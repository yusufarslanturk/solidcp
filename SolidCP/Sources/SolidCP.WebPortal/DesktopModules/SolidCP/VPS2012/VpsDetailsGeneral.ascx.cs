// Copyright (c) 2016, SolidCP
// SolidCP is distributed under the Creative Commons Share-alike license
// 
// SolidCP is a fork of WebsitePanel:
// Copyright (c) 2015, Outercurve Foundation.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// - Redistributions of source code must  retain  the  above copyright notice, this
//   list of conditions and the following disclaimer.
//
// - Redistributions in binary form  must  reproduce the  above  copyright  notice,
//   this list of conditions  and  the  following  disclaimer in  the documentation
//   and/or other materials provided with the distribution.
//
// - Neither  the  name  of  the  Outercurve Foundation  nor   the   names  of  its
//   contributors may be used to endorse or  promote  products  derived  from  this
//   software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT  NOT  LIMITED TO, THE IMPLIED
// WARRANTIES  OF  MERCHANTABILITY   AND  FITNESS  FOR  A  PARTICULAR  PURPOSE  ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO,  PROCUREMENT  OF  SUBSTITUTE  GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)  HOWEVER  CAUSED AND ON
// ANY  THEORY  OF  LIABILITY,  WHETHER  IN  CONTRACT,  STRICT  LIABILITY,  OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE)  ARISING  IN  ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

﻿using System;
using SolidCP.Providers.Common;
using SolidCP.Providers.ResultObjects;
using SolidCP.Providers.Virtualization;
using SolidCP.EnterpriseServer;
using System.Collections.Generic;

namespace SolidCP.Portal.VPS2012
{
    public partial class VpsDetailsGeneral : SolidCPModuleBase
    {
        private class ActionButton
        {
            public string Text { get; set; }
            public string Command { get; set; }
            public string Style { get; set; }
            public string OnClientClick { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGeneralDetails();
            string guacamoleconnecturl = ES.Services.VPS2012.GetVirtualMachineGuacamoleURL(PanelRequest.ItemID);
            if (guacamoleconnecturl != "")
            {
                lnkRDP.Visible = true;
            } else {
                lnkRDP.Visible = false;
            }
        }

