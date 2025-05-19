unit PCM.Functions.Login;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.ComCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxButtons, System.ImageList, Vcl.ImgList,inifiles,system.uitypes,FireDac.Stan.Param,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxClasses, cxLabel, cxImage, cxGroupBox,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, dxLayoutContainer,
  dxLayoutLookAndFeels, dxLayoutControl, dxUIAClasses;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_PCM_Login = class(TForm)
    btn_Ok: TcxButton;
    btn_Cancel: TcxButton;
    cmbbx_User: TcxComboBox;
    edt_Pass: TcxTextEdit;
    img_Image: TcxImage;
    lactrl_LoginGroup_Root: TdxLayoutGroup;
    lactrl_Login: TdxLayoutControl;
    laitm_LoginImage: TdxLayoutItem;
    laitem_Info: TdxLayoutLabeledItem;
    laitm_LoginBenutzer: TdxLayoutItem;
    laitm_LoginPasswort: TdxLayoutItem;
    laitm_LoginOk: TdxLayoutItem;
    laitm_LoginCancel: TdxLayoutItem;
    lalaflst_Login: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    laitm_LoginSep1: TdxLayoutSeparatorItem;
    laitm_LoginSep2: TdxLayoutSeparatorItem;
    lagrp_LoginBtn: TdxLayoutGroup;
    lagrp_LoginImage: TdxLayoutGroup;
    lagrp_Login: TdxLayoutGroup;
    procedure btn_CancelClick(Sender: TObject);
    procedure cbx_PCManagerLogin_UserExit(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_PCManagerLogin_PassKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PassKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public-Deklarationen }
    function Login_User : boolean;
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_Login: Tfrm_PCM_Login;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Functions,
  PCM.Functions.Login.SQL,
  PCM.Data,
  PCM.Strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
function Tfrm_PCM_Login.Login_User : boolean;
begin
  Application.CreateForm(Tfrm_PCM_Login, frm_PCM_Login);
  Result := frm_PCM_Login.ShowModal = mrOk;
end;
procedure Tfrm_PCM_Login.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent:= 0;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_PCM_Login.btn_OkClick(Sender: TObject);
var
  sPassword: string;
  iBenutzer: integer;
begin
  if cmbbx_User.Text = '' then
  begin
    MessageDlg(rs_Function_Login_Benutzereingeben, mtWarning, [mbOk], 0);
    exit;
  end;
  if edt_Pass.text <> '' then
  begin
    sPassword:= GetMD5Hash(edt_Pass.text);
    dm_pcm.qry_Work.SQL.Text:= ASSQL_GetUserLogin[dm_pcm.iDBType];
    dm_pcm.qry_Work.ParamByName('Benutzer').asString:= cmbbx_User.Text;
    dm_pcm.qry_Work.ParamByName('Passwort').asString:= sPassword;
    dm_pcm.qry_Work.Open;
    iBenutzer := dm_pcm.qry_Work.FieldByName('ID').AsInteger;
    dm_pcm.qry_Work.Close;

    if iBenutzer = 0 then
    begin
      MessageDlg(rs_Function_Login_Benutzerfalsch, mtWarning, [mbOk], 0);
      edt_Pass.Text:= '';
      exit;
    end
    else begin
      dm_pcm.iIDBenutzerPCM := iBenutzer;
      dm_pcm.bLogin:= true;
      ModalResult:= MROk;
    end;
  end
  else begin
    MessageDlg(rs_Function_Login_Passworteingeben, mtWarning, [mbOk], 0);
    exit;
  end;
end;
procedure Tfrm_PCM_Login.btn_CancelClick(Sender: TObject);
begin
  dm_pcm.bClose:= true;
  ModalResult:= MRCancel;
end;
procedure Tfrm_PCM_Login.cbx_PCManagerLogin_UserExit(Sender: TObject);
begin
  cmbbx_User.Text:= cmbbx_User.Properties.Items[cmbbx_User.ItemIndex];
end;
procedure Tfrm_PCM_Login.edt_PCManagerLogin_PassKeyPress(Sender: TObject; var Key: Char);
begin
  if key= Chr(VK_RETURN) then
  begin
    key := #0;
    btn_Ok.Click;
  end;
end;
procedure Tfrm_PCM_Login.edt_PassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (Length(edt_Pass.Text) > 0) then
    btn_OkClick(Sender);
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_Login.FormCreate(Sender: TObject);
  procedure LoadRessourceStrings;
  begin
    laitem_Info.CaptionOptions.text:= rs_Function_Login_Info;
    laitm_LoginBenutzer.CaptionOptions.text:= rs_Function_Login_Benutzer;
    laitm_LoginPasswort.CaptionOptions.text:= rs_Function_Login_Passwort;
    btn_Ok.Caption:= rs_Function_Login_BtnAnmelden;
    btn_Cancel.Caption:= rs_general_Abbrechen;
  end;
begin
  LoadRessourceStrings;
end;
procedure Tfrm_PCM_Login.FormShow(Sender: TObject);
begin
  caption:= PCM_Programmname + rs_Function_Login_Anmeldung;
  cmbbx_User.clear;
  dm_pcm.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_pcm.qry_Work.SQL.Text:= ASSQL_GetUser[dm_PCM.iDBType];
  dm_pcm.qry_Work.open;
  dm_pcm.qry_Work.First;
  while not dm_pcm.qry_Work.Eof do begin
    cmbbx_User.Properties.Items.Add(dm_pcm.qry_Work.FieldByName('benutzer').AsString);
    dm_pcm.qry_Work.Next;
  end;
  dm_pcm.qry_Work.close;
  cmbbx_User.SetFocus;
end;
{$EndRegion Formfunktionen}
end.
