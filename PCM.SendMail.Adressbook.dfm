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
      TabOrder = 1
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
      TabOrder = 2
      OnClick = btn_AnClick
    end
    object btn_CC: TcxButton
      Left = 12
      Top = 499
      Width = 75
      Height = 25
      Caption = 'CC'
      TabOrder = 4
      OnClick = btn_CCClick
    end
    object btn_BCC: TcxButton
      Left = 12
      Top = 531
      Width = 75
      Height = 25
      Caption = 'Bcc'
      TabOrder = 6
      OnClick = btn_BCCClick
    end
    object btn_Ok: TcxButton
      Left = 581
      Top = 563
      Width = 100
      Height = 25
      Caption = 'Ok'
      TabOrder = 8
      OnClick = btn_OkClick
    end
    object btn_Abort: TcxButton
      Left = 688
      Top = 563
      Width = 100
      Height = 25
      Caption = 'Abbrechen'
      TabOrder = 9
      OnClick = btn_AbortClick
    end
    object edt_An: TcxTextEdit
      Left = 94
      Top = 467
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Width = 694
    end
    object edt_BCC: TcxTextEdit
      Left = 94
      Top = 531
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Width = 694
    end
    object edt_CC: TcxTextEdit
      Left = 94
      Top = 499
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Width = 694
    end
    object edt_Suche: TcxButtonEdit
      Left = 53
      Top = 12
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.SourceHeight = 23
          Glyph.SourceWidth = 23
          Glyph.Data = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
            462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
            617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
            2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
            77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
            22307078222076696577426F783D2230203020333220333222207374796C653D
            22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
            3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
            303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
            63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
            3B7D262331333B262331303B2623393B2E5265647B66696C6C3A234431314331
            433B7D3C2F7374796C653E0D0A3C7061746820636C6173733D22426C75652220
            643D224D31382C32336C2D342E332C342E35632D302E372C302E372D312E392C
            302E372D322E362C306C2D362E362D362E36632D302E372D302E372D302E372D
            312E392C302D322E364C392C31344C31382C32337A222F3E0D0A3C7061746820
            636C6173733D225265642220643D224D32372E352C31332E374C32302C32316C
            2D392D396C372E332D372E3563302E372D302E372C312E392D302E372C322E36
            2C306C362E362C362E364332382E322C31312E382C32382E322C31332C32372E
            352C31332E377A222F3E0D0A3C2F7376673E0D0A}
          Kind = bkGlyph
        end>
      Properties.OnButtonClick = edt_SuchePropertiesButtonClick
      Properties.OnChange = edt_SuchePropertiesChange
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
      OnKeyDown = edt_Suche1KeyDown
      Width = 735
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
      Parent = lagrp_AdressbookMain
      CaptionOptions.Text = 'Name:'
      Control = edt_Suche
      ControlOptions.OriginalHeight = 25
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
