<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseStorageOwaUsersList.ascx.cs" Inherits="SolidCP.Portal.ExchangeServer.UserControls.EnterpriseStorageOwaUsersList" %>

<asp:UpdatePanel ID="UsersUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
	<div class="FormButtonsBarClean">
		<CPCC:StyleButton id="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click"> <i class="fa fa-trash-o">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnDeleteText"/> </CPCC:StyleButton>&nbsp;
        <CPCC:StyleButton id="btnAdd" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click"> <i class="fa fa-plus">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnAddText"/> </CPCC:StyleButton>
	</div>
	<asp:GridView ID="gvUsers" runat="server" meta:resourcekey="gvUsers" AutoGenerateColumns="False"
		Width="600px" CssSelectorClass="NormalGridView"
		DataKeyNames="AccountName">
		<Columns>
			<asp:TemplateField>
				<HeaderTemplate>
					<asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
				</HeaderTemplate>
				<ItemTemplate>
					<asp:CheckBox ID="chkSelect" runat="server" />
				</ItemTemplate>
				<ItemStyle Width="10px" />
			</asp:TemplateField>
			<asp:TemplateField meta:resourcekey="gvUsersAccount" HeaderText="gvUsersAccount">
				<ItemStyle Width="96%" Wrap="false" HorizontalAlign="Left">
				</ItemStyle>
				<ItemTemplate>
                    <asp:Literal ID="litAccount" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>
                    <asp:HiddenField ID="hdnAccountId" runat="server" Value='<%# Eval("AccountId") %>' />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
    <br />


<asp:Panel ID="AddAccountsPanel" runat="server" style="display:none">
	<div class="widget">
             <div class="widget-header clearfix">
				<h3><i class="fa fa-user"></i>  <asp:Localize ID="headerAddAccounts" runat="server" meta:resourcekey="headerAddAccounts"></asp:Localize></h3>
			</div>
                    <div class="widget-content Popup">
<asp:UpdatePanel ID="AddAccountsUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
	            
                <div class="FormButtonsBarClean">
                    <div class="FormButtonsBarCleanRight">
                        <asp:Panel ID="SearchPanel" runat="server" DefaultButton="cmdSearch">
                            <div class="form-inline">
                                            <div class="input-group">
                            <asp:DropDownList ID="ddlSearchColumn" runat="server" CssClass="form-control">
                                <asp:ListItem Value="DisplayName" meta:resourcekey="ddlSearchColumnDisplayName">DisplayName</asp:ListItem>
                                <asp:ListItem Value="PrimaryEmailAddress" meta:resourcekey="ddlSearchColumnEmail">Email</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:TextBox ID="txtSearchValue" runat="server" CssClass="form-control"></asp:TextBox>
                <div class="input-group-btn">
                    <CPCC:StyleButton ID="cmdSearch" Runat="server" meta:resourcekey="cmdSearch" class="btn btn-primary" CausesValidation="false" OnClick="cmdSearch_Click"><i class="fa fa-search" aria-hidden="true"></i></CPCC:StyleButton>
                       </div></div></div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="Popup-Scroll">
					<asp:GridView ID="gvPopupAccounts" runat="server" meta:resourcekey="gvPopupAccounts" AutoGenerateColumns="False"
						Width="100%" CssSelectorClass="NormalGridView"
						DataKeyNames="AccountName">
						<Columns>
							<asp:TemplateField>
								<HeaderTemplate>
									<asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
								</HeaderTemplate>
								<ItemTemplate>
									<asp:CheckBox ID="chkSelect" runat="server" />
									<asp:Literal ID="litAccountType" runat="server" Visible="false" Text='<%# Eval("AccountType") %>'></asp:Literal>
								</ItemTemplate>
								<ItemStyle Width="10px" />
							</asp:TemplateField>
							<asp:TemplateField meta:resourcekey="gvAccountsDisplayName">
								<ItemStyle Width="50%" HorizontalAlign="Left"></ItemStyle>
								<ItemTemplate>
									<asp:Image ID="imgAccount" runat="server" ImageUrl='<%# GetAccountImage((int)Eval("AccountType")) %>' ImageAlign="AbsMiddle" />
									<asp:Literal ID="litDisplayName" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>
                                    <asp:HiddenField ID="hdnAccountId" runat="server" Value='<%# Eval("AccountId") %>' />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField meta:resourcekey="gvAccountsEmail">
								<ItemStyle Width="50%" HorizontalAlign="Left"></ItemStyle>
								<ItemTemplate>
									<asp:Literal ID="litPrimaryEmailAddress" runat="server" Text='<%# Eval("PrimaryEmailAddress") %>'></asp:Literal>
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
				</div>
	</ContentTemplate>
</asp:UpdatePanel>
			<br /><br />
			<CPCC:StyleButton id="btnCancelAdd" CssClass="btn btn-warning" runat="server" CausesValidation="False"> <i class="fa fa-times">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnCancelText"/> </CPCC:StyleButton>&nbsp;
            <CPCC:StyleButton id="btnAddSelected" CssClass="btn btn-success" runat="server" OnClick="btnAddSelected_Click"> <i class="fa fa-plus">&nbsp;</i>&nbsp;<asp:Localize runat="server" meta:resourcekey="btnAddSelectedText"/> </CPCC:StyleButton>
		</div>
	</div>
</asp:Panel>
        
<asp:Button ID="btnAddAccountsFake" runat="server" style="display:none;" />
<ajaxToolkit:ModalPopupExtender ID="AddAccountsModal" runat="server"
	TargetControlID="btnAddAccountsFake" PopupControlID="AddAccountsPanel"
	BackgroundCssClass="modalBackground" DropShadow="false" CancelControlID="btnCancelAdd" />

	</ContentTemplate>
</asp:UpdatePanel>


