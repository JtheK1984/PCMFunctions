unit PCM.Strings;

interface

uses
  {$Region uses}
  Classes,
  SysUtils,
  Windows;
  {$EndRegion uses}
// allgemein
resourcestring
  {$Region resourcestring}
  // Waitform
  {$Region Waitform}
  rs_Function_Wait_FormCaption = 'Bitte warten';
  {$EndRegion Waitform}
  // Login
  {$Region Login}
  rs_Function_Login_BtnAnmelden = 'Anmelden';
  rs_Function_Login_Info = 'Bitte melden Sie sich an:';
  rs_Function_Login_Benutzer = 'Benutzername:';
  rs_Function_Login_Passwort = 'Passwort:';
  rs_Function_Login_Benutzereingeben = 'Bitte Benutzer eingeben.';
  rs_Function_Login_Benutzerfalsch = 'Benutzerdaten sind nicht korrekt.';
  rs_Function_Login_Passworteingeben = 'Bitte Passwort eingeben.';
  rs_Function_Login_Anmeldung = ': Anmeldung';
  {$EndRegion Login}
  // AppInfo
  {$Region AppInfo}
  rs_Function_AppInfo_32Bit = 'MySQL 32-Bit Version: ';
  rs_Function_AppInfo_64Bit = 'MySQL 64-Bit Version: ';
  rs_Function_Appinfo_Lizenz = 'Lizenz:';
  rs_Function_Appinfo_Database = 'Datenbank:';
  rs_Function_AppInfo_Lizenzfor = 'Lizenziert für:';
  rs_Function_AppInfo_Valid = 'Gültig bis:';
  rs_Function_AppInfo_Datenversion = 'Datenversion:';
  rs_Function_APPInfo_JensHenske = 'Jens Henske';
  rs_Function_APPInfo_Version = 'Version:';
  rs_Function_APPInfo_Revision = 'Revision:';
  rs_Function_APPInfo_Server = 'Server:';
  rs_Function_APPInfo_CopyRight = 'Copyright:';
  rs_Function_APPInfo_Demo = 'Demo:';
  rs_Function_APPInfo_LizenzEintragen = 'Neue Lizenz eintragen';
  rs_Function_APPInfo_unbegrenzt = 'unbegrenzt';
  rs_Function_APPInfo_Demolizenz = ' - Demolizenz gültig bis ';
  {$EndRegion AppInfo}
  // Design
  {$Region Design}
  rs_Function_Design_Prgramdesign = 'Programmdesign';
  rs_Function_Design_Design = 'Design:';
  rs_Function_Design_Vorschau = 'Vorschau';
  rs_Function_Design_Form = 'Form1';
  rs_Function_Design_ToolButton1 = 'ToolButton1';
  rs_Function_Design_ToolButton2 = 'ToolButton2';
  rs_Function_Design_ToolButton3 = 'ToolButton3';
  {$EndRegion Design}
  // Handbuch
  {$Region Handbuch}
  rs_Function_Handbuch_PDF = 'PDF';
  rs_Function_Handbuch_HTML = 'HTML';
  {$EndRegion Handbuch}
  // Lizenz
  {$Region DLizenz}
  rs_Function_Lizenz_Eintragen = 'Lizenz eintragen';
  rs_Function_Lizenz_Name = 'Name:';
  rs_Function_Lizenz_Lizenz = 'Lizenz:';
  rs_Function_Lizenz_LizenzFalsch = 'Lizenz nicht gültig!';
  rs_Function_Lizenz_LizenzAbgelaufen = 'Lizenz ist abgelaufen!';
  rs_Function_Lizenz_Demolizenz1 = 'Demolizenz gültig bis ';
  rs_Function_Lizenz_MessageKundenname = 'Bitte Kundennamen eingeben!';
  rs_Function_Lizenz_LizenzEintragen = 'Bitte Lizenz eingeben!';
  rs_Function_Lizenz_Lizenz1 = ': Lizenz';
  rs_Function_Lizenz_TestLizenz = 'Es ist eine 30-tägige Testlizenz vorhanden.  Möchten Sie die Testlizenz übernehmen?';
  rs_Function_Lizenz_LizenzGueltig = ': Lizenz gültig bis ';
  {$EndRegion DLizenz}
  // Sprache
  {$Region Sprache}
  rs_Function_Sprache_Sprache = 'Sprachen';
  rs_Function_Sprache_SpracheDE = 'Deutsch';
  rs_Function_Sprache_SpracheEN = 'Englisch';
  rs_Function_Sprache_SpracheWchseln = 'Sprache wechseln';
  rs_Function_Sprache_FormCaption = 'Sprache wählen';
  rs_Function_Sprache_Message ='Soll die gewählte Sprache sofort übernommen werden? ' + slinebreak + 'Bei Ja wird das Programm neu gestartet.' + slinebreak + 'Bei Nein wird die Sprache erst beim nächsten Start geändert.';
  {$EndRegion Sprache}
  // Passwört ändern
  {$Region PWChange}
  rs_Function_PasswordChange_new = 'Neues Passwort:';
  rs_Function_PasswordChange_rep = 'Passwort wiederholen:';
  rs_Function_PasswordChange_PasswortStimmtNicht = 'Die Passwörter stimmen nicht überein.';
  rs_Function_PasswordChange_EingabePruefen = 'Bitte überprüfen Sie ihre Eingabe.';
  rs_Function_PasswordChange_KeinPasswort = 'Kein Passwort eingegeben.';
  rs_Function_PasswordChange_PasswortAendern = ': Passwort ändern';
  {$EndRegion PWChange}
  // System
  {$Region System}
  rs_Function_System_Windows = 'Windows';
  rs_Function_System_OS = 'Betriebssystem:' ;
  rs_Function_system_PCName = 'Computername:';
  rs_Function_System_Grphic ='Grafikauflösung:';
  rs_Function_System_Sysdir = 'Systemlaufwerk:';
  rs_Function_System_Processor = 'Prozessor';
  rs_Function_System_ProcessorType = 'Prozessortyp:';
  rs_Function_System_ProcessorCount = 'Prozessoranzahl:';
  rs_Function_System_ProcessorSpeed = 'Prozessorgeschwindigkeit:';
  rs_Function_System_Ram = 'Arbeitsspeicher';
  rs_Function_System_RamTotal = 'Gesamter Arbeitsspeicher:';
  rs_Function_System_RamFree  = 'freier Arbeitsspeicher:';
  rs_Function_System_Auslastung = 'Auslastung';
  rs_Function_System_GridLadenFehler = 'Fehler beim Laden des Layouts: ';
  {$EndRegion System}
  // Splashscreen
  {$Region Splashscreen}
  rs_Splash_Sprache = 'Sprachdatei laden...';
  rs_Splash_Lizenz = 'Lizenz prüfen...';
  rs_Splash_Login = 'Benutzerlogin prüfen...';
  rs_Splash_Rechte = 'Benutzerrechte prüfen...';
  rs_Splash_Konfig = 'Konfiguration laden...';
  rs_Splash_MenuLaden = 'Menüs laden...';
  rs_Splash_MenuReg = 'Menüs registrieren...';
  {$EndRegion Splashscreen}
  // Benutzerverwaltung
  {$Region Benutzerverwaltung}
  rs_Function_Benutzer_New = 'Benutzer anlegen';
  rs_Function_Benutzer_Save = 'Benutzer speichern';
  rs_Function_Benutzer_Delete = 'Benutzer löschen';
  rs_Function_Benutzer_ChangePassword = 'Passwort ändern';
  rs_Function_Benutzer_Benutzer = 'Benutzer';
  rs_Function_Benutzer_Benutzerdetails = 'Benutzerdetails';
  rs_Function_Benutzer_Benutzer1 = 'Benutzer:';
  rs_Function_Benutzer_Vorname = 'Vorname:';
  rs_Function_Benutzer_Nachname = 'Nachname:';
  rs_Function_Benutzer_Restapi = 'Rest-Api';
  rs_Function_Benutzer_Password = 'Passwort:';
  rs_Function_Benutzer_Rechte1 = 'Recht:';
  rs_Function_Benutzer_Autologin = 'automatisches Login (Windows-Benutzer)';
  rs_Function_Benutzer_Vorname1 = 'Vorname';
  rs_Function_Benutzer_Nachname1 = 'Nachname';
  rs_Function_Benutzer_Rechte = 'Rechte';
  rs_Function_Benutzer_RechtNew = 'Recht anlegen';
  rs_Function_Benutzer_RechtSave = 'Recht speichern';
  rs_Function_Benutzer_RechtDelete = 'Recht löschen';
  rs_Function_Benutzer_RechtAlleBenutzer = 'Alle Benutzer';
  rs_Function_Benutzer_RechtAllgemein	= 'Rechte Allgemein';
  rs_Function_Benutzer_RechtPCM_Archiv = 'Rechte PCM - Archiv';
  rs_Function_Benutzer_RechtPCM_Backup =  'Rechte PCM - Backup';
  rs_Function_Benutzer_RechtDetails = 'Rechtedetails';
  rs_Function_Benutzer_RechtPCM_Manager	= 'Rechte PCM - Manager';
  rs_Function_Benutzer_RechtPCM_Mediacenter = 'Rechte PCM - Mediacenter';
  rs_Function_Benutzer_RechtPCM_MP3Manager = 'Rechte PCM - MP3Manager';
  rs_Function_Benutzer_RechtPCM_Notenrechner =  'Rechte PCM - Notenrechner';
  rs_Function_Benutzer_RechtPCM_Servicemanager = 'Rechte PCM - Servicemanager';
  rs_Function_Benutzer_RechtPCM_Vokabeltrainer = 'Rechte PCM - Vokabeltrainer';
  rs_Function_Benutzer_RechtBenutzerverwaltung = 'Benutzerverwaltung:';
  rs_Function_Benutzer_RechtOptionen = 'Optionen:';
  rs_Function_Benutzer_RechtArchiv = 'Archiv:';
  rs_Function_Benutzer_RechtBackup = 'Backup:';
  rs_Function_Benutzer_RechtAusgaben = 'Ausgaben:';
  rs_Function_Benutzer_RechtEinnahmen = 'Einnahmen:';
  rs_Function_Benutzer_RechtKalender = 'Kalender:';
  rs_Function_Benutzer_RechtKontakte = 'Kontakte:';
  rs_Function_Benutzer_RechtEMail	= 'E-Mail:';
  rs_Function_Benutzer_RechtMonatsübersicht = 'Monatsübersicht:';
  rs_Function_Benutzer_RechtPasswort =  'Passwörter:';
  rs_Function_Benutzer_RechtSerials	=  'Serials:';
  rs_Function_Benutzer_RechtStundenplan =  'Stundenplan:';
  rs_Function_Benutzer_RechtVerfuegung =  'Verfügung:';
  rs_Function_Benutzer_RechtMp3Player =  'MP3 - Player:';
  rs_Function_Benutzer_RechtFotos	= 'Fotos:';
  rs_Function_Benutzer_RechtVideoplayer	= 'Videoplayer:';
  rs_Function_Benutzer_RechtWebradio =  'Webradio:';
  rs_Function_Benutzer_RechtMP3Tags	= 'MP3 - Tags:';
  rs_Function_Benutzer_RechtNoten	= 'Noten: ';
  rs_Function_Benutzer_RechtShutdown = 'Shutdown:';
  rs_Function_Benutzer_RechtStatistik	= 'Statistik:';
  rs_Function_Benutzer_RechtTest = 'Test:';
  rs_Function_Benutzer_RechtVokabeln = 'Vokabeln:';
  rs_Function_Benutzer_BenutzerLoeschen = 'Der Hauptbenutzer kann nicht gelöscht werden!';
  rs_Function_Benutzer_RechteBearbeiten = 'Die vordefinierten Rechte können nicht bearbeitet werden!';
  rs_Function_Benutzer_RechteLoeschen = 'Die vordefinierten Rechte können nicht gelöscht werden!';

  {$EndRegion Benutzerverwaltung}
  // Helper
  {$Region Helper}
  rs_Function_Helper_Verbindungsversuch1 = 'Verbindungsversuch';
  rs_Function_Helper_Verbindungsversuch2 = 'erfolgreich';
  rs_Function_Helper_KeineVerbindung1 = 'Es konnte keine Verbindung zur Datenbank auf dem Server ';
  rs_Function_Helper_KeineVerbindung2 = ' hergestellt werden:';
  rs_Function_Helper_Verbindungerfolgreich ='Verbindung erfolgreich hergestellt';
  rs_Function_Helper_PCMINIPruefen = 'Bitte überprüfen Sie die Serveradresse in der Konfigurationsdatei:';
  {$EndRegion Helper}
  // Calculate
  {$Region PCM_DevManager}
  rs_Function_Helper_BerechneTag ='Berechne Tag: ';
  rs_Function_Helper_BerechneYearEnd = ', Jahr:';
  rs_Function_Helper_BerechneMonat ='Berechne Monat: ';
  rs_Function_Helper_BerechneMonate = 'Berechne Monate';
  rs_Function_Helper_BerechneJahr = 'Berechne Jahr: ';
  rs_Function_Helper_Berechne = 'Berechne ';
  rs_Function_Helper_BerechneMonatfuerMonat = 'Berechne Monate für Monat: ';
  {$EndRegion PCM_DevManager}
  // General
  {$Region General}
  rs_general_Abbrechen = 'Abbrechen';
  rs_general_Ok = 'Ok';
  rs_general_Save = 'Speichern';
  rs_general_Bezeichnung = 'Bezeichnung:';
  rs_general_Suche = 'Suche';
  rs_General_Formload = 'Formular wird geladen';
  rs_General_Dashboard = 'Dashboard';
  rs_General_Ende = 'Das Programm wird beendet.';
  rs_General_Nein = 'Nein';
  rs_General_Ja = 'Ja';
  rs_PCM_Abbrechen ='Abbrechen';
  rs_PCM_Schliessen = 'Schließen';
  rs_PCM_Style1 = 'Soll der gewählte Style sofort übernommen werden? ';
  rs_PCM_Style2 = 'Bei Ja wird das Programm neu gestartet.';
  rs_PCM_PasswortAendern1 = 'Passwort ändern';
  rs_PCM_GridSpeichernFehler = 'Fehler beim Speichern des Layouts: ';
  rs_PCM_Exception= 'Exception: ';
  rs_PCM_Januar = 'Januar';
  rs_PCM_Februar ='Februar';
  rs_PCM_Maerz ='März';
  rs_PCM_April ='April';
  rs_PCM_Mai ='Mai';
  rs_PCM_Juni ='Juni';
  rs_PCM_Juli ='Juli';
  rs_PCM_August ='August';
  rs_PCM_September ='September';
  rs_PCM_Oktober ='Oktober';
  rs_PCM_November ='November';
  rs_PCM_Dezember ='Dezember';
  rs_PCM_Uebersicht = 'Übersicht ';
  rs_PCM_Beschreibung = 'Beschreibung';
  rs_PCM_Betrag = 'Betrag';
  rs_PCM_FixBetrag = 'Fixbetrag';
  rs_PCM_FixKosten = 'Fixkosten';
  rs_PCM_Monat = 'Monat';
  rs_PCM_Jahr = 'Jahr';
  rs_PCM_Absender =  'Absender';
  rs_PCM_Bezeichnung = 'Bezeichnung';
  rs_PCM_Passwort = 'Passwort';
  rs_PCM_ersten = 'ersten';
  rs_PCM_zweiten = 'zweiten';
  rs_PCM_dritten = 'dritten';
  rs_PCM_vierten = 'vierten';
  rs_PCM_letzten = 'letzen';
  rs_PCM_Tag = 'Tag';
  rs_PCM_Beginn = 'Beginn';
  rs_PCM_Dienstag = 'Dienstag';
  rs_PCM_Donnerstag = 'Donnerstag';
  rs_PCM_EndeZeit = 'Ende';
  rs_PCM_Freitag = 'Freitag';
  rs_PCM_Mittwoch = 'Mittwoch';
  rs_PCM_Montag = 'Montag';
  rs_PCM_Samstag = 'Samstag';
  rs_PCM_Wochentag = 'Wochentag';
  rs_PCM_Wochenend_Tag = 'Wochenend-Tag';
  rs_PCM_alleTage = 'alle %d Tage';
  rs_PCM_jedentag = 'jeden Tag';
  //  rs_PCM_Modulliste_verstecken = 'Modulliste verstecken';
  //  rs_PCM_Modulliste_anzeigen = 'Modulliste anzeigen';
  rs_PCM_Kalender = 'Kalender';
  rs_PCM_Erinnerung = 'Erinnerung';
  rs_PCM_ErinnerungVor = 'Erinnerung in Minuten';
  rs_PCM_Terminfarbe = 'Terminfarbe';
  rs_PCM_Schriftfarbe = 'Schriftfarbe';
  rs_PCM_Host = 'Host';
  rs_PCM_Dateiname = 'Dateiname';
  rs_PCM_Farbe = 'Farbe';
  rs_PCM_Prioritaet = 'Priorität';
  rs_PCM_EMailadresse = 'E-Mailadresse';
  rs_PCM_Kontotyp = 'Kontotyp';
  rs_PCM_Posteingangsserver = 'Posteingangsserver';
  rs_PCM_PortEingang = 'Port Eingang';
  rs_PCM_SSLAktiv = 'SSL Aktiv';
  rs_PCM_Postfach = 'Postfach';
  rs_PCM_anzeige = 'Anzeige';
  rs_PCM_Abonnieren = 'Abonnieren';
  rs_PCM_Sortierung = 'Sortierung';
  rs_PCM_Hauptpostfach = 'Hauptpostfach';
  rs_PCM_Fehler = 'Fehler: ';
  rs_PCM_ChooseModul = 'Bitte Modul wählen';
  {$EndRegion General}
  // PCM Main
  {$Region PCM_MAIN}
  rs_PCM_Modulliste_verstecken = 'Modulliste verstecken';
  rs_PCM_Modulliste_anzeigen = 'Modulliste anzeigen';
  rs_PCM_Benutzerverwaltung ='Benutzerverwaltung';
  rs_PCM_Konfiguration = 'Konfiguration';
  rs_PCM_Design = 'Design';
  rs_PCM_Archiv = 'Archiv';
  rs_PCM_Systeminformation = 'Systeminformation';
  rs_PCM_Programminfo = 'Programminfo';
  rs_PCM_Handbuch = 'Handbuch';
  rs_PCM_Start = 'Programm gestartet';
  rs_PCM_Beenden = 'Programm beendet';
  {$EndRegion PCM_MAIN}
  // PCM - Appserver
  {$Region PCM_APPSERVER}
  rs_PCMAPPServer_Start = 'PCM - APPServer mit HTTPS gestartet';
  rs_PCMAPPServer_Dienst = 'Appserver für PCM-Apps';
  rs_PCMAPPServer_BenutzerausPCMpruefen = 'Benutzer von APP prüfen';
  rs_PCMAPPServer_BenutzerausPCMpruefen1 = 'ID_Benutzer von Server laden';
  rs_PCMAPPServer_LoginausPCMpruefen = 'Logindaten vom Server laden';
  rs_PCMAPPServer_Tokenpruefung = 'Token von APP prüfen';
  rs_PCMAPPServer_Kontakteanzahl = 'Kontakte vom Server laden, Anzahl:';
  rs_PCMAPPServer_Kontaktepruefung = 'Kontakte von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Kalenderanzahl = 'Kalender vom Server laden, Anzahl:';
  rs_PCMAPPServer_Kalenderpruefung = 'Kalender von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Passwordanzahl = 'Passwörter vom Server laden, Anzahl:';
  rs_PCMAPPServer_Passwordpruefung = 'Passwörter von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Serialsanzahl = 'Serials vom Server laden, Anzahl:';
  rs_PCMAPPServer_Serialspruefung = 'Serials von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Ausgabenanzahl = 'Ausgaben vom Server laden, Anzahl:';
  rs_PCMAPPServer_Ausgabenpruefung = 'Ausgaben von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Einnahmenanzahl = 'Einnahmen vom Server laden, Anzahl:';
  rs_PCMAPPServer_Einnahmenpruefung = 'Einnahmen von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Belegeanzahl = 'Belege vom Server laden, Anzahl:';
  rs_PCMAPPServer_Belegepruefung = 'Belege von APP prüfen, Anzahl:';
  rs_PCMAPPServer_Gutscheinanzahl = 'Gutscheine vom Server laden, Anzahl:';
  rs_PCMAPPServer_Gutscheinpruefung = 'Gutscheine von APP prüfen, Anzahl:';
  rs_PCMAPPServer_GeraeteRegistrierung = 'Gerät wird registriert';
  rs_PCMAPPServer_Monatswerteanzahl = 'Monatswerte vom Server laden, Anzahl:';
  rs_PCMAPPServer_FehltageConfiganzahl = 'Fehltagekonfiguration vom Server laden, Anzahl:';
  rs_PCMAPPServer_Fehltageanzahl = 'Fehltage vom Server laden, Anzahl:';
  rs_PCMAPPServer_LetzteBuchunganzahl = 'Letzte Buchung vom Server laden, Anzahl:';
  rs_PCMAPPServer_Buchungsjahresdatenanzahl = 'Buchungen Jahr vom Server laden, Anzahl:';
  rs_PCMAPPServer_Personalanzahl = 'Personaldaten vom Server laden, Anzahl:';
  rs_PCMAPPServer_Buchungpruefung = 'Buchung von APP prüfen, Anzahl:';
  rs_PCMAPPServer_LetzteBuchungpruefung = 'Letzte Buchung von APP prüfen, Anzahl:';
  rs_PCMAPPServer_FalschesPW = 'Falsches Passwort';
  {$EndRegion PCM_APPSERVER}
  // PCM - Archiv
  {$Region PCM_Archiv}
  rs_Archiv_Benutzer = 'Benutzer';
  rs_Archiv_Hauptkategorie = 'Hauptkategorie';
  rs_Archiv_Unterkategorie = 'Unterkategorie';
  rs_Archiv_MSGSetDesc = 'Bitte Bezeichnung angeben!';
  rs_Archiv_MSGSetDescforFileType = 'Bitte geben Sie eine Bezeichnung für den Dateinamen an!';
  rs_Archiv_MSGChooseType = 'Bitte Typ auswählen!';
  rs_Archiv_MSGScanart = 'Bitte wählen Sie die Scannerart aus!';
  rs_Archiv_MSGScanError = 'Fehler beim Scannen';
  rs_Archiv_ChooseFile = 'Bitte Datei auswählen!';
  rs_Archiv_ChooseUSer = 'Bitte Benutzer auswählen!';
  rs_Archiv_ChooseMainCat = 'Bitte Hauptkategorie auswählen!';
  rs_Archiv_DocExists = 'Dokument existiert schon. Wenn das Dokument geändert werden soll, klicken Sie auf Dokument bearbeiten!';
  rs_Archiv_DeleteDocOrg = 'Soll die Originaldatei gelöscht werden?';
	rs_Config_ZielVerzeichnis = 'Bitte Ziel-Verzeichnis wählen';
  {$EndRegion PCM_Archiv}
  // PCM - Backup / Backupservice
  {$Region PCM_Backup}
  rs_PCMBackup_BackupMod = 'Datensicherung';
  rs_PCMBackup_Backupgesichert = ' gesichert';
  rs_PCMBackup_Backup = 'Sicherung: Datenbank PCM wird gesichert';
  rs_PCMBackup_BackupLoeschen = 'Temporäre Dateien löschen: PCM wird gelöscht';
  rs_PCMBackup_BackupErfolgreich = 'Sicherung: Datenbanken wurden erfolgreich gesichert';
  rs_PCMBackup_Ordnerwaehlen = 'Zielverzeichnis für Backup auswählen';
  rs_PCMBackup_ErrorMSQLDUMP ='Error: mysqldump.exe nicht vorhanden';
  {$EndRegion PCM_Backup}
  // PCM - Cleaner
  {$Region PCM_Cleaner}
  rs_PCMCleaner_Bereinigung = 'Bereinigung';
  {$EndRegion PCM_Cleaner}
  // PCM - Dashboard
  {$Region PCM_Dashboard}
  rs_PCMDashboard = 'Eigenschaften von ' ;
  {$EndRegion PCM_Dashboard}
  // PCM - DevManager
  {$Region PCM_DevManager}
  rs_PCMDevManager_Modul_DevPro = 'Entwicklung Projekte' ;
  rs_PCMDevManager_Modul_DevWeb = 'Entwicklung Web' ;
  rs_PCMDevManager_Modul_API = 'Rest-API Dokumentation' ;
  rs_PCMDevManager_Modul_Dokumentation = 'Dokumentation' ;
  rs_PCMDevManager_Modul_UpdateXML = 'Update XML' ;
  rs_PCMDevManager_MSGCHooseProgramm = 'Bitte Programm auswählen!';
  rs_PCMDevManager_MSGCHooseSort = 'Bitte Sortierung auswählen!';
  rs_PCMDevManager_MSGSetDesc = 'Bitte Bezeichnung eingeben!';
  rs_PCMDevManager_MSGChooseApp = 'Bitte Applikation wählen';
  rs_PCMDevManager_MSGDeleteEntry = 'Möchten Die den eintrag wirklich löschen?';
  rs_PCMDevManager_MSGCheckSQLCONSuc = 'Verbindungstest erfolgreich.';
  rs_PCMDevManager_MSGCheckSQLCONErr = 'Verbindungstest nicht erfolgreich.';
  rs_PCMDevManager_MSGNoMainScript = 'Kein Mainscript vorhanden';
  rs_PCMDevManager_BTNVerNew = 'Version anlegen';
  rs_PCMDevManager_BTNVerSav = 'Version &speichern';
  rs_PCMDevManager_BTNDevToolsEnable = 'Devtools einblenden';
  rs_PCMDevManager_BTNDevToolsDisable = 'Devtools ausblenden';
  rs_PCMDevManager_BTNShowDoneTicketsEnable = 'erledigte Tickets einblenden';
  rs_PCMDevManager_BTNShowDoneTicketsDisable = 'erledigte Tickets ausblenden';
  rs_PCMDevManager_CAPProjekte =  'Projekte / ';
  rs_PCMDevManager_CAPXML = 'XML wird eingelesen';
  rs_PCMDevManager_CAPDatabase = 'Datenbank: ';
  rs_PCMDevManager_CAPCompress = ' wird komprimiert';
  rs_PCMDevManager_CAPCopy = ' wird kopiert';
  rs_PCMDevManager_CAPSave = 'Speichere Konfigurationen';
  rs_PCMDevManager_CAPCodeSave = 'QuellCode-Sicherung:';
  rs_PCMDevManager_CAPCompressCopy = 'Komprimieren und ins Setupverzeichnis kopieren:';
  rs_PCMDevManager_COL_Architektur = 'Architektur';
  rs_PCMDevManager_COL_Licence = 'Lizenz';
  rs_PCMDevManager_COL_Stichwort = 'Stichwort';
  rs_PCMDevManager_COL_FixVersion = 'FixVersion';
  rs_PCMDevManager_COL_Zugewiesen = 'Zugewiesen';
  rs_PCMDevManager_COL_Breite = 'Breite';
  rs_PCMDevManager_COL_Leerzeile = 'Leerzeile';
  rs_PCMDevManager_WAIT_Scripts = 'Scripte werden erstellt';
  rs_PCMDevManager_WAIT_DokuHTM = 'Dokumentation HTM wird erstellt';
  rs_PCMDevManager_WAIT_DokuPDF = 'Dokumentation DOC wird erstellt';
  rs_PCMDevManager_WAIT_FileEnd = 'Dateiendungen werden geladen...';
  rs_PCMDevManager_WAIT_Doku = 'Dokumentation DOC: ';
  rs_PCMDevManager_WAIT_SavePDF = 'Dokumentation PDF speichern';
  rs_PCMDevManager_WAIT_SaveDOC = 'Dokumentation DOC speichern';
  rs_PCMDevManager_WAIT_Create = ' wird erstellt';
  rs_PCMDevManager_WAIT_CreateOther ='sonstige Script werden erstellt';
  rs_PCMDevManager_CMBBX_Alle = 'Alle';
  {$EndRegion PCM_DevManager}
  // PCM - Lizenzgenerator
  {$Region PCM_Lizenzgenerator}
  rs_PCM_Lizenzen = 'Lizenzen';
  rs_PCM_Programme = 'Programme';
  rs_PCM_Sprachdatei = 'Sprachdatei kann nicht geladen werden';
  rs_PCMLizenzgenerator_Demolizenz = 'Demolizenz für: ';
  rs_PCMLizenzgenerator_Programm = 'Programm: ';
  rs_PCMLizenzgenerator_Gueltig = 'Gültig bis: ';
  rs_PCMLizenzgenerator_Benutzer = 'Benutzer: PCM';
  rs_PCMLizenzgenerator_Lizenz = 'Lizenz: ';
  rs_PCMLizenzgenerator_Loeschen1 = 'Soll die Lizenz für ';
  rs_PCMLizenzgenerator_Loeschen2 = ' für den Kunden ';
  rs_PCMLizenzgenerator_Loeschen3 = ' gelöscht werden?';
  rs_PCMLizenzgenerator_KundeLizenz = 'Kunden / Lizenzen';
  rs_PCMLizenzgenerator_Programme = 'Programme';
  rs_PCMLizenzgenerator_Lizenzautomatic = 'automatische Lizenz';
  rs_PCMLizenzgenerator_MessageStrasse = 'Bitte Straße eingeben!';
  rs_PCMLizenzgenerator_MessagePLZ = 'Bitte PLZ eingeben!';
  rs_PCMLizenzgenerator_MessageORT = 'Bitte Ort eingeben!';
  rs_PCMLizenzgenerator_MessageKundeexists = 'Kunde exisitiert bereits!';
  rs_PCMLizenzgenerator_Lizenfuer = 'Lizenz für "';
  rs_PCMLizenzgenerator_DatumFuerLizenz = 'Bitte Datum für die Demolizenz angeben!';
  rs_PCMLizenzgenerator_Lizenzerstellen ='Soll die Lizenz wirklich erstellt werden?';
  rs_PCMLizenzgenerator_Lizenzexistiert ='Lizenz existiert bereits!';
  rs_PCMLizenzgenerator_KundeName = 'Name';
  rs_PCMLizenzgenerator_KundeStrasse = 'Straße';
  rs_PCMLizenzgenerator_KundePLZ = 'PLZ';
  rs_PCMLizenzgenerator_KundeORT = 'Ort';
  rs_PCMLizenzgenerator_KundeAngelegt = 'Angelegt von';
  rs_PCMLizenzgenerator_ProgrammProgramm = 'Programm';
  rs_PCMLizenzgenerator_ProgrammNummer = 'Nummer';
  rs_PCMLizenzgenerator_ProgrammMajor = 'Major-Version';
  rs_PCMLizenzgenerator_ProgrammMinor = 'Minor-Version';
  rs_PCMLizenzgenerator_ProgrammLizenz = 'Lizenzerstellung';
  rs_PCMLizenzgenerator_Testzeitraum = 'Testzeitraum: ';
  rs_PCMLizenzgenerator_COLDatum = 'Datum';
  rs_PCMLizenzgenerator_COLUhrzeit = 'Uhrzeit';
  rs_PCMDevManager_COL_Bemerkung = 'Bemerkung';
  {$EndRegion PCM_Lizenzgenerator}
  // PCM - Manager
  {$Region PCM_Manager}
  rs_PCMManager_KeineVerbindung = 'Verbindung mit Outlook kann nicht hergestellt werden. Grund: ';
  rs_PCMManager_Namespace = 'Namespace ermitteln';
  rs_PCMManager_CalendarsRoot = 'CalendarsRoot ermitteln: ';
  rs_PCMManager_ContactsRootErmitteln = 'ContactsRoot ermitteln: ';
  rs_PCMManager_NamespaceErmitteln = 'Namespace konnt nicht ermittelt werden. Grund: ';
  rs_PCMManager_CalendarsRootErmitteln = 'CalendarsRoot konnte nicht ermittelt werden. Grund: ';
  rs_PCMManager_TerminenichtErmitteln = 'Termine konnten nicht importiert werden. Grund: ';
  rs_PCMManager_AufgabennichtErmitteln = 'Aufgaben konnten nicht importiert werden. Grund: ';
  rs_PCMManager_OutlookVerbinden = 'Mit Outlook verbinden';
  rs_PCMManager_Kontakt = 'Kontakte';
  rs_PCMManager_Kontakte = 'Kontakte: ';
  rs_PCMManager_Terminealle = 'Termine alle: ';
  rs_PCMManager_Aufgaben = 'Aufgaben: ';
  rs_PCMManager_DatumUngueltig = 'Datum ungültig. ';
  rs_PCMManager_DatumVonBis = 'Bitte geben Sie ein "Von"- und ein "Bis"-Datum an.';
  rs_PCMManager_DatumBisVon ='Das Beginn-Datum muss vor dem Ende-Datum liegen.';
  rs_PCMManager_AufgabenArtWaehlen = 'Bitte wählen Sie eine Aufgaben-Art aus.';
  rs_PCMManager_BetreffEingeben = 'Bitte geben Sie einen Betreff ein.';
  rs_PCMManager_EndeInVergangenheit = 'Das Ende des Termins / der Aufgabe darf nicht in der Vergangenheit liegen.';
  rs_PCMManager_AufgabeInVergangenheit = 'Die Aufgabe ist in der Vergangenheit fällig! Möchten Sie wirklich fortfahren?';
  rs_PCMManager_FaelligkeitStandard = 'Die Fälligkeit entspricht nicht der hinterlegten Standardfälligkeit von ';
  rs_PCMManager_FaelligkeitStandardTage = ' Tagen. ';
  rs_PCMManager_Fortfahren = 'Möchten Sie wirklich fortfahren?';
  rs_PCMManager_Faelligkeit4Stunden = 'Die Aufgabe ist in weniger als 4 Stunden fällig. ';
  rs_PCMManager_Erledigungsgrad1 = 'Wenn der Erledigungsgrad auf 100% gesetzt wird, wird die Aufgabe oder der Termin ';
  rs_PCMManager_Erledigungsgrad2 = 'nach dem Speichern als ''Bearbeitet'' gekennzeichnet.';
  rs_PCMManager_Erledigungsgrad3 = 'Aufgabe erledigt?';
  rs_PCMManager_Eintraegenichterledigt1 = 'Einträge sind noch nicht als gelesen markiert. ';
  rs_PCMManager_Eintraegenichterledigt2 = 'Möchten Sie die ';
  rs_PCMManager_Eintraegenichterledigt3 = ' Einträge wirklich als Bearbeitet markieren?';
  rs_PCMManager_Eintragnichterledigt1 = 'Der Eintrag ist noch nicht als gelesen markiert. ' ;
  rs_PCMManager_Eintragnichterledigt2 = 'Möchten Sie ihn wirklich als Bearbeitet markieren?';
  rs_PCMManager_AlsBearbeitet = 'Als Bearbeitet markieren';
	rs_PCMManager_Feiertageintragen = 'Feiertag eintragen';
	rs_PCMManager_KontakteImportieren = 'Kontakte importieren';
	rs_PCMManager_TermineImportieren = 'Termine importieren';
	rs_PCMManager_TermineLoeschen = 'Termine aus Outlook löschen';
	rs_PCMManager_AufgabenLoeschen = 'Aufgaben aus Outlook löschen';
	rs_PCMManager_AufgabenImportieren = 'Aufgaben importieren';
  rs_PCMManager_Finanzuebersicht = 'Finanzübersicht';
  rs_PCMManager_EMails = 'E-Mails';
  rs_PCMManager_KalenderStundenplan = 'Kalender / Aufgaben / Stundenplan';
  rs_PCMManager_Passwoerter_Serialkeys = 'Passwörter / Serialkeys';
  rs_PCMManager_GridExport1 = 'Daten wurden in ';
  rs_PCMManager_GridExport2 = ' exportiert';
  rs_PCMManager_AusgabenEmpfaenger = 'Empfänger';
  rs_PCMManager_Verwendungszweck = 'Verwendungszweck';
  rs_PCMManager_Monatwaehlen = 'Bitte Monat wählen.';
  rs_PCMManager_Jahrwaehlen = 'Bitte Jahr wählen.';
  rs_PCMManager_SerialTyp = 'Programmtyp';
  rs_PCMManager_Serial = 'Serial';
  rs_PCMManager_Link = 'Link';
  rs_PCMManager_AdresseWaehlen = 'Bitte wählen Sie eine Adresse aus.';
  rs_PCMManager_Bundeslandwaehlen = 'Bitte wählen Sie ain Bundesland aus.';
  rs_PCMManager_Undefiniert = 'Undefiniert';
  rs_PCMManager_posteingangerfolgreich = 'Posteingang: Verbindung erfolgreich';
  rs_PCMManager_posteingangnichterfolgreich = 'Posteingang: Einstellungen für den Posteingang prüfen';
  rs_PCMManager_Testmail = 'Testmail';
  rs_PCMManager_TestmailBody = 'Das ist eine Testmail';
  rs_PCMManager_postausgangerfolgreich = 'Postausgang: E-Mail erfolgreich versendet.';
  rs_PCMManager_postausgangnichterfolgreich = 'Postausgang: Einstellungen für den Postausgang prüfen';
  rs_PCMManager_OrdnerNichtGelesen = 'Order können nicht ausgelesen werden.';
  rs_PCMManager_Konfession = 'Konfession';
  rs_PCMManager_Vorname = 'Bitte Vorname eingeben!';
  rs_PCMManager_nachname = 'Bitte Nachname eingeben!';
  rs_PCMManager_Anrede = 'Anrede';
  rs_PCMManager_Vorname1 = 'Vorname';
  rs_PCMManager_Nachname1 = 'Nachname';
  rs_PCMManager_Geburtsname = 'Geburtsname';
  rs_PCMManager_Geburtsland = 'Geburtsland';
  rs_PCMManager_Zusatz = 'Zusatz';
  rs_PCMManager_Bild = 'Bild';
  rs_PCMManager_StrassePrivat = 'Strasse Privat';
  rs_PCMManager_PlzPrivat = 'PLZ Privat';
  rs_PCMManager_OrtPrivat = 'Ort Privat';
  rs_PCMManager_Kontaktart = 'Kontaktart';
  rs_PCMManager_TelefonPrivat = 'Telefon Privat';
  rs_PCMManager_TelefonPrivat1 = 'Telefon Privat 1';
  rs_PCMManager_HandyPrivat = 'Handy Privat';
  rs_PCMManager_MailPrivat = 'E-Mail Privat';
  rs_PCMManager_MailPrivat1 = 'E-Mail Privat 1';
  rs_PCMManager_InternetPrivat = 'Internet Privat';
  rs_PCMManager_Geburtsdatum = 'Geburtsdatum';
  rs_PCMManager_Geschlecht = 'Geschlecht';
  rs_PCMManager_Familienstand = 'Familienstand';
  rs_PCMManager_Staatsangehoerigkeit = 'Staatsangehörigkeit';
  rs_PCMManager_Info = 'Info';
  rs_PCMManager_Firma = 'Firma';
  rs_PCMManager_StrasseGes = 'Strasse Geschäftlich';
  rs_PCMManager_PLZGes = 'PLZ Geschäftlich';
  rs_PCMManager_OrtGes = 'Ort Geschäftlich';
  rs_PCMManager_Abteilung = 'Abteilung';
  rs_PCMManager_Funktion = 'Funktion';
  rs_PCMManager_Zentrale = 'Zentrale';
  rs_PCMManager_Durchwahl = 'Durchwahl';
  rs_PCMManager_HandyGes = 'Handy Geschäftlich';
  rs_PCMManager_MailGes = 'E-Mail Geschäftlich';
  rs_PCMManager_InternetGes = 'Internet Geschäftlich';
  rs_PCMManager_KeineKontakte = 'Keine Kontakte gefunden!';
  rs_PCMManager_Konfessionbearbeiten =  'Konfession bearbeiten';
  rs_PCMManager_Staatsangehoerigkeitbearbeiten = 'Staatsangehörigkeit bearbeiten';
  rs_PCMManager_KontakteinVCard = 'Kontakte in VCard exportiert';
  rs_PCMManager_Dateiwaehlen = 'Bitte Datei auswählen.';
  rs_PCMManager_alleTage = 'alle %d Tage';
  rs_PCMManager_jedenTag = 'jeden Tag';
  rs_PCMManager_Kalendername = 'Kalendername';
  rs_PCMManager_TagjedesMonats = 'Tag %d jedes %d Monats';
  rs_PCMManager_TagjedenMonats = 'Tag %d jeden Monats';
  rs_PCMManager_denjedesMonats = 'den %s %s jedes %d Monats';
  rs_PCMManager_denjedenMonats = 'den %s %s jeden Monats';
  rs_PCMManager_DauerMin = 'Dauer (Min.):';
  rs_PCMManager_DauerStd = 'Dauer (Std.):';
  rs_PCMManager_DauerTag = 'Dauer (Tag):';
  rs_PCMManager_Nachrichtbearbeiten = 'Nachricht bearbeiten';
  rs_PCMManager_Aufgabebearbeiten = 'Aufgabe bearbeiten';
  rs_PCMManager_artderAufgabe = 'Art der Aufgabe:';
  rs_PCMManager_anAufgabeerinnern = 'an die Aufgabe erinnern:';
  rs_PCMManager_Aufgabenstatus =  'Aufgabenstatus:';
  rs_PCMManager_vorAufgabe = 'vor der Aufgabe';
  rs_PCMManager_Terminbearbeiten = 'Termin bearbeiten';
  rs_PCMManager_ArtTermin = 'Art des Termin:';
  rs_PCMManager_anTerminerinnern = 'an den Termin erinnern:';
  rs_PCMManager_Terminstatus = 'Terminstatus:';
  rs_PCMManager_vorTermin = 'vor dem Termin';
  rs_PCMManager_Kalendereingebn = 'Bitte Kalendername eingeben.';
  rs_PCMManager_Betreff = 'Betreff';
  rs_PCMManager_GelesenAM = 'Gelesen am';
  rs_PCMManager_GesendetAm = 'Gesendet am';
  rs_PCMManager_Adresse = 'Adresse';
  rs_PCMManager_Ansprechpartner = 'Ansprechpartner';
  rs_PCMManager_JiraTicket = 'Jira Ticket';
  rs_PCMManager_Status = 'Status';
  rs_PCMManager_Typ = 'Typ';
  rs_PCMManager_Klasse = 'Klasse';
  rs_PCMManager_Schule = 'Schule';
  rs_PCMManager_SchulJahr = 'Schuljahr';
  rs_PCMManager_Absender = 'Absender';
  rs_PCMManager_Erhalten = 'Erhalten am';
  rs_PCMManager_Groeße = 'Größe';
  rs_PCMManager_KalenderTag = 'Terminkalender - Tagesansicht';
  rs_PCMManager_KalenderWoche = 'Terminkalender - Wochenansicht';
  rs_PCMManager_KalenderMonat = 'Terminkalender - Monatsansicht';
  rs_PCMManager_Kalenderjahr = 'Terminkalender - Jahresansicht';
  rs_PCMManager_Kalenderagenda = 'Terminkalender - Agendaansicht';
  rs_PCMManager_aktAufgaben = 'aktuelle Aufgaben';
  rs_PCMManager_bearbAufgaben = 'bearbeitete Aufgaben';
  rs_PCMManager_normAnsicht = 'norm. Ansicht';
  rs_PCMManager_maxAnsicht = 'max. Ansicht';
  rs_PCMManager_ArbWocheZurueck = 'Eine Arbeitswoche zurück springen';
  rs_PCMManager_ArbWocheVor = 'Eine Arbeitswoche vor springen';
  rs_PCMManager_JahrZurueck = 'Ein Jahr zurück springen';
  rs_PCMManager_JahrVor = 'Ein Jahr vor springen';
  rs_PCMManager_MonatZurueck = 'Einen Monat zurück springen';
  rs_PCMManager_MonatVor = 'Einen Monat vor springen';
  rs_PCMManager_TagZurueck = 'Einen Tag zurück springen';
  rs_PCMManager_TagVor = 'Einen Tag vor springen';
  rs_PCMManager_WocheZurueck = 'Eine Woche zurück springen';
  rs_PCMManager_WocheVor = 'Eine Woche vor springen';
  rs_PCMManager_Terminopen = 'Termin öffnen';
  rs_PCMManager_Adresseengefunden = ' Adressen gefunden!';
  rs_PCMManager_Aufgaben1 = 'Aufgaben';
  rs_PCMManager_Stundenplan = 'Stundenplan';
  rs_PCMManager_MSGDeleteevent = 'Möchten sie den Termin wirklich löschen?';
  rs_PCMManager_MSChooseEevent = 'Bitte einen Termin auswählen!';
  rs_PCMManager_MSChooseMailbox = 'Bitte Ordner auswählen!';
  rs_PCMManager_MSGFehler = 'Fehler:';
  rs_PCMManager_AdressIncomplete ='Adresse unvollständig';
  rs_PCMManager_APPIPAdresse = 'APP IP-Adresse:';
  rs_PCMManager_VPNIPAdresse = 'VPN IP-Adresse:';
  rs_PCMManager_Verbundenmit = 'Verbunden mit ';
  rs_PCMManager_Ordnerwerdeneingelesen = 'Ordner werden eingelesen...';
  rs_PCMManager_AnzahlElemente = 'Anzahl Elemente: %d';
  rs_PCMManager_AnzahlungelesenerElemente = 'Anzahl ungelesener Elemente: %d';
  rs_PCMManager_Uebermittlungabgeschlossen = 'Übermittlung abgeschlossen      ';
  rs_PCMManager_EmailDownload ='E-Mail wird heruntergeladen...';
  rs_PCMManager_EmailRefresh = 'E-Mails aktualisieren...';
  rs_PCMManager_StatuswithValue = 'Übermittlungsstatus %d';
  rs_PCMManager_StatuswithoutValue = 'Übermittlungsstatus: ';
  rs_PCMManager_StatuswithoutValue1 = ' von ';
  rs_PCMManager_StatuswithoutValue2 = ' Mails verarbeitet';
  rs_PCMManager_Flagread = 'gelesen';
  rs_PCMManager_Flagunread = 'ungelesen';
  rs_PCMManager_PushChange = ' wurde geändert';
  rs_PCMManager_PushNewChange = ' wurde angelegt';
  rs_PCMManager_PushVon = ' von  ';
  rs_PCMManager_PushBis = ' bis ';
  rs_PCMManager_PushAufgabe = 'Aufgabe ';
  rs_PCMManager_PushNachricht = 'Nachricht ';
  rs_PCMManager_PushNeue = 'Neue ';
  rs_PCMManager_PushNeuer = 'Neuer ';
  rs_PCMManager_Tag = 'Tag ';
  rs_PCMManager_Woche = 'Woche ';
  rs_PCMManager_ArbeitsWoche = 'Arbeitswoche ';
  rs_PCMManager_Monat = 'Monat ';
  rs_PCMManager_Jahr = 'Jahr ';
  rs_PCMManager_Vor = 'vor';
  rs_PCMManager_zurueck = 'zurück';
  rs_PCMManager_Vorname2 = 'Vorname:';
  rs_PCMManager_Nachname2 = 'Nachname:';
  rs_PCMManager_Firma2 = 'Firma:';
  rs_PCMManager_Ort2 = 'Ort:';

  {$EndRegion PCM_Manager}
  // PCM - Mediacenter
  {$Region PCM_Mediacenter}
  rs_PCMMediacenter_Musikplayer = 'Musikplayer';
  rs_PCMMediacenter_Webradio = 'Webradio';
  rs_PCMMediacenter_Videoplayer = 'Videoplayer';
  rs_PCMMediacenter_Fotos = 'Fotos';
  rs_PCMMediacenter_MSGRechteMaustaste = 'Rechte Maustaste, um Vollbild zu verlassen';
  rs_PCMMediacenter_MSGBassnichtgefunden = 'Bass 2.3 nicht gefunden';
  {$EndRegion PCM_Mediacenter}
  // PCM - MP3Manager
  {$Region PCM_MP3Manager}
  rs_PCMMP3Manger_MP3Verzeichnis = 'MP3-Verzeichnis auswählen';
  rs_PCMMP3Manger_MP3Tags = 'MP3-Tags bearbeiten';
  rs_PCMMP3Manger_MP3DateiHinweis1 = 'Hinweis:  Datei ';
  rs_PCMMP3Manger_MP3DateiHinweis2 = ' wird geändert';
  rs_PCMMP3Manger_MP3DateiFehler1 = 'Fehler:  Datei ';
  rs_PCMMP3Manger_MP3DateiFehler2 = ' kann nicht geändert werden. Grund: Falsche Konvention';
  rs_PCMMP3Manger_MP3DateiFehler3 = ' kann nicht geändert werden. Grund: ';
  rs_PCMMP3Manger_MP3DateiEdit1 = 'Es wurden ';
  rs_PCMMP3Manger_MP3DateiEdit2 = ' Dateien editiert';
  {$EndRegion PCM_MP3Manager}
  // PCM - Notenerechner
  {$Region PCM_Notenerechner}
  rs_PCMNotenrechner_Notenuebersicht = 'Notenübersicht';
  rs_PCMNotenrechner_Faktor = 'Faktor';
  {$EndRegion PCM_Notenerechner}
  // PCM - Restserver
  rs_PCMRestserver_Registry = 'Erstelle Registryeinträge';
  rs_PCMRestserver_StartError = 'Fehler beim Starten des PCM - REST Server: ';
 // PCM - Service / Servicemanager
  rs_PCMService_AktuelleZeit = 'aktuelles Datum/Zeit: ';
  rs_PCMService_naechsterZeitpunkt = 'nächster zeitpunkt: ';
  rs_PCMService_Herunterfahren = 'PC wird heruntergefahren';
  rs_PCMService_Beenden = 'Service beendet';
  rs_PCMService_Termin1 = 'Termin ';
  rs_PCMService_Termin2 = ' wird ausgeführt.';
  rs_PCMService_Aufgabeneinlesen = 'Aufgaben einlesen';
  rs_PCMService_AufgabePush = 'Aufgabe Pushnotification wird ausgeführt.';
  rs_PCMService_NaechsterZeitpunktSetzen = 'Nächsten Zeitpunkt setzen';
  rs_PCMService_ExceptionTermin = 'Exception beim Ausführen des Termins "';
  rs_PCMService_ExecuteWaitFor = 'ExecuteAndWaitFor konnte nicht ausgeführt werden. ';
  rs_PCMService_HIID = 'HD-ID:';
  rs_PCMService_PCID = 'PC-ID:';
  rs_PCMService_Aufrufvon = 'Aufruf von ';
  rs_PCMService_TerminAufgabenloeschen = 'Wollen Sie wirklich diesen Termin und alle zugewiesenen Aufgaben löschen?';
  rs_PCMService_KeinQuellVerzeichnis1 = 'Es wurde kein Quell-Verzeichnis gewählt.';
  rs_PCMService_KeinQuellVerzeichnis2 = 'Damit Dateiendungen gewählt werden können, muss ein Quell-Verzeichnis angegeben werden';
	rs_PCMService_ZielVerzeichnisBackup = 'Zielverzeichnis für Backup auswählen';
	rs_PCMService_QuellverzeichnissBackup = 'Quellverzeichnis für Backup auswählen';
	rs_PCMService_ZielVerzeichnisINNO = 'Bitte Verzeichnis für INNO-Setup wählen';
	rs_PCMService_QuellVerzeichnis = 'Bitte Quell-Verzeichnis wählen';
  rs_PCMService_ZielVerzeichnis = 'Bitte Ziel-Verzeichnis wählen';
  rs_PCMService_Shutdown = 'automatisches Herunterfahren';
  rs_PCMService_Backup = 'Sicherungen';
  rs_PCMService_Jobs = 'Termine / Aufgaben für PCM-Service';
  {$EndRegion resourcestring}
  //  rs_PCM_Datensicherung = 'Datensicherung';
