unit PCM.Functions.Synch.ProgressDialog;

interface

uses
  {$Region uses}
  WinApi.Windows, WinApi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Pcm.Strings,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxGroupBox, cxLabel, cxImage,
  dxGDIPlusClasses, dxUIAClasses, dxActivityIndicator;
  {$EndRegion uses}
type
  {$Region type}
  TfrmProgressDialog = class(TForm)
    prgbr_Main: TcxProgressBar;
    pnl_design: TcxGroupBox;
    lNachricht: TcxLabel;
    ind_wait: TdxActivityIndicator;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Cancel: Boolean;
    FParentForm: TForm;
    procedure ShowDialog(Text: string; Max: Integer);
    procedure SetText(const AText: String);
    procedure SetPosition(Value: Integer);
    procedure SetNewCount(const ACount: Integer);
    procedure Step; overload;
    procedure Step(Text: String); overload;
  end;
  {$EndRegion type}
var
  {$Region var}
  frmProgressDialog: TfrmProgressDialog;
  {$EndRegion var}
implementation
{$R *.dfm}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure TfrmProgressDialog.ShowDialog(Text: string; Max: Integer);
begin
  lNachricht.Caption := Text;
  prgbr_Main.Properties.Max := Max;
  prgbr_Main.Position := 0;
//  Self.Owner := FParentForm;
  Show;
  ind_wait.Active:= true;
  Application.ProcessMessages;
end;
procedure TfrmProgressDialog.Step(Text: String);
begin
  lNachricht.Caption := Text;
//  Step;
  prgbr_Main.Position := prgbr_Main.Position + 1;
  Application.ProcessMessages;
end;
procedure TfrmProgressDialog.Step;
begin
  prgbr_Main.Position := prgbr_Main.Position + 1;
  Application.ProcessMessages;
end;
procedure TfrmProgressDialog.FormCreate(Sender: TObject);
begin
  caption:= rs_Function_Wait_FormCaption;
end;

procedure TfrmProgressDialog.SetNewCount(const ACount: Integer);
begin
  prgbr_Main.Properties.Max := ACount;
  Application.ProcessMessages;
end;
procedure TfrmProgressDialog.SetPosition(Value: Integer);
begin
  prgbr_Main.Position := Value;
  Application.ProcessMessages;
end;
procedure TfrmProgressDialog.SetText(const AText: String);
begin
  lNachricht.Caption := AText;
  Application.ProcessMessages;
end;
{$EndRegion Hilfsfunktionen}
end.

