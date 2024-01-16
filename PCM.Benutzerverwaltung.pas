unit PCM.Benutzerverwaltung;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, dxBar, cxClasses, System.ImageList,
  Vcl.ImgList, cxImageList, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxCheckBox, cxTextEdit, cxLabel,
  cxButtons, dxGDIPlusClasses, cxImage, cxGroupBox, cxPC,inifiles, Vcl.Themes,system.UITypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,PCM.Functions, dxSkinWXI,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxScrollBox;

type
  Tfrm_User = class(TForm)
    pnl_right: TcxGroupBox;
    AA_pc_User: TcxPageControl;
    ts_User: TcxTabSheet;
    pnl_User: TcxGroupBox;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGroupBox10: TcxGroupBox;
    btn_OptionChangePassword: TcxButton;
    edt_OptionName: TcxDBTextEdit;
    edt_OptionPassword: TcxDBTextEdit;
    edt_OptionUser: TcxDBTextEdit;
    Label14: TcxLabel;
    Label15: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    Label9: TcxLabel;
    ts_rights: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1Bezeichnung: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    grpbx_1Allgemein: TcxGroupBox;
    qBenutzer: TFDQuery;
    qRechte: TFDQuery;
    qRechte_Detail: TFDQuery;
    dsBenutzer: TDataSource;
    dsRechte: TDataSource;
    dsRechte_Detail: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    btn_OptionNewUser: TdxBarLargeButton;
    btn_OptionSaveUser: TdxBarLargeButton;
    btn_OptionCancelUser: TdxBarLargeButton;
    btn_OptionDeleteUser: TdxBarLargeButton;
    btn_OptionNewRight: TdxBarLargeButton;
    btn_OptionDeleteRight: TdxBarLargeButton;
    btn_OptionCancelRight: TdxBarLargeButton;
    btn_OptionSaveRight: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxGridPopupMenu2: TcxGridPopupMenu;
    grpbx_2PCMManager: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    Label2: TcxLabel;
    Label3: TcxLabel;
    lucbx_Backup: TcxDBLookupComboBox;
    lucbx_Option: TcxDBLookupComboBox;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxDBLookupComboBox6: TcxDBLookupComboBox;
    cxLabel7: TcxLabel;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    cxLabel8: TcxLabel;
    cxDBLookupComboBox8: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    cxDBLookupComboBox9: TcxDBLookupComboBox;
    cxLabel10: TcxLabel;
    cxDBLookupComboBox10: TcxDBLookupComboBox;
    grpbx_3Mediacenter: TcxGroupBox;
    cxLabel11: TcxLabel;
    cxDBLookupComboBox11: TcxDBLookupComboBox;
    cxLabel12: TcxLabel;
    cxDBLookupComboBox12: TcxDBLookupComboBox;
    cxDBLookupComboBox13: TcxDBLookupComboBox;
    cxDBLookupComboBox14: TcxDBLookupComboBox;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    grpbx_4MP3Manager: TcxGroupBox;
    cxLabel15: TcxLabel;
    cxDBLookupComboBox15: TcxDBLookupComboBox;
    grpbx_5Notenrechner: TcxGroupBox;
    cxLabel16: TcxLabel;
    cxDBLookupComboBox16: TcxDBLookupComboBox;
    grpbx_5Service: TcxGroupBox;
    cxLabel17: TcxLabel;
    cxDBLookupComboBox17: TcxDBLookupComboBox;
    grpbx_6Vokabeltrainer: TcxGroupBox;
    cxLabel18: TcxLabel;
    cxDBLookupComboBox18: TcxDBLookupComboBox;
    cxDBLookupComboBox20: TcxDBLookupComboBox;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxDBLookupComboBox21: TcxDBLookupComboBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    pnl_UserLeft: TcxGroupBox;
    pnl_UserRight: TcxGroupBox;
    lucbx_OptionRights: TcxDBLookupComboBox;
    edt_OptionSurName: TcxDBTextEdit;
    pnl_RightLEft: TcxGroupBox;
    pnl_RightRight: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    Label12: TcxLabel;
    edt_OptionRight: TcxDBTextEdit;
    Label1: TLabel;
    pnl_mrLeft: TcxGroupBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxScrollBox1: TcxScrollBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    pnl_mrRight: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel23: TcxLabel;
    cxDBLookupComboBox22: TcxDBLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel24: TcxLabel;
    cxDBLookupComboBox23: TcxDBLookupComboBox;
    pnl_mcLeft: TcxGroupBox;
    pnl_mcRight: TcxGroupBox;
    pnl_scLeft: TcxGroupBox;
    pnl_scRight: TcxGroupBox;
    cxLabel19: TcxLabel;
    cxDBLookupComboBox19: TcxDBLookupComboBox;
    pnl_VTLeft: TcxGroupBox;
    pnl_vtRight: TcxGroupBox;
    procedure btn_OptionChangePasswordClick(Sender: TObject);
    procedure edt_OptionPasswordExit(Sender: TObject);
    procedure btn_OptionNewRightClick(Sender: TObject);
    procedure btn_OptionSaveRightClick(Sender: TObject);
    procedure btn_OptionDeleteRightClick(Sender: TObject);
    procedure btn_OptionNewUserClick(Sender: TObject);
    procedure btn_OptionSaveUserClick(Sender: TObject);
    procedure btn_OptionDeleteUserClick(Sender: TObject);
    procedure edt_OptionPasswordEnter(Sender: TObject);
    procedure btn_OptionCancelUserClick(Sender: TObject);
    procedure SetButtonsEnableVisible(DataSet: TDataSet);
    procedure btn_OptionCancelRightClick(Sender: TObject);
    procedure lucbx_BackupPropertiesChange(Sender: TObject);
    procedure lucbx_OptionPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox10PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox2PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox3PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox4PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox5PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox6PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox7PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox8PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox9PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox11PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox12PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox13PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox14PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox15PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox16PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox19PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox17PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox18PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox21PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox20PropertiesChange(Sender: TObject);
    procedure OpenData;
    procedure FormResize(Sender: TObject);
    procedure cxDBLookupComboBox22PropertiesChange(Sender: TObject);
    procedure cxDBLookupComboBox23PropertiesChange(Sender: TObject);
    procedure AA_pc_UserChange(Sender: TObject);
  private
    { Private-Deklarationen }
    SaveGridViewUser,SaveGridViewRight: TSavedGridView;
    procedure SetRightColor(ARight: TcxDBLookupComboBox);
    procedure SetGridViews(Show:boolean);
    procedure SetButtons;
    procedure InitializeRights;
  public
    { Public-Deklarationen }
  end;

