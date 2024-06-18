unit PCM.Functions.ChangePW.SQL;

interface

uses
  PCM.Data;

type
  TPCMSQL = array [0 .. 2] of string;

var
  ASSQL_ChangePW: TPCMSQL;

implementation
begin
  ASSQL_ChangePW[DB_MYSQL]:= 'Update benutzer set Passwort = :Passwort WHERE ID = :ID ';
end.
