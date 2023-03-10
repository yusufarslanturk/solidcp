<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RDSEditCollectionSettings.ascx.cs" Inherits="SolidCP.Portal.RDS.RDSEditCollectionSettings" %>
<%@ Register Src="../UserControls/SimpleMessageBox.ascx" TagName="SimpleMessageBox" TagPrefix="scp" %>
<%@ Register Src="../UserControls/EnableAsyncTasksSupport.ascx" TagName="EnableAsyncTasksSupport" TagPrefix="scp" %>
<%@ Register Src="UserControls/RDSCollectionApps.ascx" TagName="CollectionApps" TagPrefix="scp"%>
<%@ Register Src="UserControls/RDSCollectionTabs.ascx" TagName="CollectionTabs" TagPrefix="scp" %>
<%@ Register Src="UserControls/RDSSessionLimit.ascx" TagName="SessionLimit" TagPrefix="scp" %>
<%@ Register TagPrefix="scp" TagName="CollapsiblePanel" Src="../UserControls/CollapsiblePanel.ascx" %>
<%@ Register Src="../UserControls/ItemButtonPanel.ascx" TagName="ItemButtonPanel" TagPrefix="scp" %>
<script type="text/javascript" src="/JavaScript/jquery.min.js?v=1.4.4"></script>

