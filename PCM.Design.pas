unit PCM.Design;

interface

uses
  {$Region uses}
  cxButtons,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDropDownEdit,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxGroupBox,
  cxImage,
  cxImageList,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxMaskEdit,
  cxNavigator,
  cxPC,inifiles,
  cxRadioGroup,
  cxStyles,
  cxTextEdit,
  Data.DB,
  dxBar,
  dxBarBuiltInMenu,
  dxDateRanges,
  dxGDIPlusClasses,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  dxLayoutcxEditAdapters,
  dxLayoutLookAndFeels,
  dxScrollbarAnnotations,
  dxUIAClasses,
  NtTranslator,
  System.Classes,
  System.ImageList,
  System.SysUtils,
  system.UITypes,
  System.Variants,
  Vcl.BaseImageCollection,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Themes,
  Vcl.VirtualImage,
  Winapi.Messages,
  Winapi.Windows;
  {$EndRegion uses}

type
  {$Region Type}
  Tfrm_Design = class(TForm)
    brdckCtrl_Main: TdxBarDockControl;
    brmgr_Main: TdxBarManager;
    btn_OptionSaveUser: TdxBarLargeButton;
    cbx_Design: TcxComboBox;
    btn_DesignSave: TdxBarLargeButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    des_Button1: TcxButton;
    des_Button2: TcxButton;
    des_Button3: TcxButton;
    des_CheckBox1: TcxCheckBox;
    des_Edit1: TcxTextEdit;
    des_Label1: TcxLabel;
    des_RadioButton1: TcxRadioButton;
    des_ToolButton1: TcxButton;
    des_ToolButton2: TcxButton;
    des_ToolButton3: TcxButton;
    dxBarManager1Bar1: TdxBar;
    lactrl_Main: TdxLayoutControl;
    lactrl_MainGroup_Root: TdxLayoutGroup;
    laCxlaf_Design: TdxLayoutCxLookAndFeel;
    laCxlaf_Main: TdxLayoutCxLookAndFeel;
    lagrp_Design: TdxLayoutGroup;
    lagrp_DesignButtons: TdxLayoutGroup;
    lagrp_DesignDetail: TdxLayoutGroup;
    lagrp_DesignDetail1: TdxLayoutGroup;
    lagrp_DesignDetailForm: TdxLayoutGroup;
    lagrp_DesignGroup: TdxLayoutGroup;
    lagrp_DesignToolButtons: TdxLayoutGroup;
    laitm_DesignBar: TdxLayoutItem;
    laitm_DesignButton1: TdxLayoutItem;
    laitm_DesignButton2: TdxLayoutItem;
    laitm_DesignButton3: TdxLayoutItem;
    laitm_DesignCheckBox1: TdxLayoutItem;
    laitm_DesignDesign: TdxLayoutItem;
    laitm_DesignEdit1: TdxLayoutItem;
    laitm_DesignGrid: TdxLayoutItem;
    laitm_DesignLabel1: TdxLayoutItem;
    laitm_DesignRadiobutton1: TdxLayoutItem;
    laitm_DesignToolButton1: TdxLayoutItem;
    laitm_DesignToolButton2: TdxLayoutItem;
    laitm_DesignToolButton3: TdxLayoutItem;
    lalaflst_Design: TdxLayoutLookAndFeelList;
    lalaflst_Main: TdxLayoutLookAndFeelList;
    procedure btn_DesignSaveClick(Sender: TObject);
    procedure cbx_DesignPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
  {$EndRegion Type}
var
  {$Region var}
  frm_Design: Tfrm_Design;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  NtLanguageDlg,
  PCM.Data,
  PCM.Main,
  PCM.Strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
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
procedure Tfrm_Design.btn_DesignSaveClick(Sender: TObject);
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
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_Design.FormShow(Sender: TObject);
begin
  cbx_Design.ItemIndex := cbx_Design.Properties.Items.IndexOf(dm_PCM.sDesign);
end;
{$EndRegion Formfunktionen}
end.

