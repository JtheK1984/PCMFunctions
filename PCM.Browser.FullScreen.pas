unit PCM.Browser.FullScreen;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,PCM.Browser, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  cxSplitter, cxGroupBox, dxUIAClasses;
  {$EndRegion uses}
type
  {$Region uses}
  Tfrm_Browser_FullScreen = class(TForm)
    pnl_D: TcxGroupBox;
    splt_D: TcxSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pnl_DResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    FWebBrowser: TAbstractWebBrowser;
    DevToolsHWND: HWND;
    function Execute(const AShowModal: Boolean; ALabel, AUrl: String): boolean; overload;
    function Execute(const AShowModal: Boolean; ALabel, AUrl: String; ADevTools: boolean; ADevToolsHandle: hwnd): boolean; overload;
  end;
  {$EndRegion uses}
var
  {$Region uses}
  frm_Browser_FullScreen: Tfrm_Browser_FullScreen;
  {$EndRegion uses}
implementation
{$R *.dfm}
uses
  {$Region uses}
  uWvLoader;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Hilfsfunktionen}
function Tfrm_Browser_FullScreen.Execute(const AShowModal: Boolean; ALabel, AUrl: String) : boolean;
begin
  Result:= false;
  pnl_d.Visible:= false;
  splt_D.Visible:= false;
  frm_Browser_FullScreen.caption:= ALabel;
  FWebBrowser.Navigate(AURL);
  if AShowModal then
  begin
    ShowModal;
    if modalresult = mrok then
      Result:= true;
  end;
end;
function Tfrm_Browser_FullScreen.Execute(const AShowModal: Boolean; ALabel, AUrl: String; ADevTools: boolean; ADevToolsHandle: hwnd) : boolean;
var
  DevToolsRect: TRect;
begin
  DevToolsHWND:= ADevToolsHandle;
  pnl_d.Visible:= true;
  splt_D.Visible:= true;
  frm_Browser_FullScreen.caption:= ALabel;
  FWebBrowser.Navigate(AURL);
  GetWindowRect(pnl_d.Handle, DevToolsRect);
  Winapi.Windows.SetParent(DevToolsHWND, pnl_d.Handle);
  SetWindowPos(DevToolsHWND, 0, -8, -31,DevToolsRect.Right - DevToolsRect.Left +16,DevToolsRect.Bottom - DevToolsRect.Top + 39,SWP_NOZORDER);
  Result:= falSe;
  if AShowModal then
  begin
    ShowModal;
    if modalresult = mrok then
      Result:= true;
  end;
end;
{$EndRegion Hilfsfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_Browser_FullScreen.pnl_DResize(Sender: TObject);
var
  DevToolsRect: TRect;
begin
  GetWindowRect(pnl_D.Handle, DevToolsRect);
  SetWindowPos(DevToolsHWND, 0, -8, -31,DevToolsRect.Right - DevToolsRect.Left +16,DevToolsRect.Bottom - DevToolsRect.Top + 39,SWP_NOZORDER);
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_Browser_FullScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if DevToolsHWND <> 0 then
//  begin
//    SendMessage(DevToolsHWND, WM_CLOSE, 0, 0);
//  end;
  ModalResult := mrOk;
end;
procedure Tfrm_Browser_FullScreen.FormCreate(Sender: TObject);
begin
  FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
  FWebBrowser.Parent := frm_Browser_FullScreen;
  FWebBrowser.Align := alClient;
  FWebBrowser.OnBeforeNavigate := nil;
end;
{$EndRegion Formfunktionen}
end.
