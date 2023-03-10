<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HyperV_Settings.ascx.cs" Inherits="SolidCP.Portal.ProviderControls.HyperV_Settings" %>
<%@ Register Src="../UserControls/EditIPAddressControl.ascx" TagName="EditIPAddressControl" TagPrefix="scp" %>

<asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="true" ShowSummary="false" />

<fieldset>
    <legend>
        <asp:Localize ID="locHyperVServer" runat="server" meta:resourcekey="locHyperVServer" Text="Hyper-V Server"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" style="margin: 10px;">
	    <tr>
		    <td colspan="2">
		        <asp:RadioButtonList ID="radioServer" runat="server" AutoPostBack="true" 
                    onselectedindexchanged="radioServer_SelectedIndexChanged">
                    <asp:ListItem Value="local" meta:resourcekey="radioServerLocal" Selected="True">Local</asp:ListItem>
                    <asp:ListItem Value="remote" meta:resourcekey="radioServerRemote">Remote</asp:ListItem>
                </asp:RadioButtonList>
		    </td>
	    </tr>
	    <tr id="ServerNameRow" runat="server">
		    <td class="SubHead" style="padding-left:30px;" colspan="2">
		        <asp:Localize ID="locServerName" runat="server" meta:resourcekey="locServerName" Text="Server name:"></asp:Localize>
                <asp:TextBox Width="200px" CssClass="form-control" Runat="server" ID="txtServerName"></asp:TextBox>
                <CPCC:StyleButton id="btnConnect" CssClass="btn btn-success" runat="server" OnClick="btnConnect_Click" CausesValidation="false"> <i class="fa fa-check">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnConnectText"/> </CPCC:StyleButton>
                <asp:RequiredFieldValidator ID="ServerNameValidator" runat="server" ControlToValidate="txtServerName"
                    Text="*" meta:resourcekey="ServerNameValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr id="ServerErrorRow" runat="server">
	        <td colspan="2">
	            <asp:Label ID="locErrorReadingNetworksList" runat="server"
	                meta:resourcekey="locErrorReadingNetworksList" ForeColor="Red"></asp:Label>
	        </td>
	    </tr>
	</table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locGeneralSettings" runat="server" meta:resourcekey="locGeneralSettings" Text="General Settings"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locVpsRootFolder" runat="server" meta:resourcekey="locVpsRootFolder" Text="VPS root folder:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="400px" CssClass="form-control" Runat="server" ID="txtVpsRootFolder"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RootFolderValidator" runat="server" ControlToValidate="txtVpsRootFolder"
                    Text="*" meta:resourcekey="RootFolderValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr>
	        <td></td>
	        <td>
	            <asp:Localize ID="locFolderVariables" runat="server" meta:resourcekey="locFolderVariables" Text="The following variables..."></asp:Localize>
	            <br />
	            <br />
	        </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locOSTemplatesPath" runat="server" meta:resourcekey="locOSTemplatesPath" Text="OS Templates path:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="300px" CssClass="form-control" Runat="server" ID="txtOSTemplatesPath"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TemplatesPathValidator" runat="server" ControlToValidate="txtOSTemplatesPath"
                    Text="*" meta:resourcekey="TemplatesPathValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locExportedVpsPath" runat="server" meta:resourcekey="locExportedVpsPath" Text="Exported VPS path:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="300px" CssClass="form-control" Runat="server" ID="txtExportedVpsPath"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ExportedVpsPathValidator" runat="server" ControlToValidate="txtExportedVpsPath"
                    Text="*" meta:resourcekey="ExportedVpsPathValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	 </table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locProcessorSettings" runat="server" meta:resourcekey="locProcessorSettings" Text="Processor Resource Settings"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locCpuReserve" runat="server" meta:resourcekey="locCpuReserve" Text="Virtual machine reserve:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="50px" CssClass="form-control" Runat="server" ID="txtCpuReserve"></asp:TextBox>
                %
                <asp:RequiredFieldValidator ID="CpuReserveValidator" runat="server" ControlToValidate="txtCpuReserve"
                    Text="*" meta:resourcekey="CpuReserveValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locCpuLimit" runat="server" meta:resourcekey="locCpuLimit" Text="Virtual machine limit:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="50px" CssClass="form-control" Runat="server" ID="txtCpuLimit"></asp:TextBox>
                %
                <asp:RequiredFieldValidator ID="CpuLimitValidator" runat="server" ControlToValidate="txtCpuLimit"
                    Text="*" meta:resourcekey="CpuLimitValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locCpuWeight" runat="server" meta:resourcekey="locCpuWeight" Text="Relative weight:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="50px" CssClass="form-control" Runat="server" ID="txtCpuWeight"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CpuWeightValidator" runat="server" ControlToValidate="txtCpuWeight"
                    Text="*" meta:resourcekey="CpuWeightValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	 </table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locMediaLibrary" runat="server" meta:resourcekey="locMediaLibrary" Text="DVD Media Library"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locDvdIsoPath" runat="server" meta:resourcekey="locDvdIsoPath" Text="Path to DVD ISO files:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="300px" CssClass="form-control" Runat="server" ID="txtDvdLibraryPath"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DvdLibraryPathValidator" runat="server" ControlToValidate="txtDvdLibraryPath"
                    Text="*" meta:resourcekey="DvdLibraryPathValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	</table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locVhd" runat="server" meta:resourcekey="locVhd" Text="Virtual Hard Drive"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;" valign="top">
		        <asp:Localize ID="locDiskType" runat="server" meta:resourcekey="locDiskType" Text="Disk Type:"></asp:Localize>
		    </td>
		    <td>
                <asp:RadioButtonList ID="radioVirtualDiskType" runat="server">
                    <asp:ListItem Value="dynamic" meta:resourcekey="radioVirtualDiskTypeDynamic" Selected="True">Dynamic</asp:ListItem>
                    <asp:ListItem Value="fixed" meta:resourcekey="radioVirtualDiskTypeFixed">Fixed</asp:ListItem>
                </asp:RadioButtonList>
            </td>
	    </tr>
	</table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locExternalNetwork" runat="server" meta:resourcekey="locExternalNetwork" Text="External Network"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locExternalNetworkName" runat="server" meta:resourcekey="locExternalNetworkName" Text="Connect to Network:"></asp:Localize>
		    </td>
		    <td>
                <asp:DropDownList ID="ddlExternalNetworks" runat="server" CssClass="form-control" Width="450"
                    DataValueField="SwitchId" DataTextField="Name"></asp:DropDownList>
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locPreferredNameServer" runat="server" meta:resourcekey="locPreferredNameServer" Text="Preferred Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="externalPreferredNameServer" runat="server" Required="true" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locAlternateNameServer" runat="server" meta:resourcekey="locAlternateNameServer" Text="Alternate Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="externalAlternateNameServer" runat="server" />
            </td>
	    </tr>
	    <tr>
	        <td colspan="2">
	            <asp:CheckBox ID="chkAssignIPAutomatically" runat="server" meta:resourcekey="chkAssignIPAutomatically" Text="Assign IP addresses to the space on creation" />
	        </td>
	    </tr>
	</table>
