object frm_PCM_User: Tfrm_PCM_User
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_Config'
  ClientHeight = 800
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object lactrl_Main: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1280
    Height = 800
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LayoutLookAndFeel = laCxlaf_Benutzer
    OptionsImage.Images = cxImageList1
    object grd_Benutzer: TcxGrid
      Left = 36
      Top = 292
      Width = 1208
      Height = 472
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      TabStop = False
      LockedStateImageOptions.Effect = lsieDark
      object grdDBTblView_Benutzer: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = ds_Benutzer
        DataController.Filter.PercentWildcard = '*'
        DataController.Filter.UnderscoreWildcard = '?'
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
              end>
            SummaryItems = <
              item
              end>
          end>
        Filtering.ColumnPopup.MultiSelect = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.ShowHourglassCursor = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellEndEllipsis = True
        OptionsView.NoDataToDisplayInfoText = '<Keine Daten Vorhanden>'
        OptionsView.GroupByBox = False
        OptionsView.HeaderFilterButtonShowMode = fbmButton
        OptionsView.IndicatorWidth = 14
        object cxGridDBColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'Benutzer'
          DataBinding.IsNullValueType = True
          Width = 324
        end
        object grdDBTblView_BenutzerColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'Vorname'
          DataBinding.IsNullValueType = True
          Width = 323
        end
        object grdDBTblView_BenutzerColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'Nachname'
          DataBinding.IsNullValueType = True
          Width = 323
        end
      end
      object grdLvl_Benutzer: TcxGridLevel
        GridView = grdDBTblView_Benutzer
      end
    end
    object edt_OptionRight: TcxDBTextEdit
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'Bezeichnung'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 13
      Visible = False
      OnExit = btn_RechtSaveClick
      Width = 1058
    end
    object lucmbbx_RechteVokabeltrainerTest: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Vk_Vokabeltest'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 38
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteVokabeltrainerVokabeln: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'vk_Vokabeluebersicht'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 37
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteVokabeltrainerStatistik: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Vk_Vokabeltest'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 39
      Visible = False
      Width = 471
    end
    object grd_Rechte: TcxGrid
      Left = 10000
      Top = 10000
      Width = 1208
      Height = 324
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 40
      TabStop = False
      Visible = False
      LockedStateImageOptions.Effect = lsieDark
      object grdDBTblView_Rechte: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = ds_Rechte
        DataController.Filter.PercentWildcard = '*'
        DataController.Filter.UnderscoreWildcard = '?'
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
              end>
            SummaryItems = <
              item
              end>
          end>
        Filtering.ColumnPopup.MultiSelect = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.ShowHourglassCursor = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellEndEllipsis = True
        OptionsView.NoDataToDisplayInfoText = '<Keine Daten Vorhanden>'
        OptionsView.GroupByBox = False
        OptionsView.HeaderFilterButtonShowMode = fbmButton
        OptionsView.IndicatorWidth = 14
        object grdDBTblView_RechteID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          DataBinding.IsNullValueType = True
          Visible = False
        end
        object grdDBTblView_RechteBezeichnung: TcxGridDBColumn
          DataBinding.FieldName = 'Bezeichnung'
          DataBinding.IsNullValueType = True
          Width = 800
        end
      end
      object grdLvl_Rechte: TcxGridLevel
        GridView = grdDBTblView_Rechte
      end
    end
    object chkbx_BenutzerRestapi: TcxDBCheckBox
      Left = 36
      Top = 267
      AutoSize = False
      BiDiMode = bdLeftToRight
      DataBinding.DataField = 'Restapi'
      DataBinding.DataSource = ds_Benutzer
      ParentBiDiMode = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 5
      Transparent = True
      Height = 19
      Width = 601
    end
    object edt_BenutzerName: TcxDBTextEdit
      Left = 36
      Top = 215
      DataBinding.DataField = 'Vorname'
      DataBinding.DataSource = ds_Benutzer
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 3
      OnExit = btn_BenutzerSaveClick
      Width = 601
    end
    object edt_BenutzerUser: TcxDBTextEdit
      Left = 36
      Top = 188
      DataBinding.DataField = 'Benutzer'
      DataBinding.DataSource = ds_Benutzer
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 2
      OnExit = btn_BenutzerSaveClick
      Width = 601
    end
    object edt_BenutzerSurname: TcxDBTextEdit
      Left = 36
      Top = 242
      AutoSize = False
      DataBinding.DataField = 'Nachname'
      DataBinding.DataSource = ds_Benutzer
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 4
      OnExit = btn_BenutzerSaveClick
      Height = 19
      Width = 601
    end
    object btn_BenutzerChangePassword: TcxButton
      Left = 1124
      Top = 188
      Width = 120
      Height = 21
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.SourceHeight = 16
      OptionsImage.Glyph.SourceWidth = 16
      OptionsImage.Glyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C61636B7B66696C6C3A233732373237
        323B7D262331333B262331303B2623393B2E5265647B66696C6C3A2344313143
        31433B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A23
        4646423131353B7D262331333B262331303B2623393B2E477265656E7B66696C
        6C3A233033394332333B7D3C2F7374796C653E0D0A3C672069643D224B657922
        3E0D0A09093C7061746820636C6173733D2259656C6C6F772220643D224D3230
        2C34632D342E342C302D382C332E362D382C3863302C312E322C302E332C322E
        332C302E372C332E334C342C323476346834762D326832762D3268326C342E37
        2D342E3763312C302E352C322E312C302E372C332E332C302E3720202623393B
        2623393B63342E342C302C382D332E362C382D385332342E342C342C32302C34
        7A204D32322C3132632D312E312C302D322D302E392D322D3263302D312E312C
        302E392D322C322D3273322C302E392C322C324332342C31312E312C32332E31
        2C31322C32322C31327A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      TabOrder = 7
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btn_BenutzerChangePasswordClick
    end
    object chkbx_BenutzerAutologin: TcxDBCheckBox
      Left = 643
      Top = 242
      AutoSize = False
      BiDiMode = bdLeftToRight
      DataBinding.DataField = 'Autologin'
      DataBinding.DataSource = ds_Benutzer
      ParentBiDiMode = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 9
      Transparent = True
      Height = 20
      Width = 601
    end
    object edt_BenutzerPassword: TcxDBTextEdit
      Left = 643
      Top = 188
      AutoSize = False
      DataBinding.DataField = 'Passwort'
      DataBinding.DataSource = ds_Benutzer
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 6
      OnEnter = edt_BenutzerPasswordEnter
      OnExit = edt_BenutzerPasswordExit
      Height = 19
      Width = 475
    end
    object lucmbbx_BenutzerRights: TcxDBLookupComboBox
      Left = 643
      Top = 215
      DataBinding.DataField = 'ID_Rechte'
      DataBinding.DataSource = ds_Benutzer
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_Rechte
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 8
      OnExit = btn_BenutzerSaveClick
      Width = 601
    end
    object brdckCtrl_Benutzer: TdxBarDockControl
      Left = 36
      Top = 63
      Width = 1208
      Height = 58
      Align = dalNone
      BarManager = brmgr_Benutzer
    end
    object brdckCtrl_Rechte: TdxBarDockControl
      Left = 10000
      Top = 10000
      Width = 1208
      Height = 58
      Align = dalNone
      BarManager = brmgr_Benutzer
      Visible = False
    end
    object lucmbbx_RechteAllgemeinOptionen: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'Konfiguration'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 15
      Visible = False
      Width = 471
    end
    object lucmbbx_RechteAllgemeinBenutzer: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Benutzer'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 14
      Visible = False
      Width = 472
    end
    object chkbx_RechtAll: TcxDBCheckBox
      Left = 10000
      Top = 10000
      AutoSize = False
      BiDiMode = bdLeftToRight
      DataBinding.DataField = 'Alle_Benutzer'
      DataBinding.DataSource = ds_Rechte
      ParentBiDiMode = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 16
      Transparent = True
      Visible = False
      Height = 19
      Width = 1167
    end
    object lucmbbx_RechteArchivArchiv: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'dm_Archiv'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 17
      Visible = False
      Width = 1058
    end
    object lucmbbx_RechteBackupBackup: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'dm_Archiv'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 18
      Visible = False
      Width = 1058
    end
    object lucmbbx_RechteManagerKontakt: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'ma_Kontakte'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 19
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteManagerKalender: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      AutoSize = False
      DataBinding.DataField = 'ma_Kalender'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 20
      Visible = False
      Height = 19
      Width = 472
    end
    object lucmbbx_RechteManagerStundenplan: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'ma_Stundenplan'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 21
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteManagerMail: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'ma_Email'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 22
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteManagerPassword: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'ma_Password'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 23
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteManagerAusgaben: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      AutoSize = False
      DataBinding.DataField = 'ma_Ausgaben'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 28
      Visible = False
      Height = 19
      Width = 471
    end
    object lucmbbx_RechteManagerSerials: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      AutoSize = False
      DataBinding.DataField = 'ma_Kalender'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 24
      Visible = False
      Height = 19
      Width = 471
    end
    object lucmbbx_RechteManagerMonatsbericht: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      AutoSize = False
      DataBinding.DataField = 'ma_Email'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 25
      Visible = False
      Height = 19
      Width = 471
    end
    object lucmbbx_RechteManagerVerfuegung: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Serials'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 26
      Visible = False
      Height = 19
      Width = 471
    end
    object lucmbbx_RechteManagerEinnahmen: TcxDBLookupComboBox
      Left = 10000
      Top = 10123
      DataBinding.DataField = 'ma_Verfuegung'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 27
      Visible = False
      Width = 471
    end
    object lucmbbx_RechteMediacenterAudio: TcxDBLookupComboBox
      Left = 10000
      Top = 10033
      AutoSize = False
      DataBinding.DataField = 'mc_Audioplayer'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 29
      Visible = False
      Height = 19
      Width = 472
    end
    object lucmbbx_RechteMediacenterWeb: TcxDBLookupComboBox
      Left = 10000
      Top = 10033
      DataBinding.DataField = 'mc_Webradio'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 30
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteMediacenterVideo: TcxDBLookupComboBox
      Left = 10000
      Top = 10033
      DataBinding.DataField = 'mc_Videoplayer'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 31
      Visible = False
      Width = 471
    end
    object lucmbbx_RechteMediacenterFoto: TcxDBLookupComboBox
      Left = 10000
      Top = 10033
      DataBinding.DataField = 'mc_Fotos'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 32
      Visible = False
      Width = 471
    end
    object lucmbbx_RechteMP3MangerMP3: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'mm_MP3'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 33
      Visible = False
      Width = 1058
    end
    object lucmbbx_RechteNotenrechnerNoten: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'nr_Noten'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 34
      Visible = False
      Height = 19
      Width = 1058
    end
    object lucmbbx_RechteServiceManagerShutdown: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'sm_Shutdown'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 35
      Visible = False
      Width = 472
    end
    object lucmbbx_RechteServiceManagerBackup: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'sm_Backup'
      DataBinding.DataSource = ds_Rechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = ds_RechteDetail
      Properties.OnChange = lucmbbx_ChangeColorRight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 36
      Visible = False
      Height = 19
      Width = 471
    end
    object edt_BenutzerSucheBenutzer: TcxButtonEdit
      Left = 48
      Top = 145
      AutoSize = False
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
      Properties.OnButtonClick = edt_searchUserPropertiesButtonClick
      Properties.OnChange = edt_searchUserPropertiesChange
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 25
      Width = 1184
    end
    object edt_RechteSucheBezeichnung: TcxButtonEdit
      Left = 10000
      Top = 10000
      AutoSize = False
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
      Properties.OnButtonClick = edt_RechteSucheBenutzerPropertiesButtonClick
      Properties.OnChange = edt_RechteSucheBenutzerPropertiesChange
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 12
      Visible = False
      Height = 25
      Width = 1184
    end
    object lagrp_Personal: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lagrp_BenutzerRechteTab: TdxLayoutGroup
      Parent = lagrp_Personal
      AlignHorz = ahClient
      AlignVert = avClient
      SizeOptions.Height = 800
      LayoutDirection = ldTabbed
      ShowBorder = False
      TabbedOptions.HotTrack = True
      Index = 0
    end
    object lagrp_Benutzer: TdxLayoutGroup
      Parent = lagrp_BenutzerRechteTab
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 0
      TabbedOptions.HotTrack = True
      TabbedOptions.MultiLineTabCaptions = True
      TabbedOptions.ShowFrame = True
      Index = 0
    end
    object lagrp_Rechte: TdxLayoutGroup
      Parent = lagrp_BenutzerRechteTab
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 1
      Index = 1
    end
    object lagrp_BenutzerHeader: TdxLayoutGroup
      Parent = lagrp_Benutzer
      AlignHorz = ahClient
      AlignVert = avClient
      ItemIndex = 2
      Index = 0
    end
    object lagrp_RechteAllgemein: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 2
      Index = 0
    end
    object laitm_BenutzerBenutzer: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BenutzerUser
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_BenutzerVorname: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BenutzerName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_BenutzerNachname: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BenutzerSurname
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_BenutzerRestapi: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsLeft
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = chkbx_BenutzerRestapi
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitm_BenutzerPassword: TdxLayoutItem
      Parent = lagrp_BenutzerPassword
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BenutzerPassword
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 40
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_BenutzerRecht: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_BenutzerRights
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_BenutzerAutologin: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsRight
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'sd'
      CaptionOptions.Visible = False
      Control = chkbx_BenutzerAutologin
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_BenutzerPasswordBtn: TdxLayoutItem
      Parent = lagrp_BenutzerPassword
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = btn_BenutzerChangePassword
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_BenutzerBar: TdxLayoutItem
      Parent = lagrp_BenutzerHeader
      AlignHorz = ahClient
      AlignVert = avTop
      Control = brdckCtrl_Benutzer
      ControlOptions.AlignVert = avTop
      ControlOptions.OriginalHeight = 58
      ControlOptions.OriginalWidth = 500
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteBar: TdxLayoutItem
      Parent = lagrp_RechteHeader
      Control = brdckCtrl_Rechte
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 58
      ControlOptions.OriginalWidth = 500
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_BenutzerGrid: TdxLayoutItem
      Parent = lagrp_BenutzerHeader
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grd_Benutzer
      ControlOptions.OriginalHeight = 5
      ControlOptions.OriginalWidth = 1129
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitem_RechteAllgemeinBezeichnung: TdxLayoutItem
      Parent = lagrp_RechteAllgemein
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_OptionRight
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 853
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitem_RechteAllgemeinOption: TdxLayoutItem
      Parent = lagrp_RechteAllgemeinDetail
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteAllgemeinOptionen
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitem_RechteAllgemeinBenutzer: TdxLayoutItem
      Parent = lagrp_RechteAllgemeinDetail
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteAllgemeinBenutzer
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = lagrp_RechteAllgemein
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = chkbx_RechtAll
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 85
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lagrp_RechteArchiv: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 1
    end
    object lagrp_RechteBackup: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 2
    end
    object lagrp_RechteManager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object lagrp_RechteMP3Manager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 5
    end
    object lagrp_RechteMediacenter: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 4
    end
    object laitm_RechteArchivArchiv: TdxLayoutItem
      Parent = lagrp_RechteArchiv
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteArchivArchiv
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteBackupBackup: TdxLayoutItem
      Parent = lagrp_RechteBackup
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteBackupBackup
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteManagerKontakte: TdxLayoutItem
      Parent = lagrp_RechteManagerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerKontakt
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteManagerKalender: TdxLayoutItem
      Parent = lagrp_RechteManagerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerKalender
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteManagerStundenplan: TdxLayoutItem
      Parent = lagrp_RechteManagerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerStundenplan
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_RechteManagerMail: TdxLayoutItem
      Parent = lagrp_RechteManagerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerMail
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitm_RechteManagerPassword: TdxLayoutItem
      Parent = lagrp_RechteManagerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerPassword
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object laitm_RechteManagerAusgaben: TdxLayoutItem
      Parent = lagrp_RechteManagerRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerAusgaben
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object laitm_RechteManagerSerials: TdxLayoutItem
      Parent = lagrp_RechteManagerRight
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteManagerSerials
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteManagerMonatsbericht: TdxLayoutItem
      Parent = lagrp_RechteManagerRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerMonatsbericht
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteManagerVerfuegung: TdxLayoutItem
      Parent = lagrp_RechteManagerRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerVerfuegung
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_RechteManagerEinnahmen: TdxLayoutItem
      Parent = lagrp_RechteManagerRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteManagerEinnahmen
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitm_RechteMediacenterAudio: TdxLayoutItem
      Parent = lagrp_RechteMediacenterLeft
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteMediacenterAudio
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteMediacenterWeb: TdxLayoutItem
      Parent = lagrp_RechteMediacenterLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteMediacenterWeb
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteMediacenterVideo: TdxLayoutItem
      Parent = lagrp_RechteMediacenterRight
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteMediacenterVideo
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteMediacenterFotos: TdxLayoutItem
      Parent = lagrp_RechteMediacenterRight
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteMediacenterFoto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteMP3ManagerMP3: TdxLayoutItem
      Parent = lagrp_RechteMP3Manager
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteMP3MangerMP3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_RechteVokabeltrainer: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      LayoutDirection = ldHorizontal
      Index = 8
    end
    object lagrp_RechteServicemanager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      LayoutDirection = ldHorizontal
      Index = 7
    end
    object lagrp_RechteNotenrechner: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 6
    end
    object laitm_RechteGrid: TdxLayoutItem
      Parent = lagrp_RechteHeader
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grd_Rechte
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 1118
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object laitm_RechteNotenrechnerNoten: TdxLayoutItem
      Parent = lagrp_RechteNotenrechner
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteNotenrechnerNoten
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteServicemanagerShutdown: TdxLayoutItem
      Parent = lagrp_RechteServicemanager
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteServiceManagerShutdown
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_RechteServicemanagerBackup: TdxLayoutItem
      Parent = lagrp_RechteServicemanager
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteServiceManagerBackup
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteVokabeltrainerStatistik: TdxLayoutItem
      Parent = lagrp_RechteVokabeltrainer
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Width = 105
      Control = lucmbbx_RechteVokabeltrainerStatistik
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteVokabeltrainerTest: TdxLayoutItem
      Parent = lagrp_RechteVokabeltrainerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteVokabeltrainerTest
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_RechteVokabeltrainerVokabeln: TdxLayoutItem
      Parent = lagrp_RechteVokabeltrainerLeft
      AlignHorz = ahClient
      AlignVert = avTop
      Control = lucmbbx_RechteVokabeltrainerVokabeln
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_RechteVokabeltrainerLeft: TdxLayoutGroup
      Parent = lagrp_RechteVokabeltrainer
      AlignHorz = ahClient
      AlignVert = avTop
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteMediacenterRight: TdxLayoutGroup
      Parent = lagrp_RechteMediacenter
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      ShowBorder = False
      Index = 1
    end
    object lagrp_RechteMediacenterLeft: TdxLayoutGroup
      Parent = lagrp_RechteMediacenter
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteManagerRight: TdxLayoutGroup
      Parent = lagrp_RechteManager
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 4
      ShowBorder = False
      Index = 1
    end
    object lagrp_RechteManagerLeft: TdxLayoutGroup
      Parent = lagrp_RechteManager
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 4
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteAllgemeinDetail: TdxLayoutGroup
      Parent = lagrp_RechteAllgemein
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lagrp_BenutzerPassword: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetailsRight
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_BenutzerSucheDetailsRight: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetails
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 2
      ShowBorder = False
      Index = 1
    end
    object lagrp_BenutzerSucheDetailsLeft: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetails
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 3
      ShowBorder = False
      Index = 0
    end
    object lagrp_BenutzerSucheDetails: TdxLayoutGroup
      Parent = lagrp_BenutzerHeader
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object lagrp_RechteHeader: TdxLayoutGroup
      Parent = lagrp_Rechte
      AlignHorz = ahClient
      AlignVert = avClient
      ItemIndex = 2
      Index = 0
    end
    object lagrp_BenutzerSuche: TdxLayoutGroup
      Parent = lagrp_BenutzerHeader
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_BenutzerSuche: TdxLayoutItem
      Parent = lagrp_BenutzerSuche
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_BenutzerSucheBenutzer
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 865
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_RechteAlleModule: TdxLayoutGroup
      Parent = lagrp_RechteHeader
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 7
      ShowBorder = False
      Index = 2
    end
    object lagrp_RechteSuche: TdxLayoutGroup
      Parent = lagrp_RechteHeader
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_RechteSuche: TdxLayoutItem
      Parent = lagrp_RechteSuche
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edt_RechteSucheBezeichnung
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 989
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object qry_Benutzer: TFDQuery
    AfterOpen = SetButtonsEnableVisible
    AfterInsert = SetButtonsEnableVisible
    AfterEdit = SetButtonsEnableVisible
    AfterPost = SetButtonsEnableVisible
    AfterCancel = SetButtonsEnableVisible
    AfterDelete = SetButtonsEnableVisible
    AfterScroll = SetButtonsEnableVisible
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      '')
    Left = 623
    Top = 216
  end
  object qry_Rechte: TFDQuery
    AfterOpen = SetButtonsEnableVisible
    AfterInsert = SetButtonsEnableVisible
    AfterEdit = SetButtonsEnableVisible
    AfterPost = SetButtonsEnableVisible
    AfterCancel = SetButtonsEnableVisible
    AfterDelete = SetButtonsEnableVisible
    AfterScroll = SetButtonsEnableVisible
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      'Select * '
      'From Rechte'
      '')
    Left = 623
    Top = 296
  end
  object qry_RechteDetail: TFDQuery
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      '')
    Left = 647
    Top = 368
  end
  object ds_Benutzer: TDataSource
    DataSet = qry_Benutzer
    Left = 935
    Top = 376
  end
  object ds_Rechte: TDataSource
    DataSet = qry_Rechte
    Left = 751
    Top = 264
  end
  object ds_RechteDetail: TDataSource
    DataSet = qry_RechteDetail
    Left = 751
    Top = 312
  end
  object brmgr_Benutzer: TdxBarManager
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
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 448
    Top = 256
    PixelsPerInch = 96
    object tb_Benutzer: TdxBar
      CaptionButtons = <>
      DockControl = brdckCtrl_Benutzer
      DockedDockControl = brdckCtrl_Benutzer
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1304
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_BenutzerNew'
        end
        item
          Visible = True
          ItemName = 'btn_BenutzerSave'
        end
        item
          Visible = True
          ItemName = 'btn_BenutzerCancel'
        end
        item
          Visible = True
          ItemName = 'btn_BenutzerDelete'
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
    object tb_Rechte: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockControl = brdckCtrl_Rechte
      DockedDockControl = brdckCtrl_Rechte
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1304
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_RechtNew'
        end
        item
          Visible = True
          ItemName = 'btn_RechtSave'
        end
        item
          Visible = True
          ItemName = 'btn_RechtCancel'
        end
        item
          Visible = True
          ItemName = 'btn_RechtDelete'
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
    object btn_BenutzerNew: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C61636B7B66696C6C3A233732373237
        323B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A2346
        46423131353B7D262331333B262331303B2623393B2E426C75657B66696C6C3A
        233131373744373B7D262331333B262331303B2623393B2E5265647B66696C6C
        3A234431314331433B7D262331333B262331303B2623393B2E57686974657B66
        696C6C3A234646464646463B7D262331333B262331303B2623393B2E47726565
        6E7B66696C6C3A233033394332333B7D262331333B262331303B2623393B2E73
        74307B66696C6C3A233732373237323B7D262331333B262331303B2623393B2E
        7374317B6F7061636974793A302E353B7D262331333B262331303B2623393B2E
        7374327B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A3C672069
        643D2241646446696C65223E0D0A09093C7061746820636C6173733D22426C61
        636B2220643D224D31362C3236483656346831387631346832563363302D302E
        352D302E352D312D312D31483543342E352C322C342C322E352C342C33763234
        63302C302E352C302E352C312C312C316831315632367A222F3E0D0A09093C70
        6F6C79676F6E20636C6173733D22477265656E2220706F696E74733D2233302C
        32342032362C32342032362C32302032322C32302032322C32342031382C3234
        2031382C32382032322C32382032322C33322032362C33322032362C32382033
        302C3238202623393B222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      OnClick = btn_BenutzerNewClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_BenutzerSave: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D223020302033322033322220656E61626C65
        2D6261636B67726F756E643D226E6577203020302033322033322220786D6C3A
        73706163653D227072657365727665223E262331333B262331303B3C706F6C79
        676F6E2066696C6C3D22233337374142352220706F696E74733D22322C322032
        2C33302033302C33302033302C362032362C3220222F3E0D0A3C726563742078
        3D22362220793D223134222066696C6C3D222346464646464622207769647468
        3D22323022206865696768743D223134222F3E0D0A3C7265637420783D223622
        20793D223222206F7061636974793D22302E36222066696C6C3D222346464646
        46462220656E61626C652D6261636B67726F756E643D226E6577202020202220
        77696474683D22313822206865696768743D223130222F3E0D0A3C7265637420
        783D2232302220793D2232222066696C6C3D2223333737414235222077696474
        683D223222206865696768743D2238222F3E0D0A3C2F7376673E0D0A}
      OnClick = btn_BenutzerSaveClick
      AutoGrayScale = False
      LargeImageIndex = 1
      Width = 125
    end
    object btn_BenutzerCancel: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076696577426F783D222D36202D362033322033
        322220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F32303030
        2F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E7733
        2E6F72672F313939392F786C696E6B223E0D0A093C672069643D224C61796572
        5F3122207472616E73666F726D3D227472616E736C617465282D362C202D3629
        22207374796C653D22656E61626C652D6261636B67726F756E643A6E65772030
        2030203332203332223E0D0A09093C672069643D2244656C657465223E0D0A09
        09093C673E0D0A090909093C7061746820643D224D31382E382C2031364C3235
        2E372C20392E314332362E312C20382E372032362E312C20382E312032352E37
        2C20372E374C32342E332C20362E334332332E392C20352E392032332E332C20
        352E392032322E392C20362E334C31362C2031332E324C392E312C20362E3343
        382E372C20352E3920382E312C20352E3920372E372C20362E334C362E332C20
        372E3743352E392C20382E3120352E392C20382E3720362E332C20392E314C31
        332E322C2031364C362E332C2032322E3943352E392C2032332E3320352E392C
        2032332E3920362E332C2032342E334C372E372C2032352E3743382E312C2032
        362E3120382E372C2032362E3120392E312C2032352E374C31362C2031382E38
        4C32322E392C2032352E374332332E332C2032362E312032332E392C2032362E
        312032342E332C2032352E374C32352E372C2032342E334332362E312C203233
        2E392032362E312C2032332E332032352E372C2032322E394C31382E382C2031
        367A222066696C6C3D22233131373744372220636C6173733D22426C7565222F
        3E0D0A0909093C2F673E0D0A09093C2F673E0D0A093C2F673E0D0A093C672069
        643D224C617965725F3122207472616E73666F726D3D227472616E736C617465
        282D362C202D362922207374796C653D22656E61626C652D6261636B67726F75
        6E643A6E657720302030203332203332223E0D0A09093C672069643D2244656C
        657465223E0D0A0909093C673E0D0A090909093C7061746820643D224D31382E
        382C2031364C32352E372C20392E314332362E312C20382E372032362E312C20
        382E312032352E372C20372E374C32342E332C20362E334332332E392C20352E
        392032332E332C20352E392032322E392C20362E334C31362C2031332E324C39
        2E312C20362E3343382E372C20352E3920382E312C20352E3920372E372C2036
        2E334C362E332C20372E3743352E392C20382E3120352E392C20382E3720362E
        332C20392E314C31332E322C2031364C362E332C2032322E3943352E392C2032
        332E3320352E392C2032332E3920362E332C2032342E334C372E372C2032352E
        3743382E312C2032362E3120382E372C2032362E3120392E312C2032352E374C
        31362C2031382E384C32322E392C2032352E374332332E332C2032362E312032
        332E392C2032362E312032342E332C2032352E374C32352E372C2032342E3343
        32362E312C2032332E392032362E312C2032332E332032352E372C2032322E39
        4C31382E382C2031367A222066696C6C3D22233131373744372220636C617373
        3D22426C7565222F3E0D0A0909093C2F673E0D0A09093C2F673E0D0A093C2F67
        3E0D0A3C2F7376673E0D0A}
      OnClick = btn_BenutzerCancelClick
      AutoGrayScale = False
      LargeImageIndex = 2
      Width = 125
    end
    object btn_BenutzerDelete: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C61636B7B66696C6C3A233732373237
        323B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A2346
        46423131353B7D262331333B262331303B2623393B2E426C75657B66696C6C3A
        233131373744373B7D262331333B262331303B2623393B2E477265656E7B6669
        6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
        696C6C3A234431314331433B7D262331333B262331303B2623393B2E57686974
        657B66696C6C3A234646464646463B7D262331333B262331303B2623393B2E73
        74307B6F7061636974793A302E37353B7D262331333B262331303B2623393B2E
        7374317B6F7061636974793A302E353B7D262331333B262331303B2623393B2E
        7374327B6F7061636974793A302E32353B7D3C2F7374796C653E0D0A3C672069
        643D2244656C6574654C697374223E0D0A09093C7061746820636C6173733D22
        426C61636B2220643D224D362C323656346831387631332E326C322D32563363
        302D302E362D302E342D312D312D31483543342E342C322C342C322E342C342C
        3376323463302C302E362C302E342C312C312C3168382E326C322D3248367A22
        2F3E0D0A09093C706F6C79676F6E20636C6173733D225265642220706F696E74
        733D2232382C32302032362C31382032322C32322031382C31382031362C3230
        2032302C32342031362C32382031382C33302032322C32362032362C33302032
        382C32382032342C3234202623393B222F3E0D0A093C2F673E0D0A3C2F737667
        3E0D0A}
      OnClick = btn_BenutzerDeleteClick
      AutoGrayScale = False
      LargeImageIndex = 3
      Width = 125
    end
    object btn_RechtNew: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C61636B7B66696C6C3A233732373237
        323B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A2346
        46423131353B7D262331333B262331303B2623393B2E426C75657B66696C6C3A
        233131373744373B7D262331333B262331303B2623393B2E5265647B66696C6C
        3A234431314331433B7D262331333B262331303B2623393B2E57686974657B66
        696C6C3A234646464646463B7D262331333B262331303B2623393B2E47726565
        6E7B66696C6C3A233033394332333B7D262331333B262331303B2623393B2E73
        74307B66696C6C3A233732373237323B7D262331333B262331303B2623393B2E
        7374317B6F7061636974793A302E353B7D262331333B262331303B2623393B2E
        7374327B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A3C672069
        643D2241646446696C65223E0D0A09093C7061746820636C6173733D22426C61
        636B2220643D224D31362C3236483656346831387631346832563363302D302E
        352D302E352D312D312D31483543342E352C322C342C322E352C342C33763234
        63302C302E352C302E352C312C312C316831315632367A222F3E0D0A09093C70
        6F6C79676F6E20636C6173733D22477265656E2220706F696E74733D2233302C
        32342032362C32342032362C32302032322C32302032322C32342031382C3234
        2031382C32382032322C32382032322C33322032362C33322032362C32382033
        302C3238202623393B222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      OnClick = btn_RechtNewClick
      AutoGrayScale = False
      LargeImageIndex = 27
      Width = 125
    end
    object btn_RechtDelete: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C61636B7B66696C6C3A233732373237
        323B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A2346
        46423131353B7D262331333B262331303B2623393B2E426C75657B66696C6C3A
        233131373744373B7D262331333B262331303B2623393B2E477265656E7B6669
        6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
        696C6C3A234431314331433B7D262331333B262331303B2623393B2E57686974
        657B66696C6C3A234646464646463B7D262331333B262331303B2623393B2E73
        74307B6F7061636974793A302E37353B7D262331333B262331303B2623393B2E
        7374317B6F7061636974793A302E353B7D262331333B262331303B2623393B2E
        7374327B6F7061636974793A302E32353B7D3C2F7374796C653E0D0A3C672069
        643D2244656C6574654C697374223E0D0A09093C7061746820636C6173733D22
        426C61636B2220643D224D362C323656346831387631332E326C322D32563363
        302D302E362D302E342D312D312D31483543342E342C322C342C322E342C342C
        3376323463302C302E362C302E342C312C312C3168382E326C322D3248367A22
        2F3E0D0A09093C706F6C79676F6E20636C6173733D225265642220706F696E74
        733D2232382C32302032362C31382032322C32322031382C31382031362C3230
        2032302C32342031362C32382031382C33302032322C32362032362C33302032
        382C32382032342C3234202623393B222F3E0D0A093C2F673E0D0A3C2F737667
        3E0D0A}
      OnClick = btn_RechtDeleteClick
      AutoGrayScale = False
      LargeImageIndex = 24
      Width = 125
    end
    object btn_RechtCancel: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076696577426F783D222D36202D362033322033
        322220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F32303030
        2F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E7733
        2E6F72672F313939392F786C696E6B223E0D0A093C672069643D224C61796572
        5F3122207472616E73666F726D3D227472616E736C617465282D362C202D3629
        22207374796C653D22656E61626C652D6261636B67726F756E643A6E65772030
        2030203332203332223E0D0A09093C672069643D2244656C657465223E0D0A09
        09093C673E0D0A090909093C7061746820643D224D31382E382C2031364C3235
        2E372C20392E314332362E312C20382E372032362E312C20382E312032352E37
        2C20372E374C32342E332C20362E334332332E392C20352E392032332E332C20
        352E392032322E392C20362E334C31362C2031332E324C392E312C20362E3343
        382E372C20352E3920382E312C20352E3920372E372C20362E334C362E332C20
        372E3743352E392C20382E3120352E392C20382E3720362E332C20392E314C31
        332E322C2031364C362E332C2032322E3943352E392C2032332E3320352E392C
        2032332E3920362E332C2032342E334C372E372C2032352E3743382E312C2032
        362E3120382E372C2032362E3120392E312C2032352E374C31362C2031382E38
        4C32322E392C2032352E374332332E332C2032362E312032332E392C2032362E
        312032342E332C2032352E374C32352E372C2032342E334332362E312C203233
        2E392032362E312C2032332E332032352E372C2032322E394C31382E382C2031
        367A222066696C6C3D22233131373744372220636C6173733D22426C7565222F
        3E0D0A0909093C2F673E0D0A09093C2F673E0D0A093C2F673E0D0A093C672069
        643D224C617965725F3122207472616E73666F726D3D227472616E736C617465
        282D362C202D362922207374796C653D22656E61626C652D6261636B67726F75
        6E643A6E657720302030203332203332223E0D0A09093C672069643D2244656C
        657465223E0D0A0909093C673E0D0A090909093C7061746820643D224D31382E
        382C2031364C32352E372C20392E314332362E312C20382E372032362E312C20
        382E312032352E372C20372E374C32342E332C20362E334332332E392C20352E
        392032332E332C20352E392032322E392C20362E334C31362C2031332E324C39
        2E312C20362E3343382E372C20352E3920382E312C20352E3920372E372C2036
        2E334C362E332C20372E3743352E392C20382E3120352E392C20382E3720362E
        332C20392E314C31332E322C2031364C362E332C2032322E3943352E392C2032
        332E3320352E392C2032332E3920362E332C2032342E334C372E372C2032352E
        3743382E312C2032362E3120382E372C2032362E3120392E312C2032352E374C
        31362C2031382E384C32322E392C2032352E374332332E332C2032362E312032
        332E392C2032362E312032342E332C2032352E374C32352E372C2032342E3343
        32362E312C2032332E392032362E312C2032332E332032352E372C2032322E39
        4C31382E382C2031367A222066696C6C3D22233131373744372220636C617373
        3D22426C7565222F3E0D0A0909093C2F673E0D0A09093C2F673E0D0A093C2F67
        3E0D0A3C2F7376673E0D0A}
      OnClick = btn_RechtCancelClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_RechtSave: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D223020302033322033322220656E61626C65
        2D6261636B67726F756E643D226E6577203020302033322033322220786D6C3A
        73706163653D227072657365727665223E262331333B262331303B3C706F6C79
        676F6E2066696C6C3D22233337374142352220706F696E74733D22322C322032
        2C33302033302C33302033302C362032362C3220222F3E0D0A3C726563742078
        3D22362220793D223134222066696C6C3D222346464646464622207769647468
        3D22323022206865696768743D223134222F3E0D0A3C7265637420783D223622
        20793D223222206F7061636974793D22302E36222066696C6C3D222346464646
        46462220656E61626C652D6261636B67726F756E643D226E6577202020202220
        77696474683D22313822206865696768743D223130222F3E0D0A3C7265637420
        783D2232302220793D2232222066696C6C3D2223333737414235222077696474
        683D223222206865696768743D2238222F3E0D0A3C2F7376673E0D0A}
      OnClick = btn_RechtSaveClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
  end
  object lalaflst_Benutzer: TdxLayoutLookAndFeelList
    Left = 192
    Top = 384
    object laCxlaf_Benutzer: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    Left = 624
    Top = 384
    Bitmap = {
      494C010102000800040010001000FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001000014D77610FFD77610FF02010019000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A1AC3F71B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF00000000000000000000000000000000000000000000000000000000160C
      015204020023000000000D070141D77610FFD77610FF0E070142000000000703
      002E1A0E025A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001616A4E21B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1717
      B1EB000000000000000000000000000000000000000000000000160C0153D374
      10FDC16A0FF2311B037B84480AC8D77610FFD77610FF8F4E0BD03E220489C96E
      0FF7D57510FE170D015500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000505266D1A1AC9FA1B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1E1DCEFF824D
      67FFD77610FFD77610FFD77610FFD77610FF000000000000000005020028C66D
      0FF5D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFBE690FF00301002000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000112030318570C0C
      60AD1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF543796FF955654FFC86F1FFFD776
      10FFD77610FFD77610FFD77610FFB3630DE9000000000000000000000000361E
      0481D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FF301A03790000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000B0B55A31B1BD1FF1B1BD1FF593991FFD77610FFD77610FFD77610FFD776
      10FFD77610FFD77610FFD77610FF4827059400000000010100180D070141884B
      0BCBD77610FFD77610FF653808AF01000014010000125E3407A9D77610FFD776
      10FF894B0BCC110901490201001B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000B141497D91B1BD1FF1B1BD1FF3327B8FFCD711BFFD77610FFD77610FFD776
      10FFD77610FF9B550BD9311B037A0000000600000000D77610FFD77610FFD776
      10FFD77610FFD77610FF0201001A000000000000000001000013D77610FFD776
      10FFD77610FFD77610FFD77610FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      2B741B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF7B4A6EFFD77610FFD77610FF9D56
      0CDA0603002B00000000000000000000000000000000D77610FFD77610FFD776
      10FFD77610FFD77610FF0201001D000000000000000001000015D77610FFD776
      10FFD77610FFD77610FFD77610FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001111
      83CA1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF3C2BAFFFD77610FFD77610FF874A
      0BCA381F0483140B014E000000000000000000000000010000120D070141884B
      0BCBD77610FFD77610FF6C3C08B50201001C0201001A653808AFD77610FFD776
      10FF8B4C0BCD0A06003A00000011000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      BDF31B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1E1DCEFFD77610FFD77610FFD776
      10FFD77610FF2514026B0000000000000000000000000000000000000000361E
      0480D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FF4023048B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001A1A
      C7F91B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1D1CCFFFD77610FFD77610FFD776
      10FFBB670EEE000000020000000000000000000000000000000004020026C36C
      0FF3D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFCD7010F90804003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      5AA81B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF553795FFD77610FFD77610FFD776
      10FFA45A0DDF0000000000000000000000000000000000000000160C0153D374
      10FDC76D0FF5371E048284480AC8D77610FFD77610FF82480AC729170371B865
      0EECD37410FD180D025600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000B090948961818B4ED1818B6EE54357CF0CD711AFFD77610FFD77610FFD776
      10FF8F4E0BD0000000000000000000000000000000000000000000000000160C
      015305020028000000000A050039D77610FFD77610FF10090148000000000201
      001B140B014E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000381F0483D77610FFD77610FFD77610FFD776
      10FF3F23048B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000010D77610FFD77610FF0201001A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000D754009BCBF690FF0BE690FF07A43
      09C0000000100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000}
    DesignInfo = 25166448
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
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
          433B7D3C2F7374796C653E0D0A3C672069643D224C617965725F32223E0D0A09
          093C7061746820636C6173733D22426C75652220643D224D32362C313663352C
          312E322C362C322E372C362C38682D372E35483863302D352E332C312D362E38
          2C362D3863322E362D302E362C332D322E332C332D322E3963302C302C302C30
          2C302C30632D342E312C302D352D312D352D3120202623393B2623393B63342E
          342D332C302E342D362E352C342D31302E3963312E312D312E332C322E352D31
          2E332C342D3163312E352D302E332C322E392D302E332C342C3163332E362C34
          2E342D302E342C372E392C342C31302E3963302C302D302E392C312D352C3163
          302C302C302C302E332C302C302E3320202623393B2623393B4332332C31332E
          392C32332E342C31352E342C32362C31367A222F3E0D0A09093C706174682063
          6C6173733D225265642220643D224D31382C3231632D322E362D302E372D332D
          322E332D332D3363312E362D312E362C332D342E372C332D3863302D302E322C
          302D302E352C302D3163302D322E352D322E382D352D352E392D3563302C302D
          302E312C302D302E312C3020202623393B2623393B63302C302D302E312C302D
          302E312C3043382E382C342C362C362E352C362C3963302C302E352C302C302E
          382C302C3163302C332E332C312E342C362E342C332C3863302C302E372D302E
          342C322E332D332C33632D352C312E342D362C312E312D362C37683132683132
          20202623393B2623393B4332342C32322E312C32332C32322E342C31382C3231
          7A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
        FileName = 'SVG Images\PCM\All_Users.svg'
        Keywords = 'PCM;All;Users'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E5265647B66696C6C3A234431314331433B
          7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A2337323732
          37323B7D262331333B262331303B2623393B2E426C75657B66696C6C3A233131
          373744373B7D262331333B262331303B2623393B2E477265656E7B66696C6C3A
          233033394332333B7D262331333B262331303B2623393B2E59656C6C6F777B66
          696C6C3A234646423131353B7D262331333B262331303B2623393B2E57686974
          657B66696C6C3A234646464646463B7D262331333B262331303B2623393B2E73
          74307B6F7061636974793A302E353B7D262331333B262331303B2623393B2E73
          74317B6F7061636974793A302E37353B7D262331333B262331303B2623393B2E
          7374327B6F7061636974793A302E32353B7D3C2F7374796C653E0D0A3C672069
          643D2253657474696E67223E0D0A09093C7061746820636C6173733D22426C75
          652220643D224D33302C3138762D346C2D342E342D302E37632D302E322D302E
          382D302E352D312E352D302E392D322E316C322E362D332E366C2D322E382D32
          2E386C2D332E362C322E36632D302E372D302E342D312E342D302E372D322E31
          2D302E394C31382C32682D3420202623393B2623393B6C2D302E372C342E3463
          2D302E382C302E322D312E352C302E352D322E312C302E394C372E352C342E37
          4C342E372C372E356C322E362C332E36632D302E342C302E372D302E372C312E
          342D302E392C322E314C322C313476346C342E342C302E3763302E322C302E38
          2C302E352C312E352C302E392C322E3120202623393B2623393B6C2D322E362C
          332E366C322E382C322E386C332E362D322E3663302E372C302E342C312E342C
          302E372C322E312C302E394C31342C333068346C302E372D342E3463302E382D
          302E322C312E352D302E352C322E312D302E396C332E362C322E366C322E382D
          322E386C2D322E362D332E3620202623393B2623393B63302E342D302E372C30
          2E372D312E342C302E392D322E314C33302C31387A204D31362C3230632D322E
          322C302D342D312E382D342D3463302D322E322C312E382D342C342D3473342C
          312E382C342C344332302C31382E322C31382E322C32302C31362C32307A222F
          3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
        FileName = 'SVG Images\PCM\All_Config.svg'
        Keywords = 'PCM;All;Config'
      end>
  end
end
