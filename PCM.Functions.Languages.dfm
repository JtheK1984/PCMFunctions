object frm_Language: Tfrm_Language
  Left = 0
  Top = 0
  Caption = 'Sprache w'#228'hlen'
  ClientHeight = 135
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 135
    Width = 1070
    object cxRadioGroup1: TcxRadioGroup
      AlignWithMargins = True
      Left = 8
      Top = 8
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Sprachen'
      Properties.Items = <
        item
          Caption = 'Deutsch'
          Value = 'DE'
        end
        item
          Caption = 'Englisch'
          Value = 'EN'
        end>
      TabOrder = 0
      Height = 89
      Width = 1054
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 8
      Top = 102
      Width = 1054
      Height = 25
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Sprache wechseln'
      TabOrder = 1
      OnClick = cxButton1Click
    end
  end
end