</fieldset>
<br />

<asp:UpdatePanel ID="ManageUpdatePanel" runat="server" ChildrenAsTriggers="true">
    <ContentTemplate>
   
<fieldset>
    <legend>
        <asp:Localize ID="locManagementNetwork" runat="server" meta:resourcekey="locManagementNetwork" Text="Management Network"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td style="width:200px;">
		        <asp:Localize ID="locManagementNetworkName" runat="server" meta:resourcekey="locManagementNetworkName" Text="Connect to Network:"></asp:Localize>
		    </td>
		    <td>
                <asp:DropDownList ID="ddlManagementNetworks" runat="server" 
                    CssClass="form-control" Width="450"
                    DataValueField="SwitchId" DataTextField="Name" AutoPostBack="true" 
                    onselectedindexchanged="ddlManagementNetworks_SelectedIndexChanged"></asp:DropDownList>
            </td>
	    </tr>
	    <tr id="ManageNicConfigRow" runat="server">
		    <td>
		        <asp:Localize ID="locManageNicConfig" runat="server" meta:resourcekey="locManageNicConfig" Text="Network Adapter Configuration:"></asp:Localize>
		    </td>
		    <td>
                <asp:DropDownList ID="ddlManageNicConfig" runat="server" AutoPostBack="true" 
                    onselectedindexchanged="ddlManageNicConfig_SelectedIndexChanged">
                    <asp:ListItem Value="Pool" meta:resourcekey="ddlManageNicConfigPool" Selected="True">POOL</asp:ListItem>
                    <asp:ListItem Value="DHCP" meta:resourcekey="ddlManageNicConfigDhcp">DHCP</asp:ListItem>
                </asp:DropDownList>
            </td>
	    </tr>
	    <tr id="ManagePreferredNameServerRow" runat="server">
		    <td>
		        <asp:Localize ID="locManagePreferredNameServer" runat="server" meta:resourcekey="locPreferredNameServer" Text="Preferred Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="managePreferredNameServer" runat="server" Required="true" />
            </td>
	    </tr>
	    <tr id="ManageAlternateNameServerRow" runat="server">
		    <td>
		        <asp:Localize ID="locManageAlternateNameServer" runat="server" meta:resourcekey="locAlternateNameServer" Text="Alternate Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="manageAlternateNameServer" runat="server" />
            </td>
	    </tr>
	</table>
