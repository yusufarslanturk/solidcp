<?php if (!defined('WHMCS')) exit('ACCESS DENIED');
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


/**
 * SolidCP WHMCS Server Module Client Area Language
 *
 * @author SolidCP
 * @link https://solidcp.com/
 * @access public
 * @name SolidCP
 * @version 1.1.3
 * @package WHMCS
 */
$_ADDONLANG['SolidCP_migration'] = 'Migration';
$_ADDONLANG['SolidCP_settings'] = 'Einstellungen';
$_ADDONLANG['SolidCP_addon_automation'] = 'Addon-Automatisierung';
$_ADDONLANG['SolidCP_configurable_options'] = 'Konfigurierbare Optionen';
$_ADDONLANG['SolidCP_sync_automation'] = 'Sync-Automatisierung';
$_ADDONLANG['SolidCP_close'] = 'Schlie??en';
$_ADDONLANG['SolidCP_yes'] = 'Ja';
$_ADDONLANG['SolidCP_no'] = 'Nein';
$_ADDONLANG['SolidCP_action'] = 'Aktion';
$_ADDONLANG['SolidCP_checkagain'] = 'Nochmal pr??fen!';
$_ADDONLANG['SolidCP_addonsnotactive'] = 'Addon-Automatisierung ist nicht aktiviert. Bitte aktivieren Sie es zuerst auf der "Einstellungen"-Seite.';
$_ADDONLANG['SolidCP_configurablenotactive'] = 'Automatisierung der konfigurierbaren Optionen ist nicht aktiviert. Bitte aktivieren Sie es zuerst auf der "Einstellungen"-Seite.';
$_ADDONLANG['SolidCP_syncnotactive'] = 'Sync-Automatisierung ist nicht aktiviert. Bitte aktivieren Sie es zuerst auf der "Einstellungen"-Seite.';
$_ADDONLANG['SolidCP_sync_nosetting'] = 'Sync-Automatisierung besitzt aktuell keine Einstellungen.';

$_ADDONLANG['SolidCP_migration_needed'] = 'Eine Migration ist notwendig, bevor Sie das Modul nutzen k??nnen!';
$_ADDONLANG['SolidCP_migrateTable_text'] = 'Inhalt der Datenbanktabelle von "%s" zu "%s" kopieren.';
$_ADDONLANG['SolidCP_migrateDbValues_text'] = 'Wert "%s" in der Tabelle "%s" muss aufgrund von Struktur??nderungen migriert werden.';
$_ADDONLANG['SolidCP_deactivateModules_text'] = 'Das Modul "%s" muss manuell deaktiviert werden, nachdem die vorherigen Schritte erledigt wurden!';
$_ADDONLANG['SolidCP_deleteFiles_text'] = 'Datei "%s" muss manuell via FTP gel??scht werden, nachdem alle vorherigen Schritte erledigt wurden!';
$_ADDONLANG['SolidCP_confirmdelete'] = 'L??schen best??tigen';
$_ADDONLANG['SolidCP_confirmdelete_long'] = 'Sind Sie sicher, dass Sie die Tabelle l??schen m??chten? Alle Werte in dieser Tabelle werden gel??scht. Dieser Vorgang ist nach Ihrer Best??tigun nicht mehr r??ckg??ngig zu machen!';
$_ADDONLANG['SolidCP_copytable'] = 'Alte Tabelle "%s" zur neuen "%s" kopieren';
$_ADDONLANG['SolidCP_deletetable'] = 'Alte Tabelle "%s" l??schen (nicht empfohlen)';
$_ADDONLANG['SolidCP_migratedbvalues'] = 'Werte in der Tabelle "%s" zur neuen Struktur migrieren';
$_ADDONLANG['SolidCP_deactivatemodule'] = 'Gehen Sie zu "System" -> "Addon Module"';
$_ADDONLANG['SolidCP_confirmmigrate'] = 'Migration best??tigen';
$_ADDONLANG['SolidCP_confirmmigrate_long'] = 'Sind Sie sicher, dass Sie die Datenbanktabelle migrieren m??chten? Es gibt keinen Weg zur??ck, um das alte Modul zu nutzen. Erstellen Sie bitte ein Backup dieser Tabelle bevor Sie mit der Migration beginnen. Dieser Vorgang kann nach Ihrer Best??tigung nicht mehr r??ckg??ngig gemacht werden!';
$_ADDONLANG['SolidCP_migrationrunning'] = 'Migrationsvorgang wird ausgef??hrt';
$_ADDONLANG['SolidCP_saverunning'] = 'Speichervorgang wird ausgef??hrt';
$_ADDONLANG['SolidCP_needfirstconfiguration'] = 'Dies ist die erste Konfiguration des Moduls. Bitte stellen Sie die entsprechenden Einstellungen ein und speichern Sie diese!';
$_ADDONLANG['SolidCP_norecordsfound'] = 'Keine Eintr??ge gefunden';

