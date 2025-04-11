unit PCM.Functions.AppInfo;

interface

uses
  {$Region uses}
  WinApi.Windows, SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, System.ImageList, Vcl.ImgList, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, cxGroupBox,
  cxImage,Vcl.Styles,vcl.themes,inifiles, Vcl.Imaging.pngimage,
  dxBarBuiltInMenu, cxPC, cxImageList, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, dxLayoutContainer, cxClasses, dxLayoutControl,
  dxLayoutLookAndFeels, dxUIAClasses;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_PCM_InfoApp = class(TForm)
    img_PCManagerAppInfo_Image: TcxImage;
    cxButton1: TcxButton;
    cxImageList1: TcxImageList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lbl_PCManagerAppInfo_AppName: TdxLayoutLabeledItem;
    cxLabel7: TdxLayoutLabeledItem;
    cxLabel5: TdxLayoutLabeledItem;
    cxLabel9: TdxLayoutLabeledItem;
    lbl_PCManagerAppInfo_ServerLabel: TdxLayoutLabeledItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    lbl_PCManagerAppInfo_Version: TdxLayoutLabeledItem;
    dxLayoutGroup13: TdxLayoutGroup;
    dxLayoutLabeledItem1: TdxLayoutLabeledItem;
    lbl_PCManagerAppInfo_Revision: TdxLayoutLabeledItem;
    dxLayoutLabeledItem2: TdxLayoutLabeledItem;
    lbl_PCManagerAppInfo_AppCopyRight: TdxLayoutLabeledItem;
    dxLayoutGroup14: TdxLayoutGroup;
    dxLayoutGroup15: TdxLayoutGroup;
    dxLayoutLabeledItem4: TdxLayoutLabeledItem;
    dxLayoutGroup16: TdxLayoutGroup;
    dxLayoutLabeledItem5: TdxLayoutLabeledItem;
    dxLayoutGroup17: TdxLayoutGroup;
    cxLabel1: TdxLayoutLabeledItem;
    dxLayoutGroup18: TdxLayoutGroup;
    cxLabel4: TdxLayoutLabeledItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutLabeledItem3: TdxLayoutLabeledItem;
    cxLabel6: TdxLayoutLabeledItem;
    dxLayoutLabeledItem6: TdxLayoutLabeledItem;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    lblDBVersion: TdxLayoutLabeledItem;
    dxLayoutLabeledItem8: TdxLayoutLabeledItem;
    lblDataVersion: TdxLayoutLabeledItem;
    lbl_PCManagerAppInfo_Server: TdxLayoutLabeledItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutGroup9: TdxLayoutGroup;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function GetFileDate :String;
    function GetAppVersion: string;
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_InfoApp: Tfrm_PCM_InfoApp;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Functions.Lizenz,
  PCM.Main,PCM.Strings,
  PCM.Helper;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
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
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
// Formular anzeigen
procedure Tfrm_PCM_InfoApp.cxButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
  frm_PCM_lizenz.btn_SaveLicence.Enabled:= false;
  dm_PCM.bAppTerm:= false;
  frm_PCM_lizenz.Showmodal;
  frm_PCM_lizenz.Free;

  CheckLizenzNew;
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
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
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


  lbl_PCManagerAppInfo_AppName.CaptionOptions.Text:= '[B]' + PCM_Programmname + '[/B]';
  lbl_PCManagerAppInfo_Version.CaptionOptions.Text:= GetAppVersion;
  lbl_PCManagerAppInfo_Revision.CaptionOptions.Text:= GetFileDate;
  lbl_PCManagerAppInfo_Server.CaptionOptions.Text:= dm_PCM.sServer;
  if (PCM_Logname <> 'PCMLizenzgenerator') and (PCM_Logname <> 'PCMBackup') then
  begin
    cxLabel1.CaptionOptions.Text:= dm_PCM.Firma;
    if not dm_PCM.bDemo then
    begin
      cxLabel4.CaptionOptions.Text:= rs_PCM_Nein;
      cxLabel6.CaptionOptions.Text:= rs_PCM_unbegrenzt;
    end
    else
    begin
      cxLabel4.CaptionOptions.Text:= rs_PCM_Ja;
      cxLabel6.CaptionOptions.Text:= DateToStr(dm_PCM.dtGueltig);
    end;
  end
  else begin
    cxButton1.Visible:= false;
    dm_PCM.qry_work.SQL.Text:= 'Select Benutzer From manager_lizenz';
    dm_PCM.qry_work.Open;
    cxLabel1.CaptionOptions.Text:= dm_PCM.qry_work.FieldByName('Benutzer').AsString;
    dm_PCM.qry_work.close;
    cxLabel4.CaptionOptions.Text:= rs_PCM_Nein;
    cxLabel6.CaptionOptions.Text:= rs_PCM_unbegrenzt;
  end;
end;
{$EndRegion Formfunktionen}
end.
 
