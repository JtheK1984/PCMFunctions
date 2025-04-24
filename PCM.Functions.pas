unit PCM.Functions;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, System.ImageList, Vcl.ImgList,
  cxProgressBar, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,registry,
  Vcl.ExtCtrls, Vcl.Menus, cxButtons,  Data.db,
  cxGroupBox, cxLabel, cxImageList,IdGlobal, IdHash, IdHashMessageDigest,cxGridDBTableView,cxGridCustomView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, dxBarBuiltInMenu, cxPC,
  dxLayoutcxEditAdapters, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer,
  dxLayoutControl, dxUIAClasses ;
  {$EndRegion uses}
type
  {$Region type}
  TAufgabenThread = class(TThread)
  private
    { Private-Deklarationen }
  protected
    procedure Execute; override;
  public
    Proc: TProcedure;
  end;
  TSavedGridView = class
  private
    function GetTempDir: string;
  protected
    FGridView: TcxGridDBTableView;
    FDefaultView: TMemoryStream;
    FViewTyp, FID_Benutzer: Integer;
  public
    constructor Create(ViewTyp, ID_Benutzer: Integer; GridView:
      TcxGridDBTableView);
    destructor Destroy; override;
    function LoadView: Integer;
    procedure DefaultView;
    procedure SaveView(CustomData: Integer);
    procedure LoadFromFile(FileName: string);
    procedure SaveTofile(FileName: string);
  end;
  Tfrm_PCM_System = class(TForm)
    tmr_GetRamUsage: TTimer;
    prgbr_RamUse: TcxProgressBar;
    prgbr_ProcUse: TcxProgressBar;
    imglst_16x16: TcxImageList;
    lactrl_SystemGroup_Root: TdxLayoutGroup;
    lactrl_System: TdxLayoutControl;
    lagrp_System: TdxLayoutGroup;
    lagrp_SystemWindows: TdxLayoutGroup;
    laitm_SystemOSlbl: TdxLayoutLabeledItem;
    laitm_SystemOS: TdxLayoutLabeledItem;
    lagrp_SystemCPU: TdxLayoutGroup;
    lagrp_SystemRam: TdxLayoutGroup;
    lagrp_SystemAuslastungDetails: TdxLayoutGroup;
    laitm_SystemRamUSE: TdxLayoutItem;
    laitm_SystemCPUUSE: TdxLayoutItem;
    lalaflst_System: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    lagrp_SystemOS: TdxLayoutGroup;
    lagrp_SystemPCNAME: TdxLayoutGroup;
    laitm_SystemPCNAMElbl: TdxLayoutLabeledItem;
    laitm_SystemPCNAME: TdxLayoutLabeledItem;
    laitm_SystemGraphiclbl: TdxLayoutLabeledItem;
    laitm_SystemGraphic: TdxLayoutLabeledItem;
    lagrp_SystemGraphic: TdxLayoutGroup;
    laitm_SystemSysdirlbl: TdxLayoutLabeledItem;
    laitm_SystemSysdir: TdxLayoutLabeledItem;
    lagrp_SystemSysdir: TdxLayoutGroup;
    lagrp_SystemCPUType: TdxLayoutGroup;
    lagrp_SystemCPUCount: TdxLayoutGroup;
    lagrp_SystemCPUSpeed: TdxLayoutGroup;
    laitm_SystemCPUSpeedlbl: TdxLayoutLabeledItem;
    laitm_SystemCPUSpeed: TdxLayoutLabeledItem;
    laitm_SystemCPUCountlbl: TdxLayoutLabeledItem;
    laitm_SystemCPUCount: TdxLayoutLabeledItem;
    laitm_SystemCPUTypelbl: TdxLayoutLabeledItem;
    laitm_SystemCPUType: TdxLayoutLabeledItem;
    lagrp_SystemRamTotal: TdxLayoutGroup;
    lagrp_SystemRamTotalFree: TdxLayoutGroup;
    laitm_SystemRamTotalFreelbl: TdxLayoutLabeledItem;
    laitm_SystemRamTotalFree: TdxLayoutLabeledItem;
    laitm_SystemRamTotallbl: TdxLayoutLabeledItem;
    laitm_SystemRamTotal: TdxLayoutLabeledItem;
    lagrp_SystemAuslastung: TdxLayoutGroup;
    procedure tmr_GetRamUsageTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
    FLastIdleTime: Int64;
    FLastKernelTime: Int64;
    FLastUserTime: Int64;
    procedure GetRamUsage;
    function GetProzessorName: string;
    function GetCPUSpeed: real;
    function GetCPUUsage: double;

  public
    { Public-Deklarationen }
    function GetCurrentUserName: string;
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_System: Tfrm_PCM_System;
  nOldIdleTime: Int64 = 0;
  nOldSystemTime : INT64 = 0;
  nNewCPUTime    : ULONG = 0;
  {$EndRegion var}
