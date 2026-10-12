unit PCM.Functions.Synch.Wait;

interface

uses
  {$Region uses}
  System.SysUtils,
  Vcl.Forms,
  WinApi.Windows,
  WinApi.Messages,
  Vcl.Menus,
  Vcl.Controls;
  {$EndRegion uses}
// Deklarationen
{$Region Deklarationen}
procedure ShowWaitForm(const AForm: TForm; const AWaitText: String; const iCount: Integer; const AWidth: Integer = 0; const AHeight: Integer = 0);
procedure WaitFormStep; overload;
procedure WaitFormStep(const AText: String); overload;
procedure WaitFormSetNewCount(const ACount: Integer);
procedure WaitFormPosition(const APostion: Integer);
procedure WaitFormSetText(const AText: String);
procedure CloseWaitForm;
procedure LockControl(const AControl: TWinControl; const ALock: Boolean);
{$EndRegion Deklarationen}
implementation

uses
  {$Region uses}
  PCM.Functions.Synch.Transparenz,
  PCM.Functions.Synch.ProgressDialog;
  {$EndRegion uses}
var
  {$Region var}
  FForm: TForm;
  FfrmWait: TfrmProgressDialog; //TfrmWait;
  FfrmTransparenz: TfrmTransparenz;
  {$EndRegion var}
// Prozeduren
{$Region Prozeduren}
procedure ShowWaitForm(const AForm: TForm; const AWaitText: String; const iCount: Integer;const AWidth: Integer = 0; const AHeight: Integer = 0);
begin
  // 6.2.0.20 - AM
  FForm := AForm;
  FForm.Enabled := False;

  if not Assigned(FfrmTransparenz) then
  begin
    FfrmTransparenz := TfrmTransparenz.Create(FForm);
//    Application.CreateForm(TfrmTransparenz, FfrmTransparenz);
    FfrmTransparenz.BorderStyle := bsNone;
    FfrmTransparenz.Enabled := True;
  end;

  FfrmTransparenz.Execute(FForm, AWidth, AHeight);
  FfrmTransparenz.Show;

  if not Assigned(FfrmWait) then
  begin
    FfrmWait := TfrmProgressDialog.Create(frmTransparenz);
//    Application.CreateForm(TfrmProgressDialog, FfrmWait);
//    FfrmWait.BorderStyle := bsNone;
    FfrmWait.FParentForm := frmTransparenz;
    FfrmWait.Enabled := True;
  end;

//  FfrmWait.Execute(AWidth, AWaitText);
  FfrmWait.ShowDialog(AWaitText, iCount);
//  FfrmWait.Show;
  Application.ProcessMessages;
end;
procedure CloseWaitForm;
begin
  if Assigned(FfrmWait) then
  begin
    FfrmWait.ind_wait.Active:= false;
    FfrmWait.Close;
    FreeAndNil(FfrmWait);
  end;

  if Assigned(FfrmTransparenz) then
  begin
    FfrmTransparenz.Close;
    FreeAndNil(FfrmTransparenz);
  end;

  if Assigned(FForm) then
  begin
    FForm.Enabled := True;
    FForm.BringToFront;
    FForm := nil;
  end;
  Application.ProcessMessages;
end;
procedure WaitFormStep; overload;
begin
  if Assigned(FfrmWait) then
    FfrmWait.Step;
end;
procedure WaitFormStep(const AText: String); overload;
begin
  if Assigned(FfrmWait) then
    FfrmWait.Step(AText);
end;
procedure WaitFormSetNewCount(const ACount: Integer);
begin
  if Assigned(FfrmWait) then
    FfrmWait.SetNewCount(ACount);
end;
procedure WaitFormPosition(const APostion: Integer);
begin
  if Assigned(FfrmWait) then
    FfrmWait.SetPosition(APostion);
end;
procedure WaitFormSetText(const AText: String);
begin
  if Assigned(FfrmWait) then
    FfrmWait.SetText(AText);
end;
procedure LockControl(const AControl: TWinControl; const ALock: Boolean);
begin
   if (AControl = nil) or (AControl.Handle = 0) then
    Exit;

   if ALock then
    SendMessage(AControl.Handle, WM_SETREDRAW, 0, 0)
   else
   begin
     SendMessage(AControl.Handle, WM_SETREDRAW, 1, 0);
     RedrawWindow(AControl.Handle, nil, 0,
       RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
   end;
end;
{$EndRegion Prozeduren}
end.
