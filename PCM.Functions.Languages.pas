unit PCM.Functions.Languages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons,StrUtils,inifiles;

type
  Tfrm_Language = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxRadioGroup1: TcxRadioGroup;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frm_Language: Tfrm_Language;

implementation



{$R *.dfm}

uses PCM.Data,PCM.Main;

procedure Tfrm_Language.cxButton1Click(Sender: TObject);
begin
  dm_Pcm.slocale:= cxRadioGroup1.Properties.Items[cxRadioGroup1.Itemindex].Value;
  close;
end;
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

end.
