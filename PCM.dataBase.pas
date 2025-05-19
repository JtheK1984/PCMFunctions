unit PCM.dataBase;

interface

uses
  {$Region uses}
  System.SysUtils, System.Classes, cxClasses, dxLayoutLookAndFeels,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;
  {$EndRegion uses}
type
  {$Region type}
  Tdm_PCM = class(TDataModule)
    lalalflst_main: TdxLayoutLookAndFeelList;
    laCxlaf_main1: TdxLayoutSkinLookAndFeel;
    laCxlaf_main2: TdxLayoutSkinLookAndFeel;
    con_PCM: TFDConnection;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
  {$EndRegion type}
var
  {$Region var}
  dm_PCM: Tdm_PCM;
  {$EndRegion var}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