var
  frm_User: Tfrm_User;

implementation

{$R *.dfm}

uses  PCM.Main,
      PCM.Data,
      PCM.Functions.ChangePW,
      PCM.strings,
      PCM.SQL;

procedure Tfrm_User.SetGridViews(Show:boolean);
begin
  if Show then
  begin
    SaveGridViewUser := TSavedGridView.Create(GV_Benutzer,dm_PCM.iIDBenutzerPCM, cxGridDBTableView3);
    SaveGridViewUser.LoadView;
    SaveGridViewRight := TSavedGridView.Create(GV_Recht,dm_PCM.iIDBenutzerPCM, cxGridDBTableView1);
    SaveGridViewRight.LoadView;
  end
  else begin
    SaveGridViewUser.SaveView(0);
    SaveGridViewUser.Free;
    SaveGridViewRight.SaveView(0);
    SaveGridViewRight.Free;
  end;
end;
procedure Tfrm_User.SetRightColor(ARight: TcxDBLookupComboBox);
begin
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
procedure Tfrm_User.OpenData;
begin
  qBenutzer.SQL.Text:= ASSQL_GetUSer[dm_PCM.iDBType];
  qBenutzer.Open;
  qRechte.SQL.Text:= ASSQL_GetRights[dm_PCM.iDBType];
  qRechte.Open;
  qRechte_Detail.SQL.Text:= ASSQL_GetRightsDetail[dm_PCM.iDBType];
  qRechte_Detail.Open;
  cxGridDBColumn2.Caption:= rs_PCMBenutzerverwaltung_Benutzer;
  cxGridDBTableView3Column1.Caption:= rs_PCMBenutzerverwaltung_Vorname;
  cxGridDBTableView3Column2.Caption:= rs_PCMBenutzerverwaltung_Nachname;
  cxGridDBTableView1Bezeichnung.Caption:= rs_PCMBenutzerverwaltung_Bezeichnung;
