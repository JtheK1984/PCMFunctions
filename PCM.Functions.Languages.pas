unit PCM.Functions.Languages;

interface

uses
  {$Region uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons,StrUtils,inifiles, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, dxLayoutControl, dxLayoutLookAndFeels, System.UITypes,
  dxUIAClasses,shellapi;
  {$EndRegion uses}
type
  {$Region type}
  Tfrm_PCM_Language = class(TForm)
    rgrp_Sprache: TcxRadioGroup;
    btn_Ok: TcxButton;
    lactrl_SpracheGroup_Root: TdxLayoutGroup;
    lactrl_Sprache: TdxLayoutControl;
    laitm_Sprache: TdxLayoutItem;
    laitm_SpracheOk: TdxLayoutItem;
    lalaflst_Sprache: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    lagrp_Sprache: TdxLayoutGroup;
    lagrp_SpracheBtn: TdxLayoutGroup;
    laitm_SpracheCancel: TdxLayoutItem;
    btn_Cancel: TcxButton;
    procedure btn_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
  {$EndRegion type}
var
  {$Region var}
  frm_PCM_Language: Tfrm_PCM_Language;
  {$EndRegion var}
implementation
{$R *.dfm}
uses
  {$Region uses}
  PCM.Data,
  PCM.Helper,
  PCM.Main,
  PCm.Strings;
  {$EndRegion uses}
////////////////////////////////////////////////////////////////////////////////
// Buttonfunktionen                                                           //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunktionen}
procedure Tfrm_PCM_Language.btn_OkClick(Sender: TObject);
begin
  dm_Pcm.slocale:= rgrp_Sprache.Properties.Items[rgrp_Sprache.Itemindex].Value;
  if SetMessageDialog(2,rs_Function_Sprache_Message,[rs_general_BTN_Yes,rs_general_BTN_No,''],[mryes,mrNo,mrNone]) = mrYes then
  begin
    ShellExecute(Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
    Application.Terminate;
  end;
end;
{$EndRegion Buttonfunktionen}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_PCM_Language.btn_CancelClick(Sender: TObject);
begin
  Close;
end;
procedure Tfrm_PCM_Language.FormCreate(Sender: TObject);
  procedure LoadRessourceStrings;
  begin
    Caption:= rs_Function_Sprache_FormCaption;
    rgrp_Sprache.Caption:= rs_Function_Sprache_Sprache;
  	rgrp_Sprache.Properties.Items[0].Caption:= rs_Function_Sprache_SpracheDE;
  	rgrp_Sprache.Properties.Items[1].Caption:= rs_Function_Sprache_SpracheEN;
  	btn_ok.Caption:= rs_Function_Sprache_SpracheWchseln;
 	  btn_Cancel.Caption:= rs_general_BTN_Cancel;
  end;
begin
  LoadRessourceStrings;
end;
procedure Tfrm_PCM_Language.FormShow(Sender: TObject);
begin
  case AnsiIndexStr(dm_pcm.slocale, ['DE', 'EN']) of
  0: rgrp_Sprache.ItemIndex:= 0;
  1: rgrp_Sprache.ItemIndex:= 1;
  end;
end;
{$EndRegion Formfunktionen}
end.
