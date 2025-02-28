unit PCM.Design;

interface

uses
  NtTranslator,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, dxBar, cxClasses, System.ImageList,
  Vcl.ImgList, cxImageList, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxCheckBox, cxTextEdit, cxLabel,
  cxButtons, dxGDIPlusClasses, cxImage, cxGroupBox, cxPC,inifiles, Vcl.Themes,system.UITypes,
  Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControl,
  dxLayoutLookAndFeels, dxUIAClasses, dxLayoutControlAdapters;

type
  Tfrm_Design = class(TForm)
    cbx_Design: TcxComboBox;
    brmgr_Main: TdxBarManager;
    btn_OptionSaveUser: TdxBarLargeButton;
    dxBarManager1Bar1: TdxBar;
    cxButton1: TdxBarLargeButton;
    brdckCtrl_Main: TdxBarDockControl;
    lactrl_MainGroup_Root: TdxLayoutGroup;
    lactrl_Main: TdxLayoutControl;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup9: TdxLayoutGroup;
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
    lalaflst_Main: TdxLayoutLookAndFeelList;
    laCxlaf_Main: TdxLayoutCxLookAndFeel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup6: TdxLayoutGroup;
    lalaflst_Design: TdxLayoutLookAndFeelList;
    laCxlaf_Design: TdxLayoutCxLookAndFeel;
    procedure cxButton1Click(Sender: TObject);
    procedure cbx_DesignPropertiesChange(Sender: TObject);
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

procedure Tfrm_Design.cbx_DesignPropertiesChange(Sender: TObject);
begin
  if cbx_Design.ItemIndex > -1 then
  begin
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
    laCxlaf_Design.LookAndFeel.SkinName:= cbx_Design.Properties.Items[cbx_Design.Itemindex];
  end;
end;
procedure Tfrm_Design.cxButton1Click(Sender: TObject);
var
  iniFile : TIniFile;
begin
  iniFile:=TIniFile.create(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini');
  try
    iniFile.WriteString(PCM_Logname,'Design',cbx_Design.Properties.Items[cbx_Design.ItemIndex]) ;

    frm_PCM_main.lafCtrl_Main.SkinName:= cbx_Design.Properties.Items[cbx_Design.ItemIndex];
  finally
     iniFile.Free;
  end;
end;

procedure Tfrm_Design.FormShow(Sender: TObject);
begin
  cbx_Design.ItemIndex := cbx_Design.Properties.Items.IndexOf(dm_PCM.sDesign);
end;

end.

