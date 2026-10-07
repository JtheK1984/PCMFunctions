unit PCM.SendMail;

interface

uses
  {$Region Uses}
  cxButtons,
  cxClasses,
  cxContainer,
  cxControls,
  cxEdit,
  cxGraphics,
  cxGroupBox,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxTextEdit,
  Data.DB,
  dxBar,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  dxLayoutcxEditAdapters,
  dxUIAClasses,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  IdMessage,
  IdMessageClient,
  IdSMTP,
  IdSMTPBase,
  IdSASL.OAuth.Base,
  IdSASLCollection,
  IdSSL,
  IdSSLOpenSSL,
system.JSON,
  PCMManager.Helper.Email.OAuth,
  Shellapi,
  System.Classes,
  System.Net.URLClient,
  System.NetEncoding,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  IdGlobal,
  Vcl.StdCtrls, Vcl.Dialogs,
  IdText,

                          System.IOUtils,
                          mshtml,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Winapi.Messages,
  Winapi.Windows, IdContext, IdCustomHTTPServer, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdHTTPServer, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, Winapi.ActiveX, Vcl.OleCtrls,
  uWVBrowser, uWVWinControl, uWVWindowParent, uWVTypes, uWVConstants, uWVTypeLibrary,
  uWVLibFunctions, uWVLoader, uWVInterfaces, uWVCoreWebView2Args,
  uWVBrowserBase;

  {$EndRegion Uses}