<scp:EnableAsyncTasksSupport id="asyncTasks" runat="server"/>


				<div class="panel-heading">
					<asp:Image ID="imgEditRDSCollection" SkinID="EnterpriseRDSCollections48" runat="server" />
                  
					<asp:Localize ID="locTitle" runat="server" meta:resourcekey="locTitle" Text="Edit RDS Collection Settings"></asp:Localize>
                    -
					<asp:Literal ID="litCollectionName" runat="server" Text="" />
				</div>
				<div class="panel-body form-horizontal">
                    <scp:CollectionTabs id="tabs" runat="server" SelectedTab="rds_edit_collection_settings" />
                 <div class="panel panel-default tab-content">
                <div class="panel-body form-horizontal">
				    <scp:SimpleMessageBox id="messageBox" runat="server" />                    

                    <scp:CollapsiblePanel id="secRdsSessionSettings" runat="server"
                        TargetControlID="panelRdsSessionSettings" meta:resourcekey="secRdsSessionSettings" Text="">
                    </scp:CollapsiblePanel>		
                    
                    <asp:Panel runat="server" ID="panelRdsSessionSettings">                                                
                        <div style="padding: 10px;">
                            <table>
                                <tr>
                                    <td class="FormLabel260" colspan="3" style="width:auto;"><asp:Localize ID="locSessionLimitHeader" runat="server" meta:resourcekey="locSessionLimitHeader" Text=""></asp:Localize></td>
                                </tr>
                                <tr>
                                    <td class="Label" style="width:260px;" colspan="2"><asp:Localize ID="locDisconnectedSessionLimit" runat="server" meta:resourcekey="locDisconnectedSessionLimit" Text=""></asp:Localize></td>
                                    <td style="width:250px;">
                                        <scp:SessionLimit ID="slDisconnectedSessionLimit" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Label" style="width:260px;" colspan="2"><asp:Localize ID="locActiveSessionLimit" runat="server" meta:resourcekey="locActiveSessionLimit" Text=""></asp:Localize></td>
                                    <td>
                                        <scp:SessionLimit ID="slActiveSessionLimit" runat="server"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Label" style="width:260px;" colspan="2"><asp:Localize ID="locIdleSessionLimit" runat="server" meta:resourcekey="locIdleSessionLimit" Text=""></asp:Localize></td>
                                    <td>
                                        <scp:SessionLimit ID="slIdleSessionLimit" runat="server"/>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>                                
                                <tr>
                                    <td class="FormLabel260" colspan="2" style="width:auto;"><asp:Localize ID="locCollectionBroken" runat="server" meta:resourcekey="locCollectionBroken" Text=""></asp:Localize></td>
                                </tr> 
                                <tr>
                                    <td colspan="2">
                                        <asp:RadioButton ID="chDisconnect" GroupName="collectionBroken" runat="server" Text="Disconnect from the session" meta:resourcekey="chDisconnect"/>                                        
                                    </td>
                                </tr>    
                                <tr>
                                    <td style="width:20px;"></td>
                                    <td>
                                        <asp:CheckBox ID="chAutomaticReconnection" Text="Enable automatic reconnection" runat="server" meta:resourcekey="chAutomaticReconnection"/>
                                    </td>
                                </tr> 
                                <tr>
                                    <td colspan="2">
                                        <asp:RadioButton ID="chEndSession" GroupName="collectionBroken" runat="server" Text="End the session" meta:resourcekey="chEndSession"/>                                        
                                    </td>
                                </tr>                   
                            </table> 
                            <br />
                            <table>                                
                                <tr>
                                    <td class="FormLabel260" colspan="2" style="width:auto;"><asp:Localize ID="locTempFolder" runat="server" meta:resourcekey="locTempFolder" Text=""></asp:Localize></td>
                                </tr> 
                                <tr>
                                    <td>
                                        <asp:CheckBox id="chDeleteOnExit" runat="server" Text="Delete temporary folders on exit" meta:resourcekey="chDeleteOnExit"/>
                                    </td>
                                </tr>    
                                <tr>                                   
                                    <td>
                                        <asp:CheckBox ID="chUseFolders" Text="Use temporary folders per session" runat="server" meta:resourcekey="chUseFolders"/>
                                    </td>
                                </tr>                   
                            </table>
                        </div>                            
                    </asp:Panel>

                    <scp:CollapsiblePanel id="secRdsClientSettings" runat="server"
                        TargetControlID="panelRdsClientSettings" meta:resourcekey="secRdsClientSettings" Text="">
                    </scp:CollapsiblePanel>		
                    
                    <asp:Panel runat="server" ID="panelRdsClientSettings">                                                
                        <div style="padding: 10px;">
                            <table>
                                <tr>
                                    <td class="FormLabel260" colspan="2" style="width:auto;"><asp:Localize ID="locEnableRedirection" runat="server" meta:resourcekey="locEnableRedirection" Text=""></asp:Localize></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chAudioVideo" Text="Audio and video playback" runat="server" meta:resourcekey="chAudioVideo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chAudioRecording" Text="Audio recording" runat="server" meta:resourcekey="chAudioRecording"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chSmartCards" Text="Smart cards" runat="server" meta:resourcekey="chSmartCards"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chPlugPlay" Text="Plug and play devices" runat="server" meta:resourcekey="chPlugPlay"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chDrives" Text="Drives" runat="server" meta:resourcekey="chDrives"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chClipboard" Text="Clipboard" runat="server" meta:resourcekey="chClipboard"/>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table>                                
                                <tr>
                                    <td class="FormLabel260" colspan="2" style="width:auto;"><asp:Localize ID="locPrinters" runat="server" meta:resourcekey="locPrinters" Text=""></asp:Localize></td>
                                </tr> 
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chPrinterRedirection" Text="Allow client printer redirection" runat="server" meta:resourcekey="chPrinterRedirection"/>
                                    </td>
                                </tr>    
                                <tr>
                                    <td style="width:20px;"></td>
                                    <td>
                                        <asp:CheckBox ID="chDefaultDevice" Text="Use the client default printing device" runat="server" meta:resourcekey="chDefaultDevice"/>
                                    </td>
                                </tr>                   
                                <tr>
                                    <td style="width:20px;"></td>
                                    <td>
                                        <asp:CheckBox ID="chEasyPrint" Text="Use the Remote Desktop Easy Print print driver first" runat="server" meta:resourcekey="chEasyPrint"/>
                                    </td>
                                </tr>                   
                            </table>                         
                            <br />
                            <table>
                                <tr>
                                    <td class="FormLabel260" colspan="2" style="width:auto;"><asp:Localize ID="locMonitors" runat="server" meta:resourcekey="locMonitors" Text=""></asp:Localize></td>
                                </tr>
                                <tr>
                                    <td class="Label" style="width:260px;"><asp:Localize ID="locMonitorsNumber" runat="server" meta:resourcekey="locMonitorsNumber" Text=""></asp:Localize></td>
                                    <td style="width:250px;">
                                        <asp:TextBox ID="tbMonitorsNumber" runat="server" CssClass="form-control" />
                                    </td>
                                </tr>                                
                            </table>
                        </div>                            
                    </asp:Panel>

                    <scp:CollapsiblePanel id="secRdsSecuritySettings" runat="server"
                        TargetControlID="panelRdsSecuritySettings" meta:resourcekey="secRdsSecuritySettings" Text="">
                    </scp:CollapsiblePanel>		
                    
                    <asp:Panel runat="server" ID="panelRdsSecuritySettings">                                                
                        <div style="padding: 10px;">                            
                            <table>
                                <tr>
                                    <td class="Label" style="width:260px;"><asp:Localize ID="locSecurityLayer" runat="server" meta:resourcekey="locSecurityLayer" Text=""></asp:Localize></td>
                                    <td style="width:250px;">
                                        <asp:DropDownList ID="ddSecurityLayer" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="RDP" Text="RDP Security Layer" />
                                            <asp:ListItem Value="Negotiate" Text="Negotiate" />
                                            <asp:ListItem Value="SSL" Text="SSL (TLS 1.0)" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Label" style="width:260px;"><asp:Localize ID="locEncryptionLevel" runat="server" meta:resourcekey="locEncryptionLevel" Text=""></asp:Localize></td>
                                    <td style="width:250px;">
                                        <asp:DropDownList ID="ddEncryptionLevel" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Low" Text="Low" />
                                            <asp:ListItem Value="ClientCompatible" Text="Client Compatible" />
                                            <asp:ListItem Value="High" Text="High" />
                                            <asp:ListItem Value="FipsCompliant" Text="FIPS Compliant" />
                                        </asp:DropDownList>
                                    </td>
                                </tr> 
                                <tr>                                    
                                    <td colspan="2">
                                        <asp:CheckBox ID="cbAuthentication" Text="Allow connections only from computers running Remote Desktop with Network Level Authentication" runat="server" meta:resourcekey="cbAuthentication"/>
                                    </td>
                                </tr>                               
                            </table>
                        </div>                            
                    </asp:Panel>


				</div>
	
                    <div class="text-right">
                        <scp:ItemButtonPanel id="buttonPanel" runat="server" ValidationGroup="SaveRDSCollection" 
                            OnSaveClick="btnSave_Click" OnSaveExitClick="btnSaveExit_Click" />
			        </div>   		
                     </div>
		</div>