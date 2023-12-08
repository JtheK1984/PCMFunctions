unit PCM.Functions.AppInfo;

interface

uses WinApi.Windows, SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, System.ImageList, Vcl.ImgList, cxButtons,
  dxSkinMetropolisDark, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel, cxGroupBox,
  cxImage,Vcl.Styles,vcl.themes,inifiles, Vcl.Imaging.pngimage, dxSkinWXI;

type
  Tfrm_PCM_InfoApp = class(TForm)
    pnl_INFO: TcxGroupBox;
    lbl_PCManagerAppInfo_AppName: TcxLabel;
    lbl_PCManagerAppInfo_VersionInfo: TcxLabel;
    lbl_PCManagerAppInfo_RevisionInfo: TcxLabel;
    lbl_PCManagerAppInfo_Version: TcxLabel;
    lbl_PCManagerAppInfo_Revision: TcxLabel;
    lbl_PCManagerAppInfo_AppCopyRightInfo: TcxLabel;
    lbl_PCManagerAppInfo_AppCopyRight: TcxLabel;
    img_PCManagerAppInfo_Image: TcxImage;
    grpbx_Info: TcxGroupBox;
    cxButton1: TcxButton;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    lblDBVersion: TcxLabel;
    lblDataVersion: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function GetFileDate :String;
    function GetAppVersion: string;
  end;
var
  frm_PCM_InfoApp: Tfrm_PCM_InfoApp;

implementation

{$R *.dfm}

uses PCM.Data,PCM.Functions.Lizenz,PCM.Main,PCM.Strings;
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
// Ermitteln des Dateierzeugungsdatum
function Tfrm_PCM_InfoApp.GetFileDate :String;
var
  srchRecFile: TSearchRec;
begin
  Result:= DateToStr(Now);
  if FindFirst(ExtractFilePath(ParamStr(0)) + ExtractFileName(ParamStr(0)) ,faAnyFile,srchRecFile)=0 then begin
    Result:= DateToStr(srchRecFile.TimeStamp);
    Result:= copy(Result,1,2) + copy(Result,4,2) + copy(Result,9,2);
    Sysutils.FindClose(srchRecFile);
  end;
end;
// Ermitteln des Dateiversion
function Tfrm_PCM_InfoApp.GetAppVersion: string;
var
  dwVerInfoSize: DWord;
  poiVerInfo: Pointer;
  dwVerValueSize: DWord;
  ffiVerValue: PVSFixedFileInfo;
  dwdDummy: DWord;
begin
  Result := '';
  dwVerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), dwdDummy);
  if dwVerInfoSize = 0 then
    exit;
  GetMem(poiVerInfo, dwVerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, dwVerInfoSize, poiVerInfo);
  VerQueryValue(poiVerInfo, '\', Pointer(ffiVerValue), dwVerValueSize);
  with ffiVerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(poiVerInfo, dwVerInfoSize);
end;
////////////////////////////////////////////////////////////////////////////////
// Hauptfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
// Formular anzeigen
procedure Tfrm_PCM_InfoApp.cxButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
  frm_PCM_lizenz.btn_SaveLicence.Enabled:= false;
  dm_PCM.bAppTerm:= false;
  frm_PCM_lizenz.Showmodal;
  frm_PCM_lizenz.Free;

  dm_PCM.CheckLizenzNew;
  cxLabel1.Caption:= dm_PCM.Firma;
  if not dm_PCM.bDemo then
  begin
    cxLabel4.Caption:= rs_PCM_Nein;
    cxLabel6.Caption:= rs_PCM_unbegrenzt;
    frm_PCM_main.Caption:=PCM_Programmname;
  end
  else
  begin
    cxLabel4.Caption:= rs_PCM_Ja;
    cxLabel6.Caption:= DateToStr(dm_PCM.dtGueltig);
    frm_PCM_main.Caption:=PCM_Programmname + rs_PCM_Demolizenz + DateTostr(dm_PCM.dtGueltig);
  end;
end;

procedure Tfrm_PCM_InfoApp.FormShow(Sender: TObject);
begin
  case dm_PCM.iDBType of
  0:
    begin
      dm_PCM.qry_work.SQL.Text:= 'SELECT VERSION() as Version';
      dm_PCM.qry_work.Open;
      if StrToInt(Copy(dm_PCM.qry_work.FieldByName('Version').AsString,1,1 )) > 5 then
        lblDBVersion.Caption:= 'MySQL 64-Bit Version: ' + dm_PCM.qry_work.FieldByName('Version').AsString
      else
        lblDBVersion.Caption:= 'MySQL 32-Bit Version: ' + dm_PCM.qry_work.FieldByName('Version').AsString;
      dm_PCM.qry_work.close;

      dm_PCM.qry_work.SQL.Text:= 'SELECT CONCAT(Major,''.'',Minor) as Version from version_db';
      dm_PCM.qry_work.Open;
      lblDataVersion.Caption:= rs_PCM_Version + dm_PCM.qry_work.FieldByName('Version').AsString;
      dm_PCM.qry_work.close;

    end;
  end;


  lbl_PCManagerAppInfo_AppName.Caption:= PCM_Programmname;
  lbl_PCManagerAppInfo_Version.Caption:= GetAppVersion;
  lbl_PCManagerAppInfo_Revision.Caption:= GetFileDate;
  if (PCM_Logname <> 'PCMLizenzgenerator') and (PCM_Logname <> 'PCMBackup') then
  begin
    cxLabel1.Caption:= dm_PCM.Firma;
    if not dm_PCM.bDemo then
    begin
      cxLabel4.Caption:= rs_PCM_Nein;
      cxLabel6.Caption:= rs_PCM_unbegrenzt;
    end
    else
    begin
      cxLabel4.Caption:= rs_PCM_Ja;
      cxLabel6.Caption:= DateToStr(dm_PCM.dtGueltig);
    end;
  end
  else begin
    cxButton1.Visible:= false;
    dm_PCM.qry_work.SQL.Text:= 'Select Benutzer From manager_lizenz';
    dm_PCM.qry_work.Open;
    cxLabel1.Caption:= dm_PCM.qry_work.FieldByName('Benutzer').AsString;
    dm_PCM.qry_work.close;
    cxLabel4.Caption:= rs_PCM_Nein;
    cxLabel6.Caption:= rs_PCM_unbegrenzt;
  end;
end;

end.
 
