using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Text;
using System.Threading.Tasks;

namespace SolidCP.Providers.Virtualization
{
    public static class BiosHelper
    {
        public static BiosInfo Get(PowerShellManager powerShell, string name, int generation)
        {
            BiosInfo info = new BiosInfo();

            // for Win2012R2+ and Win8.1+
            if (generation == 2)
            {
                Command cmd = new Command("Get-VMFirmware");

                cmd.Parameters.Add("VMName", name);

                Collection<PSObject> result = powerShell.Execute(cmd, true);
                if (result != null && result.Count > 0)
                {
                    info.NumLockEnabled = true;

                    List<string> startupOrders = new List<string>();
                    info.BootFromCD = false;

                    foreach (dynamic item in (IEnumerable)result[0].GetProperty("BootOrder"))
                    {
                        string bootType = item.BootType.ToString();

                        // bootFromCD
                        if (!startupOrders.Any() && bootType == "Drive")
                        {
                            var device = item.Device;
                            info.BootFromCD = device.GetType().Name == "DvdDrive";
                        }

                        // startupOrders
                        startupOrders.Add(bootType);
                    }

                    info.StartupOrder = startupOrders.ToArray();
                    info.SecureBootEnabled = "On".Equals(result[0].GetString("SecureBoot"));
                    try
                    {
                        info.SecureBootTemplate = result[0].GetString("SecureBootTemplate");
                    }
                    catch (Exception)
                    {
                        info.SecureBootTemplate = "";//catch error on Hyper-V 2012 R2 (No Secure Boot Templates)
                    }
                }
            }
            // for others win and linux
            else
            {
                Command cmd = new Command("Get-VMBios");

                cmd.Parameters.Add("VMName", name);

                Collection<PSObject> result = powerShell.Execute(cmd, true);
                if (result != null && result.Count > 0)
                {
                    info.NumLockEnabled = Convert.ToBoolean(result[0].GetProperty("NumLockEnabled"));

                    List<string> startupOrders = new List<string>();

                    foreach (var item in (IEnumerable)result[0].GetProperty("StartupOrder"))
                        startupOrders.Add(item.ToString());

                    info.StartupOrder = startupOrders.ToArray();
                    info.BootFromCD = false;
                    if (info.StartupOrder != null && info.StartupOrder.Length > 0)
                        info.BootFromCD = info.StartupOrder[0] == "CD";
                }
                info.SecureBootEnabled = false;
                info.SecureBootTemplate = "";
            }

            return info;
        }

        public static void Update(PowerShellManager powerShell, VirtualMachine vm, bool bootFromCD, bool numLockEnabled, bool EnableSecureBoot, string secureBootTemplate)
        {
            // for Win2012R2+ and Win8.1+
            if (vm.Generation == 2)
            {
                Command cmd = new Command("Set-VMFirmware");

                cmd.Parameters.Add("VMName", vm.Name);
                if (vm.State == VirtualMachineState.Off)
                {
                    if (EnableSecureBoot)
                    {
                        cmd.Parameters.Add("EnableSecureBoot", "On");
                        if (!String.IsNullOrEmpty(secureBootTemplate)) cmd.Parameters.Add("SecureBootTemplate", secureBootTemplate);
                    }
                    else
                        cmd.Parameters.Add("EnableSecureBoot", "Off");
                }

                if (bootFromCD)
                    cmd.Parameters.Add("FirstBootDevice", DvdDriveHelper.GetPS(powerShell, vm.Name));
                else
                    cmd.Parameters.Add("FirstBootDevice", HardDriveHelper.GetPS(powerShell, vm.Name).FirstOrDefault());

                powerShell.Execute(cmd, true);
            }
            // for others win and linux
            else
            {
                Command cmd = new Command("Set-VMBios");

                cmd.Parameters.Add("VMName", vm.Name);
                var bootOrder = bootFromCD
                    ? new[] { "CD", "IDE", "LegacyNetworkAdapter", "Floppy" }
                    : new[] { "IDE", "CD", "LegacyNetworkAdapter", "Floppy" };
                cmd.Parameters.Add("StartupOrder", bootOrder);

                powerShell.Execute(cmd, true);
            }
        }
    }
}
