unit PCM.Browser;

interface

uses  uwvLoader,
      uWVBrowser,
      uWVWindowParent,
      Vcl.ExtCtrls,
      System.Classes,
      Winapi.Messages,
      Windows, Graphics,
      ActiveX,
      ComObj,
      Sysutils,
      StrUtils,
      System.Types,
      Vcl.Menus,
      Vcl.Controls,
      IdURI,
      IdGlobal,
      Vcl.Dialogs,
      uWVTypeLibrary;
type
  TOnBeforeNavigate = procedure (ASender: TObject; var URL:WideString; var Cancel: Boolean) of object;
  TOnDocumentComplete = procedure (ASender: TObject; var URL:WideString) of object;
  TOnBrowserMessage = procedure(ASender: TObject; MessageText:WideString) of object;
  TTransformUrlFunc = reference to function(const Url:String):String;

  IUrlProcessor = interface
    ['{74B64008-AD75-4491-A8F3-4BB18A4BFF6E}']
    function TransformUrl(const Url:String):String;
  end;

  TDelegateUrlProcessor = class(TInterfacedObject, IUrlProcessor)
  private
    FTransformProc : TTransformUrlFunc;
  public
    constructor Create(const TransFormUrlFunc:TTransformUrlFunc);
    function TransformUrl(const Url:String):String;
  end;

  TAbstractWebBrowser = class abstract(TWinControl)
  private
    FBeforeNavigate           : TOnBeforeNavigate;
    FDocumentComplete         : TOnDocumentComplete;
    FBrowserMessage           : TOnBrowserMessage;
    FUrlProcessors            : TArray<IUrlProcessor>;
  protected
    FURL                      : WideString;
    FLastCalledURL            : string;
    procedure SetPopupMenu_(AValue:TPopupMenu); virtual; abstract;
    function GetPopupMenu_:TPopupMenu; virtual; abstract;
    procedure WndProc(var Message: TMessage); override;
    function AddEncodeParameter(AURL:String):String;
    function ProcessUrl(const Url:String):String; virtual;
  public
    FPreloadUrl              : String;
    constructor Create(AOwner:TComponent); override;
    function EncodedUrl(AURL:String):String;
    procedure Reset; virtual; abstract;
    procedure Navigate(AURL:WideString; encodeURL : boolean = false; force : boolean = false); virtual; abstract;
    procedure GoForeward; virtual; abstract;
    procedure GoBack; virtual; abstract;
    function Unwrap:Pointer; virtual; abstract;
    procedure RefreshSize; virtual;
    procedure Blur; virtual;
    procedure CheckWicket; virtual;
    procedure Submit; virtual;
    function IsWicket:Boolean; virtual;
    procedure Reload;  virtual; abstract;
    procedure ReCreate;  virtual; abstract;
    function GetBitmap(AWidth, AHeight: Integer): TBitmap;  virtual; abstract;
    procedure RegisterUrlProcessor(const UrlProcessor:IUrlProcessor); virtual;
    procedure UnregisterUrlProcessor(const UrlProcessor:IUrlProcessor); virtual;
    function GetUrlProcessors:TArray<IUrlProcessor>; virtual;
    procedure ShowDevTools(const Value: Boolean); virtual; abstract;
    procedure PrintWithDialog; virtual; abstract;
    procedure SetLocationHash(const HashName:String); virtual; abstract;
    function DevToolsVisible:Boolean; virtual; abstract;
    procedure CloseBrowser(const Force:Boolean); virtual; abstract;
    property PopupMenu:TPopupMenu read GetPopupMenu_ write SetPopupMenu_;
    property URL:WideString read FURL;
    // Ereignisse
    property OnBeforeNavigate : TOnBeforeNavigate read FBeforeNavigate write FBeforeNavigate;
    property OnDocumentComplete : TOnDocumentComplete read FDocumentComplete write FDocumentComplete;
    property OnKeyDown;
    property OnKeyUp;
    property PreloadURL : STring read FPreloadUrl write FPreloadURL;
    procedure SetUrlProcessors(const UrlProcessors:TArray<IUrlProcessor>); virtual;
    destructor Destroy; override;
  published
  end;

  TWebBrowserFactory = class
  private
    class var FBrowserType : Integer;
    class var FWrapperMode : Boolean;
    class var FPreloadUrl : String;
    class var FUrlProcessors            : TArray<IUrlProcessor>;
  public
    class property BrowserType : Integer read FBrowserType write FBrowserType;
    class property WrapperMode : Boolean read FWrapperMode write FWrapperMode;
    class property PreloadUrl : String read FPreloadUrl write FPreloadUrl;

    class constructor Create;
    class function CreateWebBrowser(AOwner:TComponent):TAbstractWebBrowser; overload;
    class function CreateWebBrowser(AOwner:TComponent; ABrowserType:Integer):TAbstractWebBrowser; overload;
    class function CreateWebBrowser(AOwner:TComponent; ABrowserType:Integer; AWrapperMode:Boolean):TAbstractWebBrowser; overload;
    class procedure RegisterUrlProcessor(const UrlProcessor:IUrlProcessor); virtual;
    class procedure UnregisterUrlProcessor(const UrlProcessor:IUrlProcessor); virtual;
    class function GetUrlProcessors:TArray<IUrlProcessor>; virtual;
  end;

  IWebKitInitializationListener = interface
    ['{DFB10371-1E9A-4AD1-9344-60AE708204A2}']

    /// <summary>
    /// Triggered when web kit engine is initialized and/or browser was successfully created. Calling
    /// thread is CefRenderProcess
    /// </summary>
    procedure WebKitInitialized;
  end;

  TWebView2WebBrowser = class(TAbstractWebBrowser)
  private
    var FSearchText               : String;
    var FDevSplitter              : TSplitter;
    var FWebView2Window           : TWVWindowParent;
    var FBrowser                  : TWVBrowser;
    var FFirstURL                 : WideString;
    var FEncodeUrlOnCreate        : Boolean;
    var FPopupMenu                : TPopupMenu;
    var FPageBusHandler           : TObject;
    var FRecreated                : Boolean;
    var FHintWindow               : THintWindow;
    var FHintTimer                : TTimer;
    var FHintText                 : String;
    var FShowProgressAllowed      : Boolean;
    var FWebview2Timer            : TTimer;
