unit PCM.Handbuch;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge, system.IOUtils, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxGroupBox, cxPC, System.ImageList, Vcl.ImgList, cxImageList,PCM.Browser,
  cxClasses, dxLayoutLookAndFeels, dxLayoutContainer, dxLayoutControl,
  dxLayoutcxEditAdapters, dxUIAClasses;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_PCM_Handbuch = class(TForm)
    imglst_16x16: TcxImageList;
    lactrl_HandbuchGroup_Root: TdxLayoutGroup;
    lactrl_Handbuch: TdxLayoutControl;
    lagrp_HandbuchTab: TdxLayoutGroup;
    lagrp_HandbuchPDF: TdxLayoutGroup;
    lagrp_HandbuchHtml: TdxLayoutGroup;
    lalaflst_Handbuch: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    laitm_HandbuchPDF: TdxLayoutItem;
    laitm_HandbuchHtml: TdxLayoutItem;
    pnl_HTML: TcxGroupBox;
    pnl_PDF: TcxGroupBox;
    procedure FormShow(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    FWebBrowser: TAbstractWebBrowser;
    procedure InitializeBrowser(AParent: TWinControl);
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_Handbuch: Tfrm_PCM_Handbuch;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Browser.FullScreen,
  PCM.Strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure Tfrm_PCM_Handbuch.InitializeBrowser(AParent: TWinControl);
begin
  if not Assigned(FWebBrowser) then
  begin
    FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
    FWebBrowser.Parent := AParent;
    FWebBrowser.Align := alClient;
    FWebBrowser.OnBeforeNavigate := nil;
  end
  else
  begin
    FreeAndNil(FWebBrowser);
    FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
    FWebBrowser.Parent := AParent;
    FWebBrowser.Align := alClient;
    FWebBrowser.OnBeforeNavigate := nil;
  end;
  FWebBrowser.Navigate(TPath.GetDirectoryName(Application.ExeName) + '\' + PCM_Logname + '.pdf');
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_PCM_Handbuch.cxPageControl1Change(Sender: TObject);
begin
  if lagrp_HandbuchTab.Itemindex = 0 then
  begin
    InitializeBrowser(pnl_PDF);
    FWebBrowser.Navigate(TPath.GetDirectoryName(Application.ExeName) + '\' + PCM_Logname + '.pdf');
  end
  else begin
    InitializeBrowser(pnl_HTML);
    FWebBrowser.Navigate(TPath.GetDirectoryName(Application.ExeName) + '\' + PCM_Logname + '.htm');
  end;
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_Handbuch.FormShow(Sender: TObject);
begin
  lagrp_HandbuchPDF.CaptionOptions.Text:= rs_Function_Handbuch_PDF;
  lagrp_HandbuchHtml.CaptionOptions.Text:= rs_Function_Handbuch_HTML;
  InitializeBrowser(pnl_PDF);
end;
{$EndRegion Formfunktionen}
end.
