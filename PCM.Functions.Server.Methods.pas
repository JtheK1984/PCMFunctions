unit PCM.Functions.Server.Methods;

interface

uses Winapi.Windows, System.IOUtils, System.Classes, SysUtils,  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Data.DB,DateUtils,winapi.shellapi, FireDAC.Stan.Intf,  FireDAC.Stan.Option,
  FireDAC.Stan.Error,  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async,  FireDAC.Phys, FireDAC.Comp.Client,FireDAC.Stan.Param, System.Json,REST.Types;

  function CheckReccurence(AID: Integer; AStart: TDateTime; AWiederholung: string) :TDateTime;

  procedure Shutdown;
  procedure SendPushNotification;
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

function CheckReccurence(AID: Integer; AStart: TDateTime; AWiederholung: string) :TDateTime;
var
  fWeekWiederholung,fDays: double;
  sWiederholungDays,sDay,sInterval: String;
  iDOw,iInterval, iMonat, iTag: Integer;
  iJahrAkt,iMonatAkt,iTagakt: Word;
begin
  Result:= AStart;
////////////////////////////////////////////////////////////////////////////////
// Täglich                                                                    //
////////////////////////////////////////////////////////////////////////////////
  if Pos('FREQ=DAILY',Awiederholung) > 0 then
  begin
    if Pos('INTERVAL',Awiederholung) > 0 then
    begin
      fDays:= (Date - StrToDate(Copy(DateTimeToStr(AStart),1,10))) /2;
      if frac(fdays * 10) = 0  then
      begin
        Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
      end;
    end
    else begin
      Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
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
      iDow := DayOfWeek(Date);
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
          fWeekWiederholung := WeekOf(date) - WeekOf(AStart);
          fWeekWiederholung:= fWeekWiederholung / iInterval;
          fWeekWiederholung:= frac(fWeekWiederholung);
          if fWeekWiederholung = 0 then
            Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
        end
        else
        begin
          Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
        end;
      end;
    end
    else begin
      Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));
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
  DecodeDate(Date,iJahrAkt,iMonatAkt,iTagakt);
  if (iTagakt = iTag) and (iMonatAkt = iMonat)then
    Result:= StrToDateTime(DateToStr(Date) + ' ' + Copy(DateTimetoStr(AStart),11,Length(DateTimetoStr(AStart))));

end;


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
procedure SendPushNotification;
var
  sDateTime: TDateTime;
  joBodyMain,joBodySub: TJSONObject;
  sID,sUploadstate: String;
  sWochentagBeginn, sWochentagEnde,sAlertBody: string;