//    var FDevTools                 : TWebView2DevTools;
    class var
      FInstanceCount : Cardinal;

  protected
    function GetWebview2Component:TWVBrowser;

    procedure OnTimerShowHint(ASender:TObject);
    procedure OnTimerCreateWebViewWindow(ASender: TObject);
    procedure SetPopupMenu_(AValue:TPopupMenu); override;
    function GetPopupMenu_:TPopupMenu; override;

    procedure CreateHandle; override;
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
  public
    class constructor Create;
    constructor Create(AOwner:TComponent); override;
    procedure onWebView2Created(Sender: TObject);
    procedure BasicAuthenticationRequested(Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2BasicAuthenticationRequestedEventArgs);
    procedure NavigationCompleted(Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2NavigationCompletedEventArgs);
    procedure Reset; override;
    procedure Navigate(AURL:WideString; encodeURL : boolean = false;force : boolean = false); override;
    procedure GoForeward; override;
    procedure GoBack; override;
    function Unwrap:Pointer; override;
    procedure Reload; override;
    procedure ReCreate; override;
    function GetBitmap(AWidth, AHeight: Integer): TBitmap; override;
    procedure ShowDevTools(const Value: Boolean); override;
    procedure SetLocationHash(const HashName:String); override;
    function DevToolsVisible:Boolean; override;
    procedure PrintWithDialog; override;
    procedure CloseBrowser(const Force: Boolean); override;
    destructor Destroy; override;
  published
  end;


