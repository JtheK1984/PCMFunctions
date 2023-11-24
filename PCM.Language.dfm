object frm_Language: Tfrm_Language
  Left = 0
  Top = 0
  Caption = 'Sprache w'#228'hlen'
  ClientHeight = 190
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 190
    Width = 624
    object cxRadioGroup1: TcxRadioGroup
      AlignWithMargins = True
      Left = 8
      Top = 8
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Caption = 'Sprachen'
      Properties.Items = <
        item
          Caption = 'Deutsch'
          Value = 'DE'
        end
        item
          Caption = 'Englisch'
          Value = 'EN'
        end
        item
          Caption = 'Franz'#246'sisch'
          Value = 'FR'
        end
        item
          Caption = 'Italienisch'
          Value = 'IT'
        end
        item
          Caption = 'Spanisch'
          Value = 'ES'
        end>
      TabOrder = 0
      ExplicitHeight = 174
      Height = 144
      Width = 608
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 8
      Top = 157
      Width = 608
      Height = 25
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Sprache wechseln'
      TabOrder = 1
      OnClick = cxButton1Click
      ExplicitLeft = 280
      ExplicitTop = 104
      ExplicitWidth = 75
    end
  end
end
