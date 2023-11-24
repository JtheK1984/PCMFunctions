unit PCM.Functions.Languages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinWXI,
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons,StrUtils ;

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

uses PCM.Data;

procedure Tfrm_Language.cxButton1Click(Sender: TObject);
begin
  dm_pcm.slocale:= cxRadioGroup1.Properties.Items[cxRadioGroup1.Itemindex].Value;
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
