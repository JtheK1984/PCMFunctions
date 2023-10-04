unit PCM.Functions.Server.Methods;

interface

uses Winapi.Windows, System.IOUtils, System.Classes, SysUtils,  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Data.DB,DateUtils,winapi.shellapi, FireDAC.Stan.Intf,  FireDAC.Stan.Option,
  FireDAC.Stan.Error,  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async,  FireDAC.Phys, FireDAC.Comp.Client,FireDAC.Stan.Param;


  procedure PCMConnect;
  procedure PCMDisconnect;


  procedure Shutdown;
//  procedure BackupFiles;
  procedure BackupDatabase;
  procedure BackupQuellcode;

  procedure Zippen(sFrom, sTo,sToAlternate, sExt: String);
  procedure ExecuteAndWaitFor(FileName: AnsiString);
  procedure CopyFileSelf(bCompress,bCopy: Integer;sPath,sFile: String);
  procedure RunAndWaitShell(Executable, Parameter, Directory: STRING; ShowParameter: INTEGER);
var
  con_PCM: TFDConnection;
  qWork2: TFDQuery;
  qWork3: TFDQuery;

type
  TZipDateien = array of string;

implementation

uses PCM.Functions,PCM.main,PCM.Data;

procedure RunAndWaitShell(Executable, Parameter, Directory: STRING; ShowParameter: INTEGER);
var
  Info: TShellExecuteInfo;
  pInfo: PShellExecuteInfo;
  exitCode: DWord;
