unit PCM.data;

interface

uses
  {$Region uses}
  System.SysUtils, System.Classes;
  {$EndRegion uses}
type
  {$Region type}
  Tdm_PCM = class(TDataModule)
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
