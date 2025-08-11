unit PCM.Benutzerverwaltung;

interface

uses
  {$Region uses}
  cxButtons,
  cxCalendar,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDBEdit,
  cxDBLookupComboBox,
  cxDBLookupEdit,
  cxDropDownEdit,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomPopupMenu,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridPopupMenu,
  cxGridTableView,
  cxGroupBox,
  cxImage,
  cxImageList,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxLookupEdit,
  cxMaskEdit,
  cxMemo,
  cxNavigator,
  cxPC,
  cxRadioGroup,
  cxScrollBox,
  cxStyles,
  cxTextEdit,
  Data.DB,
  dxBar,
  dxBarBuiltInMenu,
  dxDateRanges,
  dxGDIPlusClasses,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  dxLayoutcxEditAdapters,
  dxLayoutLookAndFeels,
  dxScrollbarAnnotations,
  dxSkinWXI,
  dxUIAClasses,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  inifiles,
  PCM.Functions,
  System.Classes,
  System.ImageList,
  System.SysUtils,
  system.UITypes,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Themes,
  Winapi.Messages,
  Winapi.Windows, dxCoreGraphics, cxButtonEdit;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_PCM_User = class(TForm)
    brdckCtrl_Benutzer: TdxBarDockControl;
    brdckCtrl_Rechte: TdxBarDockControl;
    brmgr_Benutzer: TdxBarManager;
    btn_BenutzerCancel: TdxBarLargeButton;
    btn_BenutzerChangePassword: TcxButton;
    btn_BenutzerDelete: TdxBarLargeButton;
    btn_BenutzerNew: TdxBarLargeButton;
    btn_BenutzerSave: TdxBarLargeButton;
    btn_RechtCancel: TdxBarLargeButton;
    btn_RechtDelete: TdxBarLargeButton;
    btn_RechtNew: TdxBarLargeButton;
    btn_RechtSave: TdxBarLargeButton;
    chkbx_BenutzerAutologin: TcxDBCheckBox;
    chkbx_BenutzerRestapi: TcxDBCheckBox;
    chkbx_RechtAll: TcxDBCheckBox;
    cxGridDBColumn2: TcxGridDBColumn;
    ds_Benutzer: TDataSource;
    ds_Rechte: TDataSource;
    ds_RechteDetail: TDataSource;
    dxLayoutItem15: TdxLayoutItem;
    edt_BenutzerName: TcxDBTextEdit;
    edt_BenutzerPassword: TcxDBTextEdit;
    edt_BenutzerSucheBenutzer: TcxButtonEdit;
    edt_BenutzerSurname: TcxDBTextEdit;
    edt_BenutzerUser: TcxDBTextEdit;
    edt_OptionRight: TcxDBTextEdit;
    edt_RechteSucheBezeichnung: TcxButtonEdit;
    grd_Benutzer: TcxGrid;
    grd_Rechte: TcxGrid;
    grdDBTblView_Benutzer: TcxGridDBTableView;
    grdDBTblView_BenutzerColumn1: TcxGridDBColumn;
    grdDBTblView_BenutzerColumn2: TcxGridDBColumn;
    grdDBTblView_Rechte: TcxGridDBTableView;
    grdDBTblView_RechteBezeichnung: TcxGridDBColumn;
    grdDBTblView_RechteID: TcxGridDBColumn;
    grdLvl_Benutzer: TcxGridLevel;
    grdLvl_Rechte: TcxGridLevel;
    lactrl_Main: TdxLayoutControl;
    laCxlaf_Benutzer: TdxLayoutCxLookAndFeel;
    lagrp_Benutzer: TdxLayoutGroup;
    lagrp_BenutzerHeader: TdxLayoutGroup;
    lagrp_BenutzerPassword: TdxLayoutGroup;
    lagrp_BenutzerRechteTab: TdxLayoutGroup;
    lagrp_BenutzerSuche: TdxLayoutGroup;
    lagrp_BenutzerSucheDetails: TdxLayoutGroup;
    lagrp_BenutzerSucheDetailsLeft: TdxLayoutGroup;
    lagrp_BenutzerSucheDetailsRight: TdxLayoutGroup;
    lagrp_Personal: TdxLayoutGroup;
    lagrp_Rechte: TdxLayoutGroup;
    lagrp_RechteAlleModule: TdxLayoutGroup;
    lagrp_RechteAllgemein: TdxLayoutGroup;
    lagrp_RechteAllgemeinDetail: TdxLayoutGroup;
    lagrp_RechteArchiv: TdxLayoutGroup;
    lagrp_RechteBackup: TdxLayoutGroup;
    lagrp_RechteHeader: TdxLayoutGroup;
    lagrp_RechteManager: TdxLayoutGroup;
    lagrp_RechteManagerLeft: TdxLayoutGroup;
    lagrp_RechteManagerRight: TdxLayoutGroup;
    lagrp_RechteMediacenter: TdxLayoutGroup;
    lagrp_RechteMediacenterLeft: TdxLayoutGroup;
    lagrp_RechteMediacenterRight: TdxLayoutGroup;
    lagrp_RechteMP3Manager: TdxLayoutGroup;
    lagrp_RechteNotenrechner: TdxLayoutGroup;
    lagrp_RechteServicemanager: TdxLayoutGroup;
    lagrp_RechteSuche: TdxLayoutGroup;
    lagrp_RechteVokabeltrainer: TdxLayoutGroup;
    lagrp_RechteVokabeltrainerLeft: TdxLayoutGroup;
    laitem_RechteAllgemeinBenutzer: TdxLayoutItem;
    laitem_RechteAllgemeinBezeichnung: TdxLayoutItem;
    laitem_RechteAllgemeinOption: TdxLayoutItem;
    laitm_BenutzerAutologin: TdxLayoutItem;
    laitm_BenutzerBar: TdxLayoutItem;
    laitm_BenutzerBenutzer: TdxLayoutItem;
    laitm_BenutzerGrid: TdxLayoutItem;
    laitm_BenutzerNachname: TdxLayoutItem;
    laitm_BenutzerPassword: TdxLayoutItem;
    laitm_BenutzerPasswordBtn: TdxLayoutItem;
    laitm_BenutzerRecht: TdxLayoutItem;
    laitm_BenutzerRestapi: TdxLayoutItem;
    laitm_BenutzerSuche: TdxLayoutItem;
    laitm_BenutzerVorname: TdxLayoutItem;
    laitm_RechteArchivArchiv: TdxLayoutItem;
    laitm_RechteBackupBackup: TdxLayoutItem;
    laitm_RechteBar: TdxLayoutItem;
    laitm_RechteGrid: TdxLayoutItem;
    laitm_RechteManagerAusgaben: TdxLayoutItem;
    laitm_RechteManagerEinnahmen: TdxLayoutItem;
    laitm_RechteManagerKalender: TdxLayoutItem;
    laitm_RechteManagerKontakte: TdxLayoutItem;
    laitm_RechteManagerMail: TdxLayoutItem;
    laitm_RechteManagerMonatsbericht: TdxLayoutItem;
    laitm_RechteManagerPassword: TdxLayoutItem;
    laitm_RechteManagerSerials: TdxLayoutItem;
    laitm_RechteManagerStundenplan: TdxLayoutItem;
    laitm_RechteManagerVerfuegung: TdxLayoutItem;
    laitm_RechteMediacenterAudio: TdxLayoutItem;
    laitm_RechteMediacenterFotos: TdxLayoutItem;
    laitm_RechteMediacenterVideo: TdxLayoutItem;
    laitm_RechteMediacenterWeb: TdxLayoutItem;
    laitm_RechteMP3ManagerMP3: TdxLayoutItem;
    laitm_RechteNotenrechnerNoten: TdxLayoutItem;
    laitm_RechteServicemanagerBackup: TdxLayoutItem;
    laitm_RechteServicemanagerShutdown: TdxLayoutItem;
    laitm_RechteSuche: TdxLayoutItem;
    laitm_RechteVokabeltrainerStatistik: TdxLayoutItem;
    laitm_RechteVokabeltrainerTest: TdxLayoutItem;
    laitm_RechteVokabeltrainerVokabeln: TdxLayoutItem;
    lalaflst_Benutzer: TdxLayoutLookAndFeelList;
    lucmbbx_BenutzerRights: TcxDBLookupComboBox;
    lucmbbx_RechteAllgemeinBenutzer: TcxDBLookupComboBox;
    lucmbbx_RechteAllgemeinOptionen: TcxDBLookupComboBox;
    lucmbbx_RechteArchivArchiv: TcxDBLookupComboBox;
    lucmbbx_RechteBackupBackup: TcxDBLookupComboBox;
    lucmbbx_RechteManagerAusgaben: TcxDBLookupComboBox;
    lucmbbx_RechteManagerEinnahmen: TcxDBLookupComboBox;
    lucmbbx_RechteManagerKalender: TcxDBLookupComboBox;
    lucmbbx_RechteManagerKontakt: TcxDBLookupComboBox;
    lucmbbx_RechteManagerMail: TcxDBLookupComboBox;
    lucmbbx_RechteManagerMonatsbericht: TcxDBLookupComboBox;
    lucmbbx_RechteManagerPassword: TcxDBLookupComboBox;
    lucmbbx_RechteManagerSerials: TcxDBLookupComboBox;
    lucmbbx_RechteManagerStundenplan: TcxDBLookupComboBox;
    lucmbbx_RechteManagerVerfuegung: TcxDBLookupComboBox;
    lucmbbx_RechteMediacenterAudio: TcxDBLookupComboBox;
    lucmbbx_RechteMediacenterFoto: TcxDBLookupComboBox;
    lucmbbx_RechteMediacenterVideo: TcxDBLookupComboBox;
    lucmbbx_RechteMediacenterWeb: TcxDBLookupComboBox;
    lucmbbx_RechteMP3MangerMP3: TcxDBLookupComboBox;
    lucmbbx_RechteNotenrechnerNoten: TcxDBLookupComboBox;
    lucmbbx_RechteServiceManagerBackup: TcxDBLookupComboBox;
    lucmbbx_RechteServiceManagerShutdown: TcxDBLookupComboBox;
    lucmbbx_RechteVokabeltrainerStatistik: TcxDBLookupComboBox;
    lucmbbx_RechteVokabeltrainerTest: TcxDBLookupComboBox;
    lucmbbx_RechteVokabeltrainerVokabeln: TcxDBLookupComboBox;
    qry_Benutzer: TFDQuery;
    qry_Rechte: TFDQuery;
    qry_RechteDetail: TFDQuery;
    tb_Benutzer: TdxBar;
    tb_Rechte: TdxBar;
    procedure btn_BenutzerCancelClick(Sender: TObject);
    procedure btn_BenutzerChangePasswordClick(Sender: TObject);
    procedure btn_BenutzerDeleteClick(Sender: TObject);
    procedure btn_BenutzerNewClick(Sender: TObject);
    procedure btn_BenutzerSaveClick(Sender: TObject);
    procedure btn_RechtCancelClick(Sender: TObject);
    procedure btn_RechtDeleteClick(Sender: TObject);
    procedure btn_RechtNewClick(Sender: TObject);
    procedure btn_RechtSaveClick(Sender: TObject);
    procedure edt_BenutzerPasswordEnter(Sender: TObject);
    procedure edt_BenutzerPasswordExit(Sender: TObject);
    procedure edt_RechteSucheBenutzerPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edt_RechteSucheBenutzerPropertiesChange(Sender: TObject);
    procedure edt_searchUserPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edt_searchUserPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lucmbbx_ChangeColorRight(Sender: TObject);
    procedure SetButtonsEnableVisible(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    SaveGridViewUser,SaveGridViewRight: TSavedGridView;
    procedure SetGridViews(Show:boolean);
    procedure SetButtons;
  public
    { Public-Deklarationen }
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_User: Tfrm_PCM_User;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Functions.ChangePW,
  PCM.Helper,
  PCM.Main,
  PCM.SQL,
  PCM.strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure Tfrm_PCM_User.SetGridViews(Show:boolean);
begin
  if Show then
  begin
    SaveGridViewUser := TSavedGridView.Create(GV_Benutzer,dm_PCM.iIDBenutzerPCM, grdDBTblView_Benutzer);
    SaveGridViewUser.LoadView;
    SaveGridViewRight := TSavedGridView.Create(GV_Recht,dm_PCM.iIDBenutzerPCM, grdDBTblView_Rechte);
    SaveGridViewRight.LoadView;
  end
  else begin
    SaveGridViewUser.SaveView(0);
    SaveGridViewUser.Free;
    SaveGridViewRight.SaveView(0);
    SaveGridViewRight.Free;
  end;
end;
procedure Tfrm_PCM_User.SetButtons;
begin
  // Benutzer
  if dm_PCM.iBenutzer >= 2 then
  begin
    btn_BenutzerSave.Enabled := qry_Benutzer.State in [dsInsert, dsEdit];
    btn_BenutzerCancel.Enabled := qry_Benutzer.State in [dsInsert, dsEdit];
    //Rechte
    btn_RechtSave.Enabled := qry_Rechte.State in [dsInsert, dsEdit];
    btn_RechtCancel.Enabled := qry_Rechte.State in [dsInsert, dsEdit];
  end;

  if dm_PCM.iBenutzer = 3 then
  begin
    // Benutzer
    btn_BenutzerDelete.Enabled := (not qry_Benutzer.Eof) and not (qry_Benutzer.State in [dsInsert, dsEdit]);
    //Rechte
    btn_RechtDelete.Enabled := (not qry_Rechte.Eof) and not (qry_Rechte.State in [dsInsert, dsEdit]);
  end;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_PCM_User.btn_BenutzerCancelClick(Sender: TObject);
begin
  qry_Benutzer.Cancel;
end;
procedure Tfrm_PCM_User.btn_BenutzerChangePasswordClick(Sender: TObject);
begin
  dm_PCM.iIDBenutzerPCM:= qry_Benutzer.FieldByName('ID').AsInteger;
  Application.CreateForm(TfrM_PCM_ChangePW,frM_PCM_ChangePW);
  frM_PCM_ChangePW.ShowModal;
end;
procedure Tfrm_PCM_User.btn_BenutzerDeleteClick(Sender: TObject);
begin
  if qry_Benutzer.FieldByName('ID').AsInteger > 1 then
  begin
    qry_Benutzer.Delete;
  end
  else begin
    SetMessageDialog(2,rs_Function_Benutzer_BenutzerLoeschen,[rs_general_BTN_Ok,'',''],[mrOk,mrNone,mrNone]);
  end;
end;
procedure Tfrm_PCM_User.btn_BenutzerNewClick(Sender: TObject);
begin
  if qry_Benutzer.State in [dsInsert, dsedit] then
    qry_Benutzer.Post;
  qry_Benutzer.Append;
  qry_Benutzer.Insert;
  if dm_PCM.iBenutzer = 2 then
    qry_Benutzer.FieldByName('ID_Rechte').AsInteger:= 2

  else
    qry_Benutzer.FieldByName('ID_Rechte').AsInteger:= 1;
  edt_BenutzerUser.SetFocus;
end;
procedure Tfrm_PCM_User.btn_BenutzerSaveClick(Sender: TObject);
begin
  if qry_Benutzer.State in [dsInsert, dsEdit] then
  begin
    edt_BenutzerUser.PostEditValue;
    edt_BenutzerPassword.PostEditValue;
    edt_BenutzerName.PostEditValue;
    edt_BenutzerSurName.PostEditValue;
    qry_Benutzer.Post;
  end;
end;
procedure Tfrm_PCM_User.btn_RechtCancelClick(Sender: TObject);
begin
  qry_Rechte.Cancel;
end;
procedure Tfrm_PCM_User.btn_RechtDeleteClick(Sender: TObject);
begin
  if qry_Rechte.FieldByName('ID').AsInteger > 4 then
  begin
    qry_Rechte.Delete;
  end
  else begin
    SetMessageDialog(2,rs_Function_Benutzer_RechteLoeschen,[rs_general_BTN_Ok,'',''],[mrOk,mrNone,mrNone]);
  end;
end;
procedure Tfrm_PCM_User.btn_RechtNewClick(Sender: TObject);
begin
  if qry_Rechte.State in [dsInsert, dsedit] then
    qry_Rechte.Post;
  qry_Rechte.Append;
  qry_Rechte.Insert;
  qry_Rechte.FieldByName('Benutzer').AsInteger:= 3;
  qry_Rechte.FieldByName('Konfiguration').AsInteger:= 3;
  qry_Rechte.FieldByName('Alle_Benutzer').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Kontakte').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Kalender').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Stundenplan').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Email').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Password').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Serials').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Monatsuebersicht').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Verfuegung').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Einnahmen').AsInteger:= 3;
  qry_Rechte.FieldByName('ma_Ausgaben').AsInteger:= 3;
  qry_Rechte.FieldByName('mc_Audioplayer').AsInteger:= 3;
  qry_Rechte.FieldByName('mc_Webradio').AsInteger:= 3;
  qry_Rechte.FieldByName('mc_Videoplayer').AsInteger:= 3;
  qry_Rechte.FieldByName('mc_Fotos').AsInteger:= 3;
  qry_Rechte.FieldByName('mm_MP3').AsInteger:= 3;
  qry_Rechte.FieldByName('nr_Noten').AsInteger:= 3;
  qry_Rechte.FieldByName('sm_Backup').AsInteger:= 3;
  qry_Rechte.FieldByName('sm_Shutdown').AsInteger:= 3;
  qry_Rechte.FieldByName('vk_Vokabeluebersicht').AsInteger:= 3;
  qry_Rechte.FieldByName('Vk_Vokabeltest').AsInteger:= 3;
  qry_Rechte.FieldByName('vk_Lernstatistik').AsInteger:= 3;
  edt_OptionRight.SetFocus;
