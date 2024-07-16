unit PCM.Handbuch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge, system.IOUtils, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinWXI, dxSkinXmas2008Blue, cxContainer, cxEdit,
  cxGroupBox, cxPC, System.ImageList, Vcl.ImgList, cxImageList,PCM.Browser;

type
  Tfrm_Handbuch = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxImageList1: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    FWebBrowser: TAbstractWebBrowser;
    procedure InitializeBrowser(AParent: TWinControl);
  end;

var
  frm_Handbuch: Tfrm_Handbuch;

implementation

{$R *.dfm}

uses
  PCM.Data,
  PCM.Browser.FullScreen;

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

procedure Tfrm_Handbuch.cxPageControl1Change(Sender: TObject);
begin
  if cxPageControl1.ActivePage = cxTabSheet2 then
  begin
    InitializeBrowser(cxTabSheet2);
    FWebBrowser.Navigate(TPath.GetDirectoryName(Application.ExeName) + '\' + PCM_Logname + '.pdf');
  end
  else begin
    InitializeBrowser(cxTabSheet1);
    FWebBrowser.Navigate(TPath.GetDirectoryName(Application.ExeName) + '\' + PCM_Logname + '.htm');
  end;
end;

procedure Tfrm_Handbuch.FormShow(Sender: TObject);
begin
  InitializeBrowser(cxTabSheet2);
end;

end.