//const
//  UNDERSCORE_COMPILATION_UNIT = '_compilationUnit';
//  COMPILATION_UNIT = 'compilationUnit';
//  PAGEBUS_CHANNEL_PING = 'id.webforms.ping';


implementation

constructor TAbstractWebBrowser.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FURL := '';
  FBeforeNavigate := NIL;
  FDocumentComplete := NIL;
  FBrowserMessage := NIL;
  Color := clAppWorkSpace;
  FPreloadUrl := '';
  FLastCalledURL := '';
end;
function TAbstractWebBrowser.GetUrlProcessors: TArray<IUrlProcessor>;
begin
  Result := FUrlProcessors;
end;
procedure TAbstractWebBrowser.UnregisterUrlProcessor(const UrlProcessor: IUrlProcessor);
var
  i : Integer;
  f : Boolean;
begin
  f := False;
  for i := 0 to Length(FUrlProcessors) do begin
    if not f  then begin
      if FUrlProcessors[i] = UrlProcessor then begin
        f := True;
      end;
    end;
    if f then begin
      if (i < Length(FUrlProcessors) -1) then begin
        FUrlProcessors[i] := FUrlProcessors[i+1];
      end;
    end;
  end;
  SetLength(FUrlProcessors, Length(FUrlProcessors)-1);
end;
function TAbstractWebBrowser.EncodedUrl(AURL:String):String;
begin
  // SPZ-3235

  // '##' is interpreted as a '#', which should be encoded
  // '#' is interpreted as anchor
  // '+' will be encoded manually, because is is not an unsafe character in indy
  // '&&' will be interpreted as a '&', which should be encoded

  Result := StringReplace(AURL, '##','__DOUBLEROUTE__', [rfReplaceAll]);
  Result := StringReplace(Result, '+','__PLUS__', [rfReplaceAll]);
  Result := StringReplace(Result, '&&','__DOUBLEAMP__', [rfReplaceAll]);
  // Single hash means anchor / fragment identifier
  Result := StringReplace(Result, '#','__RAUTE__', [rfReplaceAll]);
  // SCR-1740 - Wir arbeiten intern mit UTF-8, also muss das URL-Encoding auch
  // mit UTF-8 arbeiten, sonst kommt Grütze an
  {$IF CompilerVersion >= 24.0}
  Result := TIdURI.URLEncode(Result, IndyTextEncoding(encUTF8));
  {$ELSE}
  Result := TIdURI.URLEncode(Result, TEncoding.UTF8);
  {$IFEND}
  Result := StringReplace(Result, '__DOUBLEAMP__','%26', [rfReplaceAll]);
  Result := StringReplace(Result, '__PLUS__','%2B', [rfReplaceAll]);
  Result := StringReplace(Result, '__DOUBLEROUTE__','%23', [rfReplaceAll]);
  Result := StringReplace(Result, '__RAUTE__','#', [rfReplaceAll]);
end;
procedure TAbstractWebBrowser.RegisterUrlProcessor(const UrlProcessor: IUrlProcessor);
var
  i : Integer;
begin
  for i := 0 to Length(FUrlProcessors)-1 do begin
    if FUrlProcessors[i] = UrlProcessor then
      Exit;
  end;
  SetLength(FUrlProcessors, Length(FUrlProcessors)+1);
  FUrlProcessors[Length(FUrlProcessors)-1] := UrlProcessor;
end;
function TAbstractWebBrowser.ProcessUrl(const Url: String): String;
var
  UrlProcessor : IUrlProcessor;
begin
  Result := Url;
  for UrlProcessor in FUrlProcessors do begin
    Result := UrlProcessor.TransformUrl(Result);
  end;
end;
procedure TAbstractWebBrowser.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_ERASEBKGND:
      if (csDesigning in ComponentState) then
        inherited WndProc(Message);
  else
    inherited WndProc(Message);
  end;
end;
procedure TAbstractWebBrowser.RefreshSize;
begin
  //