end;
procedure Tfrm_User.SetButtons;
begin
  // Benutzer
  if dm_PCM.iBenutzer >= 2 then
  begin
    btn_OptionSaveUser.Enabled := qBenutzer.State in [dsInsert, dsEdit];
    btn_OptionCancelUser.Enabled := qBenutzer.State in [dsInsert, dsEdit];
    //Rechte
    btn_OptionSaveRight.Enabled := qRechte.State in [dsInsert, dsEdit];
    btn_OptionCancelRight.Enabled := qRechte.State in [dsInsert, dsEdit];
  end;

  if dm_PCM.iBenutzer = 3 then
  begin
    // Benutzer
    btn_OptionDeleteUser.Enabled := (not qBenutzer.Eof) and not (qBenutzer.State in [dsInsert, dsEdit]);
    //Rechte
    btn_OptionDeleteRight.Enabled := (not qRechte.Eof) and not (qRechte.State in [dsInsert, dsEdit]);
  end;
end;
procedure Tfrm_User.InitializeRights;
begin
  // Benutzerverwaltung / Lesen
  if dm_PCM.iBenutzer = 1 then
  begin
    //// Benutzer
    // Toolbar
    btn_OptionNewUser.Enabled:= false;
    btn_OptionSaveUser.Enabled:= false;
    btn_OptionCancelUser.Enabled:= false;
    btn_OptionDeleteUser.Enabled:= false;
    // Editfelder
    edt_OptionUser.Enabled:= false;
    edt_OptionPassword.Enabled:= false;
    edt_OptionName.Enabled:= false;
    edt_OptionSurName.Enabled:= false;
    lucbx_OptionRights.Enabled:= false;
    // Button
    btn_OptionChangePassword.Enabled:= false;
    //// Rechte
    // Toolbar
    btn_OptionNewRight.Enabled:= false;
    btn_OptionSaveRight.Enabled:= false;
    btn_OptionCancelRight.Enabled:= false;
    btn_OptionDeleteRight.Enabled:= false;
    // Editfelder
    edt_OptionRight.Enabled:= false;
    lucbx_Option.Enabled:= false;
    lucbx_Backup.Enabled:= false;
  end;
  // Benutzerverwaltung / Ändern
  if dm_PCM.iBenutzer = 2 then
  begin
    //// Benutzer
    // Toolbar
    btn_OptionNewUser.Enabled:= true;
    btn_OptionSaveUser.Enabled:= true;
    btn_OptionCancelUser.Enabled:= true;
    btn_OptionDeleteUser.Enabled:= false;
    // Editfelder
    edt_OptionUser.Enabled:= true;
    edt_OptionPassword.Enabled:= true;
    edt_OptionName.Enabled:= true;
    edt_OptionSurName.Enabled:= true;
    lucbx_OptionRights.Enabled:= true;
    // Button
    btn_OptionChangePassword.Enabled:= true;
    //// Rechte
    // Toolbar
    btn_OptionNewRight.Enabled:= true;
    btn_OptionSaveRight.Enabled:= true;
    btn_OptionCancelRight.Enabled:= true;
    btn_OptionDeleteRight.Enabled:= false;
    // Editfelder
    edt_OptionRight.Enabled:= true;
    lucbx_Option.Enabled:= true;
    lucbx_Backup.Enabled:= true;
  end;

   // Benutzerverwaltung / Vollzugriff
  if dm_PCM.iBenutzer = 3 then
  begin
    //// Benutzer
    // Toolbar
    btn_OptionNewUser.Enabled:= true;
    btn_OptionSaveUser.Enabled:= true;
    btn_OptionCancelUser.Enabled:= true;
    btn_OptionDeleteUser.Enabled:= true;
    // Editfelder
    edt_OptionUser.Enabled:= true;
    edt_OptionPassword.Enabled:= true;
    edt_OptionName.Enabled:= true;
    edt_OptionSurName.Enabled:= true;
    lucbx_OptionRights.Enabled:= true;
    // Button
    btn_OptionChangePassword.Enabled:= true;
    //// Rechte
    // Toolbar
    btn_OptionNewRight.Enabled:= true;
    btn_OptionSaveRight.Enabled:= true;
    btn_OptionCancelRight.Enabled:= true;
    btn_OptionDeleteRight.Enabled:= true;
    // Editfelder
    edt_OptionRight.Enabled:= true;
    lucbx_Option.Enabled:= true;
    lucbx_Backup.Enabled:= true;
  end;
