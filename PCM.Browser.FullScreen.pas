unit PCM.Browser.FullScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,PCM.Browser;

type
  Tfrm_Browser_FullScreen = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    FWebBrowser: TAbstractWebBrowser;
    function Execute(const AShowModal: Boolean; ALabel, AUrl: String): boolean;
  end;

var
  frm_Browser_FullScreen: Tfrm_Browser_FullScreen;

implementation

{$R *.dfm}

uses uWvLoader;
{ Tfrm_Browser_FullScreen }

function Tfrm_Browser_FullScreen.Execute(const AShowModal: Boolean; ALabel, AUrl: String) : boolean;
//var
//  FWebBrowser: TAbstractWebBrowser;
begin
  Result:= falSe;
  frm_Browser_FullScreen.caption:= ALabel;
  FWebBrowser.Navigate(AURL);
  if modalresult = mrok then
    Result:= true;
  if AShowModal then
  begin
    ShowModal;
  end;
end;

procedure Tfrm_Browser_FullScreen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure Tfrm_Browser_FullScreen.FormCreate(Sender: TObject);
begin
    FWebBrowser := TWebBrowserFactory.CreateWebBrowser(Self);
    FWebBrowser.Parent := frm_Browser_FullScreen;
    FWebBrowser.Align := alClient;
    FWebBrowser.OnBeforeNavigate := nil;
end;

end.
