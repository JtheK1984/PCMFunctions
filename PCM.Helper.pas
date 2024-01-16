unit PCM.Helper;

interface

uses
  inifiles,
  vcl.Dialogs,
  vcl.forms,
  Winapi.Windows,
  System.SysUtils,
  PCM.Main,
  PCM.Data,
  PCM.SQL,
  PCM.Strings,
  PCM.Functions,
  PCM.Functions.Lizenz;

function CheckAutologin: String;
function Autologin: boolean;
function GetAppVersionLizenz: string;
function CheckLizenz: boolean;
procedure CheckLizenzNew;
function ReadServerAdress: boolean;

implementation

function CheckAutologin: String;
begin
  Result:= '';
  dm_pcm.qry_Work.SQL.Text:= ASSQL_GetAutologin[dm_PCM.iDBType];
  dm_pcm.qry_Work.ParamByName('Benutzer').asString:= frm_PCM_System.GetCurrentUsername;
  dm_pcm.qry_Work.Open;
  if dm_pcm.qry_Work.RecordCount > 0 then
  begin
    Result := dm_pcm.qry_Work.FieldByName('Benutzer').AsString;
    dm_PCM.iIDBenutzerPCM:= dm_pcm.qry_Work.FieldByName('ID').AsInteger;
  end;
  dm_pcm.qry_Work.Close;
end;
function Autologin: boolean;
begin
  Result:= false;
  dm_PCM.sUSerAutologin := CheckAutologin;
  if dm_pcm.sUSerAutologin <> '' then
  begin
    Result:= true;
  end;
end;
function GetAppVersionLizenz: string;
var
  dwVerInfoSize: DWord;
  poiVerInfo: Pointer;
  dwVerValueSize: DWord;
  ffiVerValue: PVSFixedFileInfo;
  dwDummy: DWord;