end;
procedure Tfrm_User.edt_OptionPasswordEnter(Sender: TObject);
begin
  if Length(edt_OptionPassword.Text) > 0 then
    edt_OptionPassword.Properties.ReadOnly:= true
  else
    edt_OptionPassword.Properties.ReadOnly:= false;
end;
procedure Tfrm_User.edt_OptionPasswordExit(Sender: TObject);
var
  astr_password: string;
begin
  if (edt_OptionPassword.text <> '') and (Length(edt_OptionPassword.text) < 32) then
  begin
    astr_password:= GetMD5Hash(edt_OptionPassword.text);
    edt_OptionPassword.text:= astr_password;
    btn_OptionSaveUser.Click;
  end;
end;
procedure Tfrm_User.FormDestroy(Sender: TObject);
begin
  SetGridViews(false);
end;
procedure Tfrm_User.FormResize(Sender: TObject);
begin
  // USER
  pnl_UserLeft.Width:= Round(pnl_User.Width / 2) - 16;
  pnl_UserRight.Width:= Round(pnl_User.Width / 2) - 16;
  edt_OptionUser.Width:= pnl_UserLeft.Width -124;
  edt_OptionName.Width:= pnl_UserLeft.Width -124;
  edt_OptionSurName.Width:= pnl_UserRight.Width -124;
  cxDBCheckBox3.Width:= pnl_UserLeft.Width -124;

  edt_OptionPassword.Width:= pnl_UserRight.Width -129 - btn_OptionChangePassword.width;
  btn_OptionChangePassword.Left:= edt_OptionPassword.Left + edt_OptionPassword.Width + 7;
  lucbx_OptionRights.Width:= pnl_UserLeft.Width -121;
  cxDBCheckBox2.Width:= pnl_UserRight.Width -121;
  cxGridDBColumn2.Width:= Round((pnl_User.Width - 42) / 3);
  cxGridDBTableView3Column1.Width:= Round((pnl_User.Width - 42) / 3);
  cxGridDBTableView3Column2.Width:= Round((pnl_User.Width - 42) / 3);
  // RECHTE

  edt_OptionRight.width:= grpbx_1Allgemein.Width - 151;
  pnl_RightLeft.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  pnl_RightRight.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  lucbx_Option.width:= pnl_RightLeft.Width -152;
  cxDBCheckBox1.width:= pnl_RightLeft.Width -152;
  lucbx_Backup.width:= pnl_RightRight.Width -130;
  // Archiv
  cxDBLookupComboBox22.Width:= grpbx_1Allgemein.Width - 151;
  // Backup
  cxDBLookupComboBox23.Width:= grpbx_1Allgemein.Width - 151;
  // Manager
  pnl_mrLeft.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox1.Width:= pnl_mrLeft.Width -152;
  cxDBLookupComboBox3.Width:= pnl_mrLeft.Width -152;
  cxDBLookupComboBox5.Width:= pnl_mrLeft.Width -152;
  cxDBLookupComboBox7.Width:= pnl_mrLeft.Width -152;
  cxDBLookupComboBox9.Width:= pnl_mrLeft.Width -152;
  pnl_mrRight.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox2.Width:= pnl_mrRight.Width -130;
  cxDBLookupComboBox4.Width:= pnl_mrRight.Width -130;
  cxDBLookupComboBox6.Width:= pnl_mrRight.Width -130;
  cxDBLookupComboBox8.Width:= pnl_mrRight.Width -130;
  cxDBLookupComboBox10.Width:= pnl_mrRight.Width -130;
  // Mediacenter
  pnl_mcLeft.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox11.Width:= pnl_mcLeft.Width -152;
  cxDBLookupComboBox13.Width:= pnl_mcLeft.Width -152;
  pnl_mcRight.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox12.Width:= pnl_mcRight.Width -130;
  cxDBLookupComboBox14.Width:= pnl_mcRight.Width -130;
  // MP3-Manager
  cxDBLookupComboBox15.Width:= grpbx_1Allgemein.Width - 151;
  // Notenrechner
  cxDBLookupComboBox16.Width:= grpbx_1Allgemein.Width - 151;
  // Servicemanager
  pnl_scLeft.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox17.Width:= pnl_scLeft.Width -152;
  pnl_scRight.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox19.Width:= pnl_scright.Width -130;
  // Vokabeltrainer
  pnl_vtLeft.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox18.Width:= pnl_vtLeft.Width -152;
  cxDBLookupComboBox21.Width:= pnl_vtLeft.Width -152;
  pnl_vtRight.Width:= Round(grpbx_1Allgemein.Width / 2) - 16;
  cxDBLookupComboBox20.Width:= pnl_vtright.Width -130;
  cxGridDBTableView1Bezeichnung.Width:= Round(grpbx_1Allgemein.Width - 42);
