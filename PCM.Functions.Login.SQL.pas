unit PCM.Functions.Login.SQL;

interface

uses
  PCM.Data;

type
  TPCMSQL = array [0 .. 2] of string;

var
  ASSQL_GetUser,
  ASSQL_GetUserLogin,
  ASSQL_GetUserLoginWithoutPassword,
  ASSQL_GetUserAutoLogin: TPCMSQL;

implementation
begin
  ASSQL_GetUser[DB_MYSQL]:= 'SELECT benutzer FROM benutzer order by benutzer asc';
  ASSQL_GetUser[DB_MSSQL]:= 'SELECT benutzer FROM pcm_lizenzgenerator.benutzer order by benutzer asc';
  ASSQL_GetUser[DB_ADS]:= 'SELECT benutzer FROM benutzer order by benutzer asc';

  ASSQL_GetUserLogin[DB_MYSQL]:= 'SELECT ID FROM benutzer WHERE benutzer  = :Benutzer AND Passwort = :Passwort';
  ASSQL_GetUserLogin[DB_MSSQL]:= 'SELECT ID FROM pcm_lizenzgenerator.benutzer WHERE benutzer  = :Benutzer AND Passwort = :Passwort';
  ASSQL_GetUserLogin[DB_ADS]:= 'SELECT ID FROM benutzer WHERE benutzer  = :Benutzer AND Passwort = :Passwort';

  ASSQL_GetUserLoginWithoutPassword[DB_MYSQL]:= 'SELECT ID FROM benutzer WHERE benutzer  = :Benutzer';

  ASSQL_GetUserAutoLogin[DB_MYSQL]:= 'SELECT ID,Benutzer FROM benutzer WHERE benutzer  = :Benutzer and Autologin = True';

end.
