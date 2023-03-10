<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VpsDetailsAddPrivateAddress.ascx.cs" Inherits="SolidCP.Portal.VPS2012.VpsDetailsAddPrivateAddress" %>
<%@ Register Src="../UserControls/SimpleMessageBox.ascx" TagName="SimpleMessageBox" TagPrefix="scp" %>
<%@ Register Src="UserControls/ServerTabs.ascx" TagName="ServerTabs" TagPrefix="scp" %>
<%@ Register Src="UserControls/Menu.ascx" TagName="Menu" TagPrefix="scp" %>
<%@ Register Src="UserControls/Breadcrumb.ascx" TagName="Breadcrumb" TagPrefix="scp" %>
<%@ Register Src="UserControls/FormTitle.ascx" TagName="FormTitle" TagPrefix="scp" %>
<%@ Register Src="../UserControls/EnableAsyncTasksSupport.ascx" TagName="EnableAsyncTasksSupport" TagPrefix="scp" %>

<scp:EnableAsyncTasksSupport id="asyncTasks" runat="server"/>

	    <div class="Content">
		    <div class="Center">
			    <div class="panel-body form-horizontal">
			        <scp:ServerTabs id="tabs" runat="server" SelectedTab="vps_network" />
			        	
                    <scp:SimpleMessageBox id="messageBox" runat="server" />
                    
                    <asp:ValidationSummary ID="validatorsSummary" runat="server" 
                        ValidationGroup="AddAddress" ShowMessageBox="True" ShowSummary="False" />
                    
		            <p class="SubTitle">
		                <asp:Localize ID="locSubTitle" runat="server" meta:resourcekey="locSubTitle"
		                    Text="Add Private IP Addresses" />
		            </p>
                    
                    <table id="tablePrivateNetwork" runat="server" cellspacing="5" style="width: 100%;">
                        <tr>
                            <td>
                                <asp:RadioButton ID="radioPrivateRandom" runat="server" AutoPostBack="true"
                                    meta:resourcekey="radioPrivateRandom" Text="Randomly select next available IP addresses to the addresses format" 
                                    Checked="True" GroupName="PrivateAddress" />
                            </td>
                        </tr>
                        <tr id="PrivateAddressesNumberRow" runat="server">
                            <td style="padding-left: 30px;">
                                <asp:Localize ID="locPrivateAddresses" runat="server"
                                        meta:resourcekey="locPrivateAddresses" Text="Number of IP addresses:"></asp:Localize>

                                <asp:TextBox ID="txtPrivateAddressesNumber" runat="server" CssClass="form-control" Width="50" Text="1"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="PrivateAddressesValidator" runat="server" Text="*" Display="Dynamic"
                                        ControlToValidate="txtPrivateAddressesNumber" meta:resourcekey="PrivateAddressesValidator" SetFocusOnError="true"
                                        ValidationGroup="AddAddress">*</asp:RequiredFieldValidator>
                                        
                                <asp:Literal ID="litMaxPrivateAddresses" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="radioPrivateSelected" runat="server" AutoPostBack="true"
                                    meta:resourcekey="radioPrivateSelected" Text="Assign specified IP addresses" 
                                    GroupName="PrivateAddress" />
                            </td>
                        </tr>
                        <tr id="PrivateAddressesListRow" runat="server">
                            <td style="padding-left: 30px;">
                                <asp:TextBox ID="txtPrivateAddressesList" runat="server" TextMode="MultiLine"
                                    CssClass="form-control" Width="170" Rows="5"></asp:TextBox>
                                <br />
                                <asp:Localize ID="locOnePerLine" runat="server"
                                        meta:resourcekey="locOnePerLine" Text="* Type one IP address per line"></asp:Localize>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:CheckBox ID="chkCustomGateway" runat="server" AutoPostBack="true" Checked="false"
                                    meta:resourcekey="chkCustomGateway" Text="Custom Gateway and DNS" />
                            </td>
                        </tr>
                        <tr id="trCustomGateway" runat="server">
                            <td style="padding-left: 30px;">
                                <asp:RequiredFieldValidator ID="GatewayValidator" runat="server" Text="*" Display="Dynamic"
                                    ControlToValidate="txtGateway" meta:resourcekey="GatewayValidator" SetFocusOnError="true"
                                    ValidationGroup="Vps">*</asp:RequiredFieldValidator>
                                <asp:Localize ID="locGateway" runat="server"
                                    meta:resourcekey="locGateway" Text="Gateway:"></asp:Localize>
                                <asp:TextBox ID="txtGateway" runat="server" CssClass="form-control form-control" Width="150" Text=""></asp:TextBox>

                                <asp:RequiredFieldValidator ID="DNSValidator" runat="server" Text="*" Display="Dynamic"
                                    ControlToValidate="txtDNS1" meta:resourcekey="DNSValidator" SetFocusOnError="true"
                                    ValidationGroup="Vps">*</asp:RequiredFieldValidator>
                                <asp:Localize ID="locDNS1" runat="server"
                                    meta:resourcekey="locDNS1" Text="Preferred DNS server:"></asp:Localize>
                                <asp:TextBox ID="txtDNS1" runat="server" CssClass="form-control form-control" Width="150" Text=""></asp:TextBox>

                                <asp:Localize ID="locDNS2" runat="server"
                                    meta:resourcekey="locDNS2" Text="Alternate DNS server:"></asp:Localize>
                                <asp:TextBox ID="txtDNS2" runat="server" CssClass="form-control form-control" Width="150" Text=""></asp:TextBox>

                                <asp:RequiredFieldValidator ID="MaskValidator" runat="server" Text="*" Display="Dynamic"
                                    ControlToValidate="txtMask" meta:resourcekey="MaskValidator" SetFocusOnError="true"
                                    ValidationGroup="Vps">*</asp:RequiredFieldValidator>
                                <asp:Localize ID="locMask" runat="server"
                                    meta:resourcekey="locMask" Text="Subnet mask:"></asp:Localize>
                                <asp:TextBox ID="txtMask" runat="server" CssClass="form-control form-control" Width="150" Text=""></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    
                    <p>
                        <CPCC:StyleButton id="btnCancel" CssClass="btn btn-warning" runat="server" CausesValidation="False" OnClick="btnCancel_Click"> <i class="fa fa-times">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnCancel"/> </CPCC:StyleButton>&nbsp;
                        <CPCC:StyleButton id="btnAdd" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click" ValidationGroup="AddAddress"> <i class="fa fa-check">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnAdd"/> </CPCC:StyleButton>
                        (<CPCC:StyleButton id="btnAddByInject" CssClass="btn btn-success" runat="server" OnClick="btnAddByInject_Click" ValidationGroup="AddAddress"> <i class="fa fa-check">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnAddByInject"/> </CPCC:StyleButton>)
                    </p>

				    
			    </div>
		    </div>
	    </div>
