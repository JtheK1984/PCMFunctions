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
  ASSQL_GetUserLizenz_PCMArchiv: TPCMSQL;

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



end.
