unit PCM.Functions.ChangePW.SQL;

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
  ASSQL_ChangePW: TPCMSQL;
  {$EndRegion var}
implementation
begin
  {$Region Begin}
  ASSQL_ChangePW[DB_MYSQL]:= 'Update benutzer set Passwort = :Passwort WHERE ID = :ID ';
  {$EndRegion Begin}
end.
