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
    btn_Lizenz: TcxButton;
    lactrl_AppinfoGroup_Root: TdxLayoutGroup;
    lactrl_Appinfo: TdxLayoutControl;
    lagrp_AppinfoDetailsImg: TdxLayoutGroup;
    lagrp_PCManagerAppInfo_DatenbankDetail: TdxLayoutGroup;
    laitm_AppinfoDetailsImg: TdxLayoutItem;
    laitm_PCManagerAppInfo_AppName: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_LizenzForlbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Demolbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_DatenbankDetaillbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_ServerLabel: TdxLayoutLabeledItem;
    lagrp_AppinfoBtn: TdxLayoutItem;
    lagrp_AppinfoInfo: TdxLayoutGroup;
    lagrp_PCManagerAppInfo_AppName: TdxLayoutGroup;
    lagrp_AppinfoDetailsWithoutImg: TdxLayoutGroup;
    lagrp_AppinfoDetails: TdxLayoutGroup;
    laitm_PCManagerAppInfo_Version: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_Revision: TdxLayoutGroup;
    laitm_PCManagerAppInfo_Revisionlbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Revision: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_AppCopyRightLbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_AppCopyRight: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_AppCopyRight: TdxLayoutGroup;
    lagrp_PCManagerAppInfo_Version: TdxLayoutGroup;
    laitm_PCManagerAppInfo_VersionLbl: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_Lizenz: TdxLayoutGroup;
    laitm_PCManagerAppInfo_Lizenz: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_LizenzFor: TdxLayoutGroup;
    laitm_PCManagerAppInfo_LizenzFor: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_Demo: TdxLayoutGroup;
    laitm_PCManagerAppInfo_Demo: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_Valid: TdxLayoutGroup;
    laitm_PCManagerAppInfo_Validlbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Valid: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Datenbank: TdxLayoutLabeledItem;
    lagrp_PCManagerAppInfo_Datenbank: TdxLayoutGroup;
    lagrp_PCManagerAppInfo_Datenversion: TdxLayoutGroup;
    lagrp_PCManagerAppInfo_Server: TdxLayoutGroup;
    laitm_PCManagerAppInfo_DatenbankDetail: TdxLayoutLabeledItem;
    laitml_PCManagerAppInfo_Datenversionlbl: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Datenversion: TdxLayoutLabeledItem;
    laitm_PCManagerAppInfo_Server: TdxLayoutLabeledItem;
    lalaflst_Appinfo: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    lagrp_Appinfo: TdxLayoutGroup;
    procedure FormShow(Sender: TObject);
    procedure btn_LizenzClick(Sender: TObject);
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
  PCM.Main,
  PCM.Strings,
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
procedure Tfrm_PCM_InfoApp.btn_LizenzClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_PCM_lizenz,frm_PCM_lizenz);
  frm_PCM_lizenz.btn_Save.enabled:= false;
  dm_PCM.bAppTerm:= false;
  frm_PCM_lizenz.Showmodal;
  frm_PCM_lizenz.Free;
  CheckLizenzNew;
  laitm_PCManagerAppInfo_LizenzFor.Caption:= dm_PCM.Firma;
  if not dm_PCM.bDemo then
  begin
    laitm_PCManagerAppInfo_Demo.Caption:= rs_PCM_Nein;
    laitm_PCManagerAppInfo_Valid.Caption:= rs_PCM_unbegrenzt;
    frm_PCM_main.Caption:=PCM_Programmname;
  end
  else
  begin
    laitm_PCManagerAppInfo_Demo.Caption:= rs_PCM_Ja;
    laitm_PCManagerAppInfo_Valid.Caption:= DateToStr(dm_PCM.dtGueltig);
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
        laitm_PCManagerAppInfo_DatenbankDetail.Caption:= rs_Function_AppInfo_64Bit + dm_PCM.qry_work.FieldByName('Version').AsString
      else
        laitm_PCManagerAppInfo_DatenbankDetail.Caption:= rs_Function_AppInfo_32Bit + dm_PCM.qry_work.FieldByName('Version').AsString;
      dm_PCM.qry_work.close;

      dm_PCM.qry_work.SQL.Text:= 'SELECT CONCAT(Major,''.'',Minor) as Version from version_db';
      dm_PCM.qry_work.Open;
      laitm_PCManagerAppInfo_Datenversion.Caption:= rs_PCM_Version + dm_PCM.qry_work.FieldByName('Version').AsString;
      dm_PCM.qry_work.close;
    end;
  end;
  btn_Lizenz.Caption:= rs_Function_APPInfo_LizenzEintragen;
  laitm_PCManagerAppInfo_Lizenz.CaptionOptions.Text:= '[B]' + rs_Function_Appinfo_Lizenz  + '[/B]';
  laitm_PCManagerAppInfo_Datenbank.CaptionOptions.Text:= '[B]' + rs_Function_Appinfo_Database  + '[/B]';
  laitm_PCManagerAppInfo_DatenbankDetaillbl.CaptionOptions.Text:= rs_Function_Appinfo_Database;
  laitm_PCManagerAppInfo_LizenzForlbl.CaptionOptions.Text:= rs_Function_AppInfo_Lizenzfor;
  laitm_PCManagerAppInfo_Validlbl.CaptionOptions.text:= rs_Function_AppInfo_Valid;
  laitml_PCManagerAppInfo_Datenversionlbl.CaptionOptions.text:= rs_Function_AppInfo_Datenversion;
  laitm_PCManagerAppInfo_AppCopyRight.CaptionOptions.text:= rs_Function_APPInfo_JensHenske;
  laitm_PCManagerAppInfo_VersionLbl.CaptionOptions.text:= rs_Function_APPInfo_Version;
  laitm_PCManagerAppInfo_Revisionlbl.CaptionOptions.text:= rs_Function_APPInfo_Revision;
  laitm_PCManagerAppInfo_AppCopyRightLbl.CaptionOptions.Text:= rs_Function_APPInfo_CopyRight;
  laitm_PCManagerAppInfo_Demolbl.CaptionOptions.Text:= rs_Function_APPInfo_Demo;
  laitm_PCManagerAppInfo_ServerLabel.CaptionOptions.Text:= rs_Function_APPInfo_Server;
  laitm_PCManagerAppInfo_AppName.CaptionOptions.Text:= '[B]' + PCM_Programmname + '[/B]';
  laitm_PCManagerAppInfo_Version.CaptionOptions.Text:= GetAppVersion;
  laitm_PCManagerAppInfo_Revision.CaptionOptions.Text:= GetFileDate;
  laitm_PCManagerAppInfo_Server.CaptionOptions.Text:= dm_PCM.sServer;
  if (PCM_Logname <> 'PCMBackup') and
     (PCM_Logname <> 'PCMBenutzerverwaltung') and
     (PCM_Logname <> 'PCMDevManager') and
     (PCM_Logname <> 'PCMLizenzgenerator') and
     (PCM_Logname <> 'PCMUpdate') then
  begin
    laitm_PCManagerAppInfo_LizenzFor.CaptionOptions.Text:= dm_PCM.Firma;
    if not dm_PCM.bDemo then
    begin
      laitm_PCManagerAppInfo_Demo.CaptionOptions.Text:= rs_PCM_Nein;
      laitm_PCManagerAppInfo_Valid.CaptionOptions.Text:= rs_PCM_unbegrenzt;
    end
    else
    begin
      laitm_PCManagerAppInfo_Demo.CaptionOptions.Text:= rs_PCM_Ja;
      laitm_PCManagerAppInfo_Valid.CaptionOptions.Text:= DateToStr(dm_PCM.dtGueltig);
    end;
  end
  else begin
    lagrp_AppinfoBtn.Visible:= false;
    dm_PCM.qry_work.SQL.Text:= 'Select Benutzer From manager_lizenz';
    dm_PCM.qry_work.Open;
    laitm_PCManagerAppInfo_Server.CaptionOptions.Text:= dm_PCM.qry_work.FieldByName('Benutzer').AsString;
    dm_PCM.qry_work.close;
    laitm_PCManagerAppInfo_Demo.CaptionOptions.Text:= rs_PCM_Nein;
    laitm_PCManagerAppInfo_Valid.CaptionOptions.Text:= rs_PCM_unbegrenzt;
  end;
end;
{$EndRegion Formfunktionen}
end.