end;
procedure Tfrm_PCM_User.btn_RechtSaveClick(Sender: TObject);
begin
  if (qry_Rechte.FieldByName('ID').AsInteger > 4) or (qry_Rechte.FieldByName('ID').AsInteger < 0) then
  begin
    if qry_Rechte.State in [dsInsert, dsEdit] then
    begin
      edt_OptionRight.PostEditValue;
      qry_Rechte.Post;
    end;
  end
  else begin
    qry_Rechte.Cancel;
    SetMessageDialog(2,rs_Function_Benutzer_RechteBearbeiten,[rs_general_BTN_Ok,'',''],[mrOk,mrNone,mrNone]);
  end;
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Editfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Editfunktionen}
procedure Tfrm_PCM_User.edt_BenutzerPasswordEnter(Sender: TObject);
begin
  if Length(edt_BenutzerPassword.Text) > 0 then
    edt_BenutzerPassword.Properties.ReadOnly:= true
  else
    edt_BenutzerPassword.Properties.ReadOnly:= false;
end;
procedure Tfrm_PCM_User.edt_BenutzerPasswordExit(Sender: TObject);
var
  astr_password: string;
begin
  if (edt_BenutzerPassword.text <> '') and (Length(edt_BenutzerPassword.text) < 32) then
  begin
    astr_password:= GetMD5Hash(edt_BenutzerPassword.text);
    edt_BenutzerPassword.text:= astr_password;
    btn_BenutzerSave.Click;
  end;
