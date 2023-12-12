unit PCM.Strings;

interface

uses Windows, Classes;

// allgemein
resourcestring
  rs_PCM_Benutzerverwaltung ='Benutzerverwaltung';
  rs_PCM_Systeminformation = 'Systeminformation';
  rs_PCM_Konfiguration = 'Konfiguration';
  rs_PCM_Sprachdatei = 'Sprachdatei kann nicht geladen werden';
  rs_PCM_Demolizenz = ' - Demolizenz gültig bis ';
  rs_PCM_Datensicherung = 'Datensicherung';
  rs_PCM_Programminfo = 'Programminfo';
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
// Logfile
  rs_PCMLog_Verbindungerfolgreich ='Verbindung erfolgreich hergestellt';
  rs_PCMLog_KeineVerbindung1 = 'Es konnte keine Verbindung zur Datenbank auf dem Server ';
  rs_PCMLog_KeineVerbindung2 = ' hergestellt werden:';
  rs_PCMLog_PCMINIPruefen = 'Bitte überprüfen Sie die Serveraddresse in der Konfigurationsdatei:';
  rs_PCMLog_FalschesPW = 'Falsches Passwort';
// PCM - Appserver
  rs_PCMAPPServer_Start = 'PCM - APPServer mit HTTPS gestartet';
  rs_PCMAPPServer_Dienst = 'Appserver für PCM-Apps';
  rs_PCMAPPServer_BenutzerausPCMpruefen = 'Benutzer aus PCM - APP prüfen';
  rs_PCMAPPServer_Tokenpruefung = 'Token geprüft';
  rs_PCMAPPServer_Kontakteanzahl = 'Kontakte lesen, Anzahl:';
  rs_PCMAPPServer_Kontaktepruefung = 'Kontakte geprüft, Anzahl:';
  rs_PCMAPPServer_Kalenderanzahl = 'Kalender lesen, Anzahl:';
  rs_PCMAPPServer_Kalenderpruefung = 'Kalender geprüft, Anzahl:';
  rs_PCMAPPServer_Passwordanzahl = 'Passwörter lesen, Anzahl:';
  rs_PCMAPPServer_Passwordpruefung = 'Passwörter geprüft, Anzahl:';
  rs_PCMAPPServer_Serialsanzahl = 'Serials lesen, Anzahl:';
  rs_PCMAPPServer_Serialspruefung = 'Serials geprüft, Anzahl:';
  rs_PCMAPPServer_Ausgabenanzahl = 'Ausgaben lesen, Anzahl:';
  rs_PCMAPPServer_Ausgabenpruefung = 'Ausgaben geprüft, Anzahl:';
  rs_PCMAPPServer_Einnahmenanzahl = 'Einnahmen lesen, Anzahl:';
  rs_PCMAPPServer_Einnahmenpruefung = 'Einnahmen geprüft, Anzahl:';
  rs_PCMAPPServer_GeraeteRegistrierung = 'Gerät wird registriert';
// PCM  - Backup / Backupservice
  rs_PCMBackup_Backupgesichert = ' gesichert';
  rs_PCMBackup_Backup = 'Sicherung: Datenbank PCM wird gesichert';
  rs_PCMBackup_BackupLoeschen = 'Temporäre Dateien löschen: PCM wird gelöscht';
  rs_PCMBackup_BackupErfolgreich = 'Sicherung: Datenbanken wurden erfolgreich gesichert';
  rs_PCMBackup_Ordnerwaehlen = 'Zielverzeichniss für Backup auswählen';
// PCM  - Benutzerverwaltung
  rs_PCMBenutzerverwaltung_Benutzer = 'Benutzer';
  rs_PCMBenutzerverwaltung_Vorname = 'Vorname';
  rs_PCMBenutzerverwaltung_Nachname = 'Nachname';
  rs_PCMBenutzerverwaltung_Bezeichnung = 'Bezeichnung';
  rs_PCMBenutzerverwaltung_RechteBearbeiten = 'Die vordefinierten Rechte können nicht bearbeitet werden!';
  rs_PCMBenutzerverwaltung_RechteLoeschen = 'Die vordefinierten Rechte können nicht gelöscht werden!';
  rs_PCMBenutzerverwaltung_BenutzerLoeschen = 'Der Haupbenutzer kann nicht gelöscht werden!';
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
  rs_PCMManager_Kontakte = 'Kontakte: ';
  rs_PCMManager_Terminealle = 'Termine alle: ';
  rs_PCMManager_Aufgaben = 'Aufgaben: ';
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


type
  TResourceStringID = Pointer;

  TResOriginalStrings = class(TStringList)
  public
    constructor Create;
  end;

var
  FResOriginalStrings: TResOriginalStrings = nil;
  FResStrings: TStringList = nil;
  FUseResCache: Boolean = true;

// TS, 02.10.2012 Bug: #DCH-1301 Performance ab Sommerrelease (virtualisiert)
procedure initNewLanguage(locale: LCID);
procedure CreateResStringLists;
procedure DestroyResStringLists;
procedure ClearResourceStrings;
function GetResourceString(AResString: TResourceStringID): string;

implementation

uses SysUtils;

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

procedure SetResourceString(AResString: TResourceStringID;
  const Value: string);
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

// TS, 02.10.2012 Bug: #DCH-1301 Performance ab Sommerrelease (virtualisiert)
procedure initNewLanguage(locale: LCID);
begin
  ClearResourceStrings;
end;

initialization
  CreateResStringLists;
finalization
  DestroyResStringLists;
end.