        private void BindGeneralDetails()
        {
            VirtualMachine item = VirtualMachines2012Helper.GetCachedVirtualMachine(PanelRequest.ItemID);
            if (!String.IsNullOrEmpty(item.CurrentTaskId)
                || item.ProvisioningStatus == VirtualMachineProvisioningStatus.Error)
            {
                DetailsTable.Visible = false;
                return;
            }

            VirtualMachine vm = null;
            string vmCreatedTime = null;
            try
            {
                vm = ES.Services.VPS2012.GetVirtualMachineGeneralDetails(PanelRequest.ItemID);
            }
            catch (Exception ex)
            {
                messageBox.ShowErrorMessage("VPS_ERROR_GET_VM_DETAILS", ex);
            }

            if (vm != null)
            {
                if (vm.State == VirtualMachineState.Unknown)// VPS was moved
                {
                    int newServiceId = ES.Services.VPS2012.DiscoverVirtualMachine(PanelRequest.ItemID);
                    if (newServiceId != -1)
                    {
                        try
                        {
                            vm = ES.Services.VPS2012.GetVirtualMachineGeneralDetails(PanelRequest.ItemID);
                        }
                        catch (Exception ex)
                        {
                            messageBox.ShowErrorMessage("VPS_ERROR_GET_VM_DETAILS", ex);
                        }

                    }
                }
                // Guacamole & RDP
                string guacamoleconnecturl = ES.Services.VPS2012.GetVirtualMachineGuacamoleURL(PanelRequest.ItemID);

                bool displayRDP = ((guacamoleconnecturl != ""
                    || Request.Browser.Browser == "IE"
                    && Request.Browser.ActiveXControls
                    && Request.Browser.VBScript)
                    && vm.State != VirtualMachineState.Off
                    && vm.State != VirtualMachineState.Paused
                    && vm.State != VirtualMachineState.Saved
                    && item.RemoteDesktopEnabled);
                lnkHostname.Text = item.Hostname.ToUpper();
                lnkHostname.Visible = displayRDP;
                litHostname.Text = item.Hostname.ToUpper();
                litHostname.Visible = !displayRDP;

                litDomain.Text = item.Domain;

                if (!IsPostBack)
                {
                    // set host name change form
                    txtHostname.Text = item.Hostname;
                    txtDomain.Text = item.Domain;
                }

                if (guacamoleconnecturl != "")
                {
                    litRdpPageUrl.Text = Page.ResolveUrl(guacamoleconnecturl);
                }
                else
                {
                    litRdpPageUrl.Text = Page.ResolveUrl("~/DesktopModules/SolidCP/VPS2012/RemoteDesktop/Connect.aspx?ItemID=" + PanelRequest.ItemID + "&Resolution=");
                }
                TimeSpan uptime = TimeSpan.FromMilliseconds(vm.Uptime);
                uptime = uptime.Subtract(TimeSpan.FromMilliseconds(uptime.Milliseconds));
                litUptime.Text = uptime.ToString();
                litStatus.Text = GetLocalizedString("State." + vm.State);
                vmCreatedTime = string.IsNullOrEmpty(vm.CreationTime) ? vm.CreatedDate.ToString() : vm.CreationTime;
                litCreated.Text = vmCreatedTime;
                litHeartbeat.Text = GetLocalizedString("Heartbeat." + vm.Heartbeat);
                trHVHost.Visible = PanelSecurity.EffectiveUser.Role == UserRole.Administrator; //It is hardcoded that GetServiceInfo can get only the Adminstrator
                if (trHVHost.Visible)
                {
                    ServiceInfo info = SolidCP.Portal.ES.Services.Servers.GetServiceInfo(vm.ServiceId);
                    litHVHost.Text = info.ServerName;
                }

                // CPU
                cpuGauge.Progress = vm.CpuUsage;
                litCpuPercentage.Text = String.Format(GetLocalizedString("CpuPercentage.Text"), vm.CpuUsage);

                // RAM
                if (vm.RamSize > 0)
                {
                    var totalRam = vm.RamSize;

                    if (vm.DynamicMemory != null && vm.DynamicMemory.Enabled)
                        totalRam = vm.DynamicMemory.Maximum;

                    int ramPercent; 
                    try
                    {
                        ramPercent = Convert.ToInt32(vm.RamUsage / (float)totalRam * 100); //It is possible to get an Overflow exception
                    }
                    catch
                    {
                        ramPercent = 100;
                    }
                    
                    ramGauge.Total = totalRam;
                    ramGauge.Progress = vm.RamUsage;
                    litRamPercentage.Text = String.Format(GetLocalizedString("MemoryPercentage.Text"), ramPercent);
                    litRamUsage.Text = String.Format(GetLocalizedString("MemoryUsage.Text"), vm.RamUsage, totalRam);
                }

                // HDD
                if (vm.HddLogicalDisks != null && vm.HddLogicalDisks.Length > 0)
                {
                    HddRow.Visible = true;

                    int freeHdd = 0;
                    int sizeHdd = 0;

                    foreach (LogicalDisk disk in vm.HddLogicalDisks)
                    {
                        freeHdd += disk.FreeSpace;
                        sizeHdd += disk.Size;
                    }

                    int usedHdd = sizeHdd - freeHdd;

                    int hddPercent;
                    try
                    {
                        hddPercent = Convert.ToInt32(usedHdd / (float)sizeHdd * 100); //It is possible to get an Overflow exception
                    }
                    catch
                    {
                        hddPercent = 100;
                    }

                    hddGauge.Total = sizeHdd;
                    hddGauge.Progress = usedHdd;
                    litHddPercentage.Text = String.Format(GetLocalizedString("HddPercentage.Text"), hddPercent);
                    litHddUsage.Text = String.Format(GetLocalizedString("HddUsage.Text"), freeHdd, sizeHdd, vm.HddLogicalDisks.Length);
                }

                // update image
                imgThumbnail.ImageUrl =
                    String.Format("~/DesktopModules/SolidCP/VPS2012/VirtualMachineImage.ashx?ItemID={0}&rnd={1}",
                    PanelRequest.ItemID, DateTime.Now.Ticks);

                // load virtual machine meta item
                VirtualMachine vmi = VirtualMachines2012Helper.GetCachedVirtualMachine(PanelRequest.ItemID); //TODO: There is probably a potential rare issue with the old cache. Need to add a try/catch?

                // draw buttons
                List<ActionButton> buttons = new List<ActionButton>();

                bool showButtons = true;

                if(!VirtualMachines2012Helper.IsVirtualMachineManagementAllowed(PanelSecurity.PackageId)) //who has permission knows what he is doing. :)
                {
                    //Hide the buttons (for typical clients) for 15 minutes until the OS template is fully deployed.
                    //Anyway, there is no point in restarting the server through the website in the first hours.
                    try
                    {
                        double totalMinutes = (DateTime.Now - DateTime.Parse(vmCreatedTime)).TotalMinutes; //we don't directly use vm.CreatedDate because it's an unpredictable value  (the problem exists for old servers or those who have migrated from WebsitePanel/MSPc)
                        if (totalMinutes > 0) //just because HyperV Created time is an unpredictable value, check that it's not a far future.
                            showButtons = (totalMinutes >= 15);
                    }
                    catch { /* this should be impossible, but if vmCreatedTime has the wrong value - do nothing  */ }                    
                }                

                if (showButtons) 
                {
                    if (vmi.StartTurnOffAllowed
                    && (vm.State == VirtualMachineState.Off
                    || vm.State == VirtualMachineState.Saved))
                        buttons.Add(CreateActionButton("Start", "start.png"));

                    if (vm.State == VirtualMachineState.Running)
                    {
                        if (vmi.RebootAllowed)
                            buttons.Add(CreateActionButton("Reboot", "reboot.png"));

                        if (vmi.StartTurnOffAllowed)
                            buttons.Add(CreateActionButton("ShutDown", "shutdown.png"));
                    }

                    if (vmi.StartTurnOffAllowed
                        && (vm.State == VirtualMachineState.Running
                        || vm.State == VirtualMachineState.Paused))
                        buttons.Add(CreateActionButton("TurnOff", "turnoff.png"));

                    if (vmi.PauseResumeAllowed
                        && vm.State == VirtualMachineState.Running)
                        buttons.Add(CreateActionButton("Pause", "pause.png"));

                    if (vmi.PauseResumeAllowed
                        && vm.State == VirtualMachineState.Paused)
                        buttons.Add(CreateActionButton("Resume", "start2.png"));

                    if (vmi.ResetAllowed
                        && (vm.State == VirtualMachineState.Running
                        || vm.State == VirtualMachineState.Paused))
                        buttons.Add(CreateActionButton("Reset", "reset2.png"));
                }                

                repButtons.DataSource = buttons;
                repButtons.DataBind();

                // other actions
                bool manageAllowed = VirtualMachines2012Helper.IsVirtualMachineManagementAllowed(PanelSecurity.PackageId);
                btnChangeHostnamePopup.Visible = manageAllowed;
            }
            else
            {
                DetailsTable.Visible = false;
                messageBox.ShowErrorMessage("VPS_LOAD_VM_ITEM");
            }
        }

