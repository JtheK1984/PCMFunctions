unit PCM.SQL;

interface

uses
  PCM.Main;

type
  TPCMSQL = array [0 .. 2] of string;

var
  ASSQL_GetAutologin,
  ASSQL_GetAllRights,
  ASSQL_GetUSer,
  ASSQL_GetRights,
  ASSQL_GetRightsDetail,
  ASSQL_GetUsername,
  ASSQL_GetLizenzCount_PCMArchiv,
  ASSQL_GetUserLizenz_PCMArchiv,
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
  ASSQL_ChartProg: TPCMSQL;

implementation
begin
  // PCM - Allgemein
  ASSQL_GetAutologin[0]:= 'SELECT ID,Benutzer FROM benutzer WHERE benutzer  = :Benutzer and Autologin = True';
  ASSQL_GetAllRights[0]:= 'SELECT mr.ba_backup, mr.dm_archiv,mr.Benutzer,mr.Konfiguration,mr.ma_Kontakte as Kontakte,mr.ma_Kalender as Kalender,mr.ma_Stundenplan as Stundenplan,'+
                       'mr.ma_Email as Email,mr.ma_Password as Password,mr.ma_Serials as Serials,mr.ma_Monatsuebersicht as Monatsuebersicht,'+
                       'mr.ma_Verfuegung as Verfuegung,mr.ma_Einnahmen as Einnahmen,mr.ma_Ausgaben as Ausgaben '+
                       'FROM benutzer mb LEFT OUTER JOIN rechte mr ON mr.ID = mb.ID_rechte WHERE mb.id = :ID';
  ASSQL_GetUSer[0]:= 'Select ID, Benutzer, Vorname, Nachname,Passwort,Autologin, ID_Rechte,Restapi  From Benutzer';
  ASSQL_GetRights[0]:= 'Select *  From Rechte';
  ASSQL_GetRightsDetail[0]:= 'Select Nummer, Bezeichnung From Rechte_detail';
  ASSQL_GetUsername[0]:= 'Select Benutzer from Benutzer Where ID = :ID';
  // PCM - Archiv
  // PCM.Data
  ASSQL_GetLizenzCount_PCMArchiv[0]:= 'Select Count(*)as Anzahl From archiv_lizenz';
  ASSQL_GetUserLizenz_PCMArchiv[0]:= 'Select Benutzer , Lizenz From archiv_lizenz';

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

end.
