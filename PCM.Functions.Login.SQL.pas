unit PCM.Functions.Login.SQL;

interface

uses
  {$Region uses}
  PCM.Data;
  {$EndRegion uses}
type
  {$Region type}
  TPCMSQL = array [0 .. 2] of string;
  {$EndRegion type}
var
  {$Region var}
  ASSQL_GetUser,
  ASSQL_GetUserLogin,
  ASSQL_GetUserLoginWithoutPassword,
  ASSQL_GetUserAutoLogin: TPCMSQL;
  {$EndRegion var}
implementation
begin
  {$Region Begin}
  ASSQL_GetUser[DB_MYSQL]:= 'SELECT benutzer FROM benutzer order by benutzer asc';
  ASSQL_GetUserLogin[DB_MYSQL]:= 'SELECT ID FROM benutzer WHERE benutzer  = :Benutzer AND Passwort = :Passwort';
  ASSQL_GetUserLoginWithoutPassword[DB_MYSQL]:= 'SELECT ID FROM benutzer WHERE benutzer  = :Benutzer';
  ASSQL_GetUserAutoLogin[DB_MYSQL]:= 'SELECT ID,Benutzer FROM benutzer WHERE benutzer  = :Benutzer and Autologin = True';
  {$EndRegion Begin}
end.
