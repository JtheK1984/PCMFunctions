program PCMFunctions;

uses
  Vcl.Forms,
  PCM.Functions.AppInfo in 'PCM.Functions.AppInfo.pas' {frm_PCM_InfoApp},
  PCM.Functions.ChangePW in 'PCM.Functions.ChangePW.pas' {frm_PCM_ChangePW},
  PCM.Functions.ChangePW.SQL in 'PCM.Functions.ChangePW.SQL.pas',
  PCM.Functions.Lizenz in 'PCM.Functions.Lizenz.pas' {frm_PCM_Lizenz},
  PCM.Functions.Login in 'PCM.Functions.Login.pas' {frm_PCM_Login},
  PCM.Functions.Login.SQL in 'PCM.Functions.Login.SQL.pas',
  PCM.Functions in 'PCM.Functions.pas' {frm_PCM_System},
  PCM.Functions.Server.Methods in 'PCM.Functions.Server.Methods.pas',
  PCM.Functions.Synch.ProgressDialog in 'PCM.Functions.Synch.ProgressDialog.pas' {frmProgressDialog},
  PCM.Functions.Synch.Transparenz in 'PCM.Functions.Synch.Transparenz.pas' {frmTransparenz},
  PCM.Functions.Synch.Wait in 'PCM.Functions.Synch.Wait.pas',
  PCM.Functions.Languages in 'PCM.Functions.Languages.pas' {frm_Language};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_PCM_InfoApp, frm_PCM_InfoApp);
  Application.CreateForm(Tfrm_PCM_ChangePW, frm_PCM_ChangePW);
  Application.CreateForm(Tfrm_PCM_Lizenz, frm_PCM_Lizenz);
  Application.CreateForm(Tfrm_PCM_Login, frm_PCM_Login);
  Application.CreateForm(Tfrm_PCM_System, frm_PCM_System);
  Application.CreateForm(TfrmProgressDialog, frmProgressDialog);
  Application.CreateForm(TfrmTransparenz, frmTransparenz);
  Application.CreateForm(Tfrm_Language, frm_Language);
  Application.Run;
end.