</fieldset>

    </ContentTemplate>
</asp:UpdatePanel>
<br />

<asp:UpdatePanel ID="PrivUpdatePanel" runat="server" ChildrenAsTriggers="true">
    <ContentTemplate>
    
<fieldset>
    <legend>
        <asp:Localize ID="locPrivateNetwork" runat="server" meta:resourcekey="locPrivateNetwork" Text="Private Network"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locIPFormat" runat="server" meta:resourcekey="locIPFormat" Text="IP addresses format:"></asp:Localize>
		    </td>
		    <td>
                <asp:DropDownList ID="ddlPrivateNetworkFormat" runat="server" 
                    AutoPostBack="true" onselectedindexchanged="ddlPrivateNetworkFormat_SelectedIndexChanged">
                    <asp:ListItem Value="" meta:resourcekey="ddlPrivateNetworkFormatCustom">Custom</asp:ListItem>
                    <asp:ListItem Value="192.168.0.1/16" meta:resourcekey="ddlPrivateNetworkFormat192" Selected="True">192.168.0.1</asp:ListItem>
                    <asp:ListItem Value="172.16.0.1/12" meta:resourcekey="ddlPrivateNetworkFormat172">172.16.0.1</asp:ListItem>
                    <asp:ListItem Value="10.0.0.1/8" meta:resourcekey="ddlPrivateNetworkFormat10">10.0.0.1</asp:ListItem>
                </asp:DropDownList>
            </td>
	    </tr>
	    <tr id="PrivCustomFormatRow" runat="server">
		    <td class="SubHead">
		        <asp:Localize ID="locPrivCustomFormat" runat="server" meta:resourcekey="locPrivCustomFormat" Text="Start IP Address:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="privateIPAddress" runat="server" Required="true" />
		        /
		        <asp:TextBox ID="privateSubnetMask" runat="server" MaxLength="3" Width="40px" CssClass="form-control"></asp:TextBox>
		        <asp:RequiredFieldValidator ID="privateSubnetMaskValidator" runat="server" ControlToValidate="privateSubnetMask"
                    Text="*" meta:resourcekey="privateSubnetMaskValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locPrivDefaultGateway" runat="server" meta:resourcekey="locDefaultGateway" Text="Default Gateway:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="privateDefaultGateway" runat="server" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locPrivPreferredNameServer" runat="server" meta:resourcekey="locPreferredNameServer" Text="Preferred Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="privatePreferredNameServer" runat="server" />
            </td>
	    </tr>
	    <tr>
		    <td class="SubHead">
		        <asp:Localize ID="locPrivAlternateNameServer" runat="server" meta:resourcekey="locAlternateNameServer" Text="Alternate Name Server:"></asp:Localize>
		    </td>
		    <td>
		        <scp:EditIPAddressControl id="privateAlternateNameServer" runat="server" />
            </td>
	    </tr>
	</table>