type
  {$Region type}
  TResourceStringID = Pointer;

  TResOriginalStrings = class(TStringList)
  public
    constructor Create;
  end;
  {$EndRegion type}
var
  {$Region var}
  FResOriginalStrings: TResOriginalStrings = nil;
  FResStrings: TStringList = nil;
  FUseResCache: Boolean = true;
  {$EndRegion var}
Const
  {$Region const}
  SetNone = 0;
  SetRead = 1;
  SetReadWrite = 2;
  SetComplete = 3;
  {$EndRegion const}
// Deklarationen
{$Region Deklarationen}
procedure initNewLanguage(locale: LCID);
procedure CreateResStringLists;
procedure DestroyResStringLists;
procedure ClearResourceStrings;
function GetResourceString(AResString: TResourceStringID): string;
{$EndRegion Deklarationen}
implementation
// Deklarationen
{$Region Prozeduren}
constructor TResOriginalStrings.Create;
begin
  inherited Create;
  CaseSensitive := True;
end;
procedure ClearResourceStrings;
begin
  if FResStrings <> nil then
    FResStrings.Clear;
  if FResOriginalStrings <> nil then
    FResOriginalStrings.Clear;
end;
procedure CreateResStringLists;
begin
  FResOriginalStrings := TResOriginalStrings.Create;
  FResStrings := TStringList.Create;
