object frm_Design: Tfrm_Design
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_Design'
  ClientHeight = 922
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object lactrl_Main: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1195
    Height = 922
    Align = alClient
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = laCxlaf_Main
    object cbx_Design: TcxComboBox
      AlignWithMargins = True
      Left = 63
      Top = 97
      Margins.Left = 8
      Margins.Top = 2
      Margins.Bottom = 2
      AutoSize = False
      Properties.DropDownRows = 20
      Properties.Items.Strings = (
        'Basic'
        'Black'
        'Blue'
        'Blueprint'
        'Caramel'
        'Coffee'
        'Darkroom'
        'DarkSide'
        'DevExpressDarkStyle'
        'DevExpressStyle'
        'Foggy'
        'GlassOceans'
        'HighContrast'
        'iMaginary'
        'Lilian'
        'LiquidSky'
        'LondonLiquidSky'
        'McSkin'
        'Metropolis'
        'MetropolisDark'
        'MoneyTwins'
        'Office2007Black'
        'Office2007Blue'
        'Office2007Green'
        'Office2007Pink'
        'Office2007Silver'
        'Office2010Black'
        'Office2010Blue'
        'Office2010Silver'
        'Office2013DarkGray'
        'Office2013LightGray'
        'Office2013White'
        'Office2016Colorful'
        'Office2016Dark'
        'Office2019Black'
        'Office2019Colorful'
        'Office2019DarkGray'
        'Office2019White'
        'Pumpkin'
        'Seven'
        'SevenClassic'
        'Sharp'
        'SharpPlus'
        'Silver'
        'Springtime'
        'Stardust'
        'Summer2008'
        'TheAsphaltWorld'
        'TheBezier'
        'UserSkin'
        'Valentine'
        'VisualStudio2013Blue'
        'VisualStudio2013Dark'
        'VisualStudio2013Light'
        'VS2010'
        'Whiteprint'
        'Xmas2008Blue')
      Properties.OnChange = cbx_DesignPropertiesChange
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 21
      Width = 1110
    end
    object brdckCtrl_Main: TdxBarDockControl
      Left = 22
      Top = 28
      Width = 1151
      Height = 63
      Align = dalNone
      BarManager = brmgr_Main
    end
    object des_ToolButton3: TcxButton
      Left = 208
      Top = 164
      Width = 75
      Height = 27
      Caption = 'ToolButton3'
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      TabStop = False
    end
    object des_ToolButton2: TcxButton
      Left = 127
      Top = 164
      Width = 75
      Height = 27
      Caption = 'ToolButton2'
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      TabStop = False
    end
    object des_ToolButton1: TcxButton
      Left = 46
      Top = 164
      Width = 75
      Height = 27
      Caption = 'ToolButton1'
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      TabStop = False
    end
    object des_Label1: TcxLabel
      Left = 46
      Top = 205
      AutoSize = False
      Caption = 'Label1'
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Transparent = True
      Height = 17
      Width = 367
    end
    object des_Edit1: TcxTextEdit
      Left = 46
      Top = 236
      TabStop = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Text = 'Edit1'
      Width = 367
    end
    object des_CheckBox1: TcxCheckBox
      Left = 46
      Top = 271
      TabStop = False
      AutoSize = False
      Caption = 'CheckBox1'
      State = cbsChecked
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Transparent = True
      Height = 17
      Width = 367
    end
    object des_RadioButton1: TcxRadioButton
      Left = 46
      Top = 302
      Width = 367
      Height = 17
      Caption = 'RadioButton1'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      TabOrder = 8
      TabStop = True
      ParentBackground = False
      Transparent = True
    end
    object des_Button1: TcxButton
      Left = 46
      Top = 419
      Width = 72
      Height = 24
      Caption = 'Button1'
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 10
      TabStop = False
    end
    object des_Button2: TcxButton
      Left = 124
      Top = 419
      Width = 72
      Height = 24
      Caption = 'Button2'
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 11
      TabStop = False
    end
    object des_Button3: TcxButton
      Left = 202
      Top = 419
      Width = 72
      Height = 24
      Caption = 'Button3'
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 12
      TabStop = False
    end
    object cxGrid2: TcxGrid
      Left = 46
      Top = 333
      Width = 367
      Height = 72
      TabOrder = 9
      TabStop = False
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = 'Column1'
          DataBinding.IsNullValueType = True
          Width = 110
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          Caption = 'Column2'
          DataBinding.IsNullValueType = True
          Width = 110
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          Caption = 'Column1'
          DataBinding.IsNullValueType = True
          Width = 110
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object lactrl_MainGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lagrp_Design: TdxLayoutGroup
      Parent = lactrl_MainGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 0
      CaptionOptions.Text = 'Personalisierung'
      ShowBorder = False
      Index = 0
    end
    object laitm_DesignBar: TdxLayoutItem
      Parent = lagrp_DesignGroup
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'dxBarDockControl1'
      CaptionOptions.Visible = False
      Control = brdckCtrl_Main
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 63
      ControlOptions.OriginalWidth = 1181
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_DesignGroup: TdxLayoutGroup
      Parent = lagrp_Design
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Programmdesign'
      ItemIndex = 2
      Index = 0
    end
    object laitm_DesignDesign: TdxLayoutItem
      Parent = lagrp_DesignGroup
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Design:'
      Control = cbx_Design
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 1042
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_DesignDetail: TdxLayoutGroup
      Parent = lagrp_DesignGroup
      CaptionOptions.Text = 'Vorschau'
      Offsets.Bottom = 4
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object lagrp_DesignDetail1: TdxLayoutGroup
      Parent = lagrp_DesignDetail
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Vorschau'
      Index = 0
    end
    object lagrp_DesignToolButtons: TdxLayoutGroup
      Parent = lagrp_DesignDetailForm
      CaptionOptions.Text = 'Form1'
      Offsets.Bottom = 4
      Offsets.Top = 4
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object laitm_DesignToolButton3: TdxLayoutItem
      Parent = lagrp_DesignToolButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_ToolButton3
      ControlOptions.OriginalHeight = 27
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_DesignToolButton2: TdxLayoutItem
      Parent = lagrp_DesignToolButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_ToolButton2
      ControlOptions.OriginalHeight = 27
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_DesignToolButton1: TdxLayoutItem
      Parent = lagrp_DesignToolButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_ToolButton1
      ControlOptions.OriginalHeight = 27
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_DesignLabel1: TdxLayoutItem
      Parent = lagrp_DesignDetailForm
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_Label1
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 210
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_DesignEdit1: TdxLayoutItem
      Parent = lagrp_DesignDetailForm
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_Edit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 367
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_DesignCheckBox1: TdxLayoutItem
      Parent = lagrp_DesignDetailForm
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_CheckBox1
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitm_DesignRadiobutton1: TdxLayoutItem
      Parent = lagrp_DesignDetailForm
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_RadioButton1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 113
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lagrp_DesignDetailForm: TdxLayoutGroup
      Parent = lagrp_DesignDetail1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Form1'
      LayoutLookAndFeel = laCxlaf_Design
      Index = 0
    end
    object laitm_DesignGrid: TdxLayoutItem
      Parent = lagrp_DesignDetailForm
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxGrid2
      ControlOptions.OriginalHeight = 72
      ControlOptions.OriginalWidth = 367
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object laitm_DesignButton3: TdxLayoutItem
      Parent = lagrp_DesignButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_Button3
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_DesignButton2: TdxLayoutItem
      Parent = lagrp_DesignButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_Button2
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_DesignButton1: TdxLayoutItem
      Parent = lagrp_DesignButtons
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = des_Button1
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_DesignButtons: TdxLayoutGroup
      Parent = lagrp_DesignDetailForm
      CaptionOptions.Text = 'New Group'
      Offsets.Bottom = 4
      Offsets.Top = 4
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 6
    end
  end
  object brmgr_Main: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = dm_PCM.imglst_32x32
    LookAndFeel.NativeStyle = False
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 632
    Top = 408
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = brdckCtrl_Main
      DockedDockControl = brdckCtrl_Main
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1207
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_DesignSave'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object btn_OptionSaveUser: TdxBarLargeButton
      Caption = 'Benutzer speichern'
      Category = 0
      Hint = 'Benutzer speichern'
      Visible = ivAlways
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
    object btn_DesignSave: TdxBarLargeButton
      Caption = 'Speichern'
      Category = 0
      Hint = 'Speichern'
      Visible = ivAlways
      OnClick = btn_DesignSaveClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
  end
  object lalaflst_Main: TdxLayoutLookAndFeelList
    object laCxlaf_Main: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
  object lalaflst_Design: TdxLayoutLookAndFeelList
    object laCxlaf_Design: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
