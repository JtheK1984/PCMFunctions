# Projekt:
  PCMFunctions.exe Version: 1.0.0.0

# Kurzbeschreibung:
  Functionssammlung Delphi für PCM-Applikationen (dieses Projekt ist nicht kompilierbar)

# Entwicklungsumgebung:
  DELPHI 12.3 Athens

# Entwickler:
  Jens Henske

# Enthaltene Units und Formualare PCM-Functions
- Root (Soluling - Übersetzer)
  - NTBase.pas
  - NtBaseTranslator.pas
  - NtChekcer.pas
  - NtDatabaseUtils.pas
  - NtFontUtils.pas
  - NtGraphic.pas
  - NtHiddenId.pas
  - NtInitialLocale.pas
  - NtLanguageDlg.dfm
  - NtLanguageDlg.pas
  - NtListViewTranslator.pas
  - NtLocalization.pas
  - NtMenu.pas
  - NtNumber.pas
  - NtOrdinal.pas
  - NtPattern.pas
  - NtPictureTranslator.pas
  - NtPluralData.pas
  - NtQuotation.pas
  - NtResource.pas
  - NtResourceEx.pas
  - NtResourceString.pas
  - NtTranslator.pas
  - NtTranslatorEx.pas
  - NtTreeViewTranslator.pas
  - NtVer.inc
  - NtWindows.pas
- Root (PCM)
  - PCMBenutzerverwaltung.dfm
  - PCMBenutzerverwaltung.pas
  - PCM.Browser.FullScreen.dfm
  - PCM.Browser.FullScreen.pas
  - PCM.Browser.pas
  - PCM.Calculate.pas
  - PCM.data.dfm
  - PCM.data.pas
  - PCM.Design.dfm
  - PCM.Design.pas
  - PCM.Functions.AppInfo.dfm,
  - PCM.Functions.AppInfo.pas
  - PCM.Functions.ChangePW.dfm
  - PCM.Functions.ChangePW.pas
  - PCM.Functions.ChangePW.SQL.pas
  - PCM.Functions.Languages.dfm
  - PCM.Functions.Languages.pas
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
  - PCM.Handbuch.dfm
  - PCM.Handbuch.pas
  - PCM.Helper.pas
  - PCM.Reports.pas
  - PCM.Strings.pas
  - skins.inc
- Webview2 

# Erforderliche Komponenten (DELPHI-IDE):
  - Devexpress 24.2.4
  - Abrevia 2025.03 (Getit-Package)

# Erforderliche Scripte (nur für die Buildpipelines in Azure DevOps):
  - PrepareBuild.cmd (Umgebungsvariablen für Delphi anpassen, wird für den Build benötigt)
  - PrepareCopy.cmd (erzeugte Versionen werden in das Inno-Setupverzeichnis abgelgt)

# Stand:
  21.07.2025
