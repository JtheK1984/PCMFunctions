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
    FOAuth2_Enhanced : TEnhancedOAuth2Authenticator;
    Provider : TMailProviderInfo;
    function ConvertLineHTML(Aline:String) :String;
    procedure CreateHTMLTEXT(AMail: String; ARefresh: boolean);
    procedure SetupAuthenticator(AQuery: TFDQuery);
  public
    { Public-Deklarationen }
    sFrom: String;
    procedure Execute(AFrom,ATo,Anrede: String);
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
  PCM.SendMail.Adressbook;
  {$EndRegion Uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
function TMailProviderInfo.TokenName: string;
begin
  Result := AuthName + 'Token';
end;
function Tfrm_Sendmail.ConvertLineHTML(Aline:String) :String;
begin
    Result:= StringReplace(ALine, 'ƒ', '&Auml;', [rfReplaceAll]);
    Result:= StringReplace(Result, '‰', '&auml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'À','&Euml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Î','&euml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'œ','&Iuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ô','&iuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, '÷','&Ouml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ˆ','&ouml;', [rfReplaceAll]);
    Result:= StringReplace(Result, '‹','&Uuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, '¸','&uuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ﬂ','&szlig;', [rfReplaceAll]);
    Result:= StringReplace(Result, '¿','&Agrave;', [rfReplaceAll]);
    Result:= StringReplace(Result, '‡','&agrave;', [rfReplaceAll]);
    Result:= StringReplace(Result, '¡','&Aacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, '·','&aacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, '¬','&Acirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, '‚','&Acirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, '«','&Ccedil;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Á','&ccedil;', [rfReplaceAll]);
    Result:= StringReplace(Result, '»','&Egrave;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ë','&egrave;', [rfReplaceAll]);
    Result:= StringReplace(Result, '…','&Eacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'È','&eacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, ' ','&Ecirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Í','&ecirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, '—','&Ntilde;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ò','&ntilde;', [rfReplaceAll]);
    Result:= StringReplace(Result, '“','&Ograve;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ú','&ograve;', [rfReplaceAll]);
    Result:= StringReplace(Result, '”','&Oacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Û','&oacute;', [rfReplaceAll]);
    Result:= StringReplace(Result, '‘','&Ocirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ù','&ocirc;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ı','&otilde;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ü','&Yuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ˇ','&yuml;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ì','&ldquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'î','&rdquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ñ','&bdquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, '´','&laquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ª','&raquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ã','&lsaquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'õ','&rsaquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ë','&lsquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'í','&rsquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ç','&sbquo;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ñ','&quot;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&larr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&uarr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&rarr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&darr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&harr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&varr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&rArr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&hArr;', [rfReplaceAll]);
    Result:= StringReplace(Result, '©','&copy;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Æ','&reg;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ô','&trade;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ß','&sect;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ï','&bull;', [rfReplaceAll]);
    Result:= StringReplace(Result, '∑','&middot;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ñ','&ndash;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ó','&mdash;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ö','&hellip;', [rfReplaceAll]);
    Result:= StringReplace(Result, '®','&uml;', [rfReplaceAll]);
    Result:= StringReplace(Result, '∞','&deg;', [rfReplaceAll]);
    Result:= StringReplace(Result, '°','&iexcl;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'ø','&iquest;', [rfReplaceAll]);
    Result:= StringReplace(Result, '¶','&brvbar;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ä','&euro;', [rfReplaceAll]);
    Result:= StringReplace(Result, '£','&pound;', [rfReplaceAll]);
    Result:= StringReplace(Result, '$','&dollar;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'º','&frac14;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Ω','&frac12;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'æ','&frac34;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&check;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&cross;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&sung;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&hearts;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&bigstar;', [rfReplaceAll]);
    Result:= StringReplace(Result, '?','&phone;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'charset=iso-8859-1', 'charset=utf-8;', [rfReplaceAll]);
    Result:= StringReplace(Result, 'Windows-1252', 'charset=utf-8;', [rfReplaceAll]);
end;
procedure Tfrm_Sendmail.CreateHTMLTEXT(AMail: String; ARefresh: boolean);
  function EncodeImageToBase64(const ImagePath: string) : string;
  var
    InputStream, OutputStream: TMemoryStream;
    Picture: TPicture;
  begin
    InputStream := TMemoryStream.Create;
    OutputStream := TMemoryStream.Create;
    Picture := TPicture.Create;
    try
      Picture.LoadFromFile(ImagePath);
      Picture.SaveToStream(InputStream);
      InputStream.Position := 0;
      TNetEncoding.Base64.Encode(InputStream, OutputStream);
      OutputStream.Position := 0;
      SetString(Result, PAnsiChar(OutputStream.Memory), OutputStream.Size);
    finally
      InputStream.Free;
      OutputStream.Free;
      Picture.Free;
    end;
  end;
var
  iBreite: integer;
  iHoehe: integer;
  slSignatur: TStringliSt;
  slSignaturAbschluss: TStringliSt;
begin
  slSignatur:=  TStringliSt.Create;
  qry_Work.SQL.Text:= 'SELECT * FROM manager_email_signatur WHERE ID_Emailkonfiguration IN (SELECT ID FROM manager_emailkonfiguration WHERE Email = :EMail)';
  qry_Work.ParamByName('Email').AsString:= AMail;
  qry_Work.open;
  if qry_Work.RecordCount > 0 then
  begin
    slSignatur.Add('<html>');
    slSignatur.Add('	<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8;"></head>');
    slSignatur.Add('		<body>');
    slSignatur.Add('		<div style="font-family: Aptos, sans-serif; font-size: 16px;" contenteditable="true"></div>');
    slSignatur.Add('		<footer>');
    // LeerZeile vor Gruﬂformel
    for var i := 1 to qry_work.FieldByName('LeerzeilenVorGruss').AsInteger do
        slSignatur.Add('		<br>');
    if qry_work.FieldByName('Gruss').asString <> '' then
      slSignatur.Add(ConvertLineHTML('		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Gruss').asString + '</div>'));
    // LeerZeile nach Gruﬂformel
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachGruss').AsInteger do    slSignatur.Add('		<br>');
    if qry_work.FieldByName('Absender').asString <> '' then
      slSignatur.Add(ConvertLineHTML('		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Absender').asString  + '</div>'));
    // LeerZeile nach Name
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachName').AsInteger do
      slSignatur.Add('		<br>');

    try
      qry_WorkBild.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
      if FileExists(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg') then
      begin
        if qry_work.FieldByName('Breite').asString = '' then
          iBreite:= 60
        else
          iBreite:= qry_work.FieldByName('Breite').AsInteger;
        if qry_work.FieldByName('Hoehe').asString = '' then
          iHoehe:= 60
        else
          iHoehe:= qry_work.FieldByName('Hoehe').AsInteger;
        slSignatur.Add('				<div style="vertical-align:baseline"><img width="' + IntToSTr(iBreite) +'" height="' + IntToSTr(iHoehe) +'" src="data:image/' + ExtractFileExt(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg') + ';base64,' + EncodeImageToBase64(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg') + '"</div>');
      end;
    except
    end;
    // LeerZeile nach Bild
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachBild').AsInteger do
      slSignatur.Add('		<br>');
    // Name
    if qry_work.FieldByName('Name').asString <> '' then
      slSignatur.Add(ConvertLineHTML('				<div style="font-family: Aptos, sans-serif; font-size: 12px;"><strong><u>' + qry_work.FieldByName('Name').asString + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></strong></div>'));
    // Strasse
    if qry_work.FieldByName('Strase').asString <> '' then
      slSignatur.Add(ConvertLineHTML('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('Strase').asString + '</div>'));
    // PLZ - Ort
    if qry_work.FieldByName('PLZ_Ort').asString <> '' then
      slSignatur.Add(ConvertLineHTML('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('PLZ_Ort').asString + '</div>'));
    // LeerZeile nach Adresse
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachAdresse').AsInteger do
      slSignatur.Add('		<br>');
    // Telefon
    if qry_work.FieldByName('Telefon').asString <> '' then
      slSignatur.Add(ConvertLineHTML('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">Telefon:&nbsp; ' + qry_work.FieldByName('Telefon').asString + '</div>'));
    // Mobil
    if qry_work.FieldByName('Mobil').asString <> '' then
      slSignatur.Add(ConvertLineHTML('						<div style="font-family: Aptos, sans-serif; font-size: 12px;">Mobil:&nbsp;&nbsp;&nbsp;&nbsp; ' + qry_work.FieldByName('Mobil').asString + '</div>'));
    // Email
    if qry_work.FieldByName('EMail').asString <> '' then
      slSignatur.Add(ConvertLineHTML('						<div style="font-family: Aptos, sans-serif; font-size: 12px;">E-Mail: &nbsp;&nbsp;<a href="mailto:' + qry_work.FieldByName('EMail').asString + '">' + qry_work.FieldByName('EMail').asString + '</a></div>'));
    // LeerZeile nach Email
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachMail').AsInteger do
      slSignatur.Add('		<br>');
    // Abschlussformel
    slSignaturAbschluss:= TStringlist.Create;
    slSignaturAbschluss.Text:= qry_work.FieldByName('Text').AsString;
    for var i := 0 to slSignaturAbschluss.Count -1 do
    begin
       slSignatur.Add(ConvertLineHTML('		<div style="font-family: Aptos, sans-serif; font-size: 10px;">' + slSignaturAbschluss.strings[i] + '</div>'));
    end;
    slSignaturAbschluss.free;
    slSignatur.Add('	  </footer>');
    slSignatur.Add('	</body>');
    slSignatur.Add('</html>');
    slSignatur.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.html');
    slSignatur.Free;
  end;
  qry_Work.Close;
  if ARefresh then
    WVBrowser1.Navigate(ExtractFilePath(ParamStr(0)) + 'Signatur.html');
end;
procedure Tfrm_Sendmail.Execute(AFrom,ATo,Anrede: String);
begin
  sFrom:= AFrom;
  if ShowModal = mrOk then
    close;
end;
procedure Tfrm_Sendmail.SetupAuthenticator(AQuery: TFDQuery);
begin
  FOAuth2_Enhanced.ClientID := AQuery.FieldByName('ClientID').AsString;;
  FOAuth2_Enhanced.ClientSecret := AQuery.FieldByName('ClientSecret').AsString;
  FOAuth2_Enhanced.Scope := AQuery.FieldByName('Scopes').AsString;
  FOAuth2_Enhanced.RedirectionEndpoint := clientredirect;
  FOAuth2_Enhanced.AuthorizationEndpoint := AQuery.FieldByName('AuthorizationEndpoint').AsString;
  FOAuth2_Enhanced.AccessTokenEndpoint := AQuery.FieldByName('AccessTokenEndpoint').AsString;
  FOAuth2_Enhanced.RefreshToken := AQuery.FieldByName('Refreshtoken').AsString;
  FOAuth2_Enhanced.AccessToken := '';
  FOAuth2_Enhanced.AccessTokenExpiry := 0;
end;
////////////////////////////////////////////////////////////////////////////////
// Browserfunktionen                                                          //
////////////////////////////////////////////////////////////////////////////////
{$Region Browserfunktionen}
procedure Tfrm_Sendmail.WVBrowser1AfterCreated(Sender: TObject);
begin
  WVWindowParent1.UpdateSize;
  WVWindowParent1.SetFocus;
end;
procedure Tfrm_Sendmail.WVBrowser1ExecuteScriptCompleted(Sender: TObject; aErrorCode: HRESULT; const aResultObjectAsJson: wvstring; aExecutionID: Integer);
  function GetEmails(AAdress: string) : String;
  var
    slAdrees: TStringlist;
    iPos1,iPos2: Integer;
  begin
    Result:= AAdress;
    slAdrees:= TStringlist.Create;
    slAdrees.Delimiter:= ';';
    slAdrees.StrictDelimiter:= True;
    slAdrees.DelimitedText:= AAdress;
    if slAdrees.Count > 0 then
      Result:= '';
    for var i  := 0 to slAdrees.Count -1 do
    begin
     ipos1:= Pos('(',slAdrees.Strings[i]);
     ipos2:= Pos(')',slAdrees.Strings[i]);
     result:= Result + ';' + StringReplace(Copy(slAdrees.Strings[i],ipos1+1,ipos2-2),')','',[rfReplaceAll,rfIgnoreCase]);
    end;
    if (Pos(';',Result) > 0)  and (Pos(';',Result) < 2)  then
      Result:= Copy(Result,2,Length(Result));
    if Result = '' then
      Result:= AAdress;
//    if slAdrees.Count = 1  then
//      Result:= StringReplace(Result,';','',[rfReplaceAll,rfignorecase]);
    slAdrees.Free;
  end;
  procedure MailAuthenticate;
  var
    uri : TURI;
  begin
    uri := TURI.Create(FOAuth2_Enhanced.AuthorizationRequestURI);
    ShellExecute(0,'open',PChar(uri.ToString),nil,nil,0);
  end;
var
  slEmailCOntentOrg: TStringlist;
  slEmailCOntent: TStringlist;
  xoauthSASL : TIdSASLListEntry;
  msgCount : Integer;
  mailboxes : TStringList;
  idSmtpMail: TIdSMTP;
  idSSLIOHndOPSSLPostfach: TIdSSLIOHandlerSocketOpenSSL;
  idmsgMail: TIdMessage;
  idSSLIOHndOPSSLMail: TIdSSLIOHandlerSocketOpenSSL;
  slMail: TStringlist;
  HTMLContent: string;
  FileName: string;
  FileStream: TFileStream;
  TextPart: TIdText;
  bFound: Boolean;
  ImageStream: TMemoryStream;
  Base64Image: string;
  sline: String;
  iBreite: integer;
  iHoehe: integer;
  slSignaturAbschluss: TStringlist;
begin
  HTMLContent := TJSONObject.ParseJSONValue(aResultObjectAsJson).Value;
  slEmailCOntentorg:= TStringlist.Create;
  slEmailCOntent:= TStringlist.Create;
  slEmailCOntentorg.Text:= HTMLContent;
  for var i := 0 to slEmailCOntentorg.Count - 1 do
  begin
    if Pos('<footer>',slEmailCOntentorg.Strings[i]) > 0 then
    begin
      break;
    end;
    if bFound then
    begin
      slEmailCOntent.Add(slEmailCOntentorg.Strings[i]);
    end;
    if Pos('<body>',slEmailCOntentorg.Strings[i]) > 0 then
    begin
      bfound:= true;
    end;
  end;
  slEmailCOntent.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Mail.html',TEncoding.UTF8);
  slEmailCOntent.Free;
  slEmailCOntentOrg.free;

  dm_PCm.qry_work2.SQL.Text:= 'SELECT * From Manager_Emailkonfiguration Where Email = :Email';
  dm_PCm.qry_work2.ParamByName('Email').AsString:= edt_Von.Text;
  dm_PCm.qry_work2.Open;
  if dm_PCm.qry_work2.FieldByName('AuthType').asInteger = 0 then
  begin
    idSmtpMail := TIdSMTP.Create(nil);
    idSSLIOHndOPSSLMail := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
    idSSLIOHndOPSSLMail.SSLOptions.Method:= sslvSSLv23;
    idSSLIOHndOPSSLpostfach := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    idmsgMail := TIdMessage.Create(nil);
    try
      idSmtpMail.Host := dm_pcm.qry_work2.FieldByName('PostAusgangsserver').AsString;
      idSmtpMail.Port := dm_pcm.qry_work2.FieldByName('PortAusgangsserver').AsInteger;
      idSmtpMail.Username := dm_pcm.qry_work2.FieldByName('Benutzer').AsString;
      idSmtpMail.Password := dm_pcm.qry_work2.FieldByName('Passwort').AsString;
      idSSLIOHndOPSSLpostfach.Host := idSmtpMail.Host;
      idSSLIOHndOPSSLpostfach.Port := idSmtpMail.Port;
      idSSLIOHndOPSSLpostfach.SSLOptions.Method := sslvSSLv23;
      idSmtpMail.IOHandler := idSSLIOHndOPSSLpostfach;
      idSmtpMail.UseTLS := utUseRequireTLS;
      idmsgMail.Recipients.EMailAddresses := GetEmails(edt_An.Text);
      if edt_CC.Text <> '' then
        idmsgMail.CCList.EMailAddresses:= GetEmails(edt_CC.Text);
      if edt_BCC.Text <> '' then
        idmsgMail.BCCList.EMailAddresses:= GetEmails(edt_BCC.Text);
      idmsgMail.Subject := edt_Betreff.Text;
      idmsgMail.From.Address := idSmtpMail.Username;
      idmsgMail.ContentType := 'text/html';
      TextPart := TIdText.Create(idmsgMail.MessageParts);
      TextPart.ContentType := 'text/html';
      qry_Work.SQL.Text:= 'SELECT * FROM manager_email_signatur WHERE ID_Emailkonfiguration IN (SELECT ID FROM manager_emailkonfiguration WHERE Email = :EMail)';
      qry_Work.ParamByName('Email').AsString:= edt_Von.Text;
      qry_Work.open;
      sline:= '';
      if qry_Work.RecordCount > 0 then
      begin
       slEmailCOntent:= TStringlist.Create;
        slEmailCOntent.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'mail.html');
        sline:= '<html>' +
        '	<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8;"></head>' +
        '		<body>' + slEmailCOntent.text +
        '		<footer>';
        for var i := 1 to qry_work.FieldByName('LeerzeilenVorGruss').AsInteger do
          sline:= sline + '		<br>';
        if qry_work.FieldByName('Gruss').asString <> '' then
          sline:= sline +'		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Gruss').asString + '</div>';
        for var i := 1 to qry_work.FieldByName('LeerzeilenNachGruss').AsInteger do
          sline:= sline + '		<br>';
        if qry_work.FieldByName('Absender').asString <> '' then
          sline:= sline + '		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Absender').asString  + '</div>';
        for var i := 1 to qry_work.FieldByName('LeerzeilenNachName').AsInteger do
          sline:= sline + '		<br>';
        try
          qry_WorkBild.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
          if FileExists(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg') then
          begin
            if qry_work.FieldByName('Breite').asString = '' then
              iBreite:= 60
            else
              iBreite:= qry_work.FieldByName('Breite').AsInteger;
            if qry_work.FieldByName('Hoehe').asString = '' then
              iHoehe:= 60
            else
              iHoehe:= qry_work.FieldByName('Hoehe').AsInteger;

            qry_WorkBild.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
            ImageStream := TMemoryStream.Create;
            ImageStream.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
            Base64Image := TNetEncoding.Base64.EncodeBytesToString(ImageStream.Memory, ImageStream.Size);
            ImageStream.Free;
            sline:= sline + '				<img width="' + IntToSTr(iBreite) +'" height="' + IntToSTr(iHoehe) +'" src="data:image/jpeg;base64,' + Base64Image + '">' ;
          end;
        except
        end;
        for var i := 1 to qry_work.FieldByName('LeerzeilenNachBild').AsInteger do
          sline:=sline +'		<br>';
        // Name
        if qry_work.FieldByName('Name').asString <> '' then
          sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;"><strong><u>' + qry_work.FieldByName('Name').asString + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></strong></div>';
        // Strasse
        if qry_work.FieldByName('Strase').asString <> '' then
          sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('Strase').asString + '</div>';
        // PLZ - Ort
        if qry_work.FieldByName('PLZ_Ort').asString <> '' then
          sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('PLZ_Ort').asString + '</div>';
        // LeerZeile nach Adresse
        for var i := 1 to qry_work.FieldByName('LeerzeilenNachAdresse').AsInteger do
          sline:=sline + '		<br>';
        // Telefon
        if qry_work.FieldByName('Telefon').asString <> '' then
          sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">Telefon:&nbsp; ' + qry_work.FieldByName('Telefon').asString + '</div>';
        // Mobil
        if qry_work.FieldByName('Mobil').asString <> '' then
          sline:=sline + '						<div style="font-family: Aptos, sans-serif; font-size: 12px;">Mobil:&nbsp;&nbsp;&nbsp;&nbsp; ' + qry_work.FieldByName('Mobil').asString + '</div>';
        // Email
        if qry_work.FieldByName('EMail').asString <> '' then
          sline:=sline + '						<div style="font-family: Aptos, sans-serif; font-size: 12px;">E-Mail: &nbsp;&nbsp;<a href="mailto:' + qry_work.FieldByName('EMail').asString + '">' + qry_work.FieldByName('EMail').asString + '</a></div>';
        // LeerZeile nach Email
        for var i := 1 to qry_work.FieldByName('LeerzeilenNachMail').AsInteger do
          sline:=sline + '		<br>';
        slSignaturAbschluss:= TStringlist.Create;
        slSignaturAbschluss.Text:= qry_work.FieldByName('Text').AsString;
        for var i := 0 to slSignaturAbschluss.Count -1 do
        begin
           sline := sline +'		<div style="font-family: Aptos, sans-serif; font-size: 10px;">' + slSignaturAbschluss.strings[i] + '</div>';
        end;
       slSignaturAbschluss.free;
        sline:=sline + '	  </footer>';
        sline:=sline + '	</body>';
        sline:=sline + '</html>';
        TextPart.Body.Text := ConvertLineHTML(sline);
        slEmailCOntent.free;
      end;
      idSmtpMail.Connect;
      idSmtpMail.Send(idmsgMail);
      idSmtpMail.Disconnect;
    finally
      idmsgMail.Free;
      idSSLIOHndOPSSLpostfach.Free;
      idSmtpMail.Free;
    end;
  end
  else begin
    Provider.AccessTokenEndpoint:=dm_pcm.qry_work2.FieldByName('AccessTokenEndpoint').AsString;
    Provider.AuthenticationType:= TIdSASLXOAuth;
    Provider.AuthName:= 'Microsoft';
    Provider.AuthorizationEndpoint:= dm_pcm.qry_work2.FieldByName('AuthorizationEndpoint').AsString;
    Provider.ClientAccount:= dm_pcm.qry_work2.FieldByName('Benutzer').AsString;
    Provider.ClientID:= dm_pcm.qry_work2.FieldByName('ClientID').AsString;
    Provider.ClientSecret:= dm_pcm.qry_work2.FieldByName('ClientSecret').AsString;
    Provider.ImapHost:= dm_pcm.qry_work2.FieldByName('PostEingangsserver').AsString;
    Provider.ImapPort:= dm_pcm.qry_work2.FieldByName('PortEingangsserver').AsInteger;
    Provider.Scopes:= dm_pcm.qry_work2.FieldByName('Scopes').AsString;
    Provider.SmtpHost:= dm_pcm.qry_work2.FieldByName('PostAusgangsserver').AsString;
    Provider.SmtpPort:= dm_pcm.qry_work2.FieldByName('PortAusgangsserver').AsInteger;
    Provider.TLS:= utUseExplicitTLS;
    if dm_PCm.qry_work2.FieldByName('RefreshToken').AsString = '' then
      MailAuthenticate;
    SetupAuthenticator(dm_PCm.qry_work2);
    FOAuth2_Enhanced.ClientID := Provider.ClientID;
    FOAuth2_Enhanced.ClientSecret := Provider.ClientSecret;
    FOAuth2_Enhanced.RefreshAccessTokenIfRequired;
    if FOAuth2_Enhanced.AccessToken.Length = 0 then
    begin
      Exit;
    end;
    IDSMTP_Mail.Host := Provider.SmtpHost;
    IDSMTP_Mail.UseTLS := Provider.TLS;
    IDSMTP_Mail.Port := Provider.SmtpPort;
    IDSMTP_Mail.IOHandler:= IdSSLIOHandlerSocketSMTP;
    xoauthSASL := IDSMTP_Mail.SASLMechanisms.Add;
    xoauthSASL.SASL := Provider.AuthenticationType.Create(nil);
    TIdSASLOAuthBase(xoauthSASL.SASL).Token := FOAuth2_Enhanced.AccessToken;
    TIdSASLOAuthBase(xoauthSASL.SASL).User := Provider.ClientAccount;
    IdSSLIOHandlerSocketSMTP.SSLOptions.SSLVersions := [sslvTLSv1_2];
    IDSMTP_Mail.Connect;
    IDSMTP_Mail.AuthType := satSASL;
    IDSMTP_Mail.Authenticate;
    idmsgMail := TIdMessage.Create(Self);
    idmsgMail.From.Address := edt_von.Text;
    idmsgMail.Recipients.EMailAddresses := GetEmails(edt_An.Text);
    if edt_CC.Text <> '' then
      idmsgMail.CCList.EMailAddresses:= GetEmails(edt_CC.Text);
    if edt_BCC.Text <> '' then
      idmsgMail.BCCList.EMailAddresses:= GetEmails(edt_BCC.Text);
    idmsgMail.Subject := edt_Betreff.Text;
    idmsgMail.ContentType := 'text/html';
    TextPart := TIdText.Create(idmsgMail.MessageParts);
    TextPart.ContentType := 'text/html';
    qry_Work.SQL.Text:= 'SELECT * FROM manager_email_signatur WHERE ID_Emailkonfiguration IN (SELECT ID FROM manager_emailkonfiguration WHERE Email = :EMail)';
    qry_Work.ParamByName('Email').AsString:= edt_Von.Text;
    qry_Work.open;
    sline:= '';
    if qry_Work.RecordCount > 0 then
    begin
      slEmailCOntent:= TStringlist.Create;
      slEmailCOntent.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'mail.html');
      sline:= '<html>' +
      '	<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8;"></head>' +
      '		<body>' + slEmailCOntent.text +
      '		<footer>';
      for var i := 1 to qry_work.FieldByName('LeerzeilenVorGruss').AsInteger do
        sline:= sline + '		<br>';
      if qry_work.FieldByName('Gruss').asString <> '' then
        sline:= sline +'		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Gruss').asString + '</div>';
      for var i := 1 to qry_work.FieldByName('LeerzeilenNachGruss').AsInteger do
        sline:= sline + '		<br>';
      if qry_work.FieldByName('Absender').asString <> '' then
        sline:= sline + '		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Absender').asString  + '</div>';
      for var i := 1 to qry_work.FieldByName('LeerzeilenNachName').AsInteger do
        sline:= sline + '		<br>';
      try
        qry_WorkBild.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
        if FileExists(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg') then
        begin
          if qry_work.FieldByName('Breite').asString = '' then
            iBreite:= 60
          else
            iBreite:= qry_work.FieldByName('Breite').AsInteger;
          if qry_work.FieldByName('Hoehe').asString = '' then
            iHoehe:= 60
          else
            iHoehe:= qry_work.FieldByName('Hoehe').AsInteger;

          qry_WorkBild.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
          ImageStream := TMemoryStream.Create;
          ImageStream.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Signatur.jpeg');
          Base64Image := TNetEncoding.Base64.EncodeBytesToString(ImageStream.Memory, ImageStream.Size);
          ImageStream.Free;
          sline:= sline + '				<img width="' + IntToSTr(iBreite) +'" height="' + IntToSTr(iHoehe) +'" src="data:image/jpeg;base64,' + Base64Image + '">' ;
        end;
      except
      end;
      for var i := 1 to qry_work.FieldByName('LeerzeilenNachBild').AsInteger do
      sline:=sline +'		<br>';
      // Name
      if qry_work.FieldByName('Name').asString <> '' then
        sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;"><strong><u>' + qry_work.FieldByName('Name').asString + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></strong></div>';
      // Strasse
      if qry_work.FieldByName('Strase').asString <> '' then
        sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('Strase').asString + '</div>';
      // PLZ - Ort
      if qry_work.FieldByName('PLZ_Ort').asString <> '' then
        sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('PLZ_Ort').asString + '</div>';
      // LeerZeile nach Adresse
      for var i := 1 to qry_work.FieldByName('LeerzeilenNachAdresse').AsInteger do
        sline:=sline + '		<br>';
      // Telefon
      if qry_work.FieldByName('Telefon').asString <> '' then
        sline:=sline + '				<div style="font-family: Aptos, sans-serif; font-size: 12px;">Telefon:&nbsp; ' + qry_work.FieldByName('Telefon').asString + '</div>';
      // Mobil
      if qry_work.FieldByName('Mobil').asString <> '' then
        sline:=sline + '						<div style="font-family: Aptos, sans-serif; font-size: 12px;">Mobil:&nbsp;&nbsp;&nbsp;&nbsp; ' + qry_work.FieldByName('Mobil').asString + '</div>';
      // Email
      if qry_work.FieldByName('EMail').asString <> '' then
        sline:=sline + '						<div style="font-family: Aptos, sans-serif; font-size: 12px;">E-Mail: &nbsp;&nbsp;<a href="mailto:' + qry_work.FieldByName('EMail').asString + '">' + qry_work.FieldByName('EMail').asString + '</a></div>';
      // LeerZeile nach Email
      for var i := 1 to qry_work.FieldByName('LeerzeilenNachMail').AsInteger do
        sline:=sline + '		<br>';
      slSignaturAbschluss:= TStringlist.Create;
      slSignaturAbschluss.Text:= qry_work.FieldByName('Text').AsString;
      for var i := 0 to slSignaturAbschluss.Count -1 do
      begin
         sline := sline +'		<div style="font-family: Aptos, sans-serif; font-size: 10px;">' + slSignaturAbschluss.strings[i] + '</div>';
      end;
      slSignaturAbschluss.free;
      sline:=sline + '	  </footer>';
      sline:=sline + '	</body>';
      sline:=sline + '</html>';
      TextPart.Body.Text := ConvertLineHTML(sline);
    end;
//    idmsgMail.Body.text := slEmailCOntent.text;
    IDSMTP_Mail.Connect;
    IDSMTP_Mail.Send(idmsgMail);
    IDSMTP_Mail.Disconnect;
    xoauthSASL.SASL.Free;
  end;
  dm_PCm.qry_work2.Close;
  ModalResult := mrOk;
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
  WVBrowser1.ExecuteScript('document.documentElement.outerHTML');
end;
procedure Tfrm_Sendmail.ChangeMail(Sender: TObject);
begin
  edt_Von.Text:=(Sender as TdxBarButton).Caption;
  CreateHTMLTEXT((Sender as TdxBarButton).Caption, true);
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_Sendmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(WVBrowser1) then
    WVBrowser1.Destroy;
end;
procedure Tfrm_Sendmail.FormShow(Sender: TObject);
  procedure CreateMails;
  var
    Item: TdxBarButton;
  begin
    dm_pcm.qry_Work.SQL.Text:= 'SELECT Email FROM manager_emailkonfiguration';
    dm_pcm.qry_Work.open;
    While not dm_pcm.qry_Work.eof do
    begin
      Item := TdxBarButton.Create(Self);
      Item.Caption := dm_pcm.qry_Work.FieldByName('Email').AsString;
      Item.OnClick := ChangeMail;
      ppm_Von.ItemLinks.Add.Item := Item;
      dm_pcm.qry_Work.Next;
    end;
    dm_pcm.qry_work.close;
  end;
begin
  if GlobalWebView2Loader.Initialized then
    GlobalWebView2Loader.Destroy;
  GlobalWebView2Loader:= TWVLoader.Create(nil);
  GlobalWebView2Loader.UserDataFolder := GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\CustomCache';
  GlobalWebView2Loader.StartWebView2;
  WVBrowser1.CreateBrowser(WVWindowParent1.Handle);
  CreateMails;

  FOAuth2_Enhanced := TEnhancedOAuth2Authenticator.Create(nil);
  if sFrom <> '' then
  begin
    edt_Von.Text:= sFrom;
    CreateHTMLTEXT(sFrom,false);
    WVBrowser1.DefaultUrl:= ExtractFilePath(ParamStr(0)) + 'Signatur.html';
  end;


end;
{$EndRegion Formfunktionen}
end.