begin
  {Pointer to Info}
  pInfo := @Info;
  {Fill info}
  with Info do
  begin
    cbSize := SizeOf(Info);
    fMask := SEE_MASK_NOCLOSEPROCESS;
    lpVerb := NIL;
    lpFile := PChar(Executable);
    {Parametros al ejecutable}
    {Executable parameters}
    lpParameters := PChar(Parameter + #0);
    lpDirectory := PChar(Directory);
    nShow       := ShowParameter;
    hInstApp    := 0;
  end;
  {Execute}
  ShellExecuteEx(pInfo);

  {Wait to finish}
  repeat
    exitCode := WaitForSingleObject(Info.hProcess, 500);
  until (exitCode <> WAIT_TIMEOUT);

end;

procedure CopyFileSelf(bcompress,bCopy: Integer; sPath,sFile: String);
var
  FPackerPath: String;
begin
  if (bCompress = 1) and (sPath <> '') and (sfile <> '') then
  begin
    ForceDirectories(sPath);
    FPackerPath := ExtractFilePath(ParamStr(0)) + 'Upx\upx.exe';

    if Length(FPackerPath) > 0 then
    begin
      if FileExists(FPackerPath) then
      begin
        RunAndWaitShell(FPackerPath, '"' + sfile + '"', ExtractFilePath(FPackerPath), SW_HIDE);
      end;
    end;
  end;

  if (bCopy = 1) and (sPath <> '') and (sfile <> '') then
  begin
    CopyFileEx(PChar(sfile), PChar(sPath + '\' +  ExtractFileName(sfile)), Nil, Nil, nil, 0);
  end;
end;

procedure PCMConnect;
begin
  con_PCM:= TFDConnection.Create(nil);
  con_PCM.Params.DriverID := 'MySQL';;
  con_PCM.Params.Add('Server=127.0.0.1');
  con_PCM.Params.Add('Port=3307');
  con_PCM.Params.Database := 'pcm_Service';
  con_PCM.Params.UserName := 'root';
  con_PCM.Params.Password := 'pcm';
  con_PCM.LoginPrompt:= false;
  con_PCM.Connected:= true;
  qWork2:= TFDQuery.Create(nil);
  qWork2.Connection:= con_PCM;
  qWork3:= TFDQuery.Create(nil);
  qWork3.Connection:= con_PCM;
end;

procedure PCMDisconnect;
begin
  qWork2.Free;
  qWork3.Free;
  con_PCM.Free;
end;

procedure BackupDatabase;
begin
  ExecuteAndWaitFor(AnsiString(ExtractFilePath(ParamStr(0)) + 'PCMBackup\PCMBackupService.exe'));
end;

procedure Shutdown;
var
  a: string;
  wDayofWeek: word;
  btimer: boolean;
  srepeat: boolean;
  srepeatMon: boolean;
  srepeatDie: boolean;
  srepeatMit: boolean;
  srepeatDon: boolean;
  srepeatFre: boolean;
  srepeatSam: boolean;
  srepeatSon: boolean;
  dtDateTime: TDatetime;
  dtdatetimeNext: TDatetime;
  bExec: boolean;
  iID: integer;
  iDiff,iDiffToleranz: Double;

begin
  try
    PCMConnect;
    qWork2.SQL.Text:= 'Select ssd.timeactive,ssd.timesd,ssd.timesdrepeat,ssd.repeatMontag, ' +
                                  'ssd.repeatDienstag,ssd.repeatMittwoch,ssd.repeatDonnerstag,ssd.repeatFreitag, ' +
                                  'ssd.repeatSamstag,ssd.repeatSonntag,ssd.intervallactive,ssd.intervallminutes , ssd.id, ssd.timenext, ' +
                                  'CASE ' +
                                  'WHEN ssdi.Nummer = 0 THEN 0.0 ' +
                                  'WHEN ssdi.Nummer = 1 THEN 0.000694444446708076 ' +
                                  'WHEN ssdi.Nummer = 2 THEN 0.00138888888614019 ' +
                                  'WHEN ssdi.Nummer = 3 THEN 0.00208333333284827 ' +
                                  'WHEN ssdi.Nummer = 4 THEN 0.00277777777955635 ' +
                                  'WHEN ssdi.Nummer = 5 THEN 0.00347222221898846 ' +
                                  'WHEN ssdi.Nummer = 6 THEN 0.00694444444525288 ' +
                                  'WHEN ssdi.Nummer = 7 THEN 0.0104166666642413 ' +
                                  'WHEN ssdi.Nummer = 8 THEN 0.0208333333357587 ' +
                                  'WHEN ssdi.Nummer = 9 THEN 0.0416666666642413  ' +
                                  'WHEN ssdi.Nummer = 10 THEN 0.0833333333357587 ' +
                                  'WHEN ssdi.Nummer = 11 THEN 0.125 ' +
                                  'WHEN ssdi.Nummer = 12 THEN 0.166666666664241 ' +
                                  'WHEN ssdi.Nummer = 13 THEN 0.208333333335759 ' +
                                  'WHEN ssdi.Nummer = 14 THEN 0.25 ' +
                                  'WHEN ssdi.Nummer = 15 THEN 0.375 ' +
                                  'WHEN ssdi.Nummer = 16 THEN 0.5 ' +
                                  'END AS Toleranz ' +
                                  'From service_config_shutdown ssd ' +
                                  'LEFT oUTER JOIN service_config_shutdown_intervall ssdi ON ssd.toleranz = ssdi.Nummer';
    try
      qWork2.open;
    except
      on e:Exception do
        Writelog(PCM_Logname, e.message,2);

    end;
    btimer:= qWork2.FieldByName('timeactive').AsBoolean;
    dtdatetime:= qWork2.FieldByName('timesd').AsDateTime;
    dtdatetimeNext:= qWork2.FieldByName('timenext').AsDateTime;
    srepeat:= qWork2.FieldByName('timesdrepeat').AsBoolean;
    srepeatSon:= qWork2.FieldByName('repeatSonntag').AsBoolean;
    srepeatMon:= qWork2.FieldByName('repeatMontag').AsBoolean;
    srepeatDie:= qWork2.FieldByName('repeatDienstag').AsBoolean;
    srepeatMit:= qWork2.FieldByName('repeatMittwoch').AsBoolean;
    srepeatDon:= qWork2.FieldByName('repeatDonnerstag').AsBoolean;
    srepeatFre:= qWork2.FieldByName('repeatFreitag').AsBoolean;
    srepeatSam:= qWork2.FieldByName('repeatSamstag').AsBoolean;
    iDiffToleranz:= qWork2.FieldByName('toleranz').AsFloat;
    iID:= qWork2.FieldByName('ID').AsInteger;
    qWork2.close;
    bExec:= false;
    if dtdatetime = dtdatetimeNext then
      dtdatetimeNext:= dtdatetime;
    if btimer then
    begin
      wDayofWeek:= dayofweek(Now());
      // Prüfen ob Wochentage aktiv sind
      if srepeat then
      begin
        case wDayofWeek of
          // Sonntag
          1:
          begin
            if srepeatSon then
              bExec:= true
            else
              bExec:= false;
          end;
          // Montag
          2:
          begin
            if srepeatMon then
                bExec:= true
            else
              bExec:= false;
          end;
          // Dienstag
          3:
          begin
            if srepeatDie then
              bExec:= true
            else
              bExec:= false;
          end;
          // Mittwoch
          4:
          begin
            if srepeatMit then
              bExec:= true
            else
              bExec:= false;
          end;
          // Donnerstag
          5:
          begin
            if srepeatDon then
              bExec:= true
            else
              bExec:= false;
          end;
          // Freitag
          6:
          begin
            if srepeatFre then
              bExec:= true
            else
              bExec:= false;
          end;
          // Samstag
          7:
          begin
            if srepeatSam then
              bExec:= true
            else
              bExec:= false;
          end;
        end;

        if (Now() >= dtDatetimeNext) then
        begin
          WriteLog(PCM_LOGname,'aktuelles Datum/Zeit: ' + formatdatetime('dd.mm.yyyy', Now()) + ' ' + formatdatetime('hh:nn:ss', Now()),0);
          WriteLog(PCM_LOGname,'nächster zeitpunkt: ' + formatdatetime('dd.mm.yyyy', dtDatetimeNext) + ' ' + formatdatetime('hh:nn:ss', dtDatetimeNext),0);
          qWork2.SQL.Text:= 'UPDATE service_config_shutdown SET timenext = TIMESTAMPADD(Day, 1, timenext) Where ID = :ID';
          qWork2.ParamByName('ID').AsInteger:= iID;
          qWork2.ExecSQL;
          iDiff := Now() - dtDatetimeNext;
          if (bExec) and (iDiff <= iDiffToleranz ) and (iDiff >= 0.0 ) then
          begin
            WriteLog(PCM_LOGname,'PC wird heruntergefahren',0);
            WriteLog(PCM_LOGname,'Service beendet',0);
            //PCM_Service.Timer1.Enabled:= false;
            a:= 'cmd /C shutdown /t 1 /s /f /m \\';// + lbl_PCName_data.Caption;
            ShellExecute(0,nil,PChar('cmd.exe'),PChar(a),nil,SW_SHOWNOACTIVATE);
          end;
        end;
      end;
    end;
  finally
    PCMDisconnect;
  end;
end;

procedure BackupQuellcode;
var
  iTemp: Integer;
  sFileFrom, sFileTo,sFileToAlternate: string;
  //sDatum, sUhrzeit: String;
//  wJahr, wMonat, wTag: Word;
//  wStd, wMin, wSec, wMSec: Word;
begin
  // Backup erstellen
  PCMConnect;
  qwork2.SQL.Text:= 'SELECT * FROM service_config_quellcode_apps';
  qwork2.open;

  while not qwork2.Eof do
  begin
    if qwork2.FieldByName('Aktiv').AsInteger = 1 then
    begin
      qwork3.SQL.Text:= 'SELECT * FROM service_config_quellcode_dir Where Backup = 1 and ID_Service_Config_apps = :ID';
      qwork3.ParamByName('ID').AsInteger:= qwork2.FieldByName('ID').AsInteger;
      qwork3.open;
      for iTemp := 1 to qwork3.RecordCount do
      begin
        sFileTo := qwork2.FieldByName('Destination').AsString;
        sFileTo := StringReplace(sFileTo, '%VERSION%',  StringReplace(qwork2.FieldByName('Version').AsString, '.', '', [rfReplaceAll]),[rfReplaceAll]);
        if Copy(sFileTo, Length(sFileTo), 1) <> '\' then
          sFileTo := sFileTo + '\';
        System.SysUtils.ForceDirectories(sFileTo);

        sFileTo := sFileTo + qwork3.FieldByName('Program').AsString + '.zip';
        sFileToAlternate := ExtractFilePath(ParamStr(0)) + qwork3.FieldByName('Program').AsString + '.zip';
        sFileFrom := qwork2.FieldByName('Source').AsString;
        if Copy(sFileFrom, Length(sFileFrom), 1) <> '\' then
          sFileFrom := sFileFrom + '\';
        sFileFrom := sFileFrom + qwork3.FieldByName('Program').AsString;
        if qwork3.FieldByName('Backup').AsInteger = 1 then
        begin
          Zippen(sFileFrom, sFileTo,sFileToAlternate, qwork2.FieldByName('FileExt').asString);
        end;
        qwork3.Next
      end;
      qwork3.Close;
    end;
    qwork2.Next;
  end;
  qwork2.First;

  while not qwork2.Eof do
  begin
    CopyFileSelf(qwork2.FieldByName('Komprimieren').AsInteger,qwork2.FieldByName('Kopieren').AsInteger,qwork2.FieldByName('PfadInno').asString,qwork2.FieldByName('DateiInno').asString);
    qwork2.Next;
  end;
end;

procedure Zippen(sFrom, sTo,sToAlternate, sExt: String);
var
//  ZipDateien:TZipDateien;
  lstFileExt: TStringList;
  iTemp: Integer;
begin
  try
    lstFileExt := TStringList.Create;
    try
      try
        lstFileExt.Delimiter := ',';
        lstFileExt.DelimitedText := sExt;
        PCM_Service.ZipForge1.FileName := sTo;
        PCM_Service.ZipForge1.OpenArchive;
        PCM_Service.ZipForge1.BaseDir := sFrom;
      except
        lstFileExt.Delimiter := ',';
        lstFileExt.DelimitedText := sExt;
        PCM_Service.ZipForge1.FileName := sToAlternate;
        PCM_Service.ZipForge1.OpenArchive;
        PCM_Service.ZipForge1.BaseDir := sFrom;
      end;
      for iTemp := 0 to lstFileExt.Count - 1 do
      begin
        PCM_Service.ZipForge1.AddFiles(lstFileExt.Strings[iTemp]);
      end;
      PCM_Service.ZipForge1.CloseArchive;
    finally
      lstFileExt.Free;
    end;
  except
    ON EX: Exception DO
    BEGIN
      WriteLog(PCM_LOgname,ex.Message,2);
    END;
  end;
end;

procedure ExecuteAndWaitFor(FileName: AnsiString);
var
  StartupInfo: TStartupInfoA;
  ProcessInfo: TProcessInformation;
  s: AnsiString;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := Sizeof(TStartupInfo);
  // Programm muss im gleichen Verzeichnis liegen wie ZMIServer !!!
  s := AnsiString(ExtractFileDir(ParamStr(0)));
  if CreateProcessA(nil, // Anwendungsname
    PAnsiChar(FileName), // Parameter
    nil, // Security
    nil, // Security
    False,
    NORMAL_PRIORITY_CLASS, // Priorität
    nil, // Environment
    PAnsiChar(s), // Verzeichnis
    StartupInfo,
    ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
  begin
    WriteLog(PCM_Logname,'ExecuteAndWaitFor konnte nicht ausgeführt werden. '+
                ' Error-Code '+intToStr(GetLastError),2);
  end;
end;
end.
