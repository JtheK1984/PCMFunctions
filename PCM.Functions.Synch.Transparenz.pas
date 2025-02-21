unit PCM.Functions.Synch.Transparenz;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmTransparenz = class(TForm)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure Execute(const AParentForm: TForm; const AWidth: Integer; const AHeight: Integer);
  end;

var
  frmTransparenz: TfrmTransparenz;

implementation

{$R *.dfm}

{ TfrmTransparenz }

procedure TfrmTransparenz.Execute(const AParentForm: TForm; const AWidth: Integer; const AHeight: Integer);
begin
  Self.Left := AParentForm.Left;
  Self.Top := AParentForm.Top;
  Self.Width := AWidth;
  Self.Height := AHeight;
end;

end.
