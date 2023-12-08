unit PCM.Functions.ChangePW;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, System.ImageList, Vcl.ImgList,FireDac.Stan.Param,
  dxSkinMetropolisDark, cxControls, cxContainer, cxEdit, cxTextEdit,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, cxGroupBox,cxPC,
  dxSkinWXI,Vcl.Dialogs;
type
  TcxPageControlPropertiesAccess = class(TcxPageControlProperties);
type
  Tfrm_PCM_ChangePW = class(TForm)
    btn_PCManagerChangePassword_Ok: TcxButton;
    edt_PCManagerChangePassword_NewPass: TcxTextEdit;
    edt_PCManagerChangePassword_RepPass: TcxTextEdit;
    img_PCManagerChangePassword_Image: TcxImage;
    lbl_PCManagerChangePassword_NewPass: TcxLabel;
    lbl_PCManagerChangePassword_RepPass: TcxLabel;
    grpbx_PwChangePassword: TcxGroupBox;
    procedure btn_PCManagerChangePassword_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_PCManagerChangePassword_CancelClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure Execute(const AShowModal: Boolean);
  end;

var
  frm_PCM_ChangePW: Tfrm_PCM_ChangePW;

implementation

{$R *.dfm}

uses  PCM.Functions.ChangePW.SQL,
      PCM.Data,
      PCM.Functions,
			PCM.Strings;

Procedure Tfrm_PCM_ChangePW.Execute(const AShowModal: Boolean);
begin
  edt_PCManagerChangePassword_NewPass.Text:= '';
  edt_PCManagerChangePassword_RepPass.Text:= '';
  if AShowModal then
    ShowModal;
end;
procedure Tfrm_PCM_ChangePW.FormShow(Sender: TObject);
begin
  caption:= PCM_Programmname + rs_PCM_PasswortAendern;
  edt_PCManagerChangePassword_NewPass.SetFocus;
end;
procedure Tfrm_PCM_ChangePW.btn_PCManagerChangePassword_CancelClick(Sender: TObject);
begin
  frm_PCM_ChangePW.close;
end;
procedure Tfrm_PCM_ChangePW.btn_PCManagerChangePassword_OkClick(Sender: TObject);
var
  sPassword: String;
begin
  if edt_PCManagerChangePassword_NewPass.Text <> edt_PCManagerChangePassword_RepPass.Text  then
  begin
    MessageDlg(rs_PCM_PasswortStimmtNicht + slinebreak + rs_PCM_EingabePruefen ,mtWarning,[mbOk], 0);
  end
  else begin
    if (edt_PCManagerChangePassword_NewPass.Text = '') or (edt_PCManagerChangePassword_RepPass.Text = '') then
    begin
      MessageDlg(rs_PCM_KeinPasswort + slinebreak + rs_PCM_EingabePruefen ,mtWarning,[mbOk], 0);
    end
    else begin
      sPassword:= GetMD5Hash(edt_PCManagerChangePassword_RepPass.text);
      dm_PCM.qry_Work.SQL.Text:= ASSQL_ChangePW[dm_PCM.iDBType];
      dm_PCM.qry_Work.ParamByName('Passwort').AsString:= sPassword ;
      dm_PCM.qry_Work.ParamByName('ID').AsInteger:= dm_PCM.iIDBenutzerPCM;
      dm_PCM.qry_Work.ExecSQL;
      frm_PCM_ChangePW.close;
    end;
  end;
end;
end.


