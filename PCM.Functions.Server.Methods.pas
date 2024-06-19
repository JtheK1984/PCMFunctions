unit PCM.Functions.Server.Methods;

interface

uses Winapi.Windows, System.IOUtils, System.Classes, SysUtils,  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Data.DB,DateUtils,winapi.shellapi, FireDAC.Stan.Intf,  FireDAC.Stan.Option,
  FireDAC.Stan.Error,  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async,  FireDAC.Phys, FireDAC.Comp.Client,FireDAC.Stan.Param, System.Json,REST.Types,
  AbBase, AbBrowse, AbZBrows, AbZipper;

  procedure Shutdown;
  procedure SendPushNotification;
//  procedure BackupFiles;
  procedure BackupDatabase;
  procedure BackupQuellcode;

  procedure ExecuteAndWaitFor(FileName: AnsiString);
type
  TZipDateien = array of string;

implementation

uses  PCM.Data,
      PCM.Functions,
      PCM.Main,
      PCM.Strings;

procedure BackupDatabase;
begin
  ExecuteAndWaitFor(AnsiString(ExtractFilePath(ParamStr(0)) + 'PCMBackup\PCMBackupService.exe'));
end;
procedure BackupQuellcode;
  procedure Zippen(sFrom, sTo,sToAlternate, sExt: String);
  var
    lstFileExt: TStringList;
    iTemp: Integer;
    Component : TAbZipper;
  begin
    try
      lstFileExt := TStringList.Create;
      try
        try
          lstFileExt.Delimiter := ',';
          lstFileExt.DelimitedText := sExt;
          if FileExists(sTo) then
            DeleteFile(sTo);
          Component:= TAbZipper.Create(nil);
          Component.FileName := sTo;
        except
          lstFileExt.Delimiter := ',';
          lstFileExt.DelimitedText := sExt;
          if FileExists(sToAlternate) then
            DeleteFile(sToAlternate);
          Component:= TAbZipper.Create(nil);
          Component.FileName := sToAlternate;
        end;
        for iTemp := 0 to lstFileExt.Count - 1 do
        begin
          Component.AddFiles(lstFileExt.Strings[iTemp],faAnyFile);
        end;
        Component.Save;
        Component.FileName := '';
        Component.Free;
      finally
        lstFileExt.Free;
      end;
    except
      ON EX: Exception DO
      BEGIN
        WriteLog(PCM_LOgname,ex.Message,2);
      END;
    end;

  //  try
  //    lstFileExt := TStringList.Create;
  //    try
  //      try
  //        lstFileExt.Delimiter := ',';
  //        lstFileExt.DelimitedText := sExt;
  //        PCM_Service.ZipForge1.FileName := sTo;
  //        PCM_Service.ZipForge1.OpenArchive;
  //        PCM_Service.ZipForge1.BaseDir := sFrom;
  //      except
  //        lstFileExt.Delimiter := ',';
  //        lstFileExt.DelimitedText := sExt;
  //        PCM_Service.ZipForge1.FileName := sToAlternate;
  //        PCM_Service.ZipForge1.OpenArchive;
  //        PCM_Service.ZipForge1.BaseDir := sFrom;
  //      end;
  //      for iTemp := 0 to lstFileExt.Count - 1 do
  //      begin
  //        PCM_Service.ZipForge1.AddFiles(lstFileExt.Strings[iTemp]);
  //      end;
  //      PCM_Service.ZipForge1.CloseArchive;
  //    finally
  //      lstFileExt.Free;
  //    end;
  //  except
  //    ON EX: Exception DO
  //    BEGIN
  //      WriteLog(PCM_LOgname,ex.Message,2);
  //    END;
  //  end;
  end;
  procedure CopyFileSelf(bcompress,bCopy: Integer; sPath,sFile: String);
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

var
  iTemp: Integer;
  sFileFrom, sFileTo,sFileToAlternate: string;
