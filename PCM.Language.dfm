object Form1: TForm1
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
  TextHeight = 15
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    ExplicitHeight = 441
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
          Value = 'SP'
        end>
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 64
      ExplicitWidth = 185
      ExplicitHeight = 105
      Height = 174
      Width = 608
    end
  end
end
