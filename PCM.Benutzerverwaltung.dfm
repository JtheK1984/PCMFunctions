object frm_User: Tfrm_User
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_Config'
  ClientHeight = 659
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
    Height = 659
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
    LayoutLookAndFeel = dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm_PCM.imglst_16x16
    object cxGrid3: TcxGrid
      Left = 20
      Top = 239
      Width = 1097
      Height = 400
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      TabStop = False
      LockedStateImageOptions.Effect = lsieDark
      object cxGridDBTableView3: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsBenutzer
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
        object cxGridDBTableView3Column1: TcxGridDBColumn
          DataBinding.FieldName = 'Vorname'
          DataBinding.IsNullValueType = True
          Width = 323
        end
        object cxGridDBTableView3Column2: TcxGridDBColumn
          DataBinding.FieldName = 'Nachname'
          DataBinding.IsNullValueType = True
          Width = 323
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView3
      end
    end
    object edt_OptionRight: TcxDBTextEdit
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Bezeichnung'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 11
      Visible = False
      OnExit = btn_OptionSaveRightClick
      Width = 962
    end
    object cxDBLookupComboBox21: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Vk_Vokabeltest'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox21PropertiesChange
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
      Width = 421
    end
    object cxDBLookupComboBox18: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'vk_Vokabeluebersicht'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox18PropertiesChange
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
      Width = 421
    end
    object cxDBLookupComboBox20: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Vk_Vokabeltest'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox20PropertiesChange
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
      Width = 420
    end
    object cxGrid1: TcxGrid
      Left = 10000
      Top = 10000
      Width = 1089
      Height = 269
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 38
      TabStop = False
      Visible = False
      LockedStateImageOptions.Effect = lsieDark
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsRechte
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
        object cxGridDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          DataBinding.IsNullValueType = True
          Visible = False
        end
        object cxGridDBTableView1Bezeichnung: TcxGridDBColumn
          DataBinding.FieldName = 'Bezeichnung'
          DataBinding.IsNullValueType = True
          Width = 800
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxDBCheckBox3: TcxDBCheckBox
      Left = 91
      Top = 202
      Hint = 'Zugriff auf PCM-Rest-API'
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Rest-API'
      DataBinding.DataField = 'Restapi'
      DataBinding.DataSource = dsBenutzer
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
      TabOrder = 4
      Transparent = True
      Height = 19
      Width = 477
    end
    object edt_OptionName: TcxDBTextEdit
      Left = 91
      Top = 152
      Hint = 'Vorname des Benutzers'
      DataBinding.DataField = 'Vorname'
      DataBinding.DataSource = dsBenutzer
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
      OnExit = btn_OptionSaveUserClick
      Width = 477
    end
    object edt_OptionUser: TcxDBTextEdit
      Left = 91
      Top = 127
      Hint = 'Benutzername des Benutzers'
      DataBinding.DataField = 'Benutzer'
      DataBinding.DataSource = dsBenutzer
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 1
      OnExit = btn_OptionSaveUserClick
      Width = 477
    end
    object edt_OptionSurName: TcxDBTextEdit
      Left = 91
      Top = 177
      Hint = 'Nachname des Benutzers'
      AutoSize = False
      DataBinding.DataField = 'Nachname'
      DataBinding.DataSource = dsBenutzer
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
      OnExit = btn_OptionSaveUserClick
      Height = 19
      Width = 477
    end
    object btn_OptionChangePassword: TcxButton
      Left = 985
      Top = 127
      Width = 120
      Height = 21
      Caption = 'Passwort '#228'ndern'
      OptionsImage.ImageIndex = 9
      OptionsImage.Images = dm_PCM.imglst_16x16
      TabOrder = 6
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btn_OptionChangePasswordClick
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 679
      Top = 179
      Hint = 'automatisches Login des Benutzers '
      BiDiMode = bdLeftToRight
      Caption = 'automatisches Login (Windows-Benutzer)'
      DataBinding.DataField = 'Autologin'
      DataBinding.DataSource = dsBenutzer
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
      TabOrder = 8
      Transparent = True
    end
    object edt_OptionPassword: TcxDBTextEdit
      Left = 629
      Top = 127
      Hint = 'Passwort des Benutzers'
      AutoSize = False
      DataBinding.DataField = 'Passwort'
      DataBinding.DataSource = dsBenutzer
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
      TabOrder = 5
      OnEnter = edt_OptionPasswordEnter
      OnExit = edt_OptionPasswordExit
      Height = 19
      Width = 350
    end
    object lucbx_OptionRights: TcxDBLookupComboBox
      Left = 629
      Top = 154
      Hint = 'Recht des Benutzers'
      DataBinding.DataField = 'ID_Rechte'
      DataBinding.DataSource = dsBenutzer
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 7
      OnExit = btn_OptionSaveUserClick
      Width = 476
    end
    object dxBarDockControl1: TdxBarDockControl
      Left = 20
      Top = 45
      Width = 1097
      Height = 58
      Align = dalNone
      BarManager = dxBarManager1
    end
    object dxBarDockControl2: TdxBarDockControl
      Left = 10000
      Top = 10000
      Width = 1089
      Height = 58
      Align = dalNone
      BarManager = dxBarManager1
      Visible = False
    end
    object lucbx_Backup: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Konfiguration'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = lucbx_BackupPropertiesChange
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
      Width = 423
    end
    object lucbx_Option: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'Benutzer'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = lucbx_OptionPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 12
      Visible = False
      Width = 424
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 10000
      Top = 10000
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Alle Benutzer'
      DataBinding.DataField = 'Alle_Benutzer'
      DataBinding.DataSource = dsRechte
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
      TabOrder = 14
      Transparent = True
      Visible = False
      Height = 19
      Width = 1071
    end
    object cxDBLookupComboBox22: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'dm_Archiv'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox22PropertiesChange
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
      Width = 945
    end
    object cxDBLookupComboBox23: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'dm_Archiv'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox23PropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 16
      Visible = False
      Width = 956
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'ma_Kontakte'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox1PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Kalender'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox3PropertiesChange
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
      Height = 19
      Width = 415
    end
    object cxDBLookupComboBox5: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'ma_Stundenplan'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox5PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox7: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'ma_Email'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox7PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox9: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'ma_Password'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox9PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox10: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Ausgaben'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox10PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Kalender'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox2PropertiesChange
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
      Height = 19
      Width = 415
    end
    object cxDBLookupComboBox4: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Email'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox4PropertiesChange
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
      Height = 19
      Width = 415
    end
    object cxDBLookupComboBox6: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'ma_Serials'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox6PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox8: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'ma_Verfuegung'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox8PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox11: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'mc_Audioplayer'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox11PropertiesChange
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
      Height = 19
      Width = 415
    end
    object cxDBLookupComboBox13: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'mc_Webradio'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox13PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox12: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'mc_Videoplayer'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox12PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox14: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'mc_Fotos'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox14PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox15: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'mm_MP3'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox15PropertiesChange
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
      Width = 945
    end
    object cxDBLookupComboBox16: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'nr_Noten'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox16PropertiesChange
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
      Height = 19
      Width = 962
    end
    object cxDBLookupComboBox17: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'sm_Shutdown'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox17PropertiesChange
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
      Width = 415
    end
    object cxDBLookupComboBox19: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      AutoSize = False
      DataBinding.DataField = 'sm_Backup'
      DataBinding.DataSource = dsRechte
      ParentFont = False
      Properties.KeyFieldNames = 'Nummer'
      Properties.ListColumns = <
        item
          FieldName = 'Bezeichnung'
        end>
      Properties.ListSource = dsRechte_Detail
      Properties.OnChange = cxDBLookupComboBox19PropertiesChange
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
      Width = 415
    end
    object lagrp_Personal: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lagrp_Personal
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      SizeOptions.Height = 800
      AllowRemove = False
      LayoutDirection = ldTabbed
      Locked = True
      ShowBorder = False
      TabbedOptions.HotTrack = True
      Index = 0
    end
    object lagrp_Suche: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 1
      CaptionOptions.Text = 'Benutzer'
      ItemIndex = 2
      TabbedOptions.HotTrack = True
      TabbedOptions.MultiLineTabCaptions = True
      TabbedOptions.ShowFrame = True
      Index = 0
    end
    object lagrp_Mitarbeiter: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 2
      CaptionOptions.Text = 'Rechte'
      ItemIndex = 10
      Index = 1
    end
    object lagrp_SucheFilter: TdxLayoutGroup
      Parent = lagrp_Suche
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Benutzerdetails[/B]'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte Allgemein[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup19
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Benutzer:'
      Control = edt_OptionUser
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup19
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Vorname:'
      Control = edt_OptionName
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup19
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Nachname:'
      Control = edt_OptionSurName
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup19
      AlignHorz = ahClient
      AlignVert = avTop
      Offsets.Left = 59
      CaptionOptions.Text = 'cxDBCheckBox3'
      CaptionOptions.Visible = False
      Control = cxDBCheckBox3
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup17
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Password:'
      Control = edt_OptionPassword
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 40
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup18
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Recht:'
      Control = lucbx_OptionRights
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup18
      AlignHorz = ahClient
      AlignVert = avTop
      Offsets.Left = 105
      CaptionOptions.Text = 'cxDBCheckBox2'
      CaptionOptions.Visible = False
      Control = cxDBCheckBox2
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup17
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'btn_OptionChangePassword'
      CaptionOptions.Visible = False
      Control = btn_OptionChangePassword
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = lagrp_Suche
      AlignHorz = ahClient
      AlignVert = avTop
      Control = dxBarDockControl1
      ControlOptions.AlignVert = avTop
      ControlOptions.OriginalHeight = 58
      ControlOptions.OriginalWidth = 500
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      Control = dxBarDockControl2
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 58
      ControlOptions.OriginalWidth = 500
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lagrp_Suche
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid3
      ControlOptions.OriginalHeight = 5
      ControlOptions.OriginalWidth = 1129
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Bezeichnung:'
      Control = edt_OptionRight
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 853
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup16
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Optionen:'
      CaptionOptions.Width = 105
      Control = lucbx_Backup
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup16
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Benutzerverwaltung:'
      CaptionOptions.Width = 105
      Control = lucbx_Option
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = cxDBCheckBox1
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 85
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Archiv[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 2
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Backup[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 3
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Manager[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 4
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - MP3Manager[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 6
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Mediacenter[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 5
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Archiv:'
      Control = cxDBLookupComboBox22
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Backup:'
      Control = cxDBLookupComboBox23
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Kontakte:'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Kalender:'
      Control = cxDBLookupComboBox3
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Stundenplan:'
      Control = cxDBLookupComboBox5
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'E-Mail:'
      Control = cxDBLookupComboBox7
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Passw'#246'rter:'
      Control = cxDBLookupComboBox9
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Ausgaben:'
      Control = cxDBLookupComboBox10
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Serials:'
      CaptionOptions.Width = 105
      Control = cxDBLookupComboBox2
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Monats'#252'bersicht:'
      Control = cxDBLookupComboBox4
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Verf'#252'gung:'
      Control = cxDBLookupComboBox6
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Einnahmen:'
      Control = cxDBLookupComboBox8
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxLayoutGroup13
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'MP3 - Player:'
      CaptionOptions.Width = 105
      Control = cxDBLookupComboBox11
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxLayoutGroup13
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Webradio:'
      Control = cxDBLookupComboBox13
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Videoplayer:'
      CaptionOptions.Width = 105
      Control = cxDBLookupComboBox12
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Fotos:'
      Control = cxDBLookupComboBox14
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'MP3 - Tags:'
      Control = cxDBLookupComboBox15
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Vokabeltrainer[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 9
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Servicemanager[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 8
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = '[B]Rechte PCM - Notenrechner[/B]'
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      Index = 7
    end
    object dxLayoutItem33: TdxLayoutItem
      Parent = lagrp_Mitarbeiter
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 1118
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutItem34: TdxLayoutItem
      Parent = dxLayoutGroup10
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Noten:'
      Control = cxDBLookupComboBox16
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Shutdown:'
      Control = cxDBLookupComboBox17
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Backup:'
      CaptionOptions.Width = 105
      Control = cxDBLookupComboBox19
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem37: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Statistik:'
      CaptionOptions.Width = 105
      Control = cxDBLookupComboBox20
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem38: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Test:'
      Control = cxDBLookupComboBox21
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem39: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Vokabeln:'
      Control = cxDBLookupComboBox18
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 370
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup12: TdxLayoutGroup
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup13: TdxLayoutGroup
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup14: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 3
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup15: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 4
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup16: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup17: TdxLayoutGroup
      Parent = dxLayoutGroup18
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup18: TdxLayoutGroup
      Parent = lagrp_SucheFilter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 2
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup19: TdxLayoutGroup
      Parent = lagrp_SucheFilter
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 3
      ShowBorder = False
      Index = 0
    end
  end
  object qBenutzer: TFDQuery
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
  object qRechte: TFDQuery
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
  object qRechte_Detail: TFDQuery
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      '')
    Left = 647
    Top = 368
  end
  object dsBenutzer: TDataSource
    DataSet = qBenutzer
    Left = 751
    Top = 216
  end
  object dsRechte: TDataSource
    DataSet = qRechte
    Left = 751
    Top = 264
  end
  object dsRechte_Detail: TDataSource
    DataSet = qRechte_Detail
    Left = 751
    Top = 312
  end
  object dxBarManager1: TdxBarManager
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
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1304
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_OptionNewUser'
        end
        item
          Visible = True
          ItemName = 'btn_OptionSaveUser'
        end
        item
          Visible = True
          ItemName = 'btn_OptionCancelUser'
        end
        item
          Visible = True
          ItemName = 'btn_OptionDeleteUser'
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
    object dxBarManager1Bar2: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1304
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_OptionNewRight'
        end
        item
          Visible = True
          ItemName = 'btn_OptionSaveRight'
        end
        item
          Visible = True
          ItemName = 'btn_OptionCancelRight'
        end
        item
          Visible = True
          ItemName = 'btn_OptionDeleteRight'
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
    object btn_OptionNewUser: TdxBarLargeButton
      Caption = 'Benutzer anlegen'
      Category = 0
      Hint = 'Benutzer anlegen'
      Visible = ivAlways
      OnClick = btn_OptionNewUserClick
      AutoGrayScale = False
      LargeImageIndex = 27
      Width = 125
    end
    object btn_OptionSaveUser: TdxBarLargeButton
      Caption = 'Benutzer speichern'
      Category = 0
      Hint = 'Benutzer speichern'
      Visible = ivAlways
      OnClick = btn_OptionSaveUserClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
    object btn_OptionCancelUser: TdxBarLargeButton
      Caption = 'Abbrechen'
      Category = 0
      Hint = 'Abbrechen'
      Visible = ivAlways
      OnClick = btn_OptionCancelUserClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_OptionDeleteUser: TdxBarLargeButton
      Caption = 'Benutzer l'#246'schen'
      Category = 0
      Hint = 'Benutzer l'#246'schen'
      Visible = ivAlways
      OnClick = btn_OptionDeleteUserClick
      AutoGrayScale = False
      LargeImageIndex = 24
      Width = 125
    end
    object btn_OptionNewRight: TdxBarLargeButton
      Caption = 'Recht anlegen'
      Category = 0
      Hint = 'Recht anlegen'
      Visible = ivAlways
      OnClick = btn_OptionNewRightClick
      AutoGrayScale = False
      LargeImageIndex = 27
      Width = 125
    end
    object btn_OptionDeleteRight: TdxBarLargeButton
      Caption = 'Recht l'#246'schen'
      Category = 0
      Hint = 'Recht l'#246'schen'
      Visible = ivAlways
      OnClick = btn_OptionDeleteRightClick
      AutoGrayScale = False
      LargeImageIndex = 24
      Width = 125
    end
    object btn_OptionCancelRight: TdxBarLargeButton
      Caption = 'Abbrechen'
      Category = 0
      Hint = 'Abbrechen'
      Visible = ivAlways
      OnClick = btn_OptionCancelRightClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
    object btn_OptionSaveRight: TdxBarLargeButton
      Caption = 'Recht speichern'
      Category = 0
      Hint = 'Recht speichern'
      Visible = ivAlways
      OnClick = btn_OptionSaveRightClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    Left = 240
    Top = 402
  end
  object cxGridPopupMenu2: TcxGridPopupMenu
    PopupMenus = <>
    Left = 248
    Top = 410
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