// Deklarationen
{$Region Deklarationen}
procedure WriteLog(AProgram, ALogString: String; AError: integer);
function EnDecrypt(AInput: string; AEncrypt: boolean) : RawByteString;
function GetHDnr: DWord;
function GetPCName: string;
function GetMD5Hash(AValue: string) :String;
{$EndRegion Deklarationen}
const
  {$Region const}
  SYS_BASIC_INFO            = 0;
  SYS_PERFORMANCE_INFO      = 2;
  SYS_TIME_INFO             = 3;
  ColorGreen = $00006E00;
  ColorOrange = $000064C8;
  ColorYellow = clOlive;
  ColorRed = $0000006E;
  // Allgemein
  GV_Benutzer = 0;
  GV_Recht = 1;

  // PCM - Lizenzgenerator
  GV_Kunden = 400;
  GV_Lizenz = 401;
  GV_Programme = 402;
  // PCM - Manager
  GV_Kalender =  100;
  GV_Feiertage = 101;
  GV_FTP = 102;
  GV_AUFGABENarten = 103;
  GV_AUFGABENPrio = 104 ;
  GV_Stundenplan = 105;
  GV_StundenplanFarbe = 106 ;
  GV_Email = 107;
  GV_Postfach = 108;
  GV_UnterPostfach = 109;
  GV_Contacs = 110;
  GV_Aufgaben = 111;
  GV_Nachrichten = 112;
  GV_StundenplanBes = 113;
  GV_StundenplanDet = 114;
  GV_Adresssuche = 115;
  GV_Mail = 116;
  GV_Passwort = 117;
  GV_Serial = 118;
  GV_SerialDet = 119;
  GV_Einnahmen = 120;
  GV_Ausgaben = 121;
  GV_Verfuegung = 122;
  // PCM Mediacenter
  GV_Sender = 600;
  // PCM Notenrechner
  GV_Noten = 200;
  GV_NotenDetail = 201;
  // PCM Vokabeltrainer
  GV_Vokabeln = 300;
  GV_Status = 301;
  // PCM Archiv
  GV_Pfad = 400;
  GV_Main = 401;
  GV_Sub = 402;
  GV_Index = 403;
  GV_Archiv = 404;
  {$EndRegion const}
type
  {$Region type}
   SYSTEM_BASIC_INFORMATION = packed record
   dwUnknown1              : DWORD;
   uKeMaximumIncrement     : ULONG;
   uPageSize               : ULONG;
   uMmNumberOfPhysicalPages: ULONG;
   uMmLowestPhysicalPage   : ULONG;
   uMmHighestPhysicalPage  : ULONG;
   uAllocationGranularity  : ULONG;
   pLowestUserAddress      : POINTER;
   pMmHighestUserAddress   : POINTER;
   uKeActiveProcessors     : POINTER;
   bKeNumberProcessors     : BYTE;
   bUnknown2               : BYTE;
   wUnknown3               : WORD;
  end;

  SYSTEM_PERFORMANCE_INFORMATION = packed record
    nIdleTime               : INT64;
    dwSpare                 : array[0..75]of DWORD;
  end;

  SYSTEM_TIME_INFORMATION = packed record
    nKeBootTime             : INT64;
    nKeSystemTime           : INT64;
    nExpTimeZoneBias        : INT64;
    uCurrentTimeZoneId      : ULONG;
    dwReserved              : DWORD;
  end;

  function NTQuerySystemInformation(SystemInformationClass: Longint;
                                    SystemInformation: Pointer;
                                    SystemInformationLength: Longint;
                                    ReturnLength: Longint): Longint; stdcall;
                                    external 'ntdll.dll' name 'NtQuerySystemInformation';
  {$EndRegion type}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Strings,
  Prism.Crypto.AES,
  System.NetEncoding;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure TAufgabenThread.Execute;
begin
  try
    Proc;
  except
    on E: Exception do
      Writelog(PCM_logname,'Exception: ' + E.Message, 2);
  end;
end;
function GetWindowsRootDir: string;
var
  Dir: string;
  Len: DWord;
