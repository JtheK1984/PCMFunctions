unit PCM.Functions.Synch.ProgressDialog;

interface

uses
  WinApi.Windows, WinApi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxGroupBox, cxLabel, cxImage,
  dxGDIPlusClasses;

type
  TfrmProgressDialog = class(TForm)
    prgbr_Main: TcxProgressBar;
    pnl_design: TcxGroupBox;
    Image1: TcxImage;
    lNachricht: TcxLabel;
    procedure FormDestroy(Sender: TObject);
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

var
  frmProgressDialog: TfrmProgressDialog;

implementation

{$R *.dfm}

procedure TfrmProgressDialog.ShowDialog(Text: string; Max: Integer);
begin
  lNachricht.Caption := Text;
  prgbr_Main.Properties.Max := Max;
  prgbr_Main.Position := 0;
//  Self.Owner := FParentForm;
  Show;
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

procedure TfrmProgressDialog.FormDestroy(Sender: TObject);
begin
    //ZMIDebugMsg('Destroy ProgressDialog');
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

end.