end;
procedure Tfrm_User.FormShow(Sender: TObject);
begin
  OPendata;
  FormResize(Self);
  InitializeRights;
  SetGridViews(true);
end;
procedure Tfrm_User.lucbx_BackupPropertiesChange(Sender: TObject);
begin
  SetRightColor(lucbx_Backup);
end;
procedure Tfrm_User.lucbx_OptionPropertiesChange(Sender: TObject);
begin
  SetRightColor(lucbx_Option);
end;
procedure Tfrm_User.SetButtonsEnableVisible(DataSet: TDataSet);
begin
  SetButtons;
end;
procedure Tfrm_User.AA_pc_UserChange(Sender: TObject);
begin
  FormResize(Self);
end;

procedure Tfrm_User.btn_OptionCancelRightClick(Sender: TObject);
begin
  qRechte.Cancel;
end;
procedure Tfrm_User.btn_OptionCancelUserClick(Sender: TObject);
begin
  qBenutzer.Cancel;
end;
procedure Tfrm_User.btn_OptionChangePasswordClick(Sender: TObject);
begin
  dm_PCM.iIDBenutzerPCM:= qBenutzer.FieldByName('ID').AsInteger;
  Application.CreateForm(TfrM_PCM_ChangePW,frM_PCM_ChangePW);
  frM_PCM_ChangePW.ShowModal;
end;
procedure Tfrm_User.btn_OptionSaveRightClick(Sender: TObject);
begin
  if (qRechte.FieldByName('ID').AsInteger > 4) or (qRechte.FieldByName('ID').AsInteger < 0) then
  begin
    if qRechte.State in [dsInsert, dsEdit] then
    begin
      edt_OptionRight.PostEditValue;
      qRechte.Post;
    end;
  end
  else begin
    qRechte.Cancel;
    MessageDlg(rs_PCMBenutzerverwaltung_RechteBearbeiten, mtWarning, [mbOk], 0);
  end;
end;
procedure Tfrm_User.btn_OptionDeleteRightClick(Sender: TObject);
begin
  if qRechte.FieldByName('ID').AsInteger > 4 then
  begin
    qRechte.Delete;
  end
  else begin
    MessageDlg(rs_PCMBenutzerverwaltung_RechteLoeschen  , mtWarning, [mbOk], 0);
  end;
end;
procedure Tfrm_User.btn_OptionNewUserClick(Sender: TObject);
begin
  if qBenutzer.State in [dsInsert, dsedit] then
    qBenutzer.Post;
  qBenutzer.Append;
  qBenutzer.Insert;
  if dm_PCM.iBenutzer = 2 then
    qBenutzer.FieldByName('ID_Rechte').AsInteger:= 2

  else
    qBenutzer.FieldByName('ID_Rechte').AsInteger:= 1;
  edt_OptionUser.SetFocus;
end;
procedure Tfrm_User.btn_OptionSaveUserClick(Sender: TObject);
begin
  if qBenutzer.State in [dsInsert, dsEdit] then
  begin
    edt_OptionUser.PostEditValue;
    edt_OptionPassword.PostEditValue;
    edt_OptionName.PostEditValue;
    edt_OptionSurName.PostEditValue;
    qBenutzer.Post;
  end;
