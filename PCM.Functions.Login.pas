unit PCM.Functions.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.ComCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, System.ImageList, Vcl.ImgList,inifiles,system.uitypes,FireDac.Stan.Param,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxClasses, cxLabel, cxImage, cxGroupBox, dxSkinWXI;

type
  Tfrm_PCM_Login = class(TForm)
    pnl_PCManagerLogin_Trenn2: TPanel;
    pnl_PCManagerLogin_Trenn1: TPanel;
    btn_PCManagerLogin_Ok: TcxButton;
    btn_PCManagerLogin_Cancel: TcxButton;
    cmbbx_PCManagerLogin_User: TcxComboBox;
    edt_PCManagerLogin_Pass: TcxTextEdit;
    lbl_PCManagerLogin_User: TcxLabel;
    lbl_PCManagerLogin_Pass: TcxLabel;
    lbl_PCManagerLogin_Info: TcxLabel;
    img_PCManagerLogin_Image: TcxImage;
    pnl_design: TcxGroupBox;
    procedure btn_PCManagerLogin_CancelClick(Sender: TObject);
    procedure cbx_PCManagerLogin_UserExit(Sender: TObject);
    procedure btn_PCManagerLogin_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_PCManagerLogin_PassKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PCManagerLogin_PassKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private-Deklarationen }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public-Deklarationen }
    function Login_User : boolean;
  end;

var
  frm_PCM_Login: Tfrm_PCM_Login;



implementation

{$R *.dfm}

uses  PCM.Functions,
      PCM.Functions.Login.SQL,
      PCM.Data,
      PCM.Strings;


function Tfrm_PCM_Login.Login_User : boolean;
begin
  Application.CreateForm(Tfrm_PCM_Login, frm_PCM_Login);
  Result := frm_PCM_Login.ShowModal = mrOk;
end;
procedure Tfrm_PCM_Login.cbx_PCManagerLogin_UserExit(Sender: TObject);
begin
  cmbbx_PCManagerLogin_User.Text:= cmbbx_PCManagerLogin_User.Properties.Items[cmbbx_PCManagerLogin_User.ItemIndex];
end;
procedure Tfrm_PCM_Login.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent:= 0;
end;
procedure Tfrm_PCM_Login.edt_PCManagerLogin_PassKeyPress(Sender: TObject; var Key: Char);
begin
  if key= Chr(VK_RETURN) then
  begin
    key := #0;
    btn_PCManagerLogin_Ok.Click;
  end;
end;
procedure Tfrm_PCM_Login.edt_PCManagerLogin_PassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (Length(edt_PCManagerLogin_Pass.Text) > 0) then
    btn_PCManagerLogin_OkClick(Sender);
end;
procedure Tfrm_PCM_Login.FormShow(Sender: TObject);
begin
  caption:= PCM_Programmname + rs_PCM_Anmeldung;
  cmbbx_PCManagerLogin_User.clear;
  dm_pcm.qry_Work.Connection:= dm_PCM.con_PCM;
  dm_pcm.qry_Work.SQL.Text:= ASSQL_GetUser[dm_PCM.iDBType];
  dm_pcm.qry_Work.open;
  dm_pcm.qry_Work.First;
  while not dm_pcm.qry_Work.Eof do begin
    cmbbx_PCManagerLogin_User.Properties.Items.Add(dm_pcm.qry_Work.FieldByName('benutzer').AsString);
    dm_pcm.qry_Work.Next;
  end;
  dm_pcm.qry_Work.close;
  cmbbx_PCManagerLogin_User.SetFocus;
end;
procedure Tfrm_PCM_Login.btn_PCManagerLogin_OkClick(Sender: TObject);
var
  sPassword: string;
  iBenutzer: integer;
begin
  if cmbbx_PCManagerLogin_User.Text = '' then
  begin
    MessageDlg(rs_PCM_Benutzereingeben, mtWarning, [mbOk], 0);
    exit;
  end;
  if edt_PCManagerLogin_Pass.text <> '' then
  begin
    sPassword:= GetMD5Hash(edt_PCManagerLogin_Pass.text);
    dm_pcm.qry_Work.SQL.Text:= ASSQL_GetUserLogin[dm_pcm.iDBType];
    dm_pcm.qry_Work.ParamByName('Benutzer').asString:= cmbbx_PCManagerLogin_User.Text;
    dm_pcm.qry_Work.ParamByName('Passwort').asString:= sPassword;
    dm_pcm.qry_Work.Open;
    iBenutzer := dm_pcm.qry_Work.FieldByName('ID').AsInteger;
    dm_pcm.qry_Work.Close;

    if iBenutzer = 0 then
    begin
      MessageDlg(rs_PCM_Benutzerfalsch, mtWarning, [mbOk], 0);
      edt_PCManagerLogin_Pass.Text:= '';
      exit;
    end
    else begin
      dm_pcm.iIDBenutzerPCM := iBenutzer;
      dm_pcm.bLogin:= true;
      ModalResult:= MROk;
    end;
  end
  else begin
    MessageDlg(rs_PCM_Passworteingeben, mtWarning, [mbOk], 0);
    exit;
  end;
end;
procedure Tfrm_PCM_Login.btn_PCManagerLogin_CancelClick(Sender: TObject);
begin
  dm_pcm.bClose:= true;
  ModalResult:= MRCancel;
end;

end.
