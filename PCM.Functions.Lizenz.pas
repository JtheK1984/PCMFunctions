unit PCM.Functions.Lizenz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels,FireDac.Stan.Param,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, cxButtons, System.ImageList,System.uitypes,
  Vcl.ImgList,inifiles, dxSkinMetropolisDark, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxImage, cxLabel, cxGroupBox;

type
  Tfrm_PCM_Lizenz = class(TForm)
    btn_SaveLicence: TcxButton;
    btn_LizenzCancel: TcxButton;
    edt_kunde: TcxTextEdit;
    edt_lizenz: TcxTextEdit;
    pnl_main: TcxGroupBox;
    lbl_Kunde: TcxLabel;
    lbl_lizenz: TcxLabel;
    img_PCManagerLogin_Image: TcxImage;
    pnl_Lizenz: TcxGroupBox;
    procedure AbbrechenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_lizenzChange(Sender: TObject);
    procedure btn_SaveLicenceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    arrbolBitMatrix: array[0..96] of Boolean;
    sVersion, str_version: String;
    function Check: Boolean;
    function GetAppVersion: string;
  end;

var
  frm_PCM_Lizenz: Tfrm_PCM_Lizenz;

implementation

{$R *.dfm}

uses  PCM.Data,
      PCM.Strings;

function Tfrm_PCM_Lizenz.GetAppVersion: string;
var
  dwdVerInfoSize: DWord;
  poiVerInfo: Pointer;
  dwdVerValueSize: DWord;
  ffiVerValue: PVSFixedFileInfo;
  dwdDummy: DWord;
