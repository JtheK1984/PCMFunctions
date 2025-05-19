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
  Tfrm_PCM_Design = class(TForm)
    brdckCtrl_Main: TdxBarDockControl;
    brmgr_Main: TdxBarManager;
    cbx_Design: TcxComboBox;
    btn_DesignSave: TdxBarLargeButton;
    tb_design: TdxBar;
    lactrl_Main: TdxLayoutControl;
    lactrl_MainGroup_Root: TdxLayoutGroup;
    laCxlaf_Design: TdxLayoutCxLookAndFeel;
    laCxlaf_Main: TdxLayoutCxLookAndFeel;
    lagrp_Design: TdxLayoutGroup;
    lagrp_DesignDetail: TdxLayoutGroup;
    lagrp_DesignGroup: TdxLayoutGroup;
    laitm_DesignBar: TdxLayoutItem;
    laitm_DesignDesign: TdxLayoutItem;
    lalaflst_Design: TdxLayoutLookAndFeelList;
    lalaflst_Main: TdxLayoutLookAndFeelList;
    ImageCollection1: TImageCollection;
    dxLayoutItem1: TdxLayoutItem;
    lagrp_DesignDetail1: TdxLayoutGroup;
    VirtualImage1: TVirtualImage;
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
  frm_PCM_Design: Tfrm_PCM_Design;
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
procedure Tfrm_PCM_Design.cbx_DesignPropertiesChange(Sender: TObject);
begin
  VirtualImage1.ImageIndex:= cbx_Design.ItemIndex;
end;
procedure Tfrm_PCM_Design.btn_DesignSaveClick(Sender: TObject);
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
procedure Tfrm_PCM_Design.FormShow(Sender: TObject);
begin
  btn_DesignSave.Caption:= rs_general_Save;
  lagrp_DesignGroup.CaptionOptions.Text:= rs_Function_Design_Prgramdesign;
  laitm_DesignDesign.CaptionOptions.Text:= rs_Function_Design_Design;
  lagrp_DesignDetail1.CaptionOptions.Text:= rs_Function_Design_Vorschau;
  cbx_Design.ItemIndex := cbx_Design.Properties.Items.IndexOf(dm_PCM.sDesign);
end;
{$EndRegion Formfunktionen}
end.