end;
procedure Tfrm_PCM_User.edt_RechteSucheBenutzerPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  edt_RechteSucheBezeichnung.Text:= '';
  qry_Rechte.Filtered:= false;
end;
procedure Tfrm_PCM_User.edt_RechteSucheBenutzerPropertiesChange(Sender: TObject);
begin
  if Length(edt_RechteSucheBezeichnung.text) = 0 then
  begin
    qry_Benutzer.Filtered:= false;
  end
  else begin
    qry_Benutzer.Filter:= 'lower(Bezeichnung) like lower(' + QuotedStr('%' + edt_RechteSucheBezeichnung.text + '%' ) + ')';
    qry_Benutzer.Filtered:= true;
  end;
end;
procedure Tfrm_PCM_User.edt_searchUserPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  edt_BenutzerSucheBenutzer.Text:= '';
  qry_Benutzer.Filtered:= false;
end;
procedure Tfrm_PCM_User.edt_searchUserPropertiesChange(Sender: TObject);
begin
  if Length(edt_BenutzerSucheBenutzer.text) = 0 then
  begin
    qry_Benutzer.Filtered:= false;
  end
  else begin
    qry_Benutzer.Filter:= 'lower(Benutzer) like lower(' + QuotedStr('%' + edt_BenutzerSucheBenutzer.text + '%' ) + ')';
    qry_Benutzer.Filtered:= true;
  end;
