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
  Tfrm_Handbuch = class(TForm)
    cxImageList1: TcxImageList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
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
  frm_Handbuch: Tfrm_Handbuch;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Browser.FullScreen;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
procedure Tfrm_Handbuch.InitializeBrowser(AParent: TWinControl);
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
procedure Tfrm_Handbuch.cxPageControl1Change(Sender: TObject);
begin
  if dxLayoutGroup2.Itemindex = 0 then
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
procedure Tfrm_Handbuch.FormShow(Sender: TObject);
begin
  InitializeBrowser(pnl_PDF);
end;
{$EndRegion Formfunktionen}
end.
