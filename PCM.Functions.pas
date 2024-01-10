unit PCM.Functions;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, System.ImageList, Vcl.ImgList,
  cxProgressBar, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,registry,
  Vcl.ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinBasic, dxSkinOffice2019Black,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, Vcl.Menus, cxButtons,  Data.db,
  cxGroupBox, cxLabel, cxImageList,IdGlobal, IdHash, IdHashMessageDigest,cxGridDBTableView,cxGridCustomView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, dxBarBuiltInMenu, cxPC, dxSkinWXI ;

type
  TAufgabenThread = class(TThread)
  private
    { Private-Deklarationen }
  protected
    procedure Execute; override;
  public
    Proc: TProcedure;
  end;

type
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

type
  Tfrm_PCM_System = class(TForm)
    tmr_GetRamUsage: TTimer;
    prgbr_RamUse: TcxProgressBar;
    prgbr_ProcUse: TcxProgressBar;
    grpbx_SysInfo_Ram: TcxGroupBox;
    grpbx_SysInfo_CPU: TcxGroupBox;
    lbl_RAMFree: TcxLabel;
    lbl_RAMFree_data: TcxLabel;
    lbl_RAMTotal: TcxLabel;
    lbl_RAMTotal_data: TcxLabel;
    lbl_ProcType: TcxLabel;
    lbl_ProcType_data: TcxLabel;
    lbl_ProcSpeed_data: TcxLabel;
    lbl_ProcCount: TcxLabel;
    lbl_ProcSpeed: TcxLabel;
    lbl_ProcCount_data: TcxLabel;
    grpbx_SysInfo_Sys: TcxGroupBox;
    grpbx_SysInfo_Resource: TcxGroupBox;
    lbl_Graphic: TcxLabel;
    lbl_Graphic_data: TcxLabel;
    lbl_os: TcxLabel;
    lbl_os_data: TcxLabel;
    lbl_PCName: TcxLabel;
    lbl_PCName_data: TcxLabel;
    lbl_SysDir: TcxLabel;
    lbl_SysDir_data: TcxLabel;
    lbl_ProcUse: TcxLabel;
    lbl_RamUse: TcxLabel;
    pnl_design: TcxGroupBox;
    procedure tmr_GetRamUsageTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure GetRamUsage;
    function GetProzessorName: string;
    function GetCPUSpeed: real;
    function GetCPUUsage: Integer;

  public
    { Public-Deklarationen }
    function GetCurrentUserName: string;
  end;

var
  frm_PCM_System: Tfrm_PCM_System;
  nOldIdleTime: Int64 = 0;
  nOldSystemTime : INT64 = 0;
  nNewCPUTime    : ULONG = 0;

  procedure WriteLog(AProgram, ALogString: String; AError: integer);
	function GetHDnr: DWord;
	function GetPCName: string;
  function GetMD5Hash(AValue: string) :String;

const
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
type
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

implementation

{$R *.dfm}

uses 	PCM.Data,
			PCM.Strings;

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
function Tfrm_PCM_System.GetCPUUsage: Integer;
var
  spi : SYSTEM_PERFORMANCE_INFORMATION;
  sti : SYSTEM_TIME_INFORMATION;
  sbi : SYSTEM_BASIC_INFORMATION;
begin
  result := 0;

  if (NTQuerySystemInformation(SYS_BASIC_INFO, @sbi, sizeof(SYSTEM_BASIC_INFORMATION), 0) = NO_ERROR) then
  begin
    if (NTQuerySystemInformation(SYS_TIME_INFO, @sti, sizeof(SYSTEM_TIME_INFORMATION), 0) = NO_ERROR) then
    if (NTQuerySystemInformation(SYS_PERFORMANCE_INFO, @spi, sizeof(SYSTEM_PERFORMANCE_INFORMATION), 0)= NO_ERROR) then
    begin
      if (nOldIdleTime <> 0) then
      begin
        try
          nNewCPUTime:= trunc(100-((spi.nIdleTime-nOldIdleTime)/(sti.nKeSystemTime-nOldSystemTime)*100)/sbi.bKeNumberProcessors+0.5);
          if (nNewCPUTime <> nOldIdleTime) then
          begin
            Result := nNewCPUTIME;
          end;
        except
          Result := 0;
        end;
      end;
      nOldIdleTime   := spi.nIdleTime;
      nOldSystemTime := sti.nKeSystemTime;
    end;
  end;
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
  sCPU: string;
begin
  mst_memory.dwLength := sizeof(mst_memory);
  GlobalMemoryStatusEx(mst_memory);
  dwd_UsedRam:= mst_memory.ullTotalPhys - mst_memory.ullAvailPhys ;
  dwd_UsedRamTemp := Round((dwd_UsedRam / mst_memory.ullTotalPhys) * 100);
  prgbr_RamUse.Position:= dwd_UsedRamTemp;
  lbl_RAMTotal_data.Caption := Format('%.2f MB', [mst_memory.ullTotalPhys / (1024 * 1024)]);
  lbl_RAMFree_data.Caption := Format('%.2f MB', [mst_memory.ullAvailPhys / (1024 * 1024)]);
  sCPU:= IntToStr(GetCPUUsage());
  prgbr_ProcUse.Position:= StrToFloatDef(sCPU,0);
end;
procedure Tfrm_PCM_System.tmr_GetRamUsageTimer(Sender: TObject);
begin
  GetRamUsage;
end;
procedure Tfrm_PCM_System.FormShow(Sender: TObject);
var
  sys_systeminfo: TSystemInfo;
  pCh_P: PChar;
  dwd_dw: dword;
  reg_Registry: TRegistry;
begin
  lbl_ProcType_data.Caption := GetProzessorName;
  lbl_ProcSpeed_data.Caption := Format('%.2f GHz',[(Round(GetCPUSpeed) / 1000)]);
  GetSystemInfo(sys_systeminfo);
  lbl_ProcCount_data.Caption := inttostr(sys_systeminfo.dwNumberOfProcessors);
  lbl_Graphic_data.Caption:= inttostr(screen.width) + 'x' + inttostr(screen.height);
  pCh_P := StrAlloc(256);
  dwd_dw := 255;
  GetComputerName(pCh_P, dwd_dw);
  lbl_PCName_data.Caption:= pCh_P;
  pCh_P := StrAlloc(MAX_PATH + 1);
  GetWindowsDirectory(pCh_P, MAX_PATH + 1);
  lbl_SysDir_data.Caption:= ExtractFileDrive(pCh_P) + '\';
  reg_Registry:= TRegistry.Create(KEY_READ);
  try
    reg_Registry.RootKey := HKEY_LOCAL_MACHINE;
    reg_Registry.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', false);
    lbl_os_data.Caption:=reg_Registry.ReadString('ProductName') + ' ' + reg_Registry.ReadString('CSDVersion') ;
  finally
    reg_Registry.free;
  end;
end;

end.
