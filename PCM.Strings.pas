unit PCM.Strings;

interface

uses Windows, Classes;

// allgemein
resourcestring rs_PCM_Benutzerverwaltung ='Benutzerverwaltung';
resourcestring rs_PCM_Systeminformation = 'Systeminformation';
resourcestring rs_PCM_Konfiguration = 'Konfiguration';
resourcestring rs_PCM_Sprachdatei = 'Sprachdatei kann nicht geladen werden';
resourcestring rs_PCM_Demolizenz = ' - Demolizenz gültig bis ';
resourcestring rs_PCM_Datensicherung = 'Datensicherung';
resourcestring rs_PCM_Programminfo = 'Programminfo';
resourcestring rs_PCM_Nein = 'Nein';
resourcestring rs_PCM_Ja = 'Ja';
resourcestring rs_PCM_unbegrenzt = 'unbegrenzt';
resourcestring rs_PCM_Abbrechen ='Abbrechen';
resourcestring rs_PCM_Schliessen = 'Schließen';
resourcestring rs_PCM_Start = 'Programm gestartet';
resourcestring rs_PCM_Beenden = 'Programm beendet';
resourcestring rs_PCM_Verbindungsversuch1 = 'Verbindungsversuch';
resourcestring rs_PCM_Verbindungsversuch2 = 'erfolgreich';
resourcestring rs_PCM_Ende = 'Das Programm wird beendet.';
resourcestring rs_PCM_Style1 = 'Soll der gewählte Style sofort übernommen werden? ';
resourcestring rs_PCM_Style2 = 'Bei Ja wird das Programm neu gestartet.';
resourcestring rs_PCM_Benutzereingeben = 'Bitte Benutzer eingeben.';
resourcestring rs_PCM_Benutzerfalsch = 'Benutzerdaten sind nicht korrekt.';
resourcestring rs_PCM_Passworteingeben = 'Bitte Passwort eingeben.';
resourcestring rs_PCM_Anmeldung = ': Anmeldung';
resourcestring rs_PCM_LizenzFalsch = 'Lizenz nicht gültig!';
resourcestring rs_PCM_LizenzAbgelaufen = 'Lizenz ist abgelaufen!';
resourcestring rs_PCM_Lizenz = ': Lizenz';
resourcestring rs_PCM_TestLizenz = 'Es ist eine 30-tägige Testlizenz vorhanden.  Möchten Sie die Testlizenz übernehmen?';
resourcestring rs_PCM_LizenzGueltig = ': Lizenz gültig bis ';
resourcestring rs_PCM_LizenzEintragen = 'Bitte Lizenz eingeben!';
resourcestring rs_PCM_PasswortAendern = ': Passwort ändern';
resourcestring rs_PCM_PasswortStimmtNicht = 'Die Passwörter stimmen nicht überein.';
resourcestring rs_PCM_PasswortAendern1 = 'Passwort ändern';
resourcestring rs_PCM_EingabePruefen = 'Bitte überprüfen Sie ihre Eingabe.';
resourcestring rs_PCM_KeinPasswort = 'Kein Passwort eingegeben.';
// Logfile
resourcestring rs_PCMLog_Verbindungerfolgreich ='Verbindung erfolgreich hergestellt';
resourcestring rs_PCMLog_KeineVerbindung1 = 'Es konnte keine Verbindung zur Datenbank auf dem Server ';
resourcestring rs_PCMLog_KeineVerbindung2 = ' hergestellt werden:';
resourcestring rs_PCMLog_PCMINIPruefen = 'Bitte überprüfen Sie die Serveraddresse in der Konfigurationsdatei:';
resourcestring rs_PCMLog_FalschesPW = 'Falsches Passwort';
// PCM - Appserver
resourcestring rs_PCMAPPServer_Start = 'PCM - APPServer mit HTTPS gestartet';
resourcestring rs_PCMAPPServer_Dienst = 'Appserver für PCM-Apps';
resourcestring rs_PCMAPPServer_BenutzerausPCMpruefen = 'Benutzer aus PCM - APP prüfen';
resourcestring rs_PCMAPPServer_Tokenpruefung = 'Token geprüft';
resourcestring rs_PCMAPPServer_Kontakteanzahl = 'Kontakte lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Kontaktepruefung = 'Kontakte geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_Kalenderanzahl = 'Kalender lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Kalenderpruefung = 'Kalender geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_Passwordanzahl = 'Passwörter lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Passwordpruefung = 'Passwörter geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_Serialsanzahl = 'Serials lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Serialspruefung = 'Serials geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_Ausgabenanzahl = 'Ausgaben lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Ausgabenpruefung = 'Ausgaben geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_Einnahmenanzahl = 'Einnahmen lesen, Anzahl:';
resourcestring rs_PCMAPPServer_Einnahmenpruefung = 'Einnahmen geprüft, Anzahl:';
resourcestring rs_PCMAPPServer_GeraeteRegistrierung = 'Gerät wird registriert';
// PCM  - Backup / Backupservice
resourcestring rs_PCMBackup_Backupgesichert = ' gesichert';
resourcestring rs_PCMBackup_Backup = 'Sicherung: Datenbank PCM wird gesichert';
resourcestring rs_PCMBackup_BackupLoeschen = 'Temporäre Dateien löschen: PCM wird gelöscht';
resourcestring rs_PCMBackup_BackupErfolgreich = 'Sicherung: Datenbanken wurden erfolgreich gesichert';
resourcestring rs_PCMBackup_Ordnerwaehlen = 'Zielverzeichniss für Backup auswählen';
// PCM  - Benutzerverwaltung
resourcestring rs_PCMBenutzerverwaltung_Benutzer = 'Benutzer';
resourcestring rs_PCMBenutzerverwaltung_Vorname = 'Vorname';
resourcestring rs_PCMBenutzerverwaltung_Nachname = 'Nachname';
resourcestring rs_PCMBenutzerverwaltung_Bezeichnung = 'Bezeichnung';
resourcestring rs_PCMBenutzerverwaltung_RechteBearbeiten = 'Die vordefinierten Rechte können nicht bearbeitet werden!';
resourcestring rs_PCMBenutzerverwaltung_RechteLoeschen = 'Die vordefinierten Rechte können nicht gelöscht werden!';
resourcestring rs_PCMBenutzerverwaltung_BenutzerLoeschen = 'Der Haupbenutzer kann nicht gelöscht werden!';
// Lizenzgenerator
resourcestring rs_liz_Demolizenz = 'Demolizenz für: ';
resourcestring rs_liz_Programm = 'Programm: ';
resourcestring rs_liz_Version = 'Version: ';
resourcestring rs_liz_Gueltig = 'Gültig bis: ';
resourcestring rs_liz_Benutzer = 'Benutzer: PCM';
resourcestring rs_liz_Lizenz = 'Lizenz: ';

resourcestring rs_liz_KundeLizenz = 'Kunden / Lizenzen';
resourcestring rs_liz_Programme = 'Programme';
resourcestring rs_liz_Lizenzautomatic = 'automatische Lizenz';
resourcestring rs_liz_MessageKundenname = 'Bitte Kundennamen eingeben!';
resourcestring rs_liz_MessageStrasse = 'Bitte Straße eingeben!';
resourcestring rs_liz_MessagePLZ = 'Bitte PLZ eingeben!';
resourcestring rs_liz_MessageORT = 'Bitte Ort eingeben!';
resourcestring rs_liz_MessageKundeexists = 'Kunde exisitiert bereits!';
resourcestring rs_liz_Lizenfuer = 'Lizenz für "';
// PCM - Service / Servicemanager
resourcestring rs_PCMService_AktuelleZeit = 'aktuelles Datum/Zeit: ';
resourcestring rs_PCMService_naechsterZeitpunkt = 'nächster zeitpunkt: ';
resourcestring rs_PCMService_Herunterfahren = 'PC wird heruntergefahren';
resourcestring rs_PCMService_Beenden = 'Service beendet';

implementation

end.