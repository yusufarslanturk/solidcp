<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VdcAuditLog.ascx.cs" Inherits="SolidCP.Portal.VPS.VdcAuditLog" %>
<%@ Register Src="../UserControls/SimpleMessageBox.ascx" TagName="SimpleMessageBox" TagPrefix="scp" %>
<%@ Register Src="../UserControls/PopupHeader.ascx" TagName="PopupHeader" TagPrefix="scp" %>
<%@ Register Src="../UserControls/AuditLogControl.ascx" TagName="AuditLogControl" TagPrefix="scp" %>
<%@ Register Src="UserControls/Menu.ascx" TagName="Menu" TagPrefix="scp" %>
<%@ Register Src="UserControls/Breadcrumb.ascx" TagName="Breadcrumb" TagPrefix="scp" %>

	    <div class="panel panel-default">
			    <div class="panel-heading">
				    <asp:Image ID="imgIcon" SkinID="AuditLog48" runat="server" />
				    <asp:Localize ID="locTitle" runat="server" meta:resourcekey="locTitle" Text="Audit Log"></asp:Localize>
			    </div>
                <div class="panel-body form-horizontal">
                <scp:Menu id="menu" runat="server" SelectedItem="vdc_audit_log" />
                <div class="panel panel-default tab-content">
                <div class="panel-body form-horizontal">
                    <scp:AuditLogControl id="auditLog" runat="server" LogSource="VPS" />
			    </div>
                </div>
                </div>
                </div>