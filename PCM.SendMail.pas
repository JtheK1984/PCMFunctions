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
  PCM.Browser,
  System.Classes,
  System.NetEncoding,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;
  {$EndRegion Uses}
type
  {$Region type}
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

    procedure btn_SendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChangeMail(Sender: TObject);
    procedure btn_AnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FWebBrowser: TAbstractWebBrowser;
    procedure CreateHTMLTEXT(AMail: String);
    procedure InitializeBrowser;
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
implementation
{$R *.dfm}
uses
  {$Region Uses}
  PCM.Browser.FullScreen,
  PCM.Data,
  PCM.SendMail.Adressbook,
  uwvLoader;
  {$EndRegion Uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure Tfrm_Sendmail.CreateHTMLTEXT(AMail: String);
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
begin
  slSignatur:=  TStringliSt.Create;
  qry_Work.SQL.Text:= 'SELECT * FROM manager_email_signatur WHERE ID_Emailkonfiguration IN (SELECT ID FROM manager_emailkonfiguration WHERE Email = :EMail)';
  qry_Work.ParamByName('Email').AsString:= AMail;
  qry_Work.open;
  if qry_Work.RecordCount > 0 then
  begin
    slSignatur.Add('<html>');
    slSignatur.Add('	<head></head>');
    slSignatur.Add('		<body contenteditable="true">');
    slSignatur.Add('		<p style="font-family: Aptos, sans-serif; font-size: 16px;"> &nbsp;</p>');
    // LeerZeile vor Gruﬂformel
    for var i := 1 to qry_work.FieldByName('LeerzeilenVorGruss').AsInteger do
        slSignatur.Add('		<br>');
    if qry_work.FieldByName('Gruss').asString <> '' then
      slSignatur.Add('		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Gruss').asString + '</div>');
    // LeerZeile nach Gruﬂformel
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachGruss').AsInteger do    slSignatur.Add('		<br>');
    if qry_work.FieldByName('Absender').asString <> '' then
      slSignatur.Add('		<div style="font-family: Aptos, sans-serif; font-size: 16px;">' + qry_work.FieldByName('Absender').asString  + '</div>');
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
      slSignatur.Add('				<div style="font-family: Aptos, sans-serif; font-size: 12px;"><strong><u>' + qry_work.FieldByName('Name').asString + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></strong></div>');
    // Strasse
    if qry_work.FieldByName('Strase').asString <> '' then
      slSignatur.Add('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('Strase').asString + '</div>');
    // PLZ - Ort
    if qry_work.FieldByName('PLZ_Ort').asString <> '' then
      slSignatur.Add('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">' + qry_work.FieldByName('PLZ_Ort').asString + '</div>');
    // LeerZeile nach Adresse
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachAdresse').AsInteger do
      slSignatur.Add('		<br>');
    // Telefon
    if qry_work.FieldByName('Telefon').asString <> '' then
      slSignatur.Add('				<div style="font-family: Aptos, sans-serif; font-size: 12px;">Telefon:&nbsp; ' + qry_work.FieldByName('Telefon').asString + '</div>');
    // Mobil
    if qry_work.FieldByName('Mobil').asString <> '' then
      slSignatur.Add('						<div style="font-family: Aptos, sans-serif; font-size: 12px;">Mobil:&nbsp;&nbsp;&nbsp;&nbsp; ' + qry_work.FieldByName('Mobil').asString + '</div>');
    // Email
    if qry_work.FieldByName('EMail').asString <> '' then
      slSignatur.Add('						<div style="font-family: Aptos, sans-serif; font-size: 12px;">E-Mail: &nbsp;&nbsp;<a href="mailto:' + qry_work.FieldByName('EMail').asString + '">' + qry_work.FieldByName('EMail').asString + '</a></div>');
    // LeerZeile nach Email
    for var i := 1 to qry_work.FieldByName('LeerzeilenNachMail').AsInteger do
      slSignatur.Add('		<br>');
    // Abschlussformel
  //  for var i := 1 to slSignatur.Count do
  //  begin
  //    slSignatur.Add('		<div style="font-family: Aptos, sans-serif; font-size: 10px;">' + Lines[i] + '</div>');
  //  end;
    slSignatur.Add('	</body>');
    slSignatur.Add('</html>');
    slSignatur.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Signatur.html');
    if Assigned(FWebBrowser) then
      FWebBrowser.Navigate(ExtractFilePath(ParamStr(0)) + 'Signatur.html');
  end;
  qry_Work.Close;
end;
procedure Tfrm_Sendmail.Execute(AFrom,ATo,Anrede: String);
begin
  sFrom:= AFrom;
  if ShowModal = mrOk then
    close;
end;
procedure Tfrm_Sendmail.InitializeBrowser;
begin
  if not Assigned(FWebBrowser) then
  begin
    FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
    FWebBrowser.Parent := pnl_Browser;
    FWebBrowser.Align := alClient;
    FWebBrowser.OnBeforeNavigate := nil;
  end
  else
  begin
    FreeAndNil(FWebBrowser);
    FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
    FWebBrowser.Parent := pnl_Browser;
    FWebBrowser.Align := alClient;
    FWebBrowser.OnBeforeNavigate := nil;
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
  ModalResult := mrOk;
end;
procedure Tfrm_Sendmail.ChangeMail(Sender: TObject);
begin
  edt_Von.Text:=(Sender as TdxBarButton).Caption;
  CreateHTMLTEXT((Sender as TdxBarButton).Caption);
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
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
  CreateMails;
  InitializeBrowser;
  if sFrom <> '' then
  begin
    edt_Von.Text:= sFrom;
    CreateHTMLTEXT(sFrom);
  end;
end;
{$EndRegion Formfunktionen}
end.