end;
procedure DestroyResStringLists;
begin
  FreeAndNil(FResOriginalStrings);
  FreeAndNil(FResStrings);
end;
function GetResOriginalStringIndex(AResString: TResourceStringID): Integer;
begin
  Result := FResOriginalStrings.IndexOfObject(TObject(AResString));
end;
procedure SetResourceString(AResString: TResourceStringID; const Value: string);
var
  AIndex: Integer;
begin
  AIndex := GetResOriginalStringIndex(AResString);
  if AIndex <> -1 then
    FResStrings[AIndex] := Value
  else
  begin
    FResOriginalStrings.AddObject(LoadResString(AResString), TObject(AResString));
    FResStrings.Add(Value);
  end;
end;
function GetResourceString(AResString: TResourceStringID): string;
var
  AIndex: Integer;
begin
  if FUseResCache then
  begin
    AIndex := GetResOriginalStringIndex(AResString);
    if AIndex <> -1 then
    begin
      Result := FResStrings[AIndex]
    end
    else
    begin
      Result := LoadResString(AResString);
      SetResourceString(AResString, Result);
    end;
  end
  else
    Result := LoadResString(AResString);
end;
procedure initNewLanguage(locale: LCID);
begin
  ClearResourceStrings;
end;
{$EndRegion Prozeduren}
initialization
  CreateResStringLists;
finalization
  DestroyResStringLists;
end.
