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
  cxGridCustomPopupMenu, cxGridPopupMenu;

type
  Tfrm_User = class(TForm)
    pnl_right: TcxGroupBox;
    AA_pc_User: TcxPageControl;
    ts_User: TcxTabSheet;
    cxGroupBox9: TcxGroupBox;
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
    edt_OptionSurName: TcxDBTextEdit;
    edt_OptionUser: TcxDBTextEdit;
    lucbx_OptionRights: TcxDBLookupComboBox;
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
    btn_OptionUserClose: TdxBarLargeButton;
    btn_OptionNewRight: TdxBarLargeButton;
    btn_OptionRightsClose: TdxBarLargeButton;
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
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBCheckBox1: TcxDBCheckBox;
    edt_OptionRight: TcxDBTextEdit;
    Label12: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    lucbx_Backup: TcxDBLookupComboBox;
    lucbx_Option: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
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
    cxDBLookupComboBox19: TcxDBLookupComboBox;
    cxLabel19: TcxLabel;
    cxDBLookupComboBox20: TcxDBLookupComboBox;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxDBLookupComboBox21: TcxDBLookupComboBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
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
      PCM.Functions.ChangePW;

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
  qBenutzer.Open;
  qRechte.Open;
  qRechte_Detail.Open;
end;
procedure Tfrm_User.SetButtons;
begin
  // Benutzer
  if dm_PCM.int_optionenRecht >= 2 then
  begin
    btn_OptionSaveUser.Enabled := qBenutzer.State in [dsInsert, dsEdit];
    btn_OptionCancelUser.Enabled := qBenutzer.State in [dsInsert, dsEdit];
    //Rechte
    btn_OptionSaveRight.Enabled := qRechte.State in [dsInsert, dsEdit];
    btn_OptionCancelRight.Enabled := qRechte.State in [dsInsert, dsEdit];
  end;

  if dm_PCM.int_optionenRecht = 3 then
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
  if dm_PCM.int_optionenRecht = 1 then
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
  if dm_PCM.int_optionenRecht = 2 then
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
  if dm_PCM.int_optionenRecht = 3 then
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
procedure Tfrm_User.FormShow(Sender: TObject);
begin
  OPendata;
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
    MessageDlg('Die vordefinierten Rechte können nicht bearbeitet werden!'  , mtWarning, [mbOk], 0);
  end;
end;
procedure Tfrm_User.btn_OptionDeleteRightClick(Sender: TObject);
begin
  if qRechte.FieldByName('ID').AsInteger > 4 then
  begin
    qRechte.Delete;
  end
  else begin
    MessageDlg('Die vordefinierten Rechte können nicht gelöscht werden!'  , mtWarning, [mbOk], 0);
  end;
end;
procedure Tfrm_User.btn_OptionNewUserClick(Sender: TObject);
begin
  if qBenutzer.State in [dsInsert, dsedit] then
    qBenutzer.Post;
  qBenutzer.Append;
  qBenutzer.Insert;
  if dm_PCM.int_optionenRecht = 2 then
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
    MessageDlg('Der Haupbenutzer kann nicht gelöscht werden!'  , mtWarning, [mbOk], 0);
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

