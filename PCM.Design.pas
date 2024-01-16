unit PCM.Design;

interface

uses
  NtTranslator,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, dxBar, cxClasses, System.ImageList,
  Vcl.ImgList, cxImageList, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxCheckBox, cxTextEdit, cxLabel,
  cxButtons, dxGDIPlusClasses, cxImage, cxGroupBox, cxPC,inifiles, Vcl.Themes,system.UITypes,
  dxSkinWXI, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  Tfrm_Design = class(TForm)
    pnl_right: TcxGroupBox;
    AB_pc_Options: TcxPageControl;
    E_ts_Personal: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    des_Main: TcxGroupBox;
    des_ToolButton3: TcxButton;
    des_ToolButton2: TcxButton;
    des_ToolButton1: TcxButton;
    des_Label1: TcxLabel;
    des_Edit1: TcxTextEdit;
    des_CheckBox1: TcxCheckBox;
    des_RadioButton1: TcxRadioButton;
    des_Button1: TcxButton;
    des_Button2: TcxButton;
    des_Button3: TcxButton;
    cxGrid2: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox4: TcxGroupBox;
    cbx_Style: TcxComboBox;
    cxLabel1: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxLabel2: TcxLabel;
    cbx_Design: TcxComboBox;
    dxBarManager1: TdxBarManager;
    btn_OptionSaveUser: TdxBarLargeButton;
    dxBarManager1Bar1: TdxBar;
    cxButton1: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    ImageCollection1: TImageCollection;
    cxImage1: TVirtualImage;
    cxImageList1: TcxImageList;
    procedure cxButton1Click(Sender: TObject);
    procedure cbx_DesignPropertiesChange(Sender: TObject);
    procedure cbx_StylePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frm_Design: Tfrm_Design;

implementation

{$R *.dfm}

uses  PCM.Main,
      PCM.Data,
      PCM.Strings,
      NtLanguageDlg;

procedure Tfrm_Design.cbx_StylePropertiesChange(Sender: TObject);
begin
  if cbx_Style.ItemIndex > -1 then
    cximage1.ImageIndex:= cbx_Style.itemindex;
end;
procedure Tfrm_Design.cbx_DesignPropertiesChange(Sender: TObject);
begin
  if cbx_Design.ItemIndex > -1 then
  begin
    des_main.Style.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_main.Height:=des_main.Height + 1;
    des_main.Height:=des_main.Height - 1;
    des_Label1.Style.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_Edit1.Style.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_CheckBox1.Style.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_RadioButton1.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    cxGrid2.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_Button1.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_Button2.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_Button3.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_ToolButton1.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_ToolButton2.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
    des_ToolButton3.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
  end;
end;
procedure Tfrm_Design.cxButton1Click(Sender: TObject);
var
  iniFile : TIniFile;
begin
  iniFile:=TIniFile.create(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini');
  try
    iniFile.WriteString(PCM_Logname,'Design',cbx_Design.Properties.Items[cbx_Design.ItemIndex]) ;
    iniFile.WriteString(PCM_Logname,'Style',cbx_Style.Properties.Items[cbx_Style.ItemIndex]) ;
    frm_PCM_main.lafCtrl_Main.SkinName:= cbx_Design.Properties.Items[cbx_Design.ItemIndex];
    if dm_PCM.sStyle <> cbx_Style.Properties.Items[cbx_Style.ItemIndex] then
    begin
      if MessageDlg(rs_PCM_Style1 + slinebreak + rs_PCM_Style2,mtInformation,[mbYes,mbNo], 0) = mrYes then
      begin
        dm_PCM.bStyle:= true;
        TStyleManager.TRYSetStyle(cbx_Style.Properties.Items[cbx_Style.Itemindex]);
        dm_PCM.sDesign:= cbx_Design.Properties.Items[cbx_Design.ItemIndex];
        dm_PCM.sStyle:= cbx_Style.Properties.Items[cbx_Style.ItemIndex];
      end;
    end;
  finally
     iniFile.Free;
  end;
end;

procedure Tfrm_Design.FormShow(Sender: TObject);
begin
  cbx_Design.ItemIndex := cbx_Design.Properties.Items.IndexOf(dm_PCM.sDesign);
  cbx_Style.ItemIndex := cbx_Style.Properties.Items.IndexOf(dm_PCM.sStyle);
end;

end.

