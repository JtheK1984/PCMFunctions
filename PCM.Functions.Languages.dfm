object frm_Language: Tfrm_Language
  Left = 0
  Top = 0
  Caption = 'Sprache w'#228'hlen'
  ClientHeight = 146
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 460
    Height = 146
    Align = alClient
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = dxLayoutCxLookAndFeel1
    ExplicitWidth = 454
    ExplicitHeight = 129
    object cxRadioGroup1: TcxRadioGroup
      AlignWithMargins = True
      Left = 12
      Top = 12
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Sprachen'
      ParentBackground = False
      ParentColor = False
      Properties.Items = <
        item
          Caption = 'Deutsch'
          Value = 'DE'
        end
        item
          Caption = 'Englisch'
          Value = 'EN'
        end>
      Style.Color = clBtnFace
      Style.TransparentBorder = False
      TabOrder = 0
      Height = 89
      Width = 436
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 12
      Top = 109
      Width = 436
      Height = 25
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Sprache wechseln'
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxRadioGroup1'
      CaptionOptions.Visible = False
      Control = cxRadioGroup1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 1056
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 1056
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 192
    Top = 32
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
