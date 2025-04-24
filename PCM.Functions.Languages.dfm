object frm_PCM_Language: Tfrm_PCM_Language
  Left = 0
  Top = 0
  ClientHeight = 170
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lactrl_Sprache: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 500
    Height = 170
    Align = alClient
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = dxLayoutCxLookAndFeel1
    ExplicitWidth = 494
    ExplicitHeight = 153
    object rgrp_Sprache: TcxRadioGroup
      AlignWithMargins = True
      Left = 12
      Top = 12
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ParentBackground = False
      ParentColor = False
      Properties.Items = <
        item
          Value = 'DE'
        end
        item
          Value = 'EN'
        end>
      Style.Color = clBtnFace
      Style.TransparentBorder = False
      TabOrder = 0
      Height = 89
      Width = 476
    end
    object btn_Ok: TcxButton
      AlignWithMargins = True
      Left = 12
      Top = 108
      Width = 235
      Height = 25
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      OnClick = btn_OkClick
    end
    object btn_Cancel: TcxButton
      Left = 254
      Top = 108
      Width = 234
      Height = 25
      TabOrder = 2
      OnClick = btn_CancelClick
    end
    object lactrl_SpracheGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object laitm_Sprache: TdxLayoutItem
      Parent = lagrp_Sprache
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = rgrp_Sprache
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 1056
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_SpracheOk: TdxLayoutItem
      Parent = lagrp_SpracheBtn
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = btn_Ok
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_Sprache: TdxLayoutGroup
      Parent = lactrl_SpracheGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      ShowBorder = False
      Index = 0
    end
    object lagrp_SpracheBtn: TdxLayoutGroup
      Parent = lagrp_Sprache
      AlignHorz = ahClient
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object laitm_SpracheCancel: TdxLayoutItem
      Parent = lagrp_SpracheBtn
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = btn_Cancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object lalaflst_Sprache: TdxLayoutLookAndFeelList
    Left = 192
    Top = 32
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
