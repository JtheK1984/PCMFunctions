unit PCM.Functions.Server.Methods;

interface

uses Winapi.Windows, System.IOUtils, System.Classes, SysUtils,  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Data.DB,DateUtils,winapi.shellapi, FireDAC.Stan.Intf,  FireDAC.Stan.Option,
  FireDAC.Stan.Error,  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async,  FireDAC.Phys, FireDAC.Comp.Client,FireDAC.Stan.Param;

  procedure Shutdown;
//  procedure BackupFiles;
  procedure BackupDatabase;
  procedure BackupQuellcode;

  procedure Zippen(sFrom, sTo,sToAlternate, sExt: String);
  procedure ExecuteAndWaitFor(FileName: AnsiString);
  procedure CopyFileSelf(bCompress,bCopy: Integer;sPath,sFile: String);
  procedure RunAndWaitShell(Executable, Parameter, Directory: STRING; ShowParameter: INTEGER);

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
    dm_PCM.qry_work.SQL.Text:= 'Select ssd.timeactive,ssd.timesd,ssd.timesdrepeat,ssd.repeatMontag, ' +
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
      dm_PCM.qry_work.open;
    except
      on e:Exception do
        Writelog(PCM_Logname,e.message,2);

    end;
    btimer:= dm_PCM.qry_work.FieldByName('timeactive').AsBoolean;
    dtdatetime:= dm_PCM.qry_work.FieldByName('timesd').AsDateTime;
    dtdatetimeNext:= dm_PCM.qry_work.FieldByName('timenext').AsDateTime;
    srepeat:= dm_PCM.qry_work.FieldByName('timesdrepeat').AsBoolean;
    srepeatSon:= dm_PCM.qry_work.FieldByName('repeatSonntag').AsBoolean;
    srepeatMon:= dm_PCM.qry_work.FieldByName('repeatMontag').AsBoolean;
    srepeatDie:= dm_PCM.qry_work.FieldByName('repeatDienstag').AsBoolean;
    srepeatMit:= dm_PCM.qry_work.FieldByName('repeatMittwoch').AsBoolean;
    srepeatDon:= dm_PCM.qry_work.FieldByName('repeatDonnerstag').AsBoolean;
    srepeatFre:= dm_PCM.qry_work.FieldByName('repeatFreitag').AsBoolean;
    srepeatSam:= dm_PCM.qry_work.FieldByName('repeatSamstag').AsBoolean;
    iDiffToleranz:= dm_PCM.qry_work.FieldByName('toleranz').AsFloat;
    iID:= dm_PCM.qry_work.FieldByName('ID').AsInteger;
    dm_PCM.qry_work.close;
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
          dm_PCM.qry_Work.SQL.Text:= 'UPDATE service_config_shutdown SET timenext = TIMESTAMPADD(Day, 1, timenext) Where ID = :ID';
          dm_PCM.qry_Work.ParamByName('ID').AsInteger:= iID;
          dm_PCM.qry_Work.ExecSQL;
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
  except
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
  dm_PCM.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_PCM.qry_Work.SQL.Text:= 'SELECT * FROM service_config_quellcode_apps';
  dm_PCM.qry_Work.open;

  while not dm_PCM.qry_Work.Eof do
  begin
    if dm_PCM.qry_Work.FieldByName('Aktiv').AsInteger = 1 then
    begin
      dm_PCM.qry_Work1.SQL.Text:= 'SELECT * FROM service_config_quellcode_dir Where Backup = 1 and ID_Service_Config_apps = :ID';
      dm_PCM.qry_Work1.ParamByName('ID').AsInteger:= dm_PCM.qry_Work.FieldByName('ID').AsInteger;
      dm_PCM.qry_Work1.open;
      for iTemp := 1 to dm_PCM.qry_Work1.RecordCount do
      begin
        sFileTo := dm_PCM.qry_Work.FieldByName('Destination').AsString;
        sFileTo := StringReplace(sFileTo, '%VERSION%',  StringReplace(dm_PCM.qry_Work.FieldByName('Version').AsString, '.', '', [rfReplaceAll]),[rfReplaceAll]);
        if Copy(sFileTo, Length(sFileTo), 1) <> '\' then
          sFileTo := sFileTo + '\';
        System.SysUtils.ForceDirectories(sFileTo);

        sFileTo := sFileTo + dm_PCM.qry_Work1.FieldByName('Program').AsString + '.zip';
        sFileToAlternate := ExtractFilePath(ParamStr(0)) + dm_PCM.qry_Work1.FieldByName('Program').AsString + '.zip';
        sFileFrom := dm_PCM.qry_Work.FieldByName('Source').AsString;
        if Copy(sFileFrom, Length(sFileFrom), 1) <> '\' then
          sFileFrom := sFileFrom + '\';
        sFileFrom := sFileFrom + dm_PCM.qry_Work1.FieldByName('Program').AsString;
        if dm_PCM.qry_Work1.FieldByName('Backup').AsInteger = 1 then
        begin
          Zippen(sFileFrom, sFileTo,sFileToAlternate, dm_PCM.qry_Work.FieldByName('FileExt').asString);
        end;
        dm_PCM.qry_Work1.Next
      end;
      dm_PCM.qry_Work1.Close;
    end;
    dm_PCM.qry_Work.Next;
  end;
  dm_PCM.qry_Work.First;

  while not dm_PCM.qry_Work.Eof do
  begin
    CopyFileSelf(dm_PCM.qry_Work.FieldByName('Komprimieren').AsInteger,dm_PCM.qry_Work.FieldByName('Kopieren').AsInteger,dm_PCM.qry_Work.FieldByName('PfadInno').asString,dm_PCM.qry_Work.FieldByName('DateiInno').asString);
    dm_PCM.qry_Work.Next;
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