begin
  Result := '';
  dwVerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), dwDummy);
  if dwVerInfoSize = 0 then
    exit;
  GetMem(poiVerInfo, dwVerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, dwVerInfoSize, poiVerInfo);
  VerQueryValue(poiVerInfo, '\', Pointer(ffiVerValue), dwVerValueSize);
  with ffiVerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + IntToStr(dwFileVersionMS and $FFFF);
    Application.CreateForm(Tfrm_PCM_Lizenz,frm_PCM_Lizenz);
    frm_PCM_Lizenz.str_Version:= Result;
    frm_PCM_Lizenz.free;
  end;
  FreeMem(poiVerInfo, dwVerInfoSize);
end;
function CheckLizenz: boolean;
var
  iProgramm: integer;
  iGeburtTagMonat: integer;
  iGeburtjahr: integer;
  iDevjahr: integer;
  procedure MakeBitMatrix;
  var
    i, j, v, addr: Integer;
    mask: Integer;
    c: Char;
  begin
    for i := 1 to Length(dm_PCM.Nummer) do
    begin
      // Zeichen umwandeln in Zahl
      c := dm_PCM.Nummer[i];
      if (c >= '0') and (c <= '9') then
        v := Ord(c) - 48
      else
        v := Ord(c) - 65 + 10;
      mask := 1;
      for j := 0 to 4 do
      begin
        addr := (i - 1) * 5 + j;
        if addr <= High(frm_PCM_Lizenz.arrbolBitMatrix) then
        begin
          if (v and mask) <> 0 then
            frm_PCM_Lizenz.arrbolBitMatrix[addr] := True
          else
            frm_PCM_Lizenz.arrbolBitMatrix[addr] := False;
        end;
        mask := mask * 2;
      end;
    end;
  end;
  function MakeString(Length: Integer): string;
  var
    i, j, n, v, mask, addr: Integer;
  begin
    n := (Length + 4) div 5;
    Result := '';

    for i := 0 to n - 1 do
    begin
      // Wert von 5 Bits holen
      v := 0;
      mask := 1;
      for j := 0 to 4 do
      begin
        addr := i * 5 + j;
        if addr >= Length then
          Break;
        if frm_PCM_Lizenz.arrbolBitMatrix[i * 5 + j] then
          v := v or mask;
        mask := mask * 2;
      end;

      // in Buchstabe wandeln
      if (v >= 0) and (v <= 9) then
        Result := Result + Chr(v + 48)
      else
        Result := Result + Chr((v - 10) + 65);
    end;
  end;
  procedure ByteCrc(data: Byte; var crc: Word);
  var
    i: Byte;
  begin
    for i := 0 to 7 do
    begin
      if ((data and $01) xor (crc and $0001) <> 0) then
      begin
        crc := crc shr 1;
        crc := crc xor $A001;
      end
      else
        crc := crc shr 1;
      data := data shr 1;
    end;
  end;
  function StringCrc16(s: string): Word;
  var
    len, i: integer;
  begin
    result := 0;
    len := length(s);
    for i := 1 to len do
      bytecrc(ord(s[i]), result);
  end;
  function GetBits(Position, Length: Integer): Integer;
  var
    i: Integer;
    mask: Integer;
  begin
    Result := 0;
    mask := 1;

    for i := Position to Position + Length - 1 do
    begin
      if frm_PCM_Lizenz.arrbolBitMatrix[i] then
        Result := Result or mask;
      mask := mask * 2;
    end;
  end;
  function CheckCheckSum: Boolean;
  var
    v, chk: Integer;
  begin
    v := StringCrc16(dm_PCM.Firma + frm_PCM_Lizenz.sVersion + MakeString(Length(frm_PCM_Lizenz.arrbolBitMatrix) - 16));
    chk := GetBits(High(frm_PCM_Lizenz.arrbolBitMatrix) - 15, 16);
    Result := v = chk;
  end;
  procedure ScrambleBits;
  var
    i, v, mask: Integer;
  begin
    mask := 1;
    v := StringCrc16(dm_PCM.Firma);

    for i := 0 to High(frm_PCM_Lizenz.arrbolBitMatrix) do
    begin
      if i mod 16 = 0 then
        mask := 1
      else
        mask := mask * 2;
      frm_PCM_Lizenz.arrbolBitMatrix[i] := (v and mask <> 0) xor (frm_PCM_Lizenz.arrbolBitMatrix[i]);
    end;
  end;
begin
  frm_PCM_Lizenz.sVersion:= GetAppVersionLizenz;
  dm_PCM.qry_Work.SQL.Text:= ASSQL_GetUserLizenz[dm_PCM.iDBType];
  dm_PCM.qry_Work.open;
  dm_PCM.Firma := dm_PCM.qry_Work.FieldByName('Benutzer').AsString;
  dm_PCM.Nummer :=   StringReplace(dm_PCM.qry_Work.FieldByName('Lizenz').AsString, '-','',[rfReplaceAll]);
  dm_PCM.qry_Work.close;
  Result := False;

  // Überprüfe Länge
  if Length(dm_PCM.Nummer) <> 20 then Exit;

  MakeBitMatrix;
  ScrambleBits;

  Result := CheckCheckSum;
  dm_PCM.bNewLiceneCheck:= true;
  if Result then
  begin
    dm_PCM.bDemo := Boolean(GetBits(0, 1));
    iProgramm := GetBits(1, 8);
    if iProgramm <> PCM_Programmnummer then
    begin
      dm_PCM.bNewLiceneCheck:= false;
    end;
    iGeburtTagMonat:= GetBits(17,16);
    if iGeburtTagMonat <> 2402 then
    begin
      dm_PCM.bNewLiceneCheck:= false;
    end;

    iGeburtJahr:= GetBits(33, 16);
    if iGeburtJahr <> 1984 then
    begin
      dm_PCM.bNewLiceneCheck:= false;
    end;

    iDevJahr:= GetBits(49, 16);
    if iDevJahr <> 2015 then
    begin
      dm_PCM.bNewLiceneCheck:= false;
    end;

    dm_PCM.dtGueltig:= EncodeDate(2005, 1, 1) + GetBits(65, 16);
    if dm_PCM.bdemo then
    begin
      dm_PCM.dtCurrDate := StrToDate(DateToStr(Now));
      if dm_PCM.dtGueltig < dm_PCM.dtCurrDate then
      begin
        dm_PCM.bNewLiceneCheck:= false;
      end
    end;
    if dm_PCM.bNewLiceneCheck = false then
    begin
      Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
      frm_PCM_lizenz.ShowModal;
      frm_PCM_lizenz.Free;
    end
    else begin
      dm_PCM.bNewLiceneCheck:= true;
    end;
  end
  else begin
    Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
    frm_PCM_lizenz.ShowModal;
    frm_PCM_lizenz.Free;
  end;
end;
procedure CheckLizenzNew;
var
  iRecordLizenz: integer;
begin
  dm_PCM.qry_Work.sql.Text:=  ASSQL_GetCurrentLizenzCount[dm_pcm.iDBType];
  dm_PCM.qry_Work.open;
  iRecordLizenz:= dm_PCM.qry_Work.FieldByName('Anzahl').AsInteger;
  dm_PCM.qry_Work.close;

  if iRecordLizenz = 0 then
  begin
    Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
    frm_PCM_lizenz.btn_SaveLicence.Enabled:= false;
    frm_PCM_lizenz.Showmodal;
    frm_PCM_lizenz.Free;
  end
  else begin
    dm_PCM.bNewLiceneCheck:= CheckLizenz;
  end;
end;
function ReadServerAdress: boolean;
var
  iniFile: TIniFile;
begin
  iniFile:=TIniFile.create(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini');
  dm_PCM.sServer:= iniFile.ReadString('PCM','Server','localhost');
  dm_PCM.sStyle:= iniFile.ReadString(PCM_Logname,'Style','Windows10');
  dm_PCM.sDesign:= iniFile.ReadString(PCM_Logname,'Design','Basic');
  dm_PCM.iDBType:= iniFile.ReadInteger('Database','Type',0);
  dm_PCM.slocale:= iniFile.ReadString(PCM_Logname,'Language','DE');
  frm_PCM_main.lafCtrl_Main.SkinName:= dm_PCM.sDesign;
  iniFile.Free;
  result:= false;
  try
    dm_PCM.con_PCM.Params.Values['Server'] := dm_PCM.sServer;
    try
      WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 1 PCM',0);
      dm_PCM.con_PCM.Connected:= True;
      WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 1 PCM ' + rs_PCM_Verbindungsversuch2,0);
      result:= true;
    except
      Sleep(5000);
      try
        WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 2 pcm',0);
        dm_PCM.con_PCM.Connected:= True;
        WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 2 PCM ' + rs_PCM_Verbindungsversuch2,0);
        result:= true;
      except
        Sleep(5000);
        try
          WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 3 PCM',0);
          dm_PCM.con_PCM.Connected:= True;
          WriteLog(PCM_logname, rs_PCM_Verbindungsversuch1 + ' 3 PCM ' + rs_PCM_Verbindungsversuch2,0);
          result:= true;
        except
        end;
      end;
    end;
  except
    MessageDlg(rs_PCMLog_KeineVerbindung1 + dm_PCM.sServer + rs_PCMLog_KeineVerbindung2
    + rs_PCMLog_PCMINIPruefen + sLineBreak + GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini.' + sLineBreak
    + rs_PCM_Ende, mtError, [mbOk], 0);
  end;
end;



end.