end;
procedure Tfrm_User.cxDBLookupComboBox10PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox10);
end;
procedure Tfrm_User.cxDBLookupComboBox11PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox11);
end;
procedure Tfrm_User.cxDBLookupComboBox12PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox12);
end;
procedure Tfrm_User.cxDBLookupComboBox13PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox13);
end;
procedure Tfrm_User.cxDBLookupComboBox14PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox14);
end;
procedure Tfrm_User.cxDBLookupComboBox15PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox15);
end;
procedure Tfrm_User.cxDBLookupComboBox16PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox16);
end;
procedure Tfrm_User.cxDBLookupComboBox17PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox17);
end;
procedure Tfrm_User.cxDBLookupComboBox18PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox18);
end;
procedure Tfrm_User.cxDBLookupComboBox19PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox19);
end;
procedure Tfrm_User.cxDBLookupComboBox1PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox1);
end;
procedure Tfrm_User.cxDBLookupComboBox20PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox20);
end;
procedure Tfrm_User.cxDBLookupComboBox21PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox21);
end;
procedure Tfrm_User.cxDBLookupComboBox22PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox22);
end;
procedure Tfrm_User.cxDBLookupComboBox23PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox23);
end;
procedure Tfrm_User.cxDBLookupComboBox2PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox2);
end;
procedure Tfrm_User.cxDBLookupComboBox3PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox3);
end;
procedure Tfrm_User.cxDBLookupComboBox4PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox4);
end;
procedure Tfrm_User.cxDBLookupComboBox5PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox5);
end;
procedure Tfrm_User.cxDBLookupComboBox6PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox6);
end;
procedure Tfrm_User.cxDBLookupComboBox7PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox7);
end;
procedure Tfrm_User.cxDBLookupComboBox8PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox8);
end;
procedure Tfrm_User.cxDBLookupComboBox9PropertiesChange(Sender: TObject);
begin
  SetRightColor(cxDBLookupComboBox9);
end;
procedure Tfrm_User.btn_OptionDeleteUserClick(Sender: TObject);
begin
  if qBenutzer.FieldByName('ID').AsInteger > 1 then
  begin
    qBenutzer.Delete;
  end
  else begin
    MessageDlg(rs_PCMBenutzerverwaltung_BenutzerLoeschen , mtWarning, [mbOk], 0);
  end;
end;
procedure Tfrm_User.btn_OptionNewRightClick(Sender: TObject);
begin
  if qRechte.State in [dsInsert, dsedit] then
    qRechte.Post;
  qRechte.Append;
  qRechte.Insert;
  qRechte.FieldByName('Benutzer').AsInteger:= 3;
  qRechte.FieldByName('Konfiguration').AsInteger:= 3;
  qRechte.FieldByName('Alle_Benutzer').AsInteger:= 3;
  qRechte.FieldByName('ma_Kontakte').AsInteger:= 3;
  qRechte.FieldByName('ma_Kalender').AsInteger:= 3;
  qRechte.FieldByName('ma_Stundenplan').AsInteger:= 3;
  qRechte.FieldByName('ma_Email').AsInteger:= 3;
  qRechte.FieldByName('ma_Password').AsInteger:= 3;
  qRechte.FieldByName('ma_Serials').AsInteger:= 3;
  qRechte.FieldByName('ma_Monatsuebersicht').AsInteger:= 3;
  qRechte.FieldByName('ma_Verfuegung').AsInteger:= 3;
  qRechte.FieldByName('ma_Einnahmen').AsInteger:= 3;
  qRechte.FieldByName('ma_Ausgaben').AsInteger:= 3;
  qRechte.FieldByName('mc_Audioplayer').AsInteger:= 3;
  qRechte.FieldByName('mc_Webradio').AsInteger:= 3;
  qRechte.FieldByName('mc_Videoplayer').AsInteger:= 3;
  qRechte.FieldByName('mc_Fotos').AsInteger:= 3;
  qRechte.FieldByName('mm_MP3').AsInteger:= 3;
  qRechte.FieldByName('nr_Noten').AsInteger:= 3;
  qRechte.FieldByName('sm_Backup').AsInteger:= 3;
  qRechte.FieldByName('sm_Shutdown').AsInteger:= 3;
  qRechte.FieldByName('vk_Vokabeluebersicht').AsInteger:= 3;
  qRechte.FieldByName('Vk_Vokabeltest').AsInteger:= 3;
  qRechte.FieldByName('vk_Lernstatistik').AsInteger:= 3;
  edt_OptionRight.SetFocus;
end;

end.