begin

  // Alle Pushnotifications schicken
  dm_PCM.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_PCM.qry_Work.SQL.Text:= 'SELECT spn.ID, bt.Devicetoken,spn.message FROM service_pushnotifications spn LEFT OUTER JOIN benutzer_token bt ON bt.ID_Benutzer = spn.ID_Benutzer';
  dm_PCM.qry_Work.open;
  while not dm_PCM.qry_Work.eof do
  begin
    WriteLog(PCM_Logname,'Token:= ' + dm_PCM.qry_Work.Fieldbyname('Devicetoken').asString,0);
    if not Assigned(joBodyMain) then
      joBodyMain:= TJSONObject.Create;
    sID:= sID + ',' + dm_PCM.qry_Work.Fieldbyname('ID').asString;
    joBodyMain.AddPair(TJSONPair.Create('to',dm_PCM.qry_Work.Fieldbyname('Devicetoken').asString));
    joBodyMain.AddPair(TJSONPair.Create('priority','high'));
    if not Assigned(joBodySub) then
      joBodySub:= TJSONObject.Create;
    joBodySub.AddPair(TJSONPair.Create('body',dm_PCM.qry_Work.Fieldbyname('Message').asString));
    joBodySub.AddPair(TJSONPair.Create('title','Änderung festgestellt'));
    joBodyMain.AddPair(TJSONPair.Create('notification',joBodySub));
    sUploadstate:= joBodyMain.ToString;
    dm_PCM.RESTRequest2.Params.AddItem('Authorization', 'Bearer AAAAKei3FDU:APA91bHidAp5KysKnJeC0zMHHs242AW-DN9GHepIEOQgqJeCni82g9l6m324q71H5Rn3yThrjLW-rH5W1P7KV4TC32eDeUUB4zeHmTv4AhTjTGVYc384BzUMUaDSY6x8KtqqkydOoq5a', pkHTTPHEADER, [poDoNotEncode]);
    dm_PCM.RESTRequest2.Body.Add(joBodyMain);
    dm_PCM.RESTRequest2.Execute;
    dm_PCM.RESTRequest2.ClearBody;
    dm_PCM.RESTRequest2.Body.ClearBody;
    if Assigned(joBodySub) then
      joBodySub:= nil;
    if Assigned(joBodyMain) then
      joBodyMain:= nil;
    dm_pcm.qry_work.Next;

  end;
  dm_pcm.qry_work.close;
  dm_PCM.qry_work.SQL.Text:= 'Delete FROM service_pushnotifications Where ID IN (0 ' + sid + ')';
  dm_PCM.qry_work.ExecSQL;
  dm_pcm.qry_work.SQL.Text:= 'SELECT mkal.*, btok.DeviceToken FROM manager_kalender mkal ' +
                             'LEFT OUTER JOIN benutzer_token btok ON btok.iD_Benutzer = mkal.ID_Benutzer ' +
                             'WHERE mkal.Reminder = true AND mkal.ReminderDate <= NOW()  AND TYP IN (1,2) ' +
                             'ORDER BY btok.devicetoken, mkal.ReminderDate';
  dm_pcm.qry_work.open;
  while not dm_pcm.qry_work.Eof do
  begin
    case DayOfWeek(dm_pcm.qry_work.FieldByName('Start').AsDateTime) of
      1: sWochentagBeginn:= 'So.';
      2: sWochentagBeginn:= 'Mo.';
      3: sWochentagBeginn:= 'Di.';
      4: sWochentagBeginn:= 'Mi.';
      5: sWochentagBeginn:= 'Do.';
      6: sWochentagBeginn:= 'Fr.';
      7: sWochentagBeginn:= 'Sa.';
    end;

    case DayOfWeek(dm_pcm.qry_work.FieldByName('Finish').AsDateTime) of
      1: sWochentagEnde:= 'So.';
      2: sWochentagEnde:= 'Mo.';
      3: sWochentagEnde:= 'Di.';
      4: sWochentagEnde:= 'Mi.';
      5: sWochentagEnde:= 'Do.';
      6: sWochentagEnde:= 'Fr.';
      7: sWochentagEnde:= 'Sa.';
    end;
    sDateTime:= CheckReccurence(dm_pcm.qry_work.FieldByName('ID').asInteger,dm_pcm.qry_work.FieldByName('Start').asDatetime,dm_pcm.qry_work.FieldByName('wiederholung_text').asString);
    if ((DateOf(sDateTime) = Date) and (dm_pcm.qry_work.FieldByName('wiederholung_text').asString <> '')) or (dm_pcm.qry_work.FieldByName('wiederholung_text').asString = '') then
    begin
      if dm_pcm.qry_work.FieldByName('CompleteDay').AsBoolean then
      begin
        if dm_pcm.qry_work.FieldByName('Finish').AsDateTime - dm_pcm.qry_work.FieldByName('Start').AsDateTime  = 1 then
        begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime);
        end
        else begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime) + ' - ' + sWochentagEnde + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Finish').AsDateTime);
        end;
      end
      else begin
        if dm_pcm.qry_work.FieldByName('Finish').AsDateTime - dm_pcm.qry_work.FieldByName('Start').AsDateTime  = 1 then
        begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime)
        end
        else begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy hh:mm',dm_pcm.qry_work.FieldByName('Start').AsDateTime) + ' - ' + FormatDateTime('hh:mm',dm_pcm.qry_work.FieldByName('Finish').AsDateTime);
        end;
      end;
    end
    else begin
      if dm_pcm.qry_work.FieldByName('CompleteDay').AsBoolean then
      begin
        if dm_pcm.qry_work.FieldByName('Finish').AsDateTime - dm_pcm.qry_work.FieldByName('Start').AsDateTime  = 1 then
        begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime);
        end
        else begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime) + ' - ' + sWochentagEnde + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Finish').AsDateTime);
        end;
      end
      else begin
        if dm_pcm.qry_work.FieldByName('Finish').AsDateTime - dm_pcm.qry_work.FieldByName('Start').AsDateTime  = 1 then
        begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy',dm_pcm.qry_work.FieldByName('Start').AsDateTime)
        end
        else begin
          sAlertBody:= sWochentagBeginn + ' ' + FormatDateTime('dd.mm.yyyy hh:mm',dm_pcm.qry_work.FieldByName('Start').AsDateTime) + ' - ' + FormatDateTime('hh:mm',dm_pcm.qry_work.FieldByName('Finish').AsDateTime);
        end;
      end;
    end;
    if not Assigned(joBodyMain) then
      joBodyMain:= TJSONObject.Create;
    joBodyMain.AddPair(TJSONPair.Create('to',dm_PCM.qry_Work.Fieldbyname('Devicetoken').asString));
    joBodyMain.AddPair(TJSONPair.Create('priority','high'));
    if not Assigned(joBodySub) then
      joBodySub:= TJSONObject.Create;
    joBodySub.AddPair(TJSONPair.Create('body',sAlertBody));
    joBodySub.AddPair(TJSONPair.Create('title',dm_PCM.qry_Work.Fieldbyname('Caption').asString));
    joBodyMain.AddPair(TJSONPair.Create('notification',joBodySub));
    sUploadstate:= joBodyMain.ToString;
    dm_PCM.RESTRequest2.Params.AddItem('Authorization', 'Bearer AAAAKei3FDU:APA91bHidAp5KysKnJeC0zMHHs242AW-DN9GHepIEOQgqJeCni82g9l6m324q71H5Rn3yThrjLW-rH5W1P7KV4TC32eDeUUB4zeHmTv4AhTjTGVYc384BzUMUaDSY6x8KtqqkydOoq5a', pkHTTPHEADER, [poDoNotEncode]);
    dm_PCM.RESTRequest2.Body.Add(joBodyMain);
    dm_PCM.RESTRequest2.Execute;
    dm_PCM.RESTRequest2.ClearBody;
    dm_PCM.RESTRequest2.Body.ClearBody;
    if Assigned(joBodySub) then
      joBodySub:= nil;
    if Assigned(joBodyMain) then
      joBodyMain:= nil;
    dm_pcm.qry_work1.SQL.Text:= 'Update manager_kalender Set ReminderDate = :Reminderdate Where ID = :ID';
    dm_pcm.qry_work1.ParamByName('ID').AsInteger:= dm_pcm.qry_work.FieldByName('ID').asInteger;
    dm_pcm.qry_work1.ParamByName('ReminderDate').AsDateTime:= Incday(dm_pcm.qry_work.FieldByName('ReminderDate').AsDateTime,1);
    dm_pcm.qry_work1.ExecSQL;
    dm_pcm.qry_work.next;
  end;
  dm_pcm.qry_work.close;
end;
procedure BackupQuellcode;
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
    WriteLog(PCM_Logname,'ExecuteAndWaitFor Error: Error-Code '+intToStr(GetLastError),2);
  end;
end;
end.
