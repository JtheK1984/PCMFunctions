unit PCM.dataBase;

interface

uses
  {$Region uses}
  System.SysUtils, System.Classes, cxClasses, dxLayoutLookAndFeels,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, VCL.Forms, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.Controls, cxImageList, cxGraphics;
  {$EndRegion uses}
type
  {$Region type}
  Tdm_PCMBase = class(TDataModule)
    lalalflst_main: TdxLayoutLookAndFeelList;
    laCxlaf_main1: TdxLayoutSkinLookAndFeel;
    laCxlaf_main2: TdxLayoutSkinLookAndFeel;
    con_PCM: TFDConnection;
    qry_work: TFDQuery;
    qry_work1: TFDQuery;
    qry_work2: TFDQuery;
    imglst_16x16: TcxImageList;
    imglst_24x24: TcxImageList;
    imglst_32x32: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure con_PCMBeforeConnect(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    sUSerAutologin: string;
    iScale: double;
    Firma, Nummer: string;
    bDemo: boolean;
    bAppTerm: boolean;
    dtGueltig,dtCurrDate: Tdate;
    bAutologin: boolean;
    iDBType: integer;
    iModulTab: integer;
    sServer,sStyle,sDesign: String;
    slocale: String;

  end;
  {$EndRegion type}
var
  {$Region var}
  dm_PCMBase: Tdm_PCMBase;
  {$EndRegion var}
const
  {$Region const}
  DB_MYSQL = 0;
  DB_MSSQL = 1;
  DB_ADS = 2;
  DB_FB = 3;
  {$EndRegion const}
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
////////////////////////////////////////////////////////////////////////////////
// Datamodul                                                                  //
////////////////////////////////////////////////////////////////////////////////
{$Region Datamodul}
procedure Tdm_PCMBase.con_PCMBeforeConnect(Sender: TObject);
begin
  con_PCM.LoginPrompt := False;
  con_PCM.Params.Clear;
  case iDBType of
    DB_MYSQL:
    begin
      con_PCM.Params.Add('Database=pcm');
      con_PCM.Params.Add('User_Name=root');
      con_PCM.Params.Add('Password=pcm');
      con_PCM.Params.Add('Server='+ sServer);
      con_PCM.Params.Add('Port=3307');
      con_PCM.Params.Add('DriverID=MySQL');
    end;
    DB_MSSQL:
    begin
      con_PCM.Params.Add('OSAuthent=No');
      con_PCM.Params.Add('User_Name=sa');
      con_PCM.Params.Add('Password=Nh2020+5');
      con_PCM.Params.Add('Server='+ sServer);
      con_PCM.Params.Add('Database=pcm');
      con_PCM.Params.Add('DriverID=MSSQL');
    end;
    DB_ADS:
     begin
      con_PCM.Params.Add('Alias=pcm');
      con_PCM.Params.Add('ServerTypes=REMOTE|LOCAL');
      con_PCM.Params.Add('User_Name=adssys');
      con_PCM.Params.Add('Password=pcm');
      con_PCM.Params.Add('DriverID=ADS');
     end;
  end;
end;
procedure Tdm_PCMBase.DataModuleCreate(Sender: TObject);
begin
  iScale := Screen.PrimaryMonitor.PixelsPerInch /96;
end;
{$EndRegion Datamodul}


end.
