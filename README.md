# Projekt: 
  PCM.Functions (dieses Projekt ist nicht kompilierbar)

# Enthaltene Units und Formualare 
  - PCM.Benutzerverwaltung.dfm
  - PCM.Benutzerverwaltung.pas
  - PCM.Functions.AppInfo.dfm
  - PCM.Functions.AppInfo.pas
  - PCM.Functions.ChangePW.dfm
  - PCM.Functions.ChangePW.pas
  - PCM.Functions.Lizenz.dfm
  - PCM.Functions.Lizenz.pas
  - PCM.Functions.Login.dfm
  - PCM.Functions.Login.pas
  - PCM.Functions.Login.SQL.pas
  - PCM.Functions.dfm
  - PCM.Functions.pas
  - PCM.Functions.Server.Methods.pas
  - PCM.Functions.Synch.ProgressDialog.dfm
  - PCM.Functions.Synch.ProgressDialog.pas
  - PCM.Functions.Synch.Transparenz.dfm
  - PCM.Functions.Synch.Transparenz.pas
  - PCM.Functions.Synch.Wait.pas

# Kurzbeschreibung
  Functionssammlung Delphi 

# Funktionsinhalt
  - PCM.Functions.AppInfo:
    - Globales Fomular zum Anzeigen von Applikationsinformationen wie Version, Release etc. sowie zum Anzeigen der Lizenzdaten  
  - PCM.Functions.ChangePW:
    - Globales Fomular zum Ändern des Benutzerpassworts in allen PCM-Applikationen
  - PCM.Functions.Lizenz  
    - Globales Fomular zum Prüfen und Eintragen der Lizenzdaten
  - PCM.Functions.Login
    - Globales Fomular für das Login in allen PCM-Applikationen
  - PCM.Functions    
    - Globales Fomular für folgende Funktionen:
        - erstellen von Threads
        - Schreiben der Logfile
        - Speichern und Laden der cxGrids auf Datenbankebene
        - Auslesen des Arbeitsspeichers Größe und aktuelle Nutzung
        - MD5-Hash-Erstellung für Passwörter
  - PCM.Functions.Server.Methods
    - Unit zur Bereitstellung für PCM-Service mit folgenden Funktionen
        - Autmatisches herunterfahren des PC's nach einem bestimmten Intervall oder zu einem bestimmten Zeitpunkt
        - Sicherung definierter Dateien 
        - Sicherung definierter Ordner
        - Sicherung der Datenbank 
        - Sicherung des Quellcodes
        - Zippen der Datenbanken und des Quellcodes
        - Kopieren und Komprimierung der Dateien in ein bestimmtes Verzeichnis 
  - PCM.Functions.Synch.ProgressDialog
    - Fomular für Fortschrittsanzeige
  - PCM.Functions.Synch.Transparenz
    - Transparentes Fomular für Fortschrittsanzeige
  - PCM.Functions.Synch.Wait.pas        
    - Unit zum Verwalten der Fortschrittsanzeige

# Entwicklungsumgebung:
  DELPHI 12

# Entwickler:
  Jens Henske
	
# Abhängigkeiten zu folgenden DLL's:
  - 32-Bit 
    - libmysql.dll (DLL für Verbindung zur MySQL-Datenbank)
  - 64-Bit 
    - libmysql.dll (DLL für Verbindung zur MySQL-Datenbank)
	
# Erforderliche Komponenten (DELPHI-IDE)
  - Devexpress
  - Abrevia (Get-IT)
	
# Erforderliche Scripte (nur für die Buildpipelines in Azure DevOps): 
  - PrepareBuild.cmd (Umgebungsvariablen für Delphi anpassen, wird für den Build benötigt)
  - PrepareCopy.cmd (erzeugte Versionen werden in das Inno-Setupverzeichnis abgelgt)

# Stand:
  07.08.2024