begin
  // Backup erstellen
  dm_PCM.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_PCM.qry_Work.SQL.Text:= 'SELECT * FROM service_config_quellcode_apps';
  dm_PCM.qry_Work.open;

  while not dm_PCM.qry_Work.Eof do
  begin
    if dm_PCM.qry_Work.FieldByName('Aktiv').AsInteger = 1 then
    begin
      dm_PCM.qry_Work_Sub.SQL.Text:= 'SELECT * FROM service_config_quellcode_dir Where Backup = 1 and ID_Service_Config_apps = :ID';
      dm_PCM.qry_Work_Sub.ParamByName('ID').AsInteger:= dm_PCM.qry_Work.FieldByName('ID').AsInteger;
      dm_PCM.qry_Work_Sub.open;
      for iTemp := 1 to dm_PCM.qry_Work_Sub.RecordCount do
      begin
        sFileTo := dm_PCM.qry_Work.FieldByName('Destination').AsString;
        sFileTo := StringReplace(sFileTo, '%VERSION%',  StringReplace(dm_PCM.qry_Work.FieldByName('Version').AsString, '.', '', [rfReplaceAll]),[rfReplaceAll]);
        if Copy(sFileTo, Length(sFileTo), 1) <> '\' then
          sFileTo := sFileTo + '\';
        System.SysUtils.ForceDirectories(sFileTo);

        sFileTo := sFileTo + dm_PCM.qry_Work_Sub.FieldByName('Program').AsString + '.zip';
        sFileToAlternate := ExtractFilePath(ParamStr(0)) + dm_PCM.qry_Work_Sub.FieldByName('Program').AsString + '.zip';
        sFileFrom := dm_PCM.qry_Work.FieldByName('Source').AsString;
        if Copy(sFileFrom, Length(sFileFrom), 1) <> '\' then
          sFileFrom := sFileFrom + '\';
        sFileFrom := sFileFrom + dm_PCM.qry_Work_Sub.FieldByName('Program').AsString;
        if dm_PCM.qry_Work_Sub.FieldByName('Backup').AsInteger = 1 then
        begin
          Zippen(sFileFrom, sFileTo,sFileToAlternate, dm_PCM.qry_Work.FieldByName('FileExt').asString);
        end;
        dm_PCM.qry_Work_Sub.Next
      end;
      dm_PCM.qry_Work_Sub.Close;
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
procedure ExecuteAndWaitFor(FileName: AnsiString);
var
  StartupInfo: TStartupInfoA;
  ProcessInfo: TProcessInformation;
  s: AnsiString;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := Sizeof(TStartupInfo);
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
    WriteLog(PCM_Logname,'ExecuteAndWaitFor Error: Error-Code '+intToStr(GetLastError),2);
  end;
