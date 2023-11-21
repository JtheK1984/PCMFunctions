unit PCM.data;

interface

uses
  System.SysUtils, System.Classes;

type
  Tdm_PCM = class(TDataModule)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  dm_PCM: Tdm_PCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
