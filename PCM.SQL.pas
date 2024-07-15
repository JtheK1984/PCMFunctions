unit PCM.SQL;

interface

uses
  PCM.Main,
  PCM.Data;

type
  TPCMSQL = array [0 .. 2] of string;

var
  ASSQL_GetAutologin,
  ASSQL_GetAllRights,
  ASSQL_GetUSer,
  ASSQL_GetRights,
  ASSQL_GetRightsDetail,
  ASSQL_GetUsername,
  ASSQL_GetCurrentLizenzCount,
  ASSQL_GetUserLizenz,
  ASSQL_GetBackupOptions,
  ASSQL_GetDefaultID,
  ASSQL_InsDefault,
  ASSQL_GetDefaultCount,
  ASSQL_GetLizenzCount,
  ASSQL_GetBenutzer,
  ASSQL_DeleteKunden,
  ASSQL_DeleteLizenz,
  ASSQL_OpenBenutzer,
  ASSQL_OpenKunde,
  ASSQL_OpenLizenz,
  ASSQL_OpenProgramme,
  ASSQL_OpenAProgramme,
  ASSQL_ChartKunde,
  ASSQL_ChartLizenz,
  ASSQL_ChartProg,
  ASSQL_GetCustomerCount,
  ASSQL_InsCustomer,
  ASSQL_UpdCustomer,
  ASSQL_GetLicenceIDDefault,
  ASSQL_GetLicenceCountDefault,
  ASSQL_GetLicence,
  ASSQL_GetLicenceInfo,
  ASSQL_GetLicenceCount,
  ASSQL_SetLicence,
  ASSQL_GetProgramms,
  ASSQL_GetProgramm,
  // PCM - Mediacenter
  ASSQL_GetLizenzCount_PCMMediaCenter,
  ASSQL_GetUserLizenz_PCMMediaCenter,
  // PCM - MP3Manager
  ASSQL_GetLizenzCount_PCMMP3,
  ASSQL_GetUserLizenz_PCMMP3,
  // PCM - Notenrechner
  ASSQL_GetLizenzCount_PCMNotenrechner,
  ASSQL_GetUserLizenz_PCMNotenrechner,
  // PCM - Servicemanager
  ASSQL_GetLizenzCount_PCMServicemanager,
  ASSQL_GetUserLizenz_PCMServicemanager,
  // PCM - Vokabeltrainer
  ASSQL_GetLizenzCount_PCMVokabeltrainer,
  ASSQL_GetUserLizenz_PCMVokabeltrainer: TPCMSQL;

