unit PCM.Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.Menus,
  cxLabel, cxGroupBox, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, cxImage,
  dxSkinsCore, dxLayoutControlAdapters;
type
  Tfrm_Dialog = class(TForm)
    lactrl_Dialog: TdxLayoutControl;
    img_Dialog: TcxImage;
    lactrl_DialogGroup_Root1: TdxLayoutGroup;
    lagrp_Dialog: TdxLayoutGroup;
    laitm_Dialogimage: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    lalbl_DialogText: TdxLayoutLabeledItem;
    btn_Yes: TcxButton;
    laitm_DialogYes: TdxLayoutItem;
    btn_No: TcxButton;
    laitm_DialogNo: TdxLayoutItem;
    laitm_DialogCancel: TdxLayoutItem;
    btn_Cancel: TcxButton;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frm_Dialog: Tfrm_Dialog;

implementation

{$R *.dfm}

uses
  PCM.Data,
  PCM.Main;
























end.