end;
function TAbstractWebBrowser.AddEncodeParameter(AURL: String): String;
var
  HashPos : Integer;
begin
   Result := AURL;
   HashPos := Pos('#', Result);
   if HashPos > 0 then begin
     Result := AddEncodeParameter(Copy(Result, 1, HashPos-1)) + Copy(Result, HashPos, Length(Result)-HashPos+1);
   end else begin
     Result := Result + IfThen(pos('?', Result) <= 0, '?', '&');
     Result := Result + 'ENCODED=1';
   end;
end;
procedure TAbstractWebBrowser.Blur;
begin
end;
procedure TAbstractWebBrowser.CheckWicket;
begin
end;
procedure TAbstractWebBrowser.SetUrlProcessors(const UrlProcessors: TArray<IUrlProcessor>);
begin
  FUrlProcessors := UrlProcessors;
end;
procedure TAbstractWebBrowser.Submit;
begin
end;
function TAbstractWebBrowser.IsWicket:Boolean;
begin
  Result := False;
end;
destructor TAbstractWebBrowser.Destroy;
begin
  inherited;
end;

class constructor TWebView2WebBrowser.Create;
begin
  FInstanceCount := 0;
end;
constructor TWebView2WebBrowser.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FSearchText := '';
  FShowProgressAllowed := False;
  FDevSplitter := nil;
//  FDevTools := nil;
  FFirstURL := '';
  // Immer hochzählen
  FEncodeUrlOnCreate := False;
  FRecreated := False;
  FPageBusHandler := NIL;
  FPopupMenu := NIL;
  FBrowser := NIL;
  FWebView2Window := nil;
  FHintText  := '';
  FHintTimer := TTimer.Create(self);
  FHintTimer.Enabled := False;
  FHintWindow := THintWindow.Create(self);
  FHintTimer.OnTimer := OnTimerShowHint;
  // Timer
  FWebview2Timer := TTimer.Create(self);
  FWebview2Timer.Enabled := true;
  FWebview2Timer.Interval := 500;
  FWebview2Timer.OnTimer := OnTimerCreateWebViewWindow;

  Inc(FInstanceCount);
end;
procedure TWebView2WebBrowser.CreateHandle;
begin
 inherited;
  // As soon we have a valid window handle, we ensure that chromium is created
  // and will load the preload url - if specified
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Queue(nil,
        procedure
        begin
          if FPreloadUrl <> '' then begin
            GetWebview2Component.Navigate(FPreloadUrl);
            FPreloadUrl := '';
          end else begin
            // Ensure chromium is created
            GetWebview2Component;
          end;
        end
      );
    end
  ).Start;
end;
procedure TWebView2WebBrowser.OnTimerCreateWebViewWindow;
begin
  FWebview2Timer.Enabled := False;
  if GlobalWebView2Loader.Initialized then
    FBrowser.CreateBrowser(FWebView2Window.Handle)
   else
    FWebview2Timer.Enabled := True;
end;
procedure TWebView2WebBrowser.OnTimerShowHint;
var
  r         : TRect;
  width     : integer;
  height    : integer;
begin
  // Kleiner Zustandsautomat
  // 0 - Tooltip sofort anzeigen
  // 1 - Tooltip verstecken
  case FHintTimer.Tag of
    0 : begin
      if FHintText = '' then begin
        FHintTimer.Enabled := False;
        FHintWindow.ReleaseHandle;
        Exit;
      end;
      FHintTimer.Enabled := False;
      width := FHintWindow.Canvas.TextWidth(FHintText);
      height := FHintWindow.Canvas.TextHeight(FHintText);
      r.Left := Mouse.CursorPos.X + 16;
      r.Top := Mouse.CursorPos.Y + 16;
      r.Right := r.Left + width + 6;
      r.Bottom := r.Top + height + 4;
      FHintWindow.ActivateHint(r, FHintText);
      // Auftrag zum verstecken erteilen...
      FHintTimer.Tag := 1;
      FHintTimer.Interval := 1000;
      FHintTimer.Enabled := True;
      FHintText := '';
    end;
    1 : begin
      FHintTimer.Enabled := False;
      FHintTimer.Tag := 0;
      FHintTimer.Interval := 50;
      FHintWindow.ReleaseHandle;
      FHintText := '';
    end;
    2 : begin
      // Nichts tun
    end;
  end;
