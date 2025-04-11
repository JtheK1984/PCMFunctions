unit PCM.Functions.ChangePW;

interface

uses
{$Region uses}
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxButtons, System.ImageList, Vcl.ImgList,FireDac.Stan.Param,
  cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLabel, cxImage, cxGroupBox,cxPC,
  Vcl.Dialogs,System.UITypes, cxClasses, dxLayoutLookAndFeels,
  dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, dxUIAClasses;
  {$EndRegion uses}
type
  {$Region type}
  TcxPageControlPropertiesAccess = class(TcxPageControlProperties);
  Tfrm_PCM_ChangePW = class(TForm)
    btn_PCManagerChangePassword_Ok: TcxButton;
    edt_PCManagerChangePassword_NewPass: TcxTextEdit;
    edt_PCManagerChangePassword_RepPass: TcxTextEdit;
    img_PCManagerChangePassword_Image: TcxImage;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    procedure btn_PCManagerChangePassword_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_PCManagerChangePassword_CancelClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure Execute(const AShowModal: Boolean);
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_ChangePW: Tfrm_PCM_ChangePW;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Functions.ChangePW.SQL,
  PCM.Data,
  PCM.Functions,
  PCM.Strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
Procedure Tfrm_PCM_ChangePW.Execute(const AShowModal: Boolean);
begin
  edt_PCManagerChangePassword_NewPass.Text:= '';
  edt_PCManagerChangePassword_RepPass.Text:= '';
  if AShowModal then
    ShowModal;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
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
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_ChangePW.FormShow(Sender: TObject);
begin
  caption:= PCM_Programmname + rs_PCM_PasswortAendern;
  edt_PCManagerChangePassword_NewPass.SetFocus;
end;
{$EndRegion Formfunktionen}
end.