begin
  SetLength(dir,MAX_PATH);
  Len:= GetWindowsDirectory(Pchar(dir),MAX_PATH);
  if len > 0 then
  begin
    SetLength(Dir,len);
    Result:= Dir;
    Result:= ExtractFileDrive(Result) + '\';
  end
  else
    RaiseLastOSError;
end;
function GetHDnr: DWord;
var
  HD,D2,d3: Dword;
  root: String;
begin
  root := GetWindowsRootDir;
  GetVolumeInformation(PCHAR(Root),nil,0,@HD,d2,d3,nil,0);
  Result:= HD;
end;
function GetPCName: String;
var
 pCh_P: PChar;
 dwd_dw: dword;
begin
  pCh_P := StrAlloc(256);
  dwd_dw := 255;
  GetComputerName(pCh_P, dwd_dw);
  Result:= pCh_P;
end;
//function EnDecrypt(AInput: string; AEncrypt: boolean) : RawByteString;
//var
//  ByteInput,OriginalText, Key, IV, EncryptedText,DecryptedText: TBytes;
//begin
//  OriginalText := TEncoding.ANSI.GetBytes(AInput);
//  Key := TEncoding.ANSI.GetBytes('PCMDevelopmentJensHenske24021984'); // 256 bits-32 bytes
//  IV := TEncoding.ANSI.GetBytes('PCMJensHenske284'); // 16 bytes
//  if AEncrypt then
//  begin
//    EncryptedText := TAES.Encrypt(OriginalText, Key, 256, IV);
//    Result:= TNetEncoding.Base64.EncodeBytesToString(EncryptedText);
//  end
//  else begin
//    ByteInput:= TNetEncoding.Base64.DecodeStringToBytes(AInput);
//    DecryptedText := TAES.Decrypt(ByteInput, Key, 256, IV);
//    Result:= TEncoding.ANSI.GetString(DecryptedText);
//  end;
//end;

function EnDecrypt(AInput: string; AEncrypt: boolean): RawByteString;
var
  ByteInput, OriginalText, Key, IV, EncryptedText, DecryptedText: TBytes;
  TempStr: string;  // Zwischenspeicher für String-Result
begin
  OriginalText := TEncoding.ANSI.GetBytes(AInput);
  Key := TEncoding.ANSI.GetBytes('PCMDevelopmentJensHenske24021984'); // 256 bits-32 bytes
  IV := TEncoding.ANSI.GetBytes('PCMJensHenske284'); // 16 bytes

  if AEncrypt then
  begin
    EncryptedText := TAES.Encrypt(OriginalText, Key, 256, IV);
    TempStr := TNetEncoding.Base64.EncodeBytesToString(EncryptedText);
    Result := RawByteString(TempStr);  // Explizite Typumwandlung
  end
  else
  begin
    ByteInput := TNetEncoding.Base64.DecodeStringToBytes(AInput);
    DecryptedText := TAES.Decrypt(ByteInput, Key, 256, IV);
    TempStr := TEncoding.ANSI.GetString(DecryptedText);
    Result := RawByteString(TempStr);  // Explizite Typumwandlung
  end;
end;


procedure WriteLog(AProgram, ALogString: String; AError: integer);
var
  tfLog: TextFile;
  sTag,sError: String;
  sLogLine: String;
  sFilePath: String;