end;
procedure TWebView2WebBrowser.BasicAuthenticationRequested(Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2BasicAuthenticationRequestedEventArgs);
var
  Response: ICoreWebView2BasicAuthenticationResponse;
begin
 if Succeeded(aArgs.Get_Response(Response)) then
  begin
    Response.Set_UserName('Jens.Henske@outlook.com');
    Response.Set_Password('JensHenske1984');
  end;
end;
procedure TWebView2WebBrowser.onWebView2Created(Sender: TObject);
begin
  FWebView2Window.UpdateSize;
  FBrowser.CoreWebView2Settings.AreDefaultContextMenusEnabled:= false;
  FBrowser.CoreWebView2Settings.AreBrowserAcceleratorKeysEnabled:= false;
  FBrowser.CoreWebView2Settings.HiddenPdfToolbarItems:= COREWEBVIEW2_PDF_TOOLBAR_ITEMS_FULL_SCREEN +  COREWEBVIEW2_PDF_TOOLBAR_ITEMS_Save;
end;
function TWebView2WebBrowser.GetWebview2Component;
begin
  if FBrowser = nil then
  begin
    FBrowser:= TWVBrowser.Create(Self);
    FBrowser.AllowSingleSignOnUsingOSPrimaryAccount:= false;
    FBrowser.DefaultURL:=   FFirstURL;
    FBrowser.TargetCompatibleBrowserVersion:= '95.0.1020.44';
    FBrowser.OnAfterCreated:=  onWebView2Created;
    FBrowser.OnBasicAuthenticationRequested:= BasicAuthenticationRequested;
    FBrowser.OnNavigationCompleted:= NavigationCompleted;
    FWebView2Window:= TWVWindowParent.Create(Self);
    FWebView2Window.Parent:= Self ;
    FWebView2Window.Align:= alClient;
    FWebView2Window.Height:= 338;
    FWebView2Window.TabStop:= true;

    FWebView2Window.Browser:= FBrowser;
  end;
  Result:= FBrowser;
end;

procedure TWebView2WebBrowser.NavigationCompleted(Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2NavigationCompletedEventArgs);
var
  success: integer;
  sScript: string;
begin
  // Handle navigation completion here
  if aArgs.Get_IsSuccess(success) = 0 then
  begin
    sScript:= 'document.getElementsByName(''L_INTERNAL_LOGINNM_'')[0].value = ''Jens.Henske@outlook.com''; ' +
              'document.getElementsByName(''L_INTERNAL_PASSWRD_'')[0].value = ''Jh2019+1''; ' +
              'let buttons = document.getElementsByTagName(''button''); ' +
              'for (let button of buttons) { ' +
              'if (button.textContent.trim().toLowerCase() === ''login'') { ' +
              '  button.click(); ' +
              '  break; ' +
              '  } ' +
              '}';
    if FBrowser.Source = 'https://pcm-apps.de/.cm4all/auth/index.php/SI_DA2_fa040ad8/aHR0cDovL3BjbS1hcHBzLmRlL1dvcmtwbGFjZT90eG5pZD0/1/1,auth,8,1' then
    FBrowser.ExecuteScript(sScript);
  end

end;
procedure TWebView2WebBrowser.Navigate(AURL:WideString; encodeURL : boolean = false;force : boolean = false);
var
//  Context : TStringList;
//  Cancel  : Boolean;
  Recreate : Boolean;
  ClosureURL : String;
