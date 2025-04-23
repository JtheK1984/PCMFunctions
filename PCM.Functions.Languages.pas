unit PCM.Functions.Languages;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons,StrUtils,inifiles, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, dxLayoutControl, dxLayoutLookAndFeels,
  dxUIAClasses,shellapi;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_Language = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    cxButton1: TcxButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_Language: Tfrm_Language;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Main;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_Language.cxButton1Click(Sender: TObject);
begin
  dm_Pcm.slocale:= cxRadioGroup1.Properties.Items[cxRadioGroup1.Itemindex].Value;
  if MessageDlg('Soll die gewählte Sprache sofort übernommen werden? '
  + slinebreak + 'Bei Ja wird das Programm neu gestartet.'
   + slinebreak + 'Bei Nein wird die Sprache erst beim nächsten Start geändert.',mtInformation,[mbYes,mbNo], 0) = mrYes then
  begin
    dm_Pcm.slocale:= cxRadioGroup1.Properties.Items[cxRadioGroup1.Itemindex].Value;
    ShellExecute(Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
    Application.Terminate; // or Halt(0) for immediate exit[1][3]
  end
  else begin

  end;
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_Language.FormShow(Sender: TObject);
begin
  case AnsiIndexStr(dm_pcm.slocale, ['DE', 'EN','FR','IT','ES']) of
  0: cxRadioGroup1.ItemIndex:= 0;
  1: cxRadioGroup1.ItemIndex:= 1;
  2: cxRadioGroup1.ItemIndex:= 2;
  3: cxRadioGroup1.ItemIndex:= 3;
  4: cxRadioGroup1.ItemIndex:= 4;
  end;
end;
{$EndRegion Formfunktionen}
end.