$_ADDONLANG['SolidCP_configurableoptionname'] = 'Name der konfigurierbaren Option';
$_ADDONLANG['SolidCP_addonname'] = 'Addon-Name';
$_ADDONLANG['SolidCP_whmcs_id'] = 'WHMCS-ID';
$_ADDONLANG['SolidCP_solidcp_id'] = 'SolidCP-ID';
$_ADDONLANG['SolidCP_hidden'] = 'Versteckt';
$_ADDONLANG['SolidCP_delete'] = 'L??schen';
$_ADDONLANG['SolidCP_addassignment'] = 'Neue Zuordnung hinzuf??gen';
$_ADDONLANG['SolidCP_add_configurable_option'] = 'Neue Zuordnung der konfigurierbaren Optionen hinzuf??gen';
$_ADDONLANG['SolidCP_add_addon_option'] = 'Neue Zuordnung der Addons hinzuf??gen';
$_ADDONLANG['SolidCP_whmcs_id_tooltip'] = 'Geben Sie die WHMCS-ID aus der Datenbank ein.';
$_ADDONLANG['SolidCP_solidcp_id_tooltip'] = 'Geben Sie die SolidCP Addon-ID ein.';
$_ADDONLANG['SolidCP_is_ip_address'] = 'Ist IP-Addresse';
$_ADDONLANG['SolidCP_is_ip_address_tooltip'] = 'Soll eine neue dedizierte IP-Adresse in SolidCP zugeordnet werden?';

$_ADDONLANG['SolidCP_general_settings'] = 'Allgemeine Einstellungen';
$_ADDONLANG['SolidCP_setting_AddonsActive'] = 'Addon-Automatisierung aktiv';
$_ADDONLANG['SolidCP_setting_AddonsActive_tooltip'] = 'Addon-Provisionierung wird automatisiert werden, wenn diese Option aktiviert ist. F??gen Sie neue Eintr??ge im Addon-Automatisierung-Tab hinzu, um diese Funktion nutzen zu k??nnen.';
$_ADDONLANG['SolidCP_setting_ConfigurableOptionsActive'] = 'Konfigurierbare Optionen aktiv';
$_ADDONLANG['SolidCP_setting_ConfigurableOptionsActive_tooltip'] = 'Provisionierung der konfigurierbaren Optionen wird automatisiert werden, wenn diese Option aktiviert ist und eine g??ltige Lizenz gefunden wurde. F??gen Sie neue Eintr??ge im Konfigurierbare Optionen-Tab hinzu, um diese Funktion nutzen zu k??nnen.';
$_ADDONLANG['SolidCP_setting_SyncActive'] = 'Sync-Automatisierung aktiv';
$_ADDONLANG['SolidCP_setting_SyncActive_tooltip'] = 'Kundendetails werden automatisch mit dem jeweiligen SolidCP-Konto synchronisiert, wenn ??nderungen in WHMCS vorgenommen wurden.';
$_ADDONLANG['SolidCP_setting_DeleteTablesOnDeactivate'] = 'DB-Tabellen beim Deaktivieren l??schen';
$_ADDONLANG['SolidCP_setting_DeleteTablesOnDeactivate_tooltip'] = 'Tabellen in der Datenbank werden gel??scht, wenn das Modul deaktiviert wird und diese Option aktiviert ist.';
$_ADDONLANG['SolidCP_setting_WhmcsAdmin'] = 'WHMCS-Admin f??r API-Aufrufe';
$_ADDONLANG['SolidCP_setting_WhmcsAdmin_tooltip'] = 'WHMCS-Admin-Benutzer, der f??r die Aufrufe der internen API in den Kundenbereich-Scripts benutzt wird (z.B. zum ??ndern des Dienste-Passworts).';

$_ADDONLANG['SolidCP_save_changes'] = '??nderungen speichern';
$_ADDONLANG['SolidCP_cancel_changes'] = '??nderungen verwerfen';
$_ADDONLANG['SolidCP_add_new'] = 'Neu hinzuf??gen';
$_ADDONLANG['SolidCP_cancel'] = 'Abbrechen';
$_ADDONLANG['SolidCP_saving'] = 'Wird gespeichert';