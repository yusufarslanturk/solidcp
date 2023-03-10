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

using SolidCP.Server.Utils;
using System;
using System.DirectoryServices;
using System.Security.Principal;
using System.Threading;

namespace SolidCP.Providers.HostedSolution
{
    public class ADPermission
    {
        public static SecurityIdentifier EveryoneIdentity => new SecurityIdentifier(WellKnownSidType.WorldSid, null);
        public static SecurityIdentifier AuthenticatedUsersIdentity => new SecurityIdentifier(WellKnownSidType.AuthenticatedUserSid, null);
        public static SecurityIdentifier PreWindows2000Identity => new SecurityIdentifier(WellKnownSidType.BuiltinPreWindows2000CompatibleAccessSid, null);

        public static void SetOUAclPermissions(OrganizationProvider orgProvider, string organizationId, string rootDomain, string rootDomainPath, string parentdomain)
        {
            string OUPath = orgProvider.GetOrganizationPath(organizationId);

            string dSHeuristicsDomain = rootDomain;

            if (!string.IsNullOrEmpty(parentdomain))
            {
                dSHeuristicsDomain = parentdomain;
                Log.WriteInfo("SetOUAclPermissions Parentdomain found: {0}", parentdomain);
            }
            else
            {
                Log.WriteInfo("SetOUAclPermissions Parentdomain not found {0}", parentdomain);
            }


            string dSHeuristicsOU = orgProvider.GetdSHeuristicsOU(dSHeuristicsDomain);
            Log.WriteInfo("dSHeuristicsOU: {0}", dSHeuristicsOU);

            DirectoryEntry GetdSHeuristicspath = new DirectoryEntry(dSHeuristicsOU);
            object DSObject = ActiveDirectoryUtils.GetADObjectProperty(GetdSHeuristicspath, "dSHeuristics") ?? "notset";
            string dSHeuristics = DSObject.ToString();
            Log.WriteInfo("dSHeuristics is : {0}", dSHeuristics);

            if (dSHeuristics is "001")
            {
                ActiveDirectoryUtils.DisableInheritance(OUPath);

                Log.WriteInfo("Removing PreWindows2000Identity from OU");
                ActiveDirectoryUtils.RemoveIdentityAllows(OUPath, PreWindows2000Identity);



                Log.WriteInfo("RemoveIdentityAllows for Everyone\n SID: {0}", EveryoneIdentity.ToString());
                ActiveDirectoryUtils.RemoveIdentityAllows(OUPath, EveryoneIdentity);
                Log.WriteInfo("RemoveIdentityAllows for AuthenticatedUsers\n SID: {0}", AuthenticatedUsersIdentity.ToString());
                ActiveDirectoryUtils.RemoveIdentityAllows(OUPath, AuthenticatedUsersIdentity);

                Log.WriteInfo("Changes for Exchange Servers: Recipient Management");
                var exchServers = ActiveDirectoryUtils.GetObjectTargetAccountName("Recipient Management", rootDomain);
                Log.WriteInfo("Recipient Management Exchange Servers: {0} ", exchServers);
                if (ActiveDirectoryUtils.AccountExists(exchServers))
                    ActiveDirectoryUtils.AddPermission(OUPath, new NTAccount(exchServers), ActiveDirectoryRights.GenericAll);

                Log.WriteInfo("Changes for Exchange Servers: Public Folder Management");
                exchServers = ActiveDirectoryUtils.GetObjectTargetAccountName("Public Folder Management", rootDomain);
                Log.WriteInfo("Public Folder Management Exchange Servers: {0} ", exchServers);
                if (ActiveDirectoryUtils.AccountExists(exchServers))
                    ActiveDirectoryUtils.AddPermission(OUPath, new NTAccount(exchServers), ActiveDirectoryRights.GenericAll);

                Log.WriteInfo("Completed Changes for Exchange Servers");

                var groupAccount = ActiveDirectoryUtils.GetObjectTargetAccountName(organizationId, orgProvider.RootDomain);
                Log.WriteInfo("Changes for GroupAccount: {0}", groupAccount.ToString());
                for (int i = 0; i <= 25; i++)
                {
                    if (ActiveDirectoryUtils.AccountExists(groupAccount))
                    {
                        ActiveDirectoryUtils.AddOrgPermisionsToIdentity(OUPath, new NTAccount(groupAccount));
                        break;
                    }

                    if (i == 25)
                        throw new Exception($"Can not find {groupAccount} group to set ACL permissions after {i * 2} seconds. Set Acl permissions manually");

                    Thread.Sleep(2000);
                }

                var privilegedGroup = ActiveDirectoryUtils.GetObjectTargetAccountName("Privileged Services", rootDomain);
                if (!ActiveDirectoryUtils.AccountExists(privilegedGroup))
                    ActiveDirectoryUtils.CreateGroup(rootDomainPath, "Privileged Services");

                ActiveDirectoryUtils.AddPermission(OUPath, new NTAccount(privilegedGroup), ActiveDirectoryRights.GenericRead);
            }
        }
    }
}
