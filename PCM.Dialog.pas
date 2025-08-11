unit PCM.Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxLayoutContainer, cxClasses,
  dxLayoutControl, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  Tfrm_Dialog = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutImageItem1: TdxLayoutImageItem;
    dxLayoutImageItem2: TdxLayoutImageItem;
    dxLayoutImageItem3: TdxLayoutImageItem;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    lalbl_DialogText: TdxLayoutLabeledItem;
    procedure FormShow(Sender: TObject);
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
  PCM.Data;

procedure Tfrm_Dialog.FormShow(Sender: TObject);
begin
    dxLayoutControl1.AutoSize:= true;
    HandleNeeded;
    dxLayoutControl1.Realign;
    dxLayoutControl1.Refresh;

    // Formgröße an LayoutControl anpassen
    ClientWidth := dxLayoutControl1.Width;
    ClientHeight := dxLayoutControl1.Height;
end;

end.