begin
  Recreate := False;
  if (FBrowser <> NIL) then
  begin
    AURL := ProcessUrl(AURL);
    FBrowser.Navigate(AURL);
    FURL := AURL;
    if encodeURL then AURL := AddEncodeParameter(EncodedUrl(FURL));
    FEncodeUrlOnCreate := encodeURL;
    if Recreate then
    begin
      FFirstUrl := AURL;
      FBrowser := nil;
      FreeAndNil(FBrowser);
      GetWebView2Component.Navigate(AURL);
    end
    else begin
      ClosureURL := AURL;
      OutputDebugString(PWideChar('URL from chromium thread :' + ClosureURL));
      TThread.CreateAnonymousThread(
      procedure
      begin
       OutputDebugString(PWideChar('URL from anonymous thread :' + ClosureURL));
       TThread.Queue(nil, procedure begin
         if FBrowser <> nil then
         begin
           FBrowser.Navigate(ClosureURL);
         end;
       end);
      end).Start;
    end;
    FLastCalledURL := AURL;
    FFirstURL := '';
  end
  else
  begin
    FEncodeUrlOnCreate := encodeURL;
    FFirstURL := AURL;
    TThread.CreateAnonymousThread(
    procedure
    begin
     TThread.Queue(nil, procedure begin
       GetWebView2Component.Navigate(AURL);
     end);
    end).Start;
  end;
end;
function TWebView2WebBrowser.GetPopupMenu_:TPopupMenu;
begin
  Result := FPopupMenu;
end;
procedure TWebView2WebBrowser.SetPopupMenu_(AValue:TPopupMenu);
begin
  FPopupMenu := AValue;
end;
procedure TWebView2WebBrowser.WMMove(var aMessage : TWMMove);
begin
  inherited;
  if (FBrowser <> nil) then FBrowser.NotifyParentWindowPositionChanged;
end;
procedure TWebView2WebBrowser.WMMoving(var aMessage : TMessage);
begin
  inherited;
  if (FBrowser <> nil) then
    FBrowser.NotifyParentWindowPositionChanged;
end;
procedure TWebView2WebBrowser.Reset;
begin
  if (FBrowser = NIL) then
    Exit;
  // Neues Control erzeugen
  FURL := '';
  FFirstURL := '';
  FLastCalledURL := '';
  FBrowser := nil;
  GetWebview2Component.RefreshIgnoreCache
end;
procedure TWebView2WebBrowser.GoForeward;
begin
  if (FBrowser <> NIL) then begin
    if (FBrowser.CanGoForward) then begin
      FBrowser.GoForward;
    end;
  end;
end;
procedure TWebView2WebBrowser.GoBack;
begin
  if (FBrowser <> NIL) then begin
    if (FBrowser.CanGoBack) then begin
      FBrowser.GoBack;
    end;
  end;
end;
function TWebView2WebBrowser.Unwrap:Pointer;
begin
  Result := Pointer(FBrowser);
end;
procedure TWebView2WebBrowser.Reload;
begin
  if (Fbrowser <> nil) and (FWebView2Window <> nil) then
    FBrowser.Refresh;
end;
procedure TWebView2WebBrowser.ReCreate;
begin
  FURL := '';
  if (Fbrowser <> nil) and (FWebView2Window <> nil) then
    FBrowser.Stop;
  FPreloadUrl := '';
  FFirstUrl := '';
  FBrowser := nil;
  if (FBrowser <> nil) then
    FreeAndNil(FBrowser);
  GetWebView2Component;
end;
function TWebView2WebBrowser.GetBitmap(AWidth, AHeight: Integer): TBitmap;
begin
  Result := nil;
  if (FBrowser <> NIL) then begin
    Result := TBitmap. Create;
//    CaptureChromiumPicture(GetWebView2Component, AHeight, AWidth, Result);
  end;
