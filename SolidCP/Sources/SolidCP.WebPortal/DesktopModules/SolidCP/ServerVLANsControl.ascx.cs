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

using System;
using SolidCP.Portal.Code.Helpers;

namespace SolidCP.Portal
{
    public partial class ServerVLANsControl : SolidCPControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvVLANs.PageIndex = PageIndex;
            }
        }

        public int PageIndex
        {
            get
            {
                return PanelRequest.GetInt("VLANsPage", 0);
            }
        }

        public string EditModuleUrl(string key, string keyVal, string ctrlKey)
        {
            return HostModule.EditUrl(key, keyVal, ctrlKey);
        }

        public string EditModuleUrl(string key, string keyVal, string ctrlKey, string key2, string keyVal2)
        {
            return HostModule.EditUrl(key, keyVal, ctrlKey, key2 + "=" + keyVal2);
        }

        public string GetReturnUrl()
        {
            var returnUrl = Request.Url
                .AddParameter("VLANsCollapsed", "False")
                .AddParameter("VLANsPage", gvVLANs.PageIndex.ToString());

            return Uri.EscapeDataString("~" + returnUrl.PathAndQuery);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(EditModuleUrl("ServerID", PanelRequest.ServerId.ToString(), "add_vlan", "ReturnUrl", GetReturnUrl()), true);
        }
    }
}