begin
  Result := '';
  dwdVerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), dwdDummy);
  if dwdVerInfoSize = 0 then
    exit;
  GetMem(poiVerInfo, dwdVerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, dwdVerInfoSize, poiVerInfo);
  VerQueryValue(poiVerInfo, '\', Pointer(ffiVerValue), dwdVerValueSize);
  with ffiVerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + IntToStr(dwFileVersionMS and $FFFF);
    str_Version:= Result;
  end;
  FreeMem(poiVerInfo, dwdVerInfoSize);
end;
function Tfrm_PCM_Lizenz.Check: Boolean;
var
  sFirma, sNummer: string;
  bDemo: boolean;
  datGueltig,datCurrDate: Tdate;
  iProgramm: integer;
  iGeburtTagMonat: integer;
  iGeburtjahr: integer;
  iDevjahr: integer;

  procedure MakeBitMatrix;
  var
    i, j, v, addr: Integer;
    mask: Integer;
    c: Char;
  begin
    for i := 1 to Length(sNummer) do
    begin
      // Zeichen umwandeln in Zahl
      c := sNummer[i];

      if (c >= '0') and (c <= '9') then
        v := Ord(c) - 48
      else
        v := Ord(c) - 65 + 10;

      mask := 1;
      for j := 0 to 4 do
      begin
        addr := (i - 1) * 5 + j;
        if addr <= High(arrbolBitMatrix) then
        begin
          if (v and mask) <> 0 then
            arrbolBitMatrix[addr] := True
          else
            arrbolBitMatrix[addr] := False;
        end;
        mask := mask * 2;
      end;
    end;
  end;

  function MakeString(Length: Integer): string;
  var
    i, j, n, v, mask, addr: Integer;
  begin
    n := (Length + 4) div 5;
    Result := '';

    for i := 0 to n - 1 do
    begin
      // Wert von 5 Bits holen
      v := 0;
      mask := 1;
      for j := 0 to 4 do
      begin
        addr := i * 5 + j;
        if addr >= Length then
          Break;
        if arrbolBitMatrix[i * 5 + j] then
          v := v or mask;
        mask := mask * 2;
      end;

      // in Buchstabe wandeln
      if (v >= 0) and (v <= 9) then
        Result := Result + Chr(v + 48)
      else
        Result := Result + Chr((v - 10) + 65);
    end;
    Result := Result;
  end;

  procedure ByteCrc(data: Byte; var crc: Word);
  var
    i: Byte;
  begin
    for i := 0 to 7 do
    begin
      if ((data and $01) xor (crc and $0001) <> 0) then
      begin
        crc := crc shr 1;
        crc := crc xor $A001;
      end
      else
        crc := crc shr 1;
      data := data shr 1;
    end;
  end;

  function StringCrc16(s: string): Word;
  var
    len, i: integer;
  begin
    result := 0;
    len := length(s);
    for i := 1 to len do
      bytecrc(ord(s[i]), result);
  end;

  function GetBits(Position, Length: Integer): Integer;
  var
    i: Integer;
    mask: Integer;
  begin
    Result := 0;
    mask := 1;

    for i := Position to Position + Length - 1 do
    begin
      if arrbolBitMatrix[i] then
        Result := Result or mask;
      mask := mask * 2;
    end;
  end;

  function CheckCheckSum: Boolean;
  var
    v, chk: Integer;
  begin
    v := StringCrc16(sFirma + sVersion + MakeString(Length(arrbolBitMatrix) -16 ));
    chk := GetBits(High(arrbolBitMatrix) - 15, 16);
    Result := v = chk;
  end;

  procedure ScrambleBits;
  var
    i, v, mask: Integer;
  begin
    mask := 1;
    v := StringCrc16(sFirma);

    for i := 0 to High(arrbolBitMatrix) do
    begin
      if i mod 16 = 0 then
        mask := 1
      else
        mask := mask * 2;
      arrbolBitMatrix[i] := (v and mask <> 0) xor (arrbolBitMatrix[i]);
    end;
  end;

begin
  Result := False;
  sFirma := edt_kunde.Text;
  sNummer := StringReplace(edt_lizenz.text,'-','',[rfReplaceAll]);

  // Überprüfe Länge
  if Length(sNummer) <> 20 then Exit;

  MakeBitMatrix;
  ScrambleBits;

  Result := CheckCheckSum;

  dm_PCM.bNewLiceneCheck:= false;

  if Result then
  begin
    bDemo := Boolean(GetBits(0, 1));
    dm_pcm.bdemo:= bdemo;
    iProgramm := GetBits(1, 8);
    if iProgramm <> PCM_Programmnummer then
    begin
      MessageDlg(rs_PCM_LizenzFalsch,mtwarning,[mbok],0);
      exit;
    end;
    iGeburtTagMonat:= GetBits(17,16);
    if iGeburtTagMonat <> 2402 then
    begin
      MessageDlg(rs_PCM_LizenzFalsch,mtwarning,[mbok],0);
      exit;
    end;

    iGeburtJahr:= GetBits(33, 16);
    if iGeburtJahr <> 1984 then
    begin
      MessageDlg(rs_PCM_LizenzFalsch,mtwarning,[mbok],0);
      exit;
    end;

    iDevJahr:= GetBits(49, 16);
    if iDevJahr <> 2015 then
    begin
      MessageDlg(rs_PCM_LizenzFalsch,mtwarning,[mbok],0);
      exit;
    end;

    datGueltig:= EncodeDate(2005, 1, 1) + GetBits(65, 16);
    if bdemo then
    begin
      datCurrDate := StrToDate(DateToStr(Now));
      if datGueltig < datCurrDate then
      begin
        MessageDlg(rs_PCM_LizenzAbgelaufen,mtwarning,[mbok],0);
        exit;
      end
      else begin
        MessageDlg(rs_PCM_Demolizenz1 + DateToStr(datGueltig) ,mtInformation,[mbok],0);
      end;
    end;
    dm_PCM.dtGueltig:= datGueltig;
    dm_PCM.bNewLiceneCheck:= true;
    dm_PCM.qry_Work.SQL.Text:= 'Delete From ' + PCM_Connectionname + '_lizenz';
    dm_PCM.qry_Work.ExecSQL;
    dm_PCM.qry_Work.SQL.Text:= 'INSERT INTO ' + PCM_Connectionname + '_lizenz (Benutzer, Lizenz) Values (:Kunde,:Lizenz)';
    dm_PCM.qry_Work.ParamByName('Kunde').AsString:= edt_kunde.Text;
    dm_PCM.qry_Work.ParamByName('Lizenz').AsString:= edt_lizenz.Text;
    dm_PCM.qry_Work.ExecSQL;
  end
  else begin
    MessageDlg(rs_PCM_LizenzFalsch,mtwarning,[mbok],0);
    exit;
  end;
  frm_PCM_Lizenz.Close;
end;
procedure Tfrm_PCM_Lizenz.edt_lizenzChange(Sender: TObject);
begin
  if Length(edt_lizenz.text) < 23 then
    btn_SaveLicence.Enabled:= false
  else
    btn_SaveLicence.Enabled:= true;
end;
procedure Tfrm_PCM_Lizenz.FormCreate(Sender: TObject);
begin
  dm_PCM.bAppTerm:= true;
end;
procedure Tfrm_PCM_Lizenz.FormShow(Sender: TObject);
var
  f: textfile;
  text:String;
begin
  btn_SaveLicence.optionsimage.images:= dm_PCM.imglst_16x16;
  btn_LizenzCancel.optionsimage.images:= dm_PCM.imglst_16x16;
  sVersion:= GetAppVersion;
  caption:= PCM_Programmname + rs_PCM_Lizenz;
  if FileExists(ExtractFilepath(Paramstr(0)) + PCM_Logname + '_Lizenz.liz') then
  begin
    if MessageDlg(rs_PCM_TestLizenz,
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      AssignFile(f,ExtractFilepath(Paramstr(0)) + PCM_Logname + '_Lizenz.liz');
      Reset(f);
      while not Eof(f) do
      begin
        ReadLn(f, text);
        frm_PCM_Lizenz.caption:= PCM_Programmname + rs_PCM_LizenzGueltig + text;
        ReadLn(f, text);
        edt_kunde.Text:= text;
        ReadLn(f, text);
        edt_lizenz.Text:= text;
        btn_SaveLicence.Enabled:= true;
        btn_SaveLicence.SetFocus;
      end;
    end;
  end;
end;
procedure Tfrm_PCM_Lizenz.AbbrechenClick(Sender: TObject);
begin
  if not dm_PCM.bAppTerm then
    Close
  else
    Application.Terminate;
end;
procedure Tfrm_PCM_Lizenz.btn_SaveLicenceClick(Sender: TObject);
begin
  if edt_kunde.Text = '' then
  begin
    MessageDlg(rs_PCMLizenzgenerator_MessageKundenname, mtwarning,[mbok],0);
    exit;
  end;

  if edt_Lizenz.Text = '' then
  begin
    MessageDlg(rs_PCM_LizenzEintragen, mtwarning,[mbok],0);
    exit;
  end;
  Check;
end;

end.


