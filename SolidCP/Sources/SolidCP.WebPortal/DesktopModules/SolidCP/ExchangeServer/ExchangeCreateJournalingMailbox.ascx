<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExchangeCreateJournalingMailbox.ascx.cs" Inherits="SolidCP.Portal.ExchangeServer.ExchangeCreateJournalingMailbox" %>
<%@ Register Src="../UserControls/EmailControl.ascx" TagName="EmailControl" TagPrefix="scp" %>
<%@ Register Src="UserControls/UserSelector.ascx" TagName="UserSelector" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/SimpleMessageBox.ascx" TagName="SimpleMessageBox" TagPrefix="scp" %>
<%@ Register Src="../UserControls/PasswordControl.ascx" TagName="PasswordControl" TagPrefix="scp" %>
<%@ Register Src="UserControls/EmailAddress.ascx" TagName="EmailAddress" TagPrefix="scp" %>
<%@ Register Src="UserControls/Menu.ascx" TagName="Menu" TagPrefix="scp" %>
<%@ Register Src="UserControls/Breadcrumb.ascx" TagName="Breadcrumb" TagPrefix="scp" %>
<%@ Register Src="../UserControls/EnableAsyncTasksSupport.ascx" TagName="EnableAsyncTasksSupport" TagPrefix="scp" %>
<%@ Register Src="UserControls/MailboxPlanSelector.ascx" TagName="MailboxPlanSelector" TagPrefix="scp" %>
<%@ Register Src="../UserControls/SendToControl.ascx" TagName="SendToControl" TagPrefix="scp" %>

<scp:EnableAsyncTasksSupport ID="asyncTasks" runat="server" />

<div runat="server" id="divWrapper">
    <script type="text/javascript">
        function buildDisplayName() {
            document.getElementById("<%= txtDisplayName.ClientID %>").value = '';

            if (document.getElementById("<%= txtFirstName.ClientID %>").value != '')
                document.getElementById("<%= txtDisplayName.ClientID %>").value = document.getElementById("<%= txtFirstName.ClientID %>").value + ' ';

            if (document.getElementById("<%= txtInitials.ClientID %>").value != '')
                document.getElementById("<%= txtDisplayName.ClientID %>").value = document.getElementById("<%= txtDisplayName.ClientID %>").value + document.getElementById("<%= txtInitials.ClientID %>").value + ' ';

            if (document.getElementById("<%= txtLastName.ClientID %>").value != '')
                document.getElementById("<%= txtDisplayName.ClientID %>").value = document.getElementById("<%= txtDisplayName.ClientID %>").value + document.getElementById("<%= txtLastName.ClientID %>").value;
        }
    </script>
</div>
<div class="panel-heading">
    <h3 class="panel-title">
        <asp:Image ID="Image1" SkinID="ExchangeJournalingMailbox48" runat="server" />
        <asp:Localize ID="locTitle" runat="server" meta:resourcekey="locTitle" Text="Create Mailbox"></asp:Localize>
    </h3>
</div>