implementation
begin
  // PCM - Allgemein
  ASSQL_GetAutologin[0]:= 'SELECT ID,Benutzer FROM benutzer WHERE benutzer  = :Benutzer and Autologin = True';
  ASSQL_GetAllRights[0]:= 'SELECT mr.ba_backup, mr.dm_archiv,mr.Benutzer,mr.Konfiguration,mr.Design,mr.lg_Lizenzen,mr.lg_Programme, mr.ma_Kontakte as Kontakte,mr.ma_Kalender as Kalender,mr.ma_Stundenplan as Stundenplan,'+
                       'mr.ma_Email as Email,mr.ma_Password as Password,mr.ma_Serials as Serials,mr.ma_Monatsuebersicht as Monatsuebersicht,'+
                       'mr.ma_Verfuegung as Verfuegung,mr.ma_Einnahmen as Einnahmen,mr.ma_Ausgaben as Ausgaben,'+
                       'mr.mc_Audioplayer AS Audioplayer,mr.mc_webradio AS  Webradio,mr.mc_Videoplayer AS Videoplayer,mr.mc_Fotos AS Fotos, ' +
                       'mr.mm_mp3 as MP3 ' +
                       'FROM benutzer mb LEFT OUTER JOIN rechte mr ON mr.ID = mb.ID_rechte WHERE mb.id = :ID';
  ASSQL_GetUSer[0]:= 'Select ID, Benutzer, Vorname, Nachname,Passwort,Autologin, ID_Rechte,Restapi  From Benutzer';
  ASSQL_GetRights[0]:= 'Select *  From Rechte';
  ASSQL_GetRightsDetail[0]:= 'Select Nummer, Bezeichnung From Rechte_detail';
  ASSQL_GetUsername[0]:= 'Select Benutzer from Benutzer Where ID = :ID';
  // PCM - Archiv
  ASSQL_GetCurrentLizenzCount[0]:= 'Select Count(*)as Anzahl From ' + PCM_Alias + '_lizenz';
  ASSQL_GetUserLizenz[0]:= 'Select Benutzer , Lizenz From ' + PCM_Alias + '_lizenz';
  // PCM - Backup
  ASSQL_GetBackupOptions[0]:= 'SELECT * FROM service_backupdatabase';
  // PCM - Lizenzgenerator
  ASSQL_GetDefaultID[0]:= 'SELECT ID FROM lizenzgenerator_Kunden WHERE Name  = :Name and ID_benutzer = 1';
  ASSQL_InsDefault[0]:= 'Insert Into lizenzgenerator_Kunden (name,ID_Benutzer) values(:name,1)';
  ASSQL_GetDefaultCount[0]:= 'SELECT COUNT(*) as Anzahl  FROM lizenzgenerator_Kunden WHERE Name  = :Name and ID_benutzer = 1';
  ASSQL_DeleteKunden[0]:= 'Delete From lizenzgenerator_lizenzen Where ID_Kunden = :ID';
  ASSQL_DeleteLizenz[0]:= 'SELECT DISTINCT Programm FROM lizenzgenerator_programme WHERE Number = :Number';
  ASSQL_OpenBenutzer[0]:=  'Select ID, Benutzer, Vorname, Nachname,Passwort From Benutzer';
  ASSQL_OpenKunde[0]:='Select id, Name, Strasse, PLZ, Ort,ID_Benutzer From lizenzgenerator_Kunden order by ID';
  ASSQL_OpenLizenz[0]:= 'Select ID, ID_Kunden,Datum, Uhrzeit, Version, Demo, Gueltig_bis,Lizenz, Programm,Bemerkung,ID_Benutzer From lizenzgenerator_lizenzen Order By ID_Kunden';
  ASSQL_OpenProgramme[0]:= 'Select Number, Programm From lizenzgenerator_programme Group by Number, Programm order by Programm';
  ASSQL_OpenAProgramme[0]:= 'Select ID,Major,minor, Number, Programm,Lizenz From lizenzgenerator_programme ORDER by Number, Major,Minor';
  ASSQL_ChartKunde[0]:= 'SELECT COUNT(*) as Wert, kun.Name FROM lizenzgenerator_lizenzen liz LEFT OUTER JOIN lizenzgenerator_kunden kun ON liz.ID_Kunden = kun.ID GROUP BY ID_Kunden';
  ASSQL_ChartLizenz[0]:= 'SELECT COUNT(*) as Wert, pro.Programm FROM lizenzgenerator_lizenzen liz LEFT OUTER JOIN lizenzgenerator_programme pro ON liz.Programm = pro.ID GROUP BY liz.programm';
  ASSQL_ChartProg[0]:= 'SELECT COUNT(*) as Wert,Programm FROM lizenzgenerator_programme Group BY number';
  ASSQL_GetCustomerCount[0]:= 'SELECT COUNT(*) as Anzahl  FROM lizenzgenerator_Kunden WHERE Name  = :Name AND Strasse = :Strasse AND PLZ = :PLZ AND Ort = :Ort and ID_benutzer = :ID_benutzer';
  ASSQL_InsCustomer[0]:= 'Insert Into lizenzgenerator_Kunden (name,Strasse,PLZ,Ort,ID_Benutzer) values(:name,:Strasse,:PLZ,:Ort,:ID_Benutzer)';
  ASSQL_UpdCustomer[0]:= 'Update lizenzgenerator_Kunden Set name = :name ,Strasse = :Strasse,PLZ = :PLZ,Ort = :Ort,ID_Benutzer = :ID_Benutzer Where ID = :ID';
  ASSQL_GetLicenceIDDefault[0]:='SELECT ID FROM lizenzgenerator_lizenzen WHERE ID_kunden = :ID  AND Version = :Version AND  Programm = :Programm';
  ASSQL_GetLicenceCountDefault[0]:='SELECT COUNT(*)as Anzahl FROM lizenzgenerator_lizenzen WHERE ID_kunden = :ID  AND Version = :Version AND  Programm = :Programm';
  ASSQL_GetLicence[0]:= 'Select Distinct Number From lizenzgenerator_programme Where Programm = :Programm';
  ASSQL_GetLicenceInfo[0]:= 'Select Major,Minor From lizenzgenerator_programme Where Programm = :Programm and Lizenz = true order by Major, Minor';
  ASSQL_GetLicenceCount[0]:= 'SELECT COUNT(*)as Anzahl FROM lizenzgenerator_lizenzen WHERE ID_kunden = :ID  AND Version = :Version AND Demo = :Demo  And Programm = :Programm  AND Gueltig_bis = :Gueltig_bis';
  ASSQL_SetLicence[0]:= 'Update lizenzgenerator_lizenzen Set ID_Kunden = :ID_Kunden, Datum = :Datum, Uhrzeit= :Uhrzeit, ' +
                               'Version = :Version, Demo = :Demo, Gueltig_bis= :Gueltig_bis ,Programm = :Programm, Lizenz =  :Lizenz, Bemerkung = :Bemerkung, ID_Benutzer = :ID_Benutzer Where ID = :ID';
  ASSQL_GetProgramms[0]:= 'Select DISTINCT Number,Programm From lizenzgenerator_programme Where Lizenz = true order by Programm';
  ASSQL_GetProgramm[0]:= 'Select Programm From lizenzgenerator_programme Where Number = :Number';

end.