end;
procedure SendPushNotification;
  function CheckReccurence(AID: Integer; AStart, ADate: TDateTime; AWiederholung: string) :TDateTime;
  var
    fWeekWiederholung: double;
    fDays: double;
    iDow: Integer;
    iInterval: Integer;
    iMonat: Integer;
    iTag: Integer;
    sDay: String;
    sInterval: String;
    sWiederholungDays: String;
    wJahrAkt: Word;
    wMonatAkt: Word;
    wTagakt: Word;
  begin
    if AWiederholung = '' then
    begin
      result := AStart;
      exit;
    end;


    itag:= 1;
    iMonat:= 1;
    Result:= AStart;
  ////////////////////////////////////////////////////////////////////////////////
  // Täglich                                                                    //
  ////////////////////////////////////////////////////////////////////////////////
    if Pos('FREQ=DAILY',Awiederholung) > 0 then
    begin
      if Pos('INTERVAL',Awiederholung) > 0 then
      begin
        fDays:= (ADate - StrToDate(Copy(DateTimeToStr(AStart),1,10))) /2;
        if frac(fdays * 10) = 0  then
        begin
          Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
        end;
      end
      else begin
        Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
      end;

    end;
  ////////////////////////////////////////////////////////////////////////////////
  // Wöchentlich                                                                //
  ////////////////////////////////////////////////////////////////////////////////
    if Pos('FREQ=WEEKLY',Awiederholung) > 0 then
    begin
      if Pos('BYDAY',Awiederholung) > 0 then
      begin
        sWiederholungDays:= Copy(Awiederholung,Pos('BYDAY',Awiederholung) + 6,Length(Awiederholung));
        iDow := DayOfWeek(ADate);
        case iDow of
        1: sDay:= 'SU';
        2: sDay:= 'MO';
        3: sDay:= 'TU';
        4: sDay:= 'WE';
        5: sDay:= 'TH';
        6: sDay:= 'FR';
        7: sDay:= 'SA';
        end;
        if Pos(sday,sWiederholungDays) > 0 then
        begin
          if Pos('INTERVAL',Awiederholung) > 0 then
          begin
            sInterval:= Copy(Awiederholung,Pos('INTERVAL',Awiederholung)+9,Length(AWiederholung));
            sInterval:= Copy(sInterval,1,Pos(';',sInterval) -1);
            iInterval:=  StrToInt(sInterval);
            fWeekWiederholung := WeekOf(ADate - AStart);
            fWeekWiederholung:= fWeekWiederholung / iInterval;
            fWeekWiederholung:= frac(fWeekWiederholung);
            if fWeekWiederholung = 0 then
              Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
          end
          else
          begin
            Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
          end;
        end;
      end
      else begin
        Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
      end;
    end;
  ////////////////////////////////////////////////////////////////////////////////
  // Monatlich                                                                  //
  ////////////////////////////////////////////////////////////////////////////////
    if Pos('FREQ=MONTHLY',Awiederholung) > 0 then
    begin

    end;
  ////////////////////////////////////////////////////////////////////////////////
  // Jährlich                                                                  //
  ////////////////////////////////////////////////////////////////////////////////
    if Pos('FREQ=YEARLY',Awiederholung) > 0 then
    begin
      sWiederholungDays:= StringReplace(AWiederholung,'FREQ=YEARLY;','',[rfReplaceAll,rfIgnoreCase]);
      sWiederholungDays:= Copy(sWiederholungDays,Pos('BYMONTHDAY=',sWiederholungDays) + 11,Length(sWiederholungDays));
      iTag := StrToint(Copy(sWiederholungDays,1,Pos(';',sWiederholungDays)-1));
      sWiederholungDays:= Copy(sWiederholungDays,Pos('BYMONTH=',sWiederholungDays) + 8,Length(sWiederholungDays));
      iMonat := StrToint(Copy(sWiederholungDays,1,2));
    end;
    DecodeDate(ADate,wJahrAkt,wMonatAkt,wTagakt);
    if (wTagakt = iTag) and (wMonatAkt = iMonat)then
      Result:= StrToDateTime(DateToStr(ADate) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
  end;
  function GetWeekDay(ADateTime: TDateTime) : String;
  begin
    case DayOfWeek(ADateTime) of
      1: Result:= 'So.';
      2: Result:= 'Mo.';
      3: Result:= 'Di.';
      4: Result:= 'Mi.';
      5: Result:= 'Do.';
      6: Result:= 'Fr.';
      7: Result:= 'Sa.';
    end;
  end;
  Procedure SendPush(AToken,AMessage,ACaption: String);
  var
    joBodyMain:       TJSONObject;
    joBodySub:        TJSONObject;
    sUploadstate:     String;
  begin
    joBodyMain:= TJSONObject.Create;
    joBodyMain.AddPair(TJSONPair.Create('to',AToken));
    joBodyMain.AddPair(TJSONPair.Create('priority','high'));
    joBodySub:= TJSONObject.Create;
    joBodySub.AddPair(TJSONPair.Create('body',AMessage));
    joBodySub.AddPair(TJSONPair.Create('title',ACaption));
    joBodyMain.AddPair(TJSONPair.Create('notification',joBodySub));
    sUploadstate:= joBodyMain.ToString;
    dm_PCM.rstreq_Push.Params.AddItem('Authorization', 'Bearer AAAAKei3FDU:APA91bHidAp5KysKnJeC0zMHHs242AW-DN9GHepIEOQgqJeCni82g9l6m324q71H5Rn3yThrjLW-rH5W1P7KV4TC32eDeUUB4zeHmTv4AhTjTGVYc384BzUMUaDSY6x8KtqqkydOoq5a', pkHTTPHEADER, [poDoNotEncode]);
    dm_PCM.rstreq_Push.Body.Add(joBodyMain);
    dm_PCM.rstreq_Push.Execute;
    dm_PCM.rstreq_Push.ClearBody;
    dm_PCM.rstreq_Push.Body.ClearBody;
    FreeandNil(joBodyMain);
  end;
var
  bReminder:            Boolean;
  dtStart:              TDateTime;
  dtDateTimeEvent:      TDateTime;
  dtReminderdate:       TDateTime;
  iID:                  Integer;
  iID_Benutzer:         Integer;
  iReminder:            Integer;
  sMessage:             string;
  sCaption:             String;
  sID:                  String;
  sToken:               String;
  sWochentagBeginn:     string;
  sWochentagEnde:       string;
begin
  // Termine
  dm_PCM.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_PCM.qry_Work.SQL.Text:= 'SELECT ID_Benutzer, DEviceToken From manager_devices';
  dm_PCM.qry_Work.open;
  while not dm_PCM.qry_Work.eof do
  begin
    iID_Benutzer:= dm_PCM.qry_Work.Fieldbyname('ID_Benutzer').asInteger;
    sToken:= dm_PCM.qry_Work.Fieldbyname('Devicetoken').asString;
    WriteLog(PCM_Logname,'Termine per Pushbenachrichtigung versenden',0);
    dm_PCM.qry_Work_Sub.SQL.Text:= 'SELECT ID, Caption, Start,Finish,Message, CompleteDay,kalendername, wiederholung_text, Reminder, Reminderdate,if(ReminderMinutesbeforeStart = 0, 15,ReminderMinutesbeforeStart) AS ReminderMinutesbeforeStart ' +
                                    'FROM manager_Kalender ' +
                                    'WHERE ID_Benutzer = :ID_Benutzer ' +
                                    'AND ((Wiederholung_text IS NOT NULL AND Wiederholung_text <> '''') ' +
                                    'OR (Date(START) = Date(Now()) AND (Wiederholung_text IS null or Wiederholung_text = '''' ))) ' +
                                    'AND (LastPush IS NULL OR Date(lastpush) < DATE(NOW())) ' +
                                    'AND Reminder is True ' +
                                    'ORDER BY Start';
    dm_PCM.qry_Work_Sub.ParamByName('ID_Benutzer').AsInteger:= iID_Benutzer;
    dm_PCM.qry_Work_Sub.open;
    while not dm_PCM.qry_Work_Sub.eof do
    begin
      sCaption:= dm_PCM.qry_Work_Sub.FieldByName('Caption').AsString;
      iID:= dm_PCM.qry_Work_Sub.FieldByName('ID').asInteger;
      bReminder:= dm_PCM.qry_Work_Sub.FieldByName('Reminder').asBoolean;
      dtReminderdate:= dm_PCM.qry_Work_Sub.FieldByName('Reminderdate').AsDateTime;
      iReminder:= dm_PCM.qry_Work_Sub.FieldByName('ReminderMinutesbeforeStart').asInteger;
      dtDateTimeEvent:= CheckReccurence(dm_PCM.qry_Work_Sub.FieldByName('ID').asInteger,dm_PCM.qry_Work_Sub.FieldByName('Start').asDatetime,Date,dm_PCM.qry_Work_Sub.FieldByName('wiederholung_text').asString);
      if (DateOf(dtDateTimeEvent) = Date) and (dm_PCM.qry_Work_Sub.FieldByName('wiederholung_text').asString <> '') and  (IncMinute(dtDateTimeEvent,iReminder *-1) <= Now()) then
      begin
        sWochentagBeginn:= GetWeekDay(dtDateTimeEvent);
        sWochentagEnde:= GetWeekDay(dm_PCM.qry_Work_Sub.FieldByName('Finish').AsDateTime);
        dm_PCM.qry_Cal.SQL.Text:= 'Select Count(*) as Anzahl FROM manager_tempkalender WHERE Text = :Text';
        dm_PCM.qry_Cal.ParamByName('Text').AsString :=  dm_PCM.qry_Work_Sub.FieldByName('Caption').AsString;
        dm_PCM.qry_Cal.open;
        if dm_PCM.qry_Cal.FieldByName('Anzahl').AsInteger = 0 then
        begin
          if dm_PCM.qry_Work_Sub.FieldByName('CompleteDay').AsBoolean then
          begin
            sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',Date);
            dtStart:= StrToTime(FormatDateTime('hh:mm',Date));
          end
          else begin
            sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dtDateTimeEvent) + ' ' + FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime) + ' - ' + FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Finish').AsDateTime);
            dtStart:= StrToTime(FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime));
          end;
          dm_PCM.qry_cal_sub.SQL.Text:= 'Insert INTO manager_TempKalender(Text,Detail,Start,ID_manager_Kalender) Values (:Text,:Detail,:Start,:ID_Kalender)';;
          dm_PCM.qry_cal_sub.ParamByName('Text').AsString :=  sCaption;
          dm_PCM.qry_cal_sub.ParamByName('Detail').AsString:= sMessage;
          dm_PCM.qry_cal_sub.ParamByName('Start').AsDateTime:= dtStart;
          dm_PCM.qry_cal_sub.ParamByName('ID_Kalender').AsInteger:= iID;
          dm_PCM.qry_cal_sub.ExecSQL;
        end;
        dm_PCM.qry_Cal.Close;
      end
      else begin
        dtDateTimeEvent:= dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime;
        if (DateOf(dtDateTimeEvent ) = Date) and  (IncMinute(dtDateTimeEvent,iReminder *-1) <= Now())then
        begin
          sWochentagBeginn:= GetWeekDay(dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime);
          sWochentagEnde:= GetWeekDay(dm_PCM.qry_Work_Sub.FieldByName('Finish').AsDateTime);
          dm_PCM.qry_Cal.SQL.Text:= 'Select Count(*) as Anzahl FROM manager_tempkalender WHERE Text = :Text';
          dm_PCM.qry_Cal.ParamByName('Text').AsString :=  dm_pcm.qry_Work_Sub.FieldByName('Caption').AsString;
          dm_PCM.qry_Cal.open;
          if dm_PCM.qry_Cal.FieldByName('Anzahl').AsInteger = 0 then
          begin
            if dm_pcm.qry_Work_Sub.FieldByName('CompleteDay').AsBoolean then
            begin
              if dm_pcm.qry_Work_Sub.FieldByName('Finish').AsDateTime - dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime  = 1 then
              begin
                sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime);
                dtStart:= StrToTime(FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime));
              end
              else begin
                sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime) + ' - ' + sWochentagEnde + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_Work_Sub.FieldByName('Finish').AsDateTime);
                dtStart:= StrToDateTime(FormatDateTime('dd.mm.yyyy hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime));
              end;
            end
            else begin
              if dm_pcm.qry_Work_Sub.FieldByName('Finish').AsDateTime - dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime  = 1 then
              begin
                sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime);
                dtStart:= StrToTime(FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime));
              end
              else begin
                sMessage:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime) + ' - ' + FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Finish').AsDateTime);
                dtStart:= StrToTime(FormatDateTime('hh:mm',dm_pcm.qry_Work_Sub.FieldByName('Start').AsDateTime));
              end;
            end;
            dm_PCM.qry_cal_sub.SQL.Text:= 'Insert INTO manager_TempKalender(Text,Detail,Start,ID_manager_Kalender) Values (:Text,:Detail,:Start,:ID_Kalender)';;
            dm_PCM.qry_cal_sub.ParamByName('Text').AsString :=  sCaption;
            dm_PCM.qry_cal_sub.ParamByName('Detail').AsString:= sMessage;
            dm_PCM.qry_cal_sub.ParamByName('Start').AsDateTime:= dtStart;
            dm_PCM.qry_cal_sub.ParamByName('ID_Kalender').AsInteger:= iID;
            dm_PCM.qry_cal_sub.ExecSQL;
          end;
          dm_PCM.qry_Cal.Close;
        end;
      end;
      dm_pcm.qry_Work_Sub.Next;
    end;
    dm_pcm.qry_Work_Sub.Close;

    dm_pcm.qry_Cal.SQL.Text:= 'Select * From manager_tempkalender order by Start asc';
    dm_pcm.qry_Cal.open;
    while not dm_pcm.qry_Cal.eof do
    begin
      SendPush(sToken,dm_pcm.qry_Cal.FieldByName('Detail').AsString,dm_pcm.qry_Cal.FieldByName('Text').AsString);
      dm_PCM.qry_Cal_Sub.SQL.Text:= 'Update manager_kalender Set LAstPush = Now() Where ID = :ID';
      dm_PCM.qry_Cal_Sub.ParamByName('ID').AsInteger := dm_pcm.qry_Cal.FieldByName('ID_manager_kalender').AsInteger;
      dm_PCM.qry_Cal_Sub.ExecSQL;
      dm_pcm.qry_Cal.Next;
    end;
    dm_pcm.qry_Cal.Close;

    // Änderungsmitteilungen
    dm_PCM.qry_Cal.SQL.Text:= 'SELECT ID, message FROM service_pushnotifications WHERE ID_Benutzer = :ID_Benutzer';
    dm_PCM.qry_Cal.ParamByName('ID_Benutzer').AsInteger:= iID_Benutzer;
    dm_PCM.qry_Cal.open;
    while not dm_PCM.qry_Cal.eof do
    begin
      sID:= sID + ',' + dm_PCM.qry_Cal.Fieldbyname('ID').asString;
      SendPush(sToken,dm_PCM.qry_Cal.Fieldbyname('Message').asString,'Änderung festgestellt');
      dm_pcm.qry_Cal.Next;
    end;
    dm_pcm.qry_Cal.close;
    dm_PCM.qry_Cal.SQL.Text:= 'Delete FROM service_pushnotifications Where ID IN (0 ' + sid + ')';
    dm_PCM.qry_Cal.ExecSQL;
    dm_pcm.qry_work.Next;
  end;
  dm_pcm.qry_work.close;
  dm_PCM.qry_work.SQL.Text:= 'DELETE FROM manager_tempkalender';
  dm_PCM.qry_work.ExecSQL;
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
          WriteLog(PCM_LOGname,rs_PCMService_AktuelleZeit + formatdatetime('dd.mm.yyyy', Now()) + ' ' + formatdatetime('hh:nn:ss', Now()),0);
          WriteLog(PCM_LOGname,rs_PCMService_naechsterZeitpunkt + formatdatetime('dd.mm.yyyy', dtDatetimeNext) + ' ' + formatdatetime('hh:nn:ss', dtDatetimeNext),0);
          dm_PCM.qry_Work.SQL.Text:= 'UPDATE service_config_shutdown SET timenext = TIMESTAMPADD(Day, 1, timenext) Where ID = :ID';
          dm_PCM.qry_Work.ParamByName('ID').AsInteger:= iID;
          dm_PCM.qry_Work.ExecSQL;
          iDiff := Now() - dtDatetimeNext;
          if (bExec) and (iDiff <= iDiffToleranz ) and (iDiff >= 0.0 ) then
          begin
            WriteLog(PCM_LOGname,rs_PCMService_Herunterfahren,0);
            WriteLog(PCM_LOGname,rs_PCMService_Beenden,0);
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

end.
