object frm_User: Tfrm_User
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_Config'
  ClientHeight = 1482
  ClientWidth = 1137
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
    Width = 1137
    Height = 1482
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
    OptionsImage.Images = dm_PCM.imglst_16x16
    object grd_Benutzer: TcxGrid
      Left = 24
      Top = 304
      Width = 1089
      Height = 1154
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
      Top = 10000
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
      Width = 932
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
      Width = 409
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
      Width = 409
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
      Width = 408
    end
    object grd_Rechte: TcxGrid
      Left = 10000
      Top = 10000
      Width = 1065
      Height = 150
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
      Left = 95
      Top = 267
      Hint = 'Zugriff auf PCM-Rest-API'
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Rest-API'
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
      Width = 473
    end
    object edt_BenutzerName: TcxDBTextEdit
      Left = 95
      Top = 215
      Hint = 'Vorname des Benutzers'
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
      Width = 473
    end
    object edt_BenutzerUser: TcxDBTextEdit
      Left = 95
      Top = 188
      Hint = 'Benutzername des Benutzers'
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
      Width = 473
    end
    object edt_BenutzerSurname: TcxDBTextEdit
      Left = 95
      Top = 242
      Hint = 'Nachname des Benutzers'
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
      Width = 473
    end
    object btn_BenutzerChangePassword: TcxButton
      Left = 981
      Top = 188
      Width = 120
      Height = 21
      Caption = 'Passwort '#228'ndern'
      OptionsImage.ImageIndex = 9
      OptionsImage.Images = dm_PCM.imglst_16x16
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
      Left = 679
      Top = 242
      Hint = 'automatisches Login des Benutzers '
      BiDiMode = bdLeftToRight
      Caption = 'automatisches Login (Windows-Benutzer)'
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
    end
    object edt_BenutzerPassword: TcxDBTextEdit
      Left = 629
      Top = 188
      Hint = 'Passwort des Benutzers'
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
      Width = 346
    end
    object lucmbbx_BenutzerRights: TcxDBLookupComboBox
      Left = 629
      Top = 215
      Hint = 'Recht des Benutzers'
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
      Width = 472
    end
    object brdckCtrl_Benutzer: TdxBarDockControl
      Left = 36
      Top = 63
      Width = 1065
      Height = 58
      Align = dalNone
      BarManager = brmgr_Benutzer
    end
    object brdckCtrl_Rechte: TdxBarDockControl
      Left = 10000
      Top = 10000
      Width = 1065
      Height = 58
      Align = dalNone
      BarManager = brmgr_Benutzer
      Visible = False
    end
    object lucmbbx_RechteAllgemeinOptionen: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
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
      Width = 409
    end
    object chkbx_RechtAll: TcxDBCheckBox
      Left = 10000
      Top = 10000
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Alle Benutzer'
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
      Width = 1041
    end
    object lucmbbx_RechteArchivArchiv: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 932
    end
    object lucmbbx_RechteBackupBackup: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 932
    end
    object lucmbbx_RechteManagerKontakt: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteManagerKalender: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteManagerStundenplan: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteManagerMail: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteManagerPassword: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteManagerAusgaben: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
    end
    object lucmbbx_RechteManagerSerials: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
    end
    object lucmbbx_RechteManagerMonatsbericht: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
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
      Width = 408
    end
    object lucmbbx_RechteManagerEinnahmen: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
    end
    object lucmbbx_RechteMediacenterAudio: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteMediacenterWeb: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 409
    end
    object lucmbbx_RechteMediacenterVideo: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
    end
    object lucmbbx_RechteMediacenterFoto: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
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
      Width = 408
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
      Width = 932
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
      Width = 932
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
      Width = 409
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
      Width = 408
    end
    object edt_BenutzerSucheBenutzer: TcxButtonEdit
      Left = 100
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
      Width = 989
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
      Width = 932
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
      CaptionOptions.Text = 'New Group'
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
      CaptionOptions.ImageIndex = 1
      CaptionOptions.Text = 'Benutzer'
      TabbedOptions.HotTrack = True
      TabbedOptions.MultiLineTabCaptions = True
      TabbedOptions.ShowFrame = True
      Index = 0
    end
    object lagrp_Rechte: TdxLayoutGroup
      Parent = lagrp_BenutzerRechteTab
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 2
      CaptionOptions.Text = 'Rechte'
      Index = 1
    end
    object lagrp_BenutzerHeader: TdxLayoutGroup
      Parent = lagrp_Benutzer
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Benutzerdetails[/B]'
      Index = 0
    end
    object lagrp_RechteAllgemein: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte Allgemein[/B]'
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      Index = 0
    end
    object laitm_BenutzerBenutzer: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsLeft
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Benutzer:'
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
      CaptionOptions.Text = 'Vorname:'
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
      CaptionOptions.Text = 'Nachname:'
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
      Offsets.Left = 59
      CaptionOptions.Text = 'cxDBCheckBox3'
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
      CaptionOptions.Text = 'Password:'
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
      CaptionOptions.Text = 'Recht:'
      Control = lucmbbx_BenutzerRights
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_BenutzerAutologin: TdxLayoutItem
      Parent = lagrp_BenutzerSucheDetailsRight
      AlignHorz = ahClient
      AlignVert = avTop
      Offsets.Left = 105
      CaptionOptions.Text = 'cxDBCheckBox2'
      CaptionOptions.Visible = False
      Control = chkbx_BenutzerAutologin
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laitm_BenutzerPasswordBtn: TdxLayoutItem
      Parent = lagrp_BenutzerPassword
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'btn_OptionChangePassword'
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
      Parent = lagrp_Benutzer
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grd_Benutzer
      ControlOptions.OriginalHeight = 5
      ControlOptions.OriginalWidth = 1129
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitem_RechteAllgemeinBezeichnung: TdxLayoutItem
      Parent = lagrp_RechteAllgemein
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Bezeichnung:'
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
      CaptionOptions.Text = 'Optionen:'
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
      CaptionOptions.Text = 'Benutzerverwaltung:'
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
      CaptionOptions.Text = '[B]Rechte PCM - Archiv[/B]'
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object lagrp_RechteBackup: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Backup[/B]'
      ButtonOptions.ShowExpandButton = True
      Index = 2
    end
    object lagrp_RechteManager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Manager[/B]'
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object lagrp_RechteMP3Manager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - MP3Manager[/B]'
      ButtonOptions.ShowExpandButton = True
      Index = 5
    end
    object lagrp_RechteMediacenter: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Mediacenter[/B]'
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 4
    end
    object laitm_RechteArchivArchiv: TdxLayoutItem
      Parent = lagrp_RechteArchiv
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Archiv:'
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
      CaptionOptions.Text = 'Backup:'
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
      CaptionOptions.Text = 'Kontakte:'
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
      CaptionOptions.Text = 'Kalender:'
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
      CaptionOptions.Text = 'Stundenplan:'
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
      CaptionOptions.Text = 'E-Mail:'
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
      CaptionOptions.Text = 'Passw'#246'rter:'
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
      CaptionOptions.Text = 'Ausgaben:'
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
      CaptionOptions.Text = 'Serials:'
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
      CaptionOptions.Text = 'Monats'#252'bersicht:'
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
      CaptionOptions.Text = 'Verf'#252'gung:'
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
      CaptionOptions.Text = 'Einnahmen:'
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
      CaptionOptions.Text = 'MP3 - Player:'
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
      CaptionOptions.Text = 'Webradio:'
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
      CaptionOptions.Text = 'Videoplayer:'
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
      CaptionOptions.Text = 'Fotos:'
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
      CaptionOptions.Text = 'MP3 - Tags:'
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
      CaptionOptions.Text = '[B]Rechte PCM - Vokabeltrainer[/B]'
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 8
    end
    object lagrp_RechteServicemanager: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Servicemanager[/B]'
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 7
    end
    object lagrp_RechteNotenrechner: TdxLayoutGroup
      Parent = lagrp_RechteAlleModule
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Notenrechner[/B]'
      ButtonOptions.ShowExpandButton = True
      Index = 6
    end
    object laitm_RechteGrid: TdxLayoutItem
      Parent = lagrp_RechteHeader
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
      CaptionOptions.Text = 'Noten:'
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
      CaptionOptions.Text = 'Shutdown:'
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
      CaptionOptions.Text = 'Backup:'
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
      CaptionOptions.Text = 'Statistik:'
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
      CaptionOptions.Text = 'Test:'
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
      CaptionOptions.Text = 'Vokabeln:'
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
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteMediacenterRight: TdxLayoutGroup
      Parent = lagrp_RechteMediacenter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 1
    end
    object lagrp_RechteMediacenterLeft: TdxLayoutGroup
      Parent = lagrp_RechteMediacenter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteManagerRight: TdxLayoutGroup
      Parent = lagrp_RechteManager
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 4
      ShowBorder = False
      Index = 1
    end
    object lagrp_RechteManagerLeft: TdxLayoutGroup
      Parent = lagrp_RechteManager
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 4
      ShowBorder = False
      Index = 0
    end
    object lagrp_RechteAllgemeinDetail: TdxLayoutGroup
      Parent = lagrp_RechteAllgemein
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lagrp_BenutzerPassword: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetailsRight
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_BenutzerSucheDetailsRight: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetails
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 2
      ShowBorder = False
      Index = 1
    end
    object lagrp_BenutzerSucheDetailsLeft: TdxLayoutGroup
      Parent = lagrp_BenutzerSucheDetails
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 3
      ShowBorder = False
      Index = 0
    end
    object lagrp_BenutzerSucheDetails: TdxLayoutGroup
      Parent = lagrp_BenutzerHeader
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object lagrp_RechteHeader: TdxLayoutGroup
      Parent = lagrp_Rechte
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = '[B]Rechtedetails[/B]'
      ItemIndex = 2
      Index = 0
    end
    object lagrp_BenutzerSuche: TdxLayoutGroup
      Parent = lagrp_BenutzerHeader
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Suche'
      Index = 1
    end
    object laitm_BenutzerSuche: TdxLayoutItem
      Parent = lagrp_BenutzerSuche
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Benutzer:'
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
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 2
    end
    object lagrp_RechteSuche: TdxLayoutGroup
      Parent = lagrp_RechteHeader
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Suche'
      Index = 1
    end
    object laitm_RechteSuche: TdxLayoutItem
      Parent = lagrp_RechteSuche
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Bezeichnung:'
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
    Left = 751
    Top = 216
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
    ImageOptions.LargeImages = dm_PCM.imglst_32x32
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 448
    Top = 256
    PixelsPerInch = 96
    object tb_Benutzer: TdxBar
      Caption = 'Custom 1'
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
      Caption = 'Benutzer anlegen'
      Category = 0
      Hint = 'Benutzer anlegen'
      Visible = ivAlways
      OnClick = btn_BenutzerNewClick
      AutoGrayScale = False
      LargeImageIndex = 27
      Width = 125
    end
    object btn_BenutzerSave: TdxBarLargeButton
      Caption = 'Benutzer speichern'
      Category = 0
      Hint = 'Benutzer speichern'
      Visible = ivAlways
      OnClick = btn_BenutzerSaveClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
    object btn_BenutzerCancel: TdxBarLargeButton
      Caption = 'Abbrechen'
      Category = 0
      Hint = 'Abbrechen'
      Visible = ivAlways
      OnClick = btn_BenutzerCancelClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_BenutzerDelete: TdxBarLargeButton
      Caption = 'Benutzer l'#246'schen'
      Category = 0
      Hint = 'Benutzer l'#246'schen'
      Visible = ivAlways
      OnClick = btn_BenutzerDeleteClick
      AutoGrayScale = False
      LargeImageIndex = 24
      Width = 125
    end
    object btn_RechtNew: TdxBarLargeButton
      Caption = 'Recht anlegen'
      Category = 0
      Hint = 'Recht anlegen'
      Visible = ivAlways
      OnClick = btn_RechtNewClick
      AutoGrayScale = False
      LargeImageIndex = 27
      Width = 125
    end
    object btn_RechtDelete: TdxBarLargeButton
      Caption = 'Recht l'#246'schen'
      Category = 0
      Hint = 'Recht l'#246'schen'
      Visible = ivAlways
      OnClick = btn_RechtDeleteClick
      AutoGrayScale = False
      LargeImageIndex = 24
      Width = 125
    end
    object btn_RechtCancel: TdxBarLargeButton
      Caption = 'Abbrechen'
      Category = 0
      Hint = 'Abbrechen'
      Visible = ivAlways
      OnClick = btn_RechtCancelClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_RechtSave: TdxBarLargeButton
      Caption = 'Recht speichern'
      Category = 0
      Hint = 'Recht speichern'
      Visible = ivAlways
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
end