type
  {$Region type}
  TAuthType = class of TIdSASLOAuthBase;
  TMailProviderInfo = record
    AuthenticationType : TAuthType;
    AuthorizationEndpoint : string;
    AccessTokenEndpoint : string;
    LogoutEndpoint : string;
    ClientID : String;
    ClientSecret : string;
    ClientAccount : string;
    ClientName : string;
    Scopes : string;
    SmtpHost : string;
    SmtpPort : Integer;
    PopHost : string;
    PopPort : Integer;
    ImapHost : string;
    ImapPort : Integer;
    AuthName : string;
    TLS : TIdUseTLS;
    TwoLinePOPFormat: Boolean;
    function TokenName: string;
  end;
  Tfrm_Sendmail = class(TForm)
    brmgr_Mail: TdxBarManager;
    btn_An: TcxButton;
    btn_BCC: TcxButton;
    btn_CC: TcxButton;
    btn_Send: TcxButton;
    btn_Von: TcxButton;
    dxBarButton1: TdxBarButton;
    edt_An: TcxTextEdit;
    edt_BCC: TcxTextEdit;
    edt_Betreff: TcxTextEdit;
    edt_CC: TcxTextEdit;
    edt_Von: TcxTextEdit;
    lactrl_Mail: TdxLayoutControl;
    lagrp_Mail: TdxLayoutGroup;
    lagrp_MailAdresses: TdxLayoutGroup;
    lagrp_MailAn: TdxLayoutGroup;
    lagrp_MailBCC: TdxLayoutGroup;
    lagrp_MailBetreff: TdxLayoutGroup;
    lagrp_MailCC: TdxLayoutGroup;
    lagrp_MailHeader: TdxLayoutGroup;
    lagrp_MailMail: TdxLayoutGroup;
    lagrp_MailRoot: TdxLayoutGroup;
    lagrp_MailVon: TdxLayoutGroup;
    laitm_Browser: TdxLayoutItem;
    laitm_MailAnBtn: TdxLayoutItem;
    laitm_MailAnEdt: TdxLayoutItem;
    laitm_MailBccBtn: TdxLayoutItem;
    laitm_MailBCCEdt: TdxLayoutItem;
    laitm_MailBetreffEdt: TdxLayoutItem;
    laitm_MailBetreffLbl: TdxLayoutLabeledItem;
    laitm_MailCCBtn: TdxLayoutItem;
    laitm_MailCCEdt: TdxLayoutItem;
    laitm_MailSend: TdxLayoutItem;
    laitm_MailVonBtn: TdxLayoutItem;
    laitm_MailVonEdt: TdxLayoutItem;
    pnl_Browser: TcxGroupBox;
    ppm_Von: TdxBarPopupMenu;
    qry_Work: TFDQuery;
    qry_WorkAbsender: TStringField;
    qry_WorkBild: TBlobField;
    qry_WorkBreite: TIntegerField;
    qry_WorkEMail: TStringField;
    qry_WorkGruss: TStringField;
    qry_WorkHoehe: TIntegerField;
    qry_WorkID: TFDAutoIncField;
    qry_WorkID_Emailkonfiguration: TIntegerField;
    qry_WorkLeerzeilenNachAdresse: TIntegerField;
    qry_WorkLeerzeilenNachBild: TIntegerField;
    qry_WorkLeerzeilenNachGruss: TIntegerField;
    qry_WorkLeerzeilenNachMail: TIntegerField;
    qry_WorkLeerzeilenNachName: TIntegerField;
    qry_WorkLeerzeilenVorGruss: TIntegerField;
    qry_WorkMobil: TStringField;
    qry_WorkName: TStringField;
    qry_WorkPfadBild: TStringField;
    qry_WorkPLZ_Ort: TStringField;
    qry_WorkStrase: TStringField;
    qry_WorkTelefon: TStringField;
    qry_WorkText: TMemoField;
    IdHTTPServer1: TIdHTTPServer;
    IDSMTP_Mail: TIdSMTP;
    IdSSLIOHandlerSocketSMTP: TIdSSLIOHandlerSocketOpenSSL;
    WVWindowParent1: TWVWindowParent;
    WVBrowser1: TWVBrowser;
    procedure btn_SendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChangeMail(Sender: TObject);
    procedure btn_AnClick(Sender: TObject);
    procedure WVBrowser1AfterCreated(Sender: TObject);
    procedure WVBrowser1ExecuteScriptCompleted(Sender: TObject; aErrorCode: HRESULT; const aResultObjectAsJson: wvstring; aExecutionID: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
    FAccountID: Integer;
    FWorkingPath: string;
    FShown, FSendPending: Boolean;
    FPendingAccountID: Integer;
    FPendingFrom: string;
    procedure CreateHTMLTEXT(AMail: String; ARefresh: boolean);
  public
    { Public-Deklarationen }
    sFrom: String;
    InitialSubject, InitialCC, InitialHTML: string;
    AttachmentFiles: TArray<string>;
    procedure Execute(AFrom,ATo,Anrede: String; AAccountID: Integer = 0);
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_Sendmail: Tfrm_Sendmail;
  {$EndRegion var}
const
  {$Region const}
  clientredirect = 'http://localhost:2132';
  {$EndRegion const}
implementation
{$R *.dfm}
uses
  {$Region Uses}
  IdSASL.OAuth.XOAUTH2,
  PCM.Data,
  PCM.SendMail.Adressbook, PCMManager.Helper.Email.Accounts, IdAttachmentFile, PCMManager.Helper.Email.Content, PCMManager.Helper.Email.TLS;
  {$EndRegion Uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
function TMailProviderInfo.TokenName: string;
begin
  Result := AuthName + 'Token';
end;
procedure Tfrm_Sendmail.CreateHTMLTEXT(AMail: String; ARefresh: boolean);
var HTML, Image: string; Stream: TMemoryStream; Width, Height: Integer;
  function FieldHTML(const Name: string): string;
  begin Result := TNetEncoding.HTML.Encode(qry_Work.FieldByName(Name).AsString); end;
  procedure Spacing(const Name: string);
  var Count: Integer;
  begin
    Count := qry_Work.FieldByName(Name).AsInteger;
    if Count > 100 then Count := 100;
    for var I := 1 to Count do HTML := HTML + '<br>';
  end;
  procedure Line(const Name: string);
  begin
    if qry_Work.FieldByName(Name).AsString <> '' then
      HTML := HTML + '<div style="white-space:pre-wrap">' + FieldHTML(Name) + '</div>' + sLineBreak;
  end;
begin
  HTML := '<html><head><meta charset="utf-8"></head><body>' + sLineBreak +
    '<div style="font-family:Aptos,sans-serif;font-size:16px" contenteditable="true"><br>' +
    InitialHTML + '</div>' + sLineBreak + '<footer>' + sLineBreak;
  qry_Work.Close;
  qry_Work.SQL.Text := 'SELECT * FROM manager_email_signatur WHERE ID_Emailkonfiguration IN ' +
    '(SELECT ID FROM manager_emailkonfiguration WHERE ID=:A AND ID_Benutzer=:U AND Email=:E)';
  qry_Work.ParamByName('A').AsInteger := FAccountID;
  qry_Work.ParamByName('U').AsInteger := dm_PCM.iIDBenutzerPCM;
  qry_Work.ParamByName('E').AsString := AMail;
  qry_Work.Open;
  try
    if not qry_Work.IsEmpty then
    begin
      Spacing('LeerzeilenVorGruss');
      Line('Gruss');
      Spacing('LeerzeilenNachGruss');
      Line('Absender');
      Spacing('LeerzeilenNachName');
      if not qry_WorkBild.IsNull then
      begin
        Stream := TMemoryStream.Create;
        try
          qry_WorkBild.SaveToStream(Stream);
          Stream.Position := 0;
          var Bytes: TBytes;
          SetLength(Bytes, Stream.Size);
          if Stream.Size > 0 then Stream.ReadBuffer(Bytes[0], Stream.Size);
          Image := TNetEncoding.Base64.EncodeBytesToString(Bytes);
          Width := qry_Work.FieldByName('Breite').AsInteger;
          Height := qry_Work.FieldByName('Hoehe').AsInteger;
          if Width <= 0 then Width := 60;
          if Height <= 0 then Height := 60;
          HTML := HTML + '<img alt="Signatur" width="' + IntToStr(Width) + '" height="' + IntToStr(Height) + '" src="data:image/jpeg;base64,' + Image + '">';
        finally Stream.Free; end;
      end;
      Spacing('LeerzeilenNachBild');
      Line('Name');
      Line('Strase');
      Line('PLZ_Ort');
      Spacing('LeerzeilenNachAdresse');
      Line('Telefon');
      Line('Mobil');
      Line('EMail');
      Spacing('LeerzeilenNachMail');
      Line('Text');
    end;
  finally qry_Work.Close; end;
  HTML := HTML + sLineBreak + '</footer>' + sLineBreak + '</body></html>';
  TFile.WriteAllText(FWorkingPath + 'Signatur.html', HTML, TEncoding.UTF8);
  if ARefresh then WVBrowser1.Navigate(FWorkingPath + 'Signatur.html');
end;

procedure Tfrm_Sendmail.Execute(AFrom,ATo,Anrede: String; AAccountID: Integer);
var Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dm_PCM.con_PCM;
    FAccountID := ResolveEmailAccountID(Q, dm_PCM.iIDBenutzerPCM, AFrom, AAccountID);
    Q.SQL.Text := 'SELECT Email FROM manager_emailkonfiguration WHERE ID=:A AND ID_Benutzer=:U';
    Q.ParamByName('A').AsInteger := FAccountID;
    Q.ParamByName('U').AsInteger := dm_PCM.iIDBenutzerPCM;
    Q.Open;
    sFrom := Q.FieldByName('Email').AsString;
  finally Q.Free; end;
  edt_An.Text := ATo;
  edt_CC.Text := InitialCC;
  edt_Betreff.Text := InitialSubject;
  FWorkingPath := IncludeTrailingPathDelimiter(TPath.Combine(TPath.GetTempPath, 'PCM-Mail-' + TGUID.NewGuid.ToString));
  ForceDirectories(FWorkingPath);
  if ShowModal = mrOk then
    close;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Browserfunktionen                                                          //
////////////////////////////////////////////////////////////////////////////////
{$Region Browserfunktionen}
procedure Tfrm_Sendmail.WVBrowser1AfterCreated(Sender: TObject);
begin
  WVWindowParent1.UpdateSize;
  WVWindowParent1.SetFocus;
end;
procedure Tfrm_Sendmail.WVBrowser1ExecuteScriptCompleted(Sender: TObject; aErrorCode: HRESULT;
  const aResultObjectAsJson: wvstring; aExecutionID: Integer);
var JSON: TJSONValue; HTML: string; Q: TFDQuery; SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL; Msg: TIdMessage;
  Auth: TEnhancedOAuth2Authenticator; SASL: TIdSASLListEntry;
  SentBackup: string;
begin
  if aExecutionID = 2 then
  begin
    JSON := TJSONObject.ParseJSONValue(aResultObjectAsJson);
    try
      if (aErrorCode < 0) or not (JSON is TJSONString) then
        raise Exception.Create('Der Entwurf konnte vor dem Absenderwechsel nicht gelesen werden.');
      InitialHTML := JSON.Value;
    finally JSON.Free; end;
    FAccountID := FPendingAccountID;
    edt_Von.Text := FPendingFrom;
    CreateHTMLTEXT(FPendingFrom, True);
    Exit;
  end;
  if aExecutionID <> 1 then Exit;
  FSendPending := False;
  btn_Send.Enabled := True;
  if aErrorCode < 0 then raise Exception.Create('Der Nachrichtentext konnte nicht gelesen werden.');
  JSON := TJSONObject.ParseJSONValue(aResultObjectAsJson);
  try
    if not (JSON is TJSONString) then raise Exception.Create('Der Nachrichtentext ist noch nicht bereit.');
    HTML := JSON.Value;
  finally JSON.Free; end;
  if Trim(edt_An.Text) = '' then raise Exception.Create('Bitte einen Empfänger eintragen.');
  Q := TFDQuery.Create(nil);
  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  Auth := TEnhancedOAuth2Authenticator.Create(nil);
  try
    Q.Connection := dm_PCM.con_PCM;
    Q.SQL.Text := 'SELECT * FROM manager_emailkonfiguration WHERE ID=:A AND ID_Benutzer=:U AND Email=:E';
    Q.ParamByName('A').AsInteger := FAccountID;
    Q.ParamByName('U').AsInteger := dm_PCM.iIDBenutzerPCM;
    Q.ParamByName('E').AsString := edt_Von.Text;
    Q.Open;
    if Q.IsEmpty then raise Exception.Create('Das gewählte E-Mail-Konto ist nicht mehr vorhanden.');
    SMTP.Host := Q.FieldByName('PostAusgangsserver').AsString;
    SMTP.Port := Q.FieldByName('PortAusgangsserver').AsInteger;
    SMTP.Username := Q.FieldByName('Benutzer').AsString;
    SMTP.ConnectTimeout := 15000;
    SMTP.ReadTimeout := 30000;
    SSL := TIdSSLIOHandlerSocketOpenSSL.Create(SMTP);
    ConfigureEmailTLS(SSL, SMTP.Host);
    SMTP.IOHandler := SSL;
    SMTP.UseTLS := EmailTLSMode(SMTP.Port, (Q.FieldByName('SSLActive').AsString = '1') or
      SameText(Q.FieldByName('SSLActive').AsString, 'true') or (Q.FieldByName('AuthType').AsInteger <> 0));
    if Q.FieldByName('AuthType').AsInteger = 0 then
      SMTP.Password := Q.FieldByName('Passwort').AsString
    else
    begin
      if Q.FieldByName('RefreshToken').AsString = '' then
        raise Exception.Create('Bitte das Konto zuerst in der Konfiguration bei OAuth anmelden.');
      Auth.ClientID := Q.FieldByName('ClientID').AsString;
      Auth.ClientSecret := Q.FieldByName('ClientSecret').AsString;
      Auth.Scope := Q.FieldByName('Scopes').AsString;
      Auth.AccessTokenEndpoint := Q.FieldByName('AccessTokenEndpoint').AsString;
      Auth.RefreshToken := Q.FieldByName('RefreshToken').AsString;
      Auth.RefreshAccessTokenIfRequired;
      SASL := SMTP.SASLMechanisms.Add;
      SASL.SASL := TIdSASLXOAuth.Create(SMTP);
      TIdSASLOAuthBase(SASL.SASL).Token := Auth.AccessToken;
      TIdSASLOAuthBase(SASL.SASL).User := SMTP.Username;
      SMTP.AuthType := satSASL;
      if Auth.RefreshToken <> Q.FieldByName('RefreshToken').AsString then
      begin
        Q.Close;
        Q.SQL.Text := 'UPDATE manager_emailkonfiguration SET RefreshToken=:T WHERE ID=:A AND ID_Benutzer=:U';
        Q.ParamByName('T').AsString := Auth.RefreshToken;
        Q.ParamByName('A').AsInteger := FAccountID;
        Q.ParamByName('U').AsInteger := dm_PCM.iIDBenutzerPCM;
        Q.ExecSQL;
      end;
    end;
    PrepareEmailOutgoing(Msg, edt_Von.Text, edt_An.Text, edt_CC.Text, edt_BCC.Text,
      edt_Betreff.Text, HTML, AttachmentFiles);
    btn_Send.Enabled := False;
    try
      // Retain a local copy if IMAP storage fails after successful delivery.
      Msg.MsgId := '<' + StringReplace(StringReplace(TGUID.NewGuid.ToString, '{', '', []), '}', '', []) + '@pcmmanager.local>';
      SentBackup := TPath.Combine(FWorkingPath, 'Gesendet.eml');
      Msg.SaveToFile(SentBackup);
      SMTP.Connect;
      SMTP.Send(Msg);
      ModalResult := mrOK;
      try
        if not EmailServerSavesSent(SMTP.Host) then
          SaveEmailSent(Q, FAccountID, dm_PCM.iIDBenutzerPCM, Msg);
        System.SysUtils.DeleteFile(SentBackup);
      except
        on E: Exception do
          MessageDlg('Die E-Mail wurde erfolgreich versendet. Die Kopie konnte nicht im Ordner Gesendet gespeichert werden.' +
            sLineBreak + E.Message + sLineBreak + 'Die lokale Kopie liegt unter: ' + SentBackup +
            sLineBreak + 'Bitte die E-Mail nicht erneut versenden.', mtWarning, [mbOK], 0);
      end;
    finally btn_Send.Enabled := True; end;
  finally
    Auth.Free; Msg.Free; SMTP.Free; Q.Free;
  end;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_Sendmail.btn_AnClick(Sender: TObject);
var
  sAN,sCC,sBCC: String;
begin
  Application.CreateForm(Tfrm_AdressBook,frm_AdressBook);
  frm_AdressBook.Execute(True,sAn,sCC,sBCC);
  edt_An.Text:= sAN;
  edt_CC.Text:= sCC;
  edt_BCC.Text:= sBCC;
  if edt_BCC.Text <> '' then
    lagrp_MailBCC.Visible:= true;
end;
procedure Tfrm_Sendmail.btn_SendClick(Sender: TObject);
begin
  if FSendPending then Exit;
  FSendPending := True;
  btn_Send.Enabled := False;
  if not WVBrowser1.ExecuteScript('document.documentElement.outerHTML', 1) then
  begin
    FSendPending := False;
    btn_Send.Enabled := True;
    raise Exception.Create('Der Editor ist noch nicht bereit. Bitte kurz warten.');
  end;
end;
procedure Tfrm_Sendmail.ChangeMail(Sender: TObject);
begin
  if FSendPending then Exit;
  FPendingAccountID := (Sender as TdxBarButton).Tag;
  FPendingFrom := (Sender as TdxBarButton).Caption;
  if not WVBrowser1.ExecuteScript('document.querySelector("[contenteditable]").innerHTML', 2) then
    raise Exception.Create('Der Editor ist noch nicht bereit. Bitte kurz warten.');
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_Sendmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;
procedure Tfrm_Sendmail.FormShow(Sender: TObject);
  procedure CreateMails;
  var
    Item: TdxBarButton;
  begin
    dm_pcm.qry_Work.SQL.Text:= 'SELECT ID, Email FROM manager_emailkonfiguration WHERE ID_Benutzer = :OwnerID ORDER BY ID';
    dm_PCM.qry_Work.ParamByName('OwnerID').AsInteger := dm_PCM.iIDBenutzerPCM;
    dm_pcm.qry_Work.open;
    While not dm_pcm.qry_Work.eof do
    begin
      Item := TdxBarButton.Create(Self);
      Item.Caption := dm_pcm.qry_Work.FieldByName('Email').AsString;
      Item.Tag := dm_PCM.qry_Work.FieldByName('ID').AsInteger;
      Item.OnClick := ChangeMail;
      ppm_Von.ItemLinks.Add.Item := Item;
      dm_pcm.qry_Work.Next;
    end;
    dm_pcm.qry_work.close;
  end;
begin
  if FShown then Exit;
  FShown := True;
  if not Assigned(GlobalWebView2Loader) then GlobalWebView2Loader := TWVLoader.Create(nil);
  if not GlobalWebView2Loader.Initialized then
  begin
    GlobalWebView2Loader.UserDataFolder := GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\CustomCache';
    GlobalWebView2Loader.StartWebView2;
  end;
  CreateMails;

  if sFrom <> '' then
  begin
    edt_Von.Text:= sFrom;
    CreateHTMLTEXT(sFrom,false);
    WVBrowser1.DefaultUrl := FWorkingPath + 'Signatur.html';
  end;
  WVBrowser1.CreateBrowser(WVWindowParent1.Handle);
end;
{$EndRegion Formfunktionen}
end.
