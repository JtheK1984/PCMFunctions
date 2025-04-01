unit PCM.SendMail.Adressbook;

interface

uses
  {$Region uses}
  cxButtonEdit,
  cxButtons,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxMaskEdit,
  cxNavigator,
  cxStyles,
  cxTextEdit,
  Data.DB,
  dxCoreGraphics,
  dxDateRanges,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  dxLayoutcxEditAdapters,
  dxmdaset,
  dxScrollbarAnnotations,
  dxUIAClasses,
  System.Classes,
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
  {$EndRegion uses}
type
  {$Region Type}
  Tfrm_AdressBook = class(TForm)
    btn_Abort: TcxButton;
    btn_An: TcxButton;
    btn_BCC: TcxButton;
    btn_CC: TcxButton;
    btn_Ok: TcxButton;
    btn_Reset: TcxButton;
    DataSource1: TDataSource;
    edt_An: TcxTextEdit;
    edt_BCC: TcxTextEdit;
    edt_CC: TcxTextEdit;
    edt_Suche: TcxTextEdit;
    grd_Adress: TcxGrid;
    grdDBTblView_Adress: TcxGridDBTableView;
    grdDBTblView_AdressMail: TcxGridDBColumn;
    grdDBTblView_AdressName: TcxGridDBColumn;
    grdLvl_Adress: TcxGridLevel;
    lactrl_Adressbook: TdxLayoutControl;
    lactrl_AdressbookGroup_Root: TdxLayoutGroup;
    lagrp_Adressbook: TdxLayoutGroup;
    lagrp_AdressbookAdresses: TdxLayoutGroup;
    lagrp_AdressbookAn: TdxLayoutGroup;
    lagrp_AdressbookBCC: TdxLayoutGroup;
    lagrp_AdressbookBtn: TdxLayoutGroup;
    lagrp_AdressbookCC: TdxLayoutGroup;
    lagrp_AdressbookMain: TdxLayoutGroup;
    lagrp_AdressbookSuche: TdxLayoutGroup;
    laitm_AdressbookAnBtn: TdxLayoutItem;
    laitm_AdressbookAnEdit: TdxLayoutItem;
    laitm_AdressbookBCCBtn: TdxLayoutItem;
    laitm_AdressbookBCCEdit: TdxLayoutItem;
    laitm_AdressbookCancel: TdxLayoutItem;
    laitm_AdressbookCCBtn: TdxLayoutItem;
    laitm_AdressbookCCEdit: TdxLayoutItem;
    laitm_AdressbookGrid: TdxLayoutItem;
    laitm_AdressbookOk: TdxLayoutItem;
    laitm_AdressbookReset: TdxLayoutItem;
    laitm_AdressbookSuche: TdxLayoutItem;
    memData_Mail: TdxMemData;
    memData_MailMail: TStringField;
    memData_MailNachname: TStringField;
    memData_MailName: TStringField;
    memData_MailVorname: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btn_AbortClick(Sender: TObject);
    procedure btn_AnClick(Sender: TObject);
    procedure btn_CCClick(Sender: TObject);
    procedure btn_BCCClick(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure btn_ResetClick(Sender: TObject);
    procedure edt_SuchePropertiesChange(Sender: TObject);
    procedure memData_MailFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure grdDBTblView_AdressCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function Execute(AModal: boolean; out AN, CC, BCC: string): Boolean;
  end;
  {$EndRegion Type}
var
  {$Region var}
  frm_AdressBook: Tfrm_AdressBook;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.SendMail;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
function Tfrm_AdressBook.Execute(AModal: boolean; out AN, CC, BCC: string): Boolean;
  function RecordExists(MemData: TdxMemData; const FieldName, PartialValue: string): Boolean;
  begin
    Result := False;
    MemData.DisableControls; // Prevent UI updates for better performance
    try
      MemData.First;
      while not MemData.Eof do
      begin
        if Pos(PartialValue, MemData.FieldByName(FieldName).AsString) > 0 then
        begin
          Result := True;
          Break;
        end;
        MemData.Next;
      end;
    finally
      MemData.EnableControls; // Re-enable UI updates
    end;
  end;
begin
  edt_an.Text:= frm_Sendmail.edt_an.Text;
  edt_CC.Text:= frm_Sendmail.edt_CC.Text;
  edt_Bcc.Text:= frm_Sendmail.edt_BCC.Text;

  result:= false;
  dm_PCM.qry_Work.SQL.Text:= 'SELECT ID, if(Firma = ''''  OR Firma IS null, CONCAT(Vorname, '' '',Nachname),CONCAT(Vorname,'' '',Nachname, '' - '', Firma )) as NAME,Vorname,Nachname From manager_kontakte order by vorname, nachname asc';
  dm_PCM.qry_Work.open;
  dm_PCM.qry_Work.First;
  memData_Mail.Open;
  while not dm_PCM.qry_Work.EOF do begin
    dm_pcm.qry_work1.SQL.Text:= 'SELECT E_Mail_Privat,E_Mail_Privat1,E_Mail_Zentral,E_Mail_Ges From manager_kontakte Where ID = :ID';
    dm_pcm.qry_work1.ParamByName('ID').AsInteger:= dm_pcm.qry_work.FieldByName('ID').AsInteger;
    dm_pcm.qry_work1.open;
    if dm_pcm.qry_work1.FieldByName('E_Mail_Privat').asString <> '' then
    begin
      if not RecordExists(memData_Mail, 'Mail', dm_pcm.qry_work1.FieldByName('E_Mail_Privat').AsString) then
      begin
        memData_Mail.Append;
        memData_Mail.FieldByName('Name').AsString := dm_pcm.qry_work.FieldByName('Name').AsString;
        memData_Mail.FieldByName('Mail').AsString := dm_pcm.qry_work1.FieldByName('E_Mail_Privat').AsString;
        memData_Mail.FieldByName('Nachname').AsString := dm_pcm.qry_work.FieldByName('Nachname').AsString;
        memData_Mail.FieldByName('Vorname').AsString := dm_pcm.qry_work.FieldByName('Vorname').AsString;
        memData_Mail.Post;
      end;
    end;
    if dm_pcm.qry_work1.FieldByName('E_Mail_Privat1').asString <> '' then
    begin
      if not RecordExists(memData_Mail, 'Mail', dm_pcm.qry_work1.FieldByName('E_Mail_Privat1').AsString) then
      begin
        memData_Mail.Append;
        memData_Mail.FieldByName('Name').AsString := dm_pcm.qry_work.FieldByName('Name').AsString;
        memData_Mail.FieldByName('Mail').AsString := dm_pcm.qry_work1.FieldByName('E_Mail_Privat1').AsString;
        memData_Mail.FieldByName('Nachname').AsString := dm_pcm.qry_work.FieldByName('Nachname').AsString;
        memData_Mail.FieldByName('Vorname').AsString := dm_pcm.qry_work.FieldByName('Vorname').AsString;
        memData_Mail.Post;
      end;
    end;
    if dm_pcm.qry_work1.FieldByName('E_Mail_Zentral').asString <> '' then
    begin
      if not RecordExists(memData_Mail, 'Mail', dm_pcm.qry_work1.FieldByName('E_Mail_Zentral').AsString) then
      begin
        memData_Mail.Append;
        memData_Mail.FieldByName('Name').AsString := dm_pcm.qry_work.FieldByName('Name').AsString;
        memData_Mail.FieldByName('Mail').AsString := dm_pcm.qry_work1.FieldByName('E_Mail_Zentral').AsString;
        memData_Mail.FieldByName('Nachname').AsString := dm_pcm.qry_work.FieldByName('Nachname').AsString;
        memData_Mail.FieldByName('Vorname').AsString := dm_pcm.qry_work.FieldByName('Vorname').AsString;
        memData_Mail.Post;
      end;
    end;
    if dm_pcm.qry_work1.FieldByName('E_Mail_Ges').asString <> '' then
    begin
      if not RecordExists(memData_Mail, 'Mail', dm_pcm.qry_work1.FieldByName('E_Mail_Ges').AsString) then
      begin
        memData_Mail.Append;
        memData_Mail.FieldByName('Name').AsString := dm_pcm.qry_work.FieldByName('Name').AsString;
        memData_Mail.FieldByName('Mail').AsString := dm_pcm.qry_work1.FieldByName('E_Mail_Ges').AsString;
        memData_Mail.FieldByName('Nachname').AsString := dm_pcm.qry_work.FieldByName('Nachname').AsString;
        memData_Mail.FieldByName('Vorname').AsString := dm_pcm.qry_work.FieldByName('Vorname').AsString;
        memData_Mail.Post;
      end;
    end;
    dm_PCM.qry_Work.Next;
  end;
  ShowModal;
  if ModalResult = mrOK then
  begin
    AN:= edt_An.Text;
    CC:= edt_CC.Text;
    BCC:= edt_BCC.Text;
  end;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_AdressBook.btn_ResetClick(Sender: TObject);
begin
  memData_Mail.Filtered:= false;
end;
procedure Tfrm_AdressBook.btn_AnClick(Sender: TObject);
begin
  btn_An.Tag:= 1;
  btn_CC.Tag:= 0;
  btn_BCC.Tag:= 0;
  if edt_AN.Text = '' then
    edt_AN.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
  else
    edt_AN.Text:= edt_AN.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
end;
procedure Tfrm_AdressBook.btn_BCCClick(Sender: TObject);
begin
  btn_An.Tag:= 0;
  btn_CC.Tag:= 0;
  btn_BCC.Tag:= 1;
  if edt_BCC.Text = '' then
    edt_BCC.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
  else
    edt_BCC.Text:= edt_BCC.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
end;
procedure Tfrm_AdressBook.btn_CCClick(Sender: TObject);
begin
  btn_An.Tag:= 0;
  btn_CC.Tag:= 1;
  btn_BCC.Tag:= 0;
  if edt_CC.Text = '' then
    edt_CC.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
  else
    edt_CC.Text:= edt_CC.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
end;
procedure Tfrm_AdressBook.btn_OkClick(Sender: TObject);
begin
  modalresult:= mrOk;
end;
procedure Tfrm_AdressBook.btn_AbortClick(Sender: TObject);
begin
  modalresult:= mrabort;
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Sonstigefunktionen                                                         //
////////////////////////////////////////////////////////////////////////////////
{$Region Sonstigefunktionen}
procedure Tfrm_AdressBook.edt_SuchePropertiesChange(Sender: TObject);
  procedure ApplyFilter;
  begin
    // Enable filtering and assign the OnFilterRecord event
    memData_Mail.OnFilterRecord := memData_MailFilterRecord;
    memData_Mail.Filtered := True;
  end;
begin
  ApplyFilter;
  if Length(edt_Suche.text) = 0 then
    memData_Mail.Filtered:= false;
end;
procedure Tfrm_AdressBook.grdDBTblView_AdressCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  hittest : TcxCustomGridHitTest;
begin
  hittest := grdDBTblView_Adress.GetHitTest(grd_Adress.ScreenToClient(Mouse.CursorPos));
  if hittest.HitTestCode = htCell then
  begin
    if memData_MailMail.AsString <> '' then
    begin
      if btn_An.Tag = 1 then
      begin
        if edt_An.Text = '' then
          edt_An.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
        else
          edt_An.Text:= edt_An.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
      end;
      if btn_CC.Tag = 1 then
      begin
        if edt_CC.Text = '' then
          edt_CC.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
        else
          edt_CC.Text:= edt_CC.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
      end;
      if btn_BCC.Tag = 1 then
      begin
        if edt_BCC.Text = '' then
          edt_BCC.Text := memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')'
        else
          edt_BCC.Text:= edt_BCC.Text + '; ' + memData_MailVorname.asString + ' ' + memData_MailVorname.asString + ' (' + memData_MailMail.asString + ')';
      end;
    end;
  end;
end;
procedure Tfrm_AdressBook.memData_MailFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  FilterValue: string;
begin
  FilterValue := edt_Suche.text;
  Accept := Pos(FilterValue, DataSet.FieldByName('Name').AsString) > 0;
end;
{$EndRegion Sonstigefunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_AdressBook.FormShow(Sender: TObject);
begin
  btn_An.Tag:= 1;
  btn_CC.Tag:= 0;
  btn_BCC.Tag:= 0;
end;
{$EndRegion Formfunktionen}
end.
