object frm_AdressBook: Tfrm_AdressBook
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'PCM-Manager: E-Mail Adressbuch'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lactrl_Adressbook: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm_PCM.dxLayoutSkinLookAndFeel1
    ExplicitWidth = 794
    ExplicitHeight = 583
    object grd_Adress: TcxGrid
      Left = 12
      Top = 44
      Width = 776
      Height = 416
      TabOrder = 2
      object grdDBTblView_Adress: TcxGridDBTableView
        OnKeyDown = grdDBTblView_AdressKeyDown
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = grdDBTblView_AdressCellDblClick
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object grdDBTblView_AdressName: TcxGridDBColumn
          DataBinding.FieldName = 'Name'
          Width = 375
        end
        object grdDBTblView_AdressMail: TcxGridDBColumn
          DataBinding.FieldName = 'Mail'
          Width = 375
        end
      end
      object grdLvl_Adress: TcxGridLevel
        GridView = grdDBTblView_Adress
      end
    end
    object btn_An: TcxButton
      Left = 12
      Top = 467
      Width = 75
      Height = 25
      Caption = 'An'
      TabOrder = 3
      OnClick = btn_AnClick
    end
    object btn_CC: TcxButton
      Left = 12
      Top = 499
      Width = 75
      Height = 25
      Caption = 'CC'
      TabOrder = 5
      OnClick = btn_CCClick
    end
    object btn_BCC: TcxButton
      Left = 12
      Top = 531
      Width = 75
      Height = 25
      Caption = 'Bcc'
      TabOrder = 7
      OnClick = btn_BCCClick
    end
    object btn_Ok: TcxButton
      Left = 581
      Top = 563
      Width = 100
      Height = 25
      Caption = 'Ok'
      TabOrder = 9
      OnClick = btn_OkClick
    end
    object btn_Abort: TcxButton
      Left = 688
      Top = 563
      Width = 100
      Height = 25
      Caption = 'Abbrechen'
      TabOrder = 10
      OnClick = btn_AbortClick
    end
    object edt_Suche: TcxTextEdit
      Left = 12
      Top = 12
      AutoSize = False
      Properties.OnChange = edt_SuchePropertiesChange
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
      TextHint = 'Suche'
      OnKeyDown = edt_SucheKeyDown
      Height = 25
      Width = 744
    end
    object edt_An: TcxTextEdit
      Left = 94
      Top = 467
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 694
    end
    object edt_BCC: TcxTextEdit
      Left = 94
      Top = 531
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 8
      Width = 694
    end
    object edt_CC: TcxTextEdit
      Left = 94
      Top = 499
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Width = 694
    end
    object btn_Reset: TcxButton
      Left = 763
      Top = 12
      Width = 25
      Height = 25
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D2243
        6C656172486561646572416E64466F6F7465722220786D6C6E733D2268747470
        3A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C
        696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E
        6B2220783D223070782220793D22307078222076696577426F783D2230203020
        333220333222207374796C653D22656E61626C652D6261636B67726F756E643A
        6E6577203020302033322033323B2220786D6C3A73706163653D227072657365
        727665223E262331333B262331303B3C7374796C6520747970653D2274657874
        2F637373223E2E5265647B66696C6C3A234431314331433B7D3C2F7374796C65
        3E0D0A3C7061746820636C6173733D225265642220643D224D32372C34483543
        342E352C342C342C342E352C342C3576323263302C302E352C302E352C312C31
        2C3168323263302E352C302C312D302E352C312D3156354332382C342E352C32
        372E352C342C32372C347A204D32322C32306C2D322C326C2D342D346C2D342C
        3420202623393B6C2D322D326C342D346C2D342D346C322D326C342C346C342D
        346C322C326C2D342C344C32322C32307A222F3E0D0A3C2F7376673E0D0A}
      TabOrder = 1
      OnClick = btn_ResetClick
    end
    object lactrl_AdressbookGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lagrp_Adressbook: TdxLayoutGroup
      Parent = lactrl_AdressbookGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 0
    end
    object lagrp_AdressbookMain: TdxLayoutGroup
      Parent = lagrp_Adressbook
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Suche'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookGrid: TdxLayoutItem
      Parent = lagrp_AdressbookMain
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = grd_Adress
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_AdressbookAdresses: TdxLayoutGroup
      Parent = lagrp_AdressbookMain
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 2
    end
    object lagrp_AdressbookAn: TdxLayoutGroup
      Parent = lagrp_AdressbookAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_AdressbookBCC: TdxLayoutGroup
      Parent = lagrp_AdressbookAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object lagrp_AdressbookCC: TdxLayoutGroup
      Parent = lagrp_AdressbookAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object laitm_AdressbookAnBtn: TdxLayoutItem
      Parent = lagrp_AdressbookAn
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_An
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookCCBtn: TdxLayoutItem
      Parent = lagrp_AdressbookCC
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_CC
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookBCCBtn: TdxLayoutItem
      Parent = lagrp_AdressbookBCC
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_BCC
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_AdressbookBtn: TdxLayoutGroup
      Parent = lagrp_AdressbookMain
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object laitm_AdressbookOk: TdxLayoutItem
      Parent = lagrp_AdressbookBtn
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_Ok
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookCancel: TdxLayoutItem
      Parent = lagrp_AdressbookBtn
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_Abort
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_AdressbookSuche: TdxLayoutItem
      Parent = lagrp_AdressbookSuche
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edt_Suche
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookAnEdit: TdxLayoutItem
      Parent = lagrp_AdressbookAn
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_An
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_AdressbookBCCEdit: TdxLayoutItem
      Parent = lagrp_AdressbookBCC
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BCC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_AdressbookCCEdit: TdxLayoutItem
      Parent = lagrp_AdressbookCC
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_CC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_AdressbookSuche: TdxLayoutGroup
      Parent = lagrp_AdressbookMain
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object laitm_AdressbookReset: TdxLayoutItem
      Parent = lagrp_AdressbookSuche
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_Reset
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object memData_Mail: TdxMemData
    Indexes = <>
    SortOptions = []
    OnFilterRecord = memData_MailFilterRecord
    Left = 448
    Top = 208
    object memData_MailName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object memData_MailMail: TStringField
      FieldName = 'Mail'
      Size = 255
    end
    object memData_MailVorname: TStringField
      FieldName = 'Vorname'
      Size = 255
    end
    object memData_MailNachname: TStringField
      FieldName = 'Nachname'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = memData_Mail
    Left = 456
    Top = 304
  end
end