<div class="panel-body form-horizontal">
    <scp:SimpleMessageBox ID="messageBox" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
        <ContentTemplate>


            <div class="panel-body">
                <h4>
                    <asp:Literal ID="TopComments" runat="server" meta:resourcekey="TopComments" /></h4>
                <div class="radio">
                    <label class="btn btn-primary radio-inline" data-initialize="radio" id="radios-inline-0">
                        <asp:RadioButton runat="server" class="sr-only form-control" name="radios-inline" type="button" ID="rbtnCreateNewMailbox" AutoPostBack="true" Checked="true" GroupName="CreateMailboxGoup" OnCheckedChanged="rbtnCreateNewMailbox_CheckedChanged" />
                        <span class="radio-label">
                            <asp:Localize runat="server" meta:resourcekey="rbtnCreateNewMailbox" Text="First Name: " /></span>
                    </label>
                    <label class="btn btn-primary radio-inline" data-initialize="radio" id="radios-inline-1">
                        <asp:RadioButton runat="server" class="sr-only form-control" name="radios-inline" type="button" ID="rbtnUserExistingUser" AutoPostBack="true" GroupName="CreateMailboxGoup" OnCheckedChanged="rbtnUserExistingUser_CheckedChanged" />
                        <span class="radio-label">
                            <asp:Localize runat="server" meta:resourcekey="rbtnUserExistingUser" Text="First Name: " /></span>
                    </label>
                </div>
            </div>
            <hr />
            <div id="NewUserDiv" runat="server">

                <fieldset>

                    <div class="row form-group">
                        <asp:Label runat="server" CssClass="control-label col-sm-2" AssociatedControlID="txtFirstName">
                            <asp:Localize ID="locName" runat="server" meta:resourcekey="locName" Text="Name:" />
                        </asp:Label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" onKeyUp="buildDisplayName();" placeholder="First Name"></asp:TextBox>
                                <span class="input-group-addon" title="Required"><i class="fa fa-asterisk" aria-hidden="true"></i></span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txtInitials" runat="server" MaxLength="6" CssClass="form-control" onKeyUp="buildDisplayName();" placeholder="Initials"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" onKeyUp="buildDisplayName();" placeholder="Last Name"></asp:TextBox>
                                <span class="input-group-addon" title="Required"><i class="fa fa-asterisk" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="control-label col-sm-2" AssociatedControlID="txtDisplayName">
                            <asp:Localize ID="locDisplayName" runat="server" meta:resourcekey="locDisplayName" Text="Display Name:" />
                        </asp:Label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <asp:TextBox ID="txtDisplayName" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon" title="Required"><i class="fa fa-asterisk" aria-hidden="true"></i></span>
                            </div>
                            <asp:RequiredFieldValidator ID="valRequireDisplayName" runat="server" meta:resourcekey="valRequireDisplayName" ControlToValidate="txtDisplayName"
                                ErrorMessage="Enter Display Name" ValidationGroup="CreateMailbox" Display="Dynamic" Text="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="control-label col-sm-2" AssociatedControlID="txtSubscriberNumber">
                            <asp:Localize ID="locSubscriberNumber" runat="server" meta:resourcekey="locSubscriberNumber" Text="Account Number: *" />
                        </asp:Label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <asp:TextBox ID="txtSubscriberNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="valRequireSubscriberNumber" runat="server" meta:resourcekey="valRequireSubscriberNumber" ControlToValidate="txtSubscriberNumber"
                                ErrorMessage="Enter Account Number" ValidationGroup="CreateMailbox" Display="Dynamic" Text="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="control-label col-sm-2" AssociatedControlID="email">
                            <asp:Localize ID="locAccount" runat="server" meta:resourcekey="locAccount" Text="E-mail Address: *" />
                        </asp:Label>
                        <div class="col-sm-10">
                            <scp:EmailAddress ID="email" runat="server" ValidationGroup="CreateMailbox"></scp:EmailAddress>
                        </div>
                    </div>

                </fieldset>

                <scp:SendToControl ID="sendToControl" runat="server" ValidationGroup="CreateMailbox" ControlToHide="PasswordBlock"></scp:SendToControl>
                <div id="PasswordBlock" runat="server">
                    <scp:PasswordControl ID="password" runat="server" ValidationGroup="CreateMailbox" AllowGeneratePassword="true"></scp:PasswordControl>
                </div>
            </div>
            <div id="ExistingUserDiv" visible="false" runat="server">
                <div class="container">
                    <div class="form-group">
                        <label for="userSelector">
                            <asp:Localize ID="Localize1" runat="server" meta:resourcekey="locDisplayName" Text="Display Name: *" />
                        </label>
                        <uc1:UserSelector ID="userSelector" runat="server"></uc1:UserSelector>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <fieldset>
        <div class="form-group">
            <label for="mailboxPlanSelector" class="col-sm-2 control-label">
                <asp:Localize ID="locMailboxplanName" runat="server" meta:resourcekey="locMailboxplanName" Text="Mailboxplan Name: *" />
            </label>
            <div class="col-sm-10">
                <div class="input-group">
                    <scp:MailboxPlanSelector ID="mailboxPlanSelector" runat="server" Archiving="false" IsForJournaling="true" ValidationGroup="CreateMailbox" OnChanged="mailboxPlanSelector_Change" />
                </div>
            </div>
        </div>

        <hr />

        <div class="form-group">
            <label for="ddlScope" class="col-sm-2 control-label">
                <asp:Localize ID="locScope" runat="server" meta:resourcekey="locScope" Text="If the message is sent to or received from:" />
            </label>
            <div class="col-sm-10">
                <div class="input-group">
                    <asp:DropDownList ID="ddlScope" runat="server" CssClass="form-control col-sm-4">
                        <asp:ListItem Selected="True" Value="Global" meta:resourcekey="ddlScopeGlobal">All messages</asp:ListItem>
                        <asp:ListItem Value="Internal" meta:resourcekey="ddlScopeInternal">Internal messages only</asp:ListItem>
                        <asp:ListItem Value="External" meta:resourcekey="ddlScopeExternal">External messages only</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="ddlRecipient" class="col-sm-2 control-label">
                <asp:Localize ID="locRecipient" runat="server" meta:resourcekey="locRecipient" Text="Journal messages sent to or received from:" />
            </label>
            <div class="col-sm-10">
                <div class="input-group">
                    <asp:DropDownList ID="ddlRecipient" runat="server" CssClass="form-control col-sm-4" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2 control-label">
            </div>
            <div class="col-sm-10">
                <div class="input-group">
                    <asp:CheckBox ID="cbEnabled" runat="server" Checked="true" meta:resourcekey="locEnabled" Text="Enable journal rule"/>
                </div>
            </div>
        </div>

    </fieldset>

</div>

<div class="panel-footer text-right">
    <CPCC:StyleButton ID="btnCreate" CssClass="btn btn-success" runat="server" OnClick="btnCreate_Click" ValidationGroup="CreateMailbox" meta:resourcekey="btnCreate" OnClientClick="ShowProgressDialog('Creating journaling mailbox...');">
        <i class="fa fa-envelope">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnCreateText" />
    </CPCC:StyleButton>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="CreateMailbox" />
</div>
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>