begin
  case DayOfWeek(Date) of
  1: sTag := 'So';
  2: sTag := 'Mo';
  3: sTag := 'Di';
  4: sTag := 'Mi';
  5: sTag := 'Do';
  6: sTag := 'Fr';
  7: sTag := 'Sa';
  end;

  case AError of
  0: sError := 'Hinweis: ';
  1: sError := 'Warnung: ';
  2: sError := 'Fehler: ';

  end;
  if not DirectoryExists(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM') then
    CreateDir(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM');

  if (AProgram = 'PCMRestserver') or (AProgram = 'PCMService') or (AProgram = 'PCMAppserver') or (AProgram = 'PCMBackupService')then
    sFilePath := ExtractFilePath(paramstr(0)) + AProgram + sTag + '.log'
  else
    sFilePath := GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\'+ AProgram + sTag + '.log';
  sLogLine := DateTimeToStr(Now()) + ' ' + sError;
  AssignFile(tfLog, sFilePath);
  if FileExists(sFilePath) then
    Append(tfLog)
  else
    Rewrite(tfLog);
  Writeln(tfLog, sLogLine + ALogString);
  CloseFile(tfLog);
end;
constructor TSavedGridView.Create(ViewTyp, ID_Benutzer: Integer; GridView:  TcxGridDBTableView);
begin
  FViewTyp := ViewTyp;
  FID_Benutzer := ID_Benutzer;
  FGridView := GridView;

  // save current view as default view
  FDefaultView := TMemoryStream.Create;
  FGridView.StoreToStream(FDefaultView);
end;
destructor TSavedGridView.Destroy;
begin
  FDefaultView.Free;
end;
function TSavedGridView.GetTempDir: string;
var
  Dir: string;
  Len: DWord;
begin
  SetLength(Dir,MAX_PATH);
  Len:= GetTempPath(MAX_PATH, PChar(Dir));
  if Len > 0 then
  begin
    SetLength(Dir,Len);
    Result:=Dir;
  end
  else
    RaiseLastOSError;
end;
function TSavedGridView.LoadView: Integer;
var
  SavedView: TStream;
  CustomData: Integer;
begin

  dm_PCM.qry_Work.SQL.Text := 'SELECT Data FROM benutzer_grids WHERE ID_Benutzer = :IDBen AND Typ = :Typ';
  dm_PCM.qry_Work.ParamByName('IDBen').AsInteger := FID_Benutzer;
  dm_PCM.qry_Work.ParamByName('Typ').AsInteger := FViewTyp;
  dm_PCM.qry_Work.Open;

  if not dm_PCM.qry_Work.Eof then
  begin
    // Daten einlesen aus Blob
    SavedView := dm_PCM.qry_Work.CreateBlobStream(dm_PCM.qry_Work.FieldByName('Data'), bmRead);
    FGridView.RestoreFromStream(SavedView);
    if SavedView.Position < SavedView.Size then
    begin
      SavedView.Read(CustomData, SizeOf(CustomData));
      Result := CustomData;
    end
    else
      Result := -1;
    SavedView.Free;
  end
  else
    Result := -1;
  dm_PCM.qry_Work.Close;
end;
procedure TSavedGridView.DefaultView;
begin
  FDefaultView.Seek(0, soFromBeginning);
  FGridView.RestoreFromStream(FDefaultView);
end;
procedure TSavedGridView.SaveView(CustomData: Integer);
var
  SavedView: TFileStream;
  sGridViewFile: String;
begin
  try
    dm_PCM.qry_Work.SQL.Text := 'SELECT Data FROM benutzer_grids WHERE ID_Benutzer = :IDBen AND Typ = :Typ';
    dm_PCM.qry_Work.ParamByName('IDBen').AsInteger := FID_Benutzer;
    dm_PCM.qry_Work.ParamByName('Typ').AsInteger := FViewTyp;
    dm_PCM.qry_Work.Open;


    if dm_PCM.qry_Work.Eof then
    begin
      dm_PCM.qry_Work.Close;
      dm_PCM.qry_Work.SQL.Text := 'INSERT INTO benutzer_grids (ID_Benutzer, Typ, Data) VALUES (:IDBen, :Typ, :Data)';
    end
    else
    begin
      dm_PCM.qry_Work.Close;
      dm_PCM.qry_Work.SQL.Text := 'UPDATE benutzer_grids SET Data = :Data WHERE ID_Benutzer = :IDBen AND Typ = :Typ';
    end;

    try
      sGridViewFile := GetTempDir + 'Grid.res';
      SavedView := TFileStream.Create(sGridViewFile, fmCreate);
      try
        FGridView.StoreToStream(SavedView, [gsoUseSummary]);
      finally
        SavedView.Free;
      end;
    except
      on E: Exception do
      begin
        ShowMessage(rs_PCM_GridSpeichernFehler + E.Message);
      end;
    end;

    dm_PCM.qry_Work.ParamByName('IDBen').AsInteger := FID_Benutzer;
    dm_PCM.qry_Work.ParamByName('Typ').AsInteger := FViewTyp;
    if FileExists(sGridViewFile) then
    begin
      dm_PCM.qry_Work.ParamByName('Data').LoadFromFile(sGridViewFile, ftBlob);
      dm_PCM.qry_Work.ExecSQL;
    end;
  finally
    if FileExists(sGridViewFile) then
      DeleteFile(sGridViewFile);
  end;
end;
procedure TSavedGridView.LoadFromFile(FileName: string);
var
  f: TFileStream;
  Source: TDataSource;
begin
  Source := FGridView.DataController.DataSource;
  FGridView.DataController.DataSource := nil;

  try
    f := TFileStream.Create(FileName, fmOpenRead);
    FGridView.RestoreFromStream(f, True, True, [gsoUseSummary]);
    f.Free;
  except
    on E: Exception do
    begin
      ShowMessage(rs_PCM_GridLadenFehler + E.Message);
    end;
  end;

  FGridView.DataController.DataSource := Source;
end;
procedure TSavedGridView.SaveTofile(FileName: string);
var
  f: TFileStream;
begin
  try
    f := TFileStream.Create(FileName, fmCreate);
    FGridView.StoreToStream(f, [gsoUseSummary]);
    f.Free;
  except
    on E: Exception do
    begin
      ShowMessage(rs_PCM_GridSpeichernFehler + E.Message);
    end;
  end;
end;
// Prozessername ermitteln
function Tfrm_PCM_System.GetProzessorName: string;
var reg: TRegistry;
begin
  result:='Unbekannter Prozessor';
  reg:=TRegistry.Create(KEY_READ);
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Hardware\Description\System\CentralProcessor\0', false);
    result:=reg.ReadString('ProcessorNameString');
  finally
    reg.free;
  end;
end;
{$ifDef WIN64}
function Tfrm_PCM_System.GetCPUSpeed : real;
var
  Reg : TRegistry;
begin
 Result:= 0;
 Reg := TRegistry.Create(KEY_QUERY_VALUE);
 try
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.OpenKeyReadOnly('HARDWARE\DESCRIPTION\System\CentralProcessor\0') then
   begin
    Result := Reg.ReadInteger('~MHz');
    Reg.CloseKey;
   end;
 finally
  Reg.Free;
 end;
end;
{$else}
// Prozessergeschwindigkeit ermitteln
function Tfrm_PCM_System.GetCPUSpeed: real;
const
  TimeOfDelay = 500;
var
  TimerHigh, TimerLow: DWORD;
begin
  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
  Sleep(10);
  asm
    dw 310Fh
    mov TimerLow, eax
    mov TimerHigh, edx
  end;
  Sleep(TimeOfDelay);
  asm
    dw 310Fh
    sub eax, TimerLow
    sbb edx, TimerHigh
    mov TimerLow, eax
    mov TimerHigh, edx
  end;
  Result := TimerLow / (1000.0 * TimeOfDelay);
end;
{$endif}
function Tfrm_PCM_System.GetCPUUsage: double;
var
  IdleTimeRec, KernelTimeRec, UserTimeRec: TFileTime;
  IdleTime, KernelTime, UserTime: Int64;
  IdleDiff, KernelDiff, UserDiff, SysTime: Int64;
begin
  GetSystemTimes(IdleTimeRec, KernelTimeRec, UserTimeRec);

  IdleTime := Int64(IdleTimeRec.dwLowDateTime) or (Int64(IdleTimeRec.dwHighDateTime) shl 32);
  KernelTime := Int64(KernelTimeRec.dwLowDateTime) or (Int64(KernelTimeRec.dwHighDateTime) shl 32);
  UserTime := Int64(UserTimeRec.dwLowDateTime) or (Int64(UserTimeRec.dwHighDateTime) shl 32);

  IdleDiff := IdleTime - FLastIdleTime;
  KernelDiff := KernelTime - FLastKernelTime;
  UserDiff := UserTime - FLastUserTime;

  SysTime := KernelDiff + UserDiff;

  if SysTime > 0 then
    Result := 100.0 - (IdleDiff * 100.0 / SysTime)
  else
    Result := 0;

  FLastIdleTime := IdleTime;
  FLastKernelTime := KernelTime;
  FLastUserTime := UserTime;
end;
function GetMD5Hash(AValue: string): String;
var
    hashMessageDigest5 : TIdHashMessageDigest5;
begin
    hashMessageDigest5 := nil;
    try
        hashMessageDigest5 := TIdHashMessageDigest5.Create;
        Result := IdGlobal.IndyLowerCase ( hashMessageDigest5.HashStringAsHex ( Avalue ) );
    finally
        hashMessageDigest5.Free;
    end;
end;
function Tfrm_PCM_System.GetCurrentUserName: string;
const
  cnMaxUserNameLen = 254;
var
  sUserName: string;
  dwUserNameLen: DWORD;
begin
  dwUserNameLen := cnMaxUserNameLen - 1;
  SetLength(sUserName, cnMaxUserNameLen);
  GetUserName(PChar(sUserName), dwUserNameLen);
  SetLength(sUserName, dwUserNameLen-1);
  Result := sUserName;
end;
// Arbeitsspeicherauslastung ermitteln
procedure Tfrm_PCM_System.GetRamUsage;
var
  mst_memory: TMemoryStatusEx;
  dwd_UsedRam, dwd_UsedRamTemp: UInt64;
begin
  mst_memory.dwLength := sizeof(mst_memory);
  GlobalMemoryStatusEx(mst_memory);
  dwd_UsedRam:= mst_memory.ullTotalPhys - mst_memory.ullAvailPhys ;
  dwd_UsedRamTemp := Round((dwd_UsedRam / mst_memory.ullTotalPhys) * 100);
  prgbr_RamUse.Position:= dwd_UsedRamTemp;
  laitm_SystemRamTotal.Caption := Format('%.2f MB', [mst_memory.ullTotalPhys / (1024 * 1024)]);
  laitm_SystemRamTotalFree.Caption := Format('%.2f MB', [mst_memory.ullAvailPhys / (1024 * 1024)]);
  prgbr_ProcUse.Position:= GetCPUUsage;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_System.tmr_GetRamUsageTimer(Sender: TObject);
begin
  GetRamUsage;
end;
{$EndRegion Formfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_System.FormShow(Sender: TObject);
var
  sys_systeminfo: TSystemInfo;
  pCh_P: PChar;
  dwd_dw: dword;
  reg_Registry: TRegistry;
begin
  lagrp_SystemWindows.CaptionOptions.Text:= rs_Function_System_Windows;
  laitm_SystemOSlbl.CaptionOptions.text:= rs_Function_System_OS;
  laitm_SystemPCNAMElbl.CaptionOptions.Text:= rs_Function_system_PCName;
  laitm_SystemGraphiclbl.CaptionOptions.Text:= rs_Function_System_Grphic;
  laitm_SystemSysdirlbl.CaptionOptions.Text:= rs_Function_System_Sysdir;
  lagrp_SystemCPU.CaptionOptions.Text:= rs_Function_System_Processor;
  laitm_SystemCPUTypelbl.CaptionOptions.Text:= rs_Function_System_ProcessorType;
  laitm_SystemCPUCountlbl.CaptionOptions.Text:= rs_Function_System_ProcessorCount;
  laitm_SystemCPUSpeedlbl.CaptionOptions.Text:= rs_Function_System_ProcessorSpeed;
  lagrp_SystemRam.CaptionOptions.Text:= rs_Function_System_Ram;
  laitm_SystemRamTotallbl.CaptionOptions.Text:= rs_Function_System_RamTotal;
  laitm_SystemRamTotalFreelbl.CaptionOptions.Text:= rs_Function_System_RamFree;
  lagrp_SystemAuslastungDetails.CaptionOptions.Text:= rs_Function_System_Auslastung;
  laitm_SystemRamUSE.CaptionOptions.Text:= rs_Function_System_Ram;
  laitm_SystemCPUUSE.CaptionOptions.Text:= rs_Function_System_Processor;
  laitm_SystemCPUType.Caption := GetProzessorName;
  laitm_SystemCPUSpeed.Caption := Format('%.2f GHz',[(Round(GetCPUSpeed) / 1000)]);
  GetSystemInfo(sys_systeminfo);
  laitm_SystemCPUCount.Caption := inttostr(sys_systeminfo.dwNumberOfProcessors);
  laitm_SystemGraphic.Caption:= inttostr(screen.width) + 'x' + inttostr(screen.height);
  pCh_P := StrAlloc(256);
  dwd_dw := 255;
  GetComputerName(pCh_P, dwd_dw);
  laitm_SystemPCNAME.Caption:= pCh_P;
  pCh_P := StrAlloc(MAX_PATH + 1);
  GetWindowsDirectory(pCh_P, MAX_PATH + 1);
  laitm_SystemSysdir.Caption:= ExtractFileDrive(pCh_P) + '\';
  reg_Registry:= TRegistry.Create(KEY_READ);
  try
    reg_Registry.RootKey := HKEY_LOCAL_MACHINE;
    reg_Registry.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', false);
    laitm_SystemOS.Caption:=reg_Registry.ReadString('ProductName') + ' ' + reg_Registry.ReadString('CSDVersion') ;
  finally
    reg_Registry.free;
  end;
end;
{$EndRegion Formfunktionen}
end.
