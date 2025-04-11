unit PCM.Functions.Synch.Transparenz;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
  {$EndRegion uses}
type
  {$Region type}
  TfrmTransparenz = class(TForm)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure Execute(const AParentForm: TForm; const AWidth: Integer; const AHeight: Integer);
  end;
  {$EndRegion type}
var
  {$Region var}
  frmTransparenz: TfrmTransparenz;
  {$EndRegion var}
implementation
{$R *.dfm}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure TfrmTransparenz.Execute(const AParentForm: TForm; const AWidth: Integer; const AHeight: Integer);
begin
  Self.Left := AParentForm.Left;
  Self.Top := AParentForm.Top;
  Self.Width := AWidth;
  Self.Height := AHeight;
end;
{$EndRegion Hilfsfunktionen}
end.
