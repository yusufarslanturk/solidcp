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
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SolidCP.Setup
{
    /// <summary>
    /// Release 2.1.0
    /// </summary>
    public class WebDavPortal210 : WebDavPortal
    {
        public static new object Install(object obj)
        {
            //
            return WebDavPortal.InstallBase(obj, minimalInstallerVersion: "2.0.0");
        }

        public static new object Uninstall(object obj)
        {
            return WebDavPortal.Uninstall(obj);
        }

        public static new object Setup(object obj)
        {
            return WebDavPortal.Setup(obj);
        }

        public static new object Update(object obj)
        {
            return WebDavPortal.UpdateBase(obj,
                minimalInstallerVersion: "2.0.0",
                versionToUpgrade: "2.0.0,2.1.0",
                updateSql: false);
        }
    }

    /// <summary>
    /// Release 2.0.0
    /// </summary>
    public class WebDavPortal200 : WebDavPortal
    {
        public static new object Install(object obj)
        {
            //
            return WebDavPortal.InstallBase(obj, minimalInstallerVersion: "2.0.0");
        }

        public static new object Uninstall(object obj)
        {
            return WebDavPortal.Uninstall(obj);
        }

        public static new object Setup(object obj)
        {
            return WebDavPortal.Setup(obj);
        }

        public static new object Update(object obj)
        {
            return WebDavPortal.UpdateBase(obj,
                minimalInstallerVersion: "2.0.0",
                versionToUpgrade: "1.2.1,2.0.0",
                updateSql: false);
        }
    }
}