end;
procedure TWebView2WebBrowser.CloseBrowser(const Force: Boolean);
begin
end;
procedure TWebView2WebBrowser.ShowDevTools(const Value: Boolean);
begin
  if Value then
  begin
    FBrowser.CoreWebView2.Settings.Set_AreDevToolsEnabled(1);
    GetWebview2Component.OpenDevToolsWindow;
  end
  else begin
    FBrowser.CoreWebView2.Settings.Set_AreDevToolsEnabled(0);
  end;
end;
procedure TWebView2WebBrowser.PrintWithDialog;
begin
  if FBrowser = nil then
    Exit;
  FBrowser.Print;
end;
procedure TWebView2WebBrowser.SetLocationHash(const HashName: String);
begin
  FBrowser.ExecuteScriptWithResult(Format('window.location.href="#%s";', [HashName]));
end;
function TWebView2WebBrowser.DevToolsVisible: Boolean;
begin
    Result := GetWebView2Component.DevToolsEnabled;
end;
destructor TWebView2WebBrowser.Destroy;
begin
  if (Fbrowser <> nil) and (FWebView2Window <> nil) then
  begin
    Fbrowser.Stop;
  end;
  FreeAndNil(Fbrowser);
  FreeAndNil(FPageBusHandler);
  FreeAndNil(FDevSplitter);
//    FreeAndNil(FDevTools);
//    FDownloadProgresses.Free;
  Dec(FInstanceCount);
  inherited;
end;

class function TWebBrowserFactory.CreateWebBrowser(AOwner:TComponent):TAbstractWebBrowser;
begin
  Result := TWebBrowserFactory.CreateWebBrowser(AOwner, BrowserType);
end;
class function TWebBrowserFactory.CreateWebBrowser(AOwner:TComponent; ABrowserType:Integer):TAbstractWebBrowser;
begin
  Result := TWebBrowserFactory.CreateWebBrowser(AOwner, ABrowserType, WrapperMode);
end;
class constructor TWebBrowserFactory.Create;
begin
  SetLength(FUrlProcessors, 0);
  FBrowserType := 2;
  FWrapperMode := False;
  FPreloadUrl := '';
end;
class function TWebBrowserFactory.CreateWebBrowser(AOwner:TComponent; ABrowserType:Integer; AWrapperMode:Boolean):TAbstractWebBrowser;
begin
  Result := TWebView2WebBrowser.Create(AOwner);
  Result.FPreloadUrl := FPreloadUrl;
  Result.SetUrlProcessors(GetUrlProcessors);
end;
class function TWebBrowserFactory.GetUrlProcessors: TArray<IUrlProcessor>;
begin
  Result := FUrlProcessors;
end;
class procedure TWebBrowserFactory.RegisterUrlProcessor(const UrlProcessor: IUrlProcessor);
var
  i : Integer;
begin
  for i := 0 to Length(FUrlProcessors)-1 do begin
    if FUrlProcessors[i] = UrlProcessor then
      Exit;
  end;
  SetLength(FUrlProcessors, Length(FUrlProcessors)+1);
  FUrlProcessors[Length(FUrlProcessors)-1] := UrlProcessor;
end;
class procedure TWebBrowserFactory.UnregisterUrlProcessor(const UrlProcessor: IUrlProcessor);
var
  i : Integer;
  f : Boolean;
begin
  f := False;
  for i := 0 to Length(FUrlProcessors) do begin
    if not f  then begin
      if FUrlProcessors[i] = UrlProcessor then begin
        f := True;
      end;
    end;
    if f then begin
      if (i < Length(FUrlProcessors) -1) then begin
        FUrlProcessors[i] := FUrlProcessors[i+1];
      end;
    end;
  end;
  SetLength(FUrlProcessors, Length(FUrlProcessors)-1);
end;

constructor TDelegateUrlProcessor.Create(const TransFormUrlFunc: TTransformUrlFunc);
begin
  inherited Create;
  FTransformProc := TransFormUrlFunc;
end;
function TDelegateUrlProcessor.TransformUrl(const Url: String): String;
begin
  Result := FTransformProc(Url);
end;



end.
