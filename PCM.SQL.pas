unit PCM.SQL;

interface

uses
  PCM.Main;

type
  TPCMSQL = array [0 .. 2] of string;

var
  ASSQL_GetAutologin,
  ASSQL_GetLizenzCount_PCMArchiv,
  ASSQL_GetUserLizenz_PCMArchiv: TPCMSQL;

implementation
begin
  // PCM - Allgemein
  ASSQL_GetAutologin[0]:= 'SELECT ID,Benutzer FROM benutzer WHERE benutzer  = :Benutzer and Autologin = True';
  // PCM - Archiv
  // PCM.Data
  ASSQL_GetLizenzCount_PCMArchiv[0]:= 'Select Count(*)as Anzahl From archiv_lizenz';
  ASSQL_GetUserLizenz_PCMArchiv[0]:= 'Select Benutzer , Lizenz From archiv_lizenz';



end.