</fieldset>
    </ContentTemplate>
</asp:UpdatePanel>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locHostname" runat="server" meta:resourcekey="locHostname" Text="Host name"></asp:Localize>
    </legend>
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
	    <tr>
		    <td class="SubHead" style="width:200px;">
		        <asp:Localize ID="locHostnamePattern" runat="server" meta:resourcekey="locHostnamePattern" Text="VPS host name pattern:"></asp:Localize>
		    </td>
		    <td>
                <asp:TextBox Width="200px" CssClass="form-control" Runat="server" ID="txtHostnamePattern"></asp:TextBox>
                <asp:RequiredFieldValidator ID="HostnamePatternValidator" runat="server" ControlToValidate="txtHostnamePattern"
                    Text="*" meta:resourcekey="HostnamePatternValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
	    </tr>
	</table>
	<p style="margin: 10px;">
	    <asp:Localize ID="locPatternText" runat="server" meta:resourcekey="locPatternText" Text="Help text goes here..."></asp:Localize>
	</p>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locStartAction" runat="server" meta:resourcekey="locStartAction" Text="Automatic Start Action"></asp:Localize>
    </legend>
    
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
        <tr>
            <td>
                <asp:Localize ID="locStartOptionsText" runat="server" meta:resourcekey="locStartOptionsText" Text="What do you want VPS to do when the physical computer starts?"></asp:Localize>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="radioStartAction" runat="server">
                    <asp:ListItem Value="0" meta:resourcekey="radioStartActionNothing">Nothing</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="radioStartActionStart" Selected="True">Start</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="radioStartActionAlwaysStart">AlwaysStart</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Localize ID="locStartupDelayText" runat="server" meta:resourcekey="locStartupDelayText" Text="Specify a startup delay to reduce resource contention between virtual machines."></asp:Localize>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Localize ID="locStartupDelay" runat="server" meta:resourcekey="locStartupDelay" Text="Startup delay:"></asp:Localize>
                <asp:TextBox ID="txtStartupDelay" runat="server" Width="30px"></asp:TextBox>
                <asp:Localize ID="locSeconds" runat="server" meta:resourcekey="locSeconds" Text="seconds"></asp:Localize>
                <asp:RequiredFieldValidator ID="StartupDelayValidator" runat="server" ControlToValidate="txtStartupDelay"
                    Text="*" meta:resourcekey="StartupDelayValidator" Display="Dynamic" SetFocusOnError="true" />
            </td>
        </tr>
    </table>
</fieldset>
<br />

<fieldset>
    <legend>
        <asp:Localize ID="locStopAction" runat="server" meta:resourcekey="locStopAction" Text="Automatic Stop Action"></asp:Localize>
    </legend>
    
    <table cellpadding="2" cellspacing="0" width="100%" style="margin: 10px;">
        <tr>
            <td>
                <asp:Localize ID="locStopActionText" runat="server" meta:resourcekey="locStopActionText" Text="What do you want VPS to do when the physical shuts down?"></asp:Localize>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="radioStopAction" runat="server">
                    <asp:ListItem Value="1" meta:resourcekey="radioStopActionSave">Save</asp:ListItem>
                    <asp:ListItem Value="0" meta:resourcekey="radioStopActionTurnOff">TurnOff</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="radioStopActionShutDown" Selected="True">ShutDown</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
</fieldset>
<br />