end;
{$EndRegion Editfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Sonstigefunktionen                                                         //
////////////////////////////////////////////////////////////////////////////////
{$Region Sonstigefunktionen}
procedure Tfrm_PCM_User.lucmbbx_ChangeColorRight(Sender: TObject);
var
  ARight: TcxDBLookupComboBox;
begin
  ARight:= Sender as TcxDBLookupComboBox;
  case ARight.ItemIndex of
  0:
    begin
      ARight.Style.Color := ColorRed;
    end;
  1:
    begin
      ARight.Style.Color := ColorOrange;
    end;
  2:
    begin
      ARight.Style.Color := ColorYellow;
    end;
  3:
    begin
      ARight.Style.Color := ColorGreen;
    end;
  end;
end;
procedure Tfrm_PCM_User.SetButtonsEnableVisible(DataSet: TDataSet);
begin
  SetButtons;
end;
{$EndRegion Sonstigefunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_User.FormDestroy(Sender: TObject);
begin
  SetGridViews(false);
end;
procedure Tfrm_PCM_User.FormShow(Sender: TObject);
  procedure InitializeRights;
  begin
    // Benutzerverwaltung / Lesen
    if dm_PCM.iBenutzer = 1 then
    begin
      //// Benutzer
      // Toolbar
      btn_BenutzerNew.Enabled:= false;
      btn_BenutzerSave.Enabled:= false;
      btn_BenutzerCancel.Enabled:= false;
      btn_BenutzerDelete.Enabled:= false;
      // Editfelder
      edt_BenutzerUser.Enabled:= false;
      edt_BenutzerPassword.Enabled:= false;
      edt_BenutzerName.Enabled:= false;
      edt_BenutzerSurName.Enabled:= false;
      lucmbbx_BenutzerRights.Enabled:= false;
      // Button
      btn_BenutzerChangePassword.Enabled:= false;
      //// Rechte
      // Toolbar
      btn_RechtNew.Enabled:= false;
      btn_RechtSave.Enabled:= false;
      btn_RechtCancel.Enabled:= false;
      btn_RechtDelete.Enabled:= false;
      // Editfelder
      edt_OptionRight.Enabled:= false;
      lagrp_RechteAlleModule.Enabled:= false;
    end;
    // Benutzerverwaltung / Ändern
    if dm_PCM.iBenutzer = 2 then
    begin
      //// Benutzer
      // Toolbar
      btn_BenutzerNew.Enabled:= true;
      btn_BenutzerSave.Enabled:= true;
      btn_BenutzerCancel.Enabled:= true;
      btn_BenutzerDelete.Enabled:= false;
      // Editfelder
      edt_BenutzerUser.Enabled:= true;
      edt_BenutzerPassword.Enabled:= true;
      edt_BenutzerName.Enabled:= true;
      edt_BenutzerSurName.Enabled:= true;
      lucmbbx_BenutzerRights.Enabled:= true;
      // Button
      btn_BenutzerChangePassword.Enabled:= true;
      //// Rechte
      // Toolbar
      btn_RechtNew.Enabled:= true;
      btn_RechtSave.Enabled:= true;
      btn_RechtCancel.Enabled:= true;
      btn_RechtDelete.Enabled:= false;
      // Editfelder
      edt_OptionRight.Enabled:= true;
      lagrp_RechteAlleModule.Enabled:= true;
    end;

     // Benutzerverwaltung / Vollzugriff
    if dm_PCM.iBenutzer = 3 then
    begin
      //// Benutzer
      // Toolbar
      btn_BenutzerNew.Enabled:= true;
      btn_BenutzerSave.Enabled:= true;
      btn_BenutzerCancel.Enabled:= true;
      btn_BenutzerDelete.Enabled:= true;
      // Editfelder
      edt_BenutzerUser.Enabled:= true;
      edt_BenutzerPassword.Enabled:= true;
      edt_BenutzerName.Enabled:= true;
      edt_BenutzerSurName.Enabled:= true;
      lucmbbx_BenutzerRights.Enabled:= true;
      // Button
      btn_BenutzerChangePassword.Enabled:= true;
      //// Rechte
      // Toolbar
      btn_RechtNew.Enabled:= true;
      btn_RechtSave.Enabled:= true;
      btn_RechtCancel.Enabled:= true;
      btn_RechtDelete.Enabled:= true;
      // Editfelder
      edt_OptionRight.Enabled:= true;
      lagrp_RechteAlleModule.Enabled:= true;
    end;
  end;
  procedure OpenData;
  begin
    qry_Benutzer.SQL.Text:= ASSQL_GetUSer[dm_PCM.iDBType];
    qry_Benutzer.Open;
    qry_Rechte.SQL.Text:= ASSQL_GetRights[dm_PCM.iDBType];
    qry_Rechte.Open;
    qry_RechteDetail.SQL.Text:= ASSQL_GetRightsDetail[dm_PCM.iDBType];
    qry_RechteDetail.Open;
  end;
begin
  btn_BenutzerNew.Caption:= rs_Function_Benutzer_New;
  btn_BenutzerSave.Caption:= rs_Function_Benutzer_Save;
  btn_BenutzerCancel.Caption:= rs_general_BTN_Cancel;
  btn_BenutzerDelete.Caption:= rs_Function_Benutzer_Delete;
  btn_BenutzerChangePassword.Caption:= rs_Function_Benutzer_ChangePassword;

  btn_RechtNew.Caption:= rs_Function_Benutzer_RechtNew;
  btn_RechtSave.Caption:= rs_Function_Benutzer_RechtSave;
  btn_RechtCancel.Caption:= rs_general_BTN_Cancel;
  btn_RechtDelete.Caption:= rs_Function_Benutzer_RechtDelete;
  lagrp_Benutzer.CaptionOptions.Text:= rs_Function_Benutzer_Benutzer;
  lagrp_BenutzerHeader.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_Benutzerdetails + '[/B]';
  lagrp_BenutzerSuche.CaptionOptions.Text:= rs_general_Suche;
  laitm_BenutzerSuche.CaptionOptions.Text:= rs_Function_Benutzer_Benutzer1;
  laitm_BenutzerBenutzer.CaptionOptions.Text:= rs_Function_Benutzer_Benutzer1;
  laitm_BenutzerVorname.CaptionOptions.Text:= rs_Function_Benutzer_Vorname;
  laitm_BenutzerNachname.CaptionOptions.Text:= rs_Function_Benutzer_Nachname;
  chkbx_BenutzerRestapi.Caption:= rs_Function_Benutzer_Restapi;
  laitm_BenutzerPassword.CaptionOptions.Text:= rs_Function_Benutzer_Password;
  laitm_BenutzerRecht.CaptionOptions.Text:= rs_Function_Benutzer_Rechte1;
  chkbx_BenutzerAutologin.Caption:= rs_Function_Benutzer_Autologin;
  cxGridDBColumn2.Caption:= rs_Function_Benutzer_Benutzer;
  grdDBTblView_BenutzerColumn1.Caption:= rs_Function_Benutzer_Vorname1;
  grdDBTblView_BenutzerColumn2.Caption:= rs_Function_Benutzer_Nachname1;
  lagrp_Rechte.CaptionOptions.Text:= rs_Function_Benutzer_Rechte;
  chkbx_RechtAll.Caption:= rs_Function_Benutzer_RechtAlleBenutzer;
  lagrp_RechteAllgemein.CaptionOptions.Text:=	'[B]' + rs_Function_Benutzer_RechtAllgemein + '[/B]';
  lagrp_RechteArchiv.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_Archiv + '[/B]';
  lagrp_RechteBackup.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_Backup + '[/B]';
  lagrp_RechteHeader.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtDetails + '[/B]';
  lagrp_RechteManager.CaptionOptions.Text:=	'[B]' + rs_Function_Benutzer_RechtPCM_Manager + '[/B]';
  lagrp_RechteMediacenter.CaptionOptions.Text:=	'[B]' + rs_Function_Benutzer_RechtPCM_Mediacenter + '[/B]';
  lagrp_RechteMP3Manager.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_MP3Manager + '[/B]';
  lagrp_RechteNotenrechner.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_Notenrechner + '[/B]';
  lagrp_RechteServicemanager.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_Servicemanager + '[/B]';
  lagrp_RechteSuche.CaptionOptions.Text:=	rs_general_Suche;
  lagrp_RechteVokabeltrainer.CaptionOptions.Text:= '[B]' + rs_Function_Benutzer_RechtPCM_Vokabeltrainer + '[/B]';
  laitem_RechteAllgemeinBenutzer.CaptionOptions.Text:= rs_Function_Benutzer_RechtBenutzerverwaltung;
  laitem_RechteAllgemeinBezeichnung.CaptionOptions.Text:=	rs_general_Bezeichnung;
  laitem_RechteAllgemeinOption.CaptionOptions.Text:= rs_Function_Benutzer_RechtOptionen;
  laitm_RechteArchivArchiv.CaptionOptions.Text:= rs_Function_Benutzer_RechtArchiv;
  laitm_RechteBackupBackup.CaptionOptions.Text:= rs_Function_Benutzer_RechtBackup;
  laitm_RechteManagerAusgaben.CaptionOptions.Text:=	rs_Function_Benutzer_RechtAusgaben;
  laitm_RechteManagerEinnahmen.CaptionOptions.Text:= rs_Function_Benutzer_RechtEinnahmen;
  laitm_RechteManagerKalender.CaptionOptions.Text:=	rs_Function_Benutzer_RechtKalender;
  laitm_RechteManagerKontakte.CaptionOptions.Text:=	rs_Function_Benutzer_RechtKontakte;
  laitm_RechteManagerMail.CaptionOptions.Text:=	rs_Function_Benutzer_RechtEMail;
  laitm_RechteManagerMonatsbericht.CaptionOptions.Text:= rs_Function_Benutzer_RechtMonatsübersicht;
  laitm_RechteManagerPassword.CaptionOptions.Text:=	rs_Function_Benutzer_RechtPasswort;
  laitm_RechteManagerSerials.CaptionOptions.Text:= rs_Function_Benutzer_RechtSerials;
  laitm_RechteManagerStundenplan.CaptionOptions.Text:= rs_Function_Benutzer_RechtStundenplan;
  laitm_RechteManagerVerfuegung.CaptionOptions.Text:=	rs_Function_Benutzer_RechtVerfuegung;
  laitm_RechteMediacenterAudio.CaptionOptions.Text:= rs_Function_Benutzer_RechtMp3Player;
  laitm_RechteMediacenterFotos.CaptionOptions.Text:= rs_Function_Benutzer_RechtFotos;
  laitm_RechteMediacenterVideo.CaptionOptions.Text:= rs_Function_Benutzer_RechtVideoplayer;
  laitm_RechteMediacenterWeb.CaptionOptions.Text:= rs_Function_Benutzer_RechtWebradio;
  laitm_RechteMP3ManagerMP3.CaptionOptions.Text:=	rs_Function_Benutzer_RechtMP3Tags;
  laitm_RechteNotenrechnerNoten.CaptionOptions.Text:=	rs_Function_Benutzer_RechtNoten;
  laitm_RechteServicemanagerBackup.CaptionOptions.Text:= rs_Function_Benutzer_RechtBackup;
  laitm_RechteServicemanagerShutdown.CaptionOptions.Text:= rs_Function_Benutzer_RechtShutdown;
  laitm_RechteSuche.CaptionOptions.Text:=	rs_general_Bezeichnung;
  laitm_RechteVokabeltrainerStatistik.CaptionOptions.Text:=	rs_Function_Benutzer_RechtStatistik;
  laitm_RechteVokabeltrainerTest.CaptionOptions.Text:= rs_Function_Benutzer_RechtTest;
  laitm_RechteVokabeltrainerVokabeln.CaptionOptions.Text:= rs_Function_Benutzer_RechtVokabeln;
  grdDBTblView_RechteBezeichnung.Caption:= rs_general_Bezeichnung;
  OPendata;
  InitializeRights;
  SetGridViews(true);
end;
{$EndRegion Formfunktionen}
end.