        private ActionButton CreateActionButton(string command, string icon)
        {
            ActionButton btn = new ActionButton();
            btn.Command = command;
            btn.Style = String.Format(
                "background: transparent url({0}) left center no-repeat;",
                PortalUtils.GetThemedImage(String.Format("VPS2012/{0}", icon)));

            string localizedText = GetLocalizedString("Command." + command);
            btn.Text = localizedText != null ? localizedText : command;

            btn.OnClientClick = GetLocalizedString("OnClientClick." + command);

            return btn;
        }

        protected void repButtons_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            try
            {
                ResultObject res = null;

                string command = e.CommandName;
                if (command == "Snapshot")
                {
                    res = ES.Services.VPS2012.CreateSnapshot(PanelRequest.ItemID);
                }
                else
                {
                    // parse command
                    VirtualMachineRequestedState state = (VirtualMachineRequestedState)Enum.Parse(
                        typeof(VirtualMachineRequestedState), command, true);

                    // call services
                    res = ES.Services.VPS2012.ChangeVirtualMachineState(PanelRequest.ItemID, state);
                }

                // check results
                if (res.IsSuccess)
                {
                    if (command == "Snapshot")
                    {
                        // go to snapshots screen
                        Response.Redirect(EditUrl("ItemID", PanelRequest.ItemID.ToString(), "vps_snapshots",
                            "SpaceID=" + PanelSecurity.PackageId.ToString()));
                    }
                    else
                    {
                        // return
                        BindGeneralDetails();
                        return;
                    }
                }
                else
                {
                    // show error
                    messageBox.ShowMessage(res, "VPS_ERROR_CHANGE_VM_STATE", "VPS");
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowErrorMessage("VPS_ERROR_CHANGE_VM_STATE", ex);
            }
        }

        protected void btnChangeHostname_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            try
            {
                string hostname = String.Format("{0}.{1}", txtHostname.Text.Trim(), txtDomain.Text.Trim());

                ResultObject res = ES.Services.VPS2012.UpdateVirtualMachineHostName(PanelRequest.ItemID,
                    hostname, chkUpdateComputerName.Checked);

                if (res.IsSuccess)
                {
                    // show success message
                    messageBox.ShowSuccessMessage("VPS_CHANGE_VM_HOSTNAME");
                    BindGeneralDetails();
                    lnkHostname.Text = txtHostname.Text.Trim().ToUpper();
                    litHostname.Text = lnkHostname.Text;
                    litDomain.Text = txtDomain.Text.Trim();
                    // clear fields
                    //txtHostname.Text = "";
                    //txtDomain.Text = "";
                    chkUpdateComputerName.Checked = false;
                }
                else
                {
                    // show error
                    messageBox.ShowMessage(res, "VPS_CHANGE_VM_HOSTNAME", "VPS");
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowErrorMessage("VPS_CHANGE_VM_HOSTNAME", ex);
            }
        }
    }
}
