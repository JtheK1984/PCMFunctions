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
  rs_PCM_Benutzerverwaltung ='Benutzerverwaltung';
  rs_PCM_Systeminformation = 'Systeminformation';
  rs_PCM_Konfiguration = 'Konfiguration';
  rs_PCM_Design = 'Design / Style';
  rs_PCM_Lizenzen = 'Lizenzen';
  rs_PCM_Programme = 'Programme';
  rs_PCM_Sprachdatei = 'Sprachdatei kann nicht geladen werden';
  rs_PCM_Demolizenz = ' - Demolizenz gültig bis ';
  rs_PCM_Demolizenz1 = 'Demolizenz gültig bis ';
  rs_PCM_Datensicherung = 'Datensicherung';
  rs_PCM_Programminfo = 'Programminfo';
  rs_PCM_Handbuch = 'Handbuch';
  rs_PCM_Nein = 'Nein';
  rs_PCM_Ja = 'Ja';
  rs_PCM_unbegrenzt = 'unbegrenzt';
  rs_PCM_Abbrechen ='Abbrechen';
  rs_PCM_Schliessen = 'Schließen';
  rs_PCM_Start = 'Programm gestartet';
  rs_PCM_Beenden = 'Programm beendet';
  rs_PCM_Verbindungsversuch1 = 'Verbindungsversuch';
  rs_PCM_Verbindungsversuch2 = 'erfolgreich';
  rs_PCM_Ende = 'Das Programm wird beendet.';
  rs_PCM_Style1 = 'Soll der gewählte Style sofort übernommen werden? ';
  rs_PCM_Style2 = 'Bei Ja wird das Programm neu gestartet.';
  rs_PCM_Benutzereingeben = 'Bitte Benutzer eingeben.';
  rs_PCM_Benutzerfalsch = 'Benutzerdaten sind nicht korrekt.';
  rs_PCM_Passworteingeben = 'Bitte Passwort eingeben.';
  rs_PCM_Anmeldung = ': Anmeldung';
  rs_PCM_LizenzFalsch = 'Lizenz nicht gültig!';
  rs_PCM_LizenzAbgelaufen = 'Lizenz ist abgelaufen!';
  rs_PCM_Lizenz = ': Lizenz';
  rs_PCM_TestLizenz = 'Es ist eine 30-tägige Testlizenz vorhanden.  Möchten Sie die Testlizenz übernehmen?';
  rs_PCM_LizenzGueltig = ': Lizenz gültig bis ';
  rs_PCM_LizenzEintragen = 'Bitte Lizenz eingeben!';
  rs_PCM_PasswortAendern = ': Passwort ändern';
  rs_PCM_PasswortStimmtNicht = 'Die Passwörter stimmen nicht überein.';
  rs_PCM_PasswortAendern1 = 'Passwort ändern';
  rs_PCM_EingabePruefen = 'Bitte überprüfen Sie ihre Eingabe.';
  rs_PCM_KeinPasswort = 'Kein Passwort eingegeben.';
  rs_PCM_GridSpeichernFehler = 'Fehler beim Speichern des Layouts: ';
  rs_PCM_GridLadenFehler = 'Fehler beim Laden des Layouts: ';
  rs_PCM_Version = 'Version: ';
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
  rs_PCM_Modulliste_verstecken = 'Modulliste verstecken';
  rs_PCM_Modulliste_anzeigen = 'Modulliste anzeigen';
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
// Logfile
  rs_PCMLog_Verbindungerfolgreich ='Verbindung erfolgreich hergestellt';
  rs_PCMLog_KeineVerbindung1 = 'Es konnte keine Verbindung zur Datenbank auf dem Server ';
  rs_PCMLog_KeineVerbindung2 = ' hergestellt werden:';
  rs_PCMLog_PCMINIPruefen = 'Bitte überprüfen Sie die Serveradresse in der Konfigurationsdatei:';
  rs_PCMLog_FalschesPW = 'Falsches Passwort';
// PCM - Appserver
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
// PCM - Archiv
  rs_PCMArchiv_Archiv = 'Archiv';
  rs_PCMArchiv_DeleteIndex1 = 'Soll der Index ';
// PCM  - Backup / Backupservice
  rs_PCMBackup_BackupMod = 'Datensicherung';
  rs_PCMBackup_Backupgesichert = ' gesichert';
  rs_PCMBackup_Backup = 'Sicherung: Datenbank PCM wird gesichert';
  rs_PCMBackup_BackupLoeschen = 'Temporäre Dateien löschen: PCM wird gelöscht';
  rs_PCMBackup_BackupErfolgreich = 'Sicherung: Datenbanken wurden erfolgreich gesichert';
  rs_PCMBackup_Ordnerwaehlen = 'Zielverzeichnis für Backup auswählen';
// PCM  - Benutzerverwaltung
  rs_PCMBenutzerverwaltung_Benutzer = 'Benutzer';
  rs_PCMBenutzerverwaltung_Vorname = 'Vorname';
  rs_PCMBenutzerverwaltung_Nachname = 'Nachname';
  rs_PCMBenutzerverwaltung_Bezeichnung = 'Bezeichnung';
  rs_PCMBenutzerverwaltung_RechteBearbeiten = 'Die vordefinierten Rechte können nicht bearbeitet werden!';
  rs_PCMBenutzerverwaltung_RechteLoeschen = 'Die vordefinierten Rechte können nicht gelöscht werden!';
  rs_PCMBenutzerverwaltung_BenutzerLoeschen = 'Der Hauptbenutzer kann nicht gelöscht werden!';
// PCM  - Lizenzgenerator
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
  rs_PCMLizenzgenerator_MessageKundenname = 'Bitte Kundennamen eingeben!';
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
// PCM - Manager
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
  rs_PCMManager_KalenderStundenplan = 'Kalender / Aufgaben / Jira / Stundenplan';
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
// PCM - Mediacenter
  rs_PCMMediacenter_Musikplayer = 'Musikplayer';
  rs_PCMMediacenter_Webradio = 'Webradio';
  rs_PCMMediacenter_Videoplayer = 'Videoplayer';
  rs_PCMMediacenter_Fotos = 'Fotos';
// PCM - MP3Manager
  rs_PCMMP3Manger_MP3Verzeichnis = 'MP3-Verzeichnis auswählen';
  rs_PCMMP3Manger_MP3Tags = 'MP3-Tags bearbeiten';
  rs_PCMMP3Manger_MP3DateiHinweis1 = 'Hinweis:  Datei ';
  rs_PCMMP3Manger_MP3DateiHinweis2 = ' wird geändert';
  rs_PCMMP3Manger_MP3DateiFehler1 = 'Fehler:  Datei ';
  rs_PCMMP3Manger_MP3DateiFehler2 = ' kann nicht geändert werden. Grund: Falsche Konvention';
  rs_PCMMP3Manger_MP3DateiFehler3 = ' kann nicht geändert werden. Grund: ';
  rs_PCMMP3Manger_MP3DateiEdit1 = 'Es wurden ';
  rs_PCMMP3Manger_MP3DateiEdit2 = ' Dateien editiert';
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
	rs_PCMService_ZielVerzeichnis = 'Bitte Ziel-Verzeichnis wählen';
	rs_PCMService_QuellVerzeichnis = 'Bitte Quell-Verzeichnis wählen';
  rs_PCMService_Shutdown = 'automatisches Herunterfahren';
  rs_PCMService_Backup = 'Sicherungen';
  rs_PCMService_Jobs = 'Termine / Aufgaben für PCM-Service';
  {$EndRegion resourcestring}
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
