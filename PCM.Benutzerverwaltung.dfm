object frm_User: Tfrm_User
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_Config'
  ClientHeight = 922
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object pnl_right: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 922
    Width = 1195
    object AA_pc_User: TcxPageControl
      Left = 3
      Top = 3
      Width = 1189
      Height = 916
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = ts_User
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dm_PCM.imglst_16x16
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabWidth = 100
      OnChange = AA_pc_UserChange
      ClientRectBottom = 910
      ClientRectLeft = 2
      ClientRectRight = 1183
      ClientRectTop = 28
      object ts_User: TcxTabSheet
        Caption = 'Benutzer'
        ImageIndex = 1
        object pnl_User: TcxGroupBox
          Left = 0
          Top = 63
          Align = alClient
          Caption = 'Benutzerdetails'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 0
          Height = 819
          Width = 1181
          object cxGrid3: TcxGrid
            Left = 3
            Top = 115
            Width = 1175
            Height = 695
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
          object cxGroupBox10: TcxGroupBox
            Left = 3
            Top = 15
            Align = alTop
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            TabOrder = 0
            ExplicitTop = -4
            Height = 100
            Width = 1175
            object pnl_UserLeft: TcxGroupBox
              Left = 3
              Top = 3
              Align = alLeft
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 0
              Height = 94
              Width = 525
              object cxDBCheckBox3: TcxDBCheckBox
                Left = 108
                Top = 75
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
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                TabOrder = 3
                Transparent = True
                Height = 19
                Width = 400
              end
              object edt_OptionName: TcxDBTextEdit
                Left = 108
                Top = 25
                Hint = 'Vorname des Benutzers'
                DataBinding.DataField = 'Vorname'
                DataBinding.DataSource = dsBenutzer
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                OnExit = btn_OptionSaveUserClick
                Width = 400
              end
              object edt_OptionUser: TcxDBTextEdit
                Left = 108
                Top = 0
                Hint = 'Benutzername des Benutzers'
                DataBinding.DataField = 'Benutzer'
                DataBinding.DataSource = dsBenutzer
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                OnExit = btn_OptionSaveUserClick
                Width = 400
              end
              object Label14: TcxLabel
                Left = 5
                Top = 51
                AutoSize = False
                Caption = 'Nachname:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 100
              end
              object Label7: TcxLabel
                Left = 5
                Top = 1
                AutoSize = False
                Caption = 'Benutzer:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 100
              end
              object Label8: TcxLabel
                Left = 5
                Top = 26
                AutoSize = False
                Caption = 'Vorname:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 100
              end
              object edt_OptionSurName: TcxDBTextEdit
                Left = 108
                Top = 50
                Hint = 'Nachname des Benutzers'
                DataBinding.DataField = 'Nachname'
                DataBinding.DataSource = dsBenutzer
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                OnExit = btn_OptionSaveUserClick
                Width = 400
              end
            end
            object pnl_UserRight: TcxGroupBox
              Left = 728
              Top = 3
              Align = alRight
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 1
              Height = 94
              Width = 444
              object btn_OptionChangePassword: TcxButton
                Left = 216
                Top = 0
                Width = 177
                Height = 21
                Caption = 'Passwort '#228'ndern'
                OptionsImage.ImageIndex = 9
                OptionsImage.Images = dm_PCM.imglst_16x16
                TabOrder = 3
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
                Left = 116
                Top = 50
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
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                TabOrder = 2
                Transparent = True
              end
              object edt_OptionPassword: TcxDBTextEdit
                Left = 116
                Top = 0
                Hint = 'Passwort des Benutzers'
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
                Style.IsFontAssigned = True
                TabOrder = 0
                OnEnter = edt_OptionPasswordEnter
                OnExit = edt_OptionPasswordExit
                Width = 215
              end
              object Label15: TcxLabel
                Left = 13
                Top = 1
                Caption = 'Passwort:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object Label9: TcxLabel
                Left = 13
                Top = 26
                Caption = 'Recht:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object lucbx_OptionRights: TcxDBLookupComboBox
                Left = 116
                Top = 25
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
                Style.IsFontAssigned = True
                TabOrder = 1
                OnExit = btn_OptionSaveUserClick
                Width = 414
              end
            end
          end
        end
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 1181
          Height = 63
          Align = dalTop
          BarManager = dxBarManager1
        end
      end
      object ts_rights: TcxTabSheet
        Caption = 'Rechte'
        ImageIndex = 2
        object dxBarDockControl2: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 1181
          Height = 63
          Align = dalTop
          BarManager = dxBarManager1
        end
        object cxScrollBox1: TcxScrollBox
          Left = 0
          Top = 63
          Width = 1181
          Height = 819
          Align = alClient
          TabOrder = 1
          object grpbx_1Allgemein: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Caption = 'Rechte Allgemein:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 95
            Width = 1179
            object Label1: TLabel
              Left = 194
              Top = 44
              Width = 37
              Height = 13
              Caption = 'Label1'
            end
            object pnl_RightLEft: TcxGroupBox
              Left = 3
              Top = 41
              Align = alLeft
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 1
              ExplicitTop = 22
              ExplicitHeight = 64
              Height = 45
              Width = 571
              object cxDBCheckBox1: TcxDBCheckBox
                Left = 138
                Top = 26
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
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                TabOrder = 1
                Transparent = True
                Height = 19
                Width = 85
              end
              object Label3: TcxLabel
                Left = 8
                Top = 1
                AutoSize = False
                Caption = 'Benutzerverwaltung:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 120
              end
              object lucbx_Option: TcxDBLookupComboBox
                Left = 138
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
            end
            object pnl_RightRight: TcxGroupBox
              Left = 534
              Top = 41
              Align = alRight
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 2
              ExplicitTop = 22
              ExplicitHeight = 64
              Height = 45
              Width = 642
              object Label2: TcxLabel
                Left = 33
                Top = 0
                AutoSize = False
                Caption = 'Optionen:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 60
              end
              object lucbx_Backup: TcxDBLookupComboBox
                Left = 123
                Top = 0
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
            end
            object cxGroupBox3: TcxGroupBox
              AlignWithMargins = True
              Left = 6
              Top = 18
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 0
              ExplicitTop = -1
              Height = 20
              Width = 1167
              object Label12: TcxLabel
                Left = 5
                Top = 1
                AutoSize = False
                Caption = 'Bezeichnung:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
                Height = 17
                Width = 120
              end
              object edt_OptionRight: TcxDBTextEdit
                Left = 135
                Top = 0
                DataBinding.DataField = 'Bezeichnung'
                DataBinding.DataSource = dsRechte
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                OnExit = btn_OptionSaveRightClick
                Width = 853
              end
            end
          end
          object grpbx_2PCMManager: TcxGroupBox
            Left = 0
            Top = 189
            Align = alTop
            Caption = 'Rechte PCM - Manager:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 147
            Width = 1179
            object pnl_mrLeft: TcxGroupBox
              Left = 3
              Top = 15
              Align = alLeft
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 0
              ExplicitTop = -4
              ExplicitHeight = 142
              Height = 123
              Width = 536
              object cxLabel1: TcxLabel
                Left = 10
                Top = 2
                Caption = 'Kontakte:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox1: TcxDBLookupComboBox
                Left = 138
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
              object cxDBLookupComboBox5: TcxDBLookupComboBox
                Left = 138
                Top = 51
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
                Style.IsFontAssigned = True
                TabOrder = 2
                Width = 370
              end
              object cxDBLookupComboBox7: TcxDBLookupComboBox
                Left = 138
                Top = 76
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
                Style.IsFontAssigned = True
                TabOrder = 3
                Width = 370
              end
              object cxDBLookupComboBox9: TcxDBLookupComboBox
                Left = 138
                Top = 101
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
                Style.IsFontAssigned = True
                TabOrder = 4
                Width = 370
              end
              object cxLabel3: TcxLabel
                Left = 10
                Top = 27
                Caption = 'Kalender:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel5: TcxLabel
                Left = 10
                Top = 52
                Caption = 'Stundenplan:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel7: TcxLabel
                Left = 10
                Top = 77
                Caption = 'E-Mail:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel9: TcxLabel
                Left = 10
                Top = 102
                Caption = 'Passw'#246'rter:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox3: TcxDBLookupComboBox
                Left = 138
                Top = 26
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
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 370
              end
            end
            object pnl_mrRight: TcxGroupBox
              Left = 534
              Top = 15
              Align = alRight
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 1
              ExplicitTop = -4
              ExplicitHeight = 142
              Height = 123
              Width = 642
              object cxLabel10: TcxLabel
                Left = 33
                Top = 102
                Caption = 'Ausgaben:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel2: TcxLabel
                Left = 33
                Top = 2
                Caption = 'Serials:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel4: TcxLabel
                Left = 33
                Top = 27
                Caption = 'Monats'#252'bersicht:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel6: TcxLabel
                Left = 33
                Top = 52
                Caption = 'Verf'#252'gung:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel8: TcxLabel
                Left = 33
                Top = 77
                Caption = 'Einnahmen:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox10: TcxDBLookupComboBox
                Left = 123
                Top = 102
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
                Style.IsFontAssigned = True
                TabOrder = 5
                Width = 370
              end
              object cxDBLookupComboBox2: TcxDBLookupComboBox
                Left = 123
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 6
                Width = 370
              end
              object cxDBLookupComboBox4: TcxDBLookupComboBox
                Left = 123
                Top = 26
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
                Style.IsFontAssigned = True
                TabOrder = 7
                Width = 370
              end
              object cxDBLookupComboBox6: TcxDBLookupComboBox
                Left = 123
                Top = 51
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
                Style.IsFontAssigned = True
                TabOrder = 8
                Width = 370
              end
              object cxDBLookupComboBox8: TcxDBLookupComboBox
                Left = 123
                Top = 76
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
                Style.IsFontAssigned = True
                TabOrder = 9
                Width = 370
              end
            end
          end
          object grpbx_3Mediacenter: TcxGroupBox
            Left = 0
            Top = 336
            Align = alTop
            Caption = 'Rechte PCM - Mediacenter:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 4
            Height = 72
            Width = 1179
            object pnl_mcLeft: TcxGroupBox
              Left = 3
              Top = 15
              Align = alLeft
              Style.BorderStyle = ebsNone
              TabOrder = 0
              ExplicitTop = -4
              ExplicitHeight = 67
              Height = 48
              Width = 536
              object cxLabel13: TcxLabel
                Left = 10
                Top = 27
                Caption = 'Webradio:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel11: TcxLabel
                Left = 10
                Top = 2
                Caption = 'MP3 - Player:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox11: TcxDBLookupComboBox
                Left = 138
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
              object cxDBLookupComboBox13: TcxDBLookupComboBox
                Left = 138
                Top = 26
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
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 370
              end
            end
            object pnl_mcRight: TcxGroupBox
              Left = 534
              Top = 15
              Align = alRight
              Style.BorderStyle = ebsNone
              TabOrder = 1
              ExplicitTop = -4
              ExplicitHeight = 67
              Height = 48
              Width = 642
              object cxDBLookupComboBox12: TcxDBLookupComboBox
                Left = 123
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
              object cxDBLookupComboBox14: TcxDBLookupComboBox
                Left = 123
                Top = 26
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
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 370
              end
              object cxLabel12: TcxLabel
                Left = 33
                Top = 2
                Caption = 'Videoplayer:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel14: TcxLabel
                Left = 33
                Top = 27
                Caption = 'Fotos:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
            end
          end
          object grpbx_4MP3Manager: TcxGroupBox
            Left = 0
            Top = 408
            Align = alTop
            Caption = 'Rechte PCM - MP3Manager:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 5
            Height = 47
            Width = 1179
            object cxLabel15: TcxLabel
              Left = 13
              Top = 17
              Caption = 'MP3 - Tags:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxDBLookupComboBox15: TcxDBLookupComboBox
              Left = 141
              Top = 16
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
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 370
            end
          end
          object grpbx_5Notenrechner: TcxGroupBox
            Left = 0
            Top = 455
            Align = alTop
            Caption = 'Rechte PCM - Notenrechner:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 6
            Height = 47
            Width = 1179
            object cxLabel16: TcxLabel
              Left = 13
              Top = 17
              Caption = 'Noten:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxDBLookupComboBox16: TcxDBLookupComboBox
              Left = 141
              Top = 16
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
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 370
            end
          end
          object grpbx_5Service: TcxGroupBox
            Left = 0
            Top = 502
            Align = alTop
            Caption = 'Rechte PCM - Servicemanager:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 7
            Height = 47
            Width = 1179
            object pnl_scLeft: TcxGroupBox
              Left = 3
              Top = 15
              Align = alLeft
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 0
              ExplicitTop = -4
              ExplicitHeight = 42
              Height = 23
              Width = 536
              object cxDBLookupComboBox17: TcxDBLookupComboBox
                Left = 138
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
              object cxLabel17: TcxLabel
                Left = 10
                Top = 2
                Caption = 'Shutdown:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
            end
            object pnl_scRight: TcxGroupBox
              Left = 534
              Top = 15
              Align = alRight
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 1
              ExplicitTop = -4
              ExplicitHeight = 42
              Height = 23
              Width = 642
              object cxLabel19: TcxLabel
                Left = 33
                Top = 2
                Caption = 'Backup:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox19: TcxDBLookupComboBox
                Left = 123
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
            end
          end
          object grpbx_6Vokabeltrainer: TcxGroupBox
            Left = 0
            Top = 549
            Align = alTop
            Caption = 'Rechte PCM - Vokabeltrainer:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 8
            Height = 74
            Width = 1179
            object pnl_VTLeft: TcxGroupBox
              Left = 3
              Top = 15
              Align = alLeft
              Style.BorderStyle = ebsNone
              TabOrder = 0
              ExplicitTop = -4
              ExplicitHeight = 69
              Height = 50
              Width = 536
              object cxLabel21: TcxLabel
                Left = 10
                Top = 26
                Caption = 'Test:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel18: TcxLabel
                Left = 10
                Top = 2
                Caption = 'Vokabeln:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxDBLookupComboBox21: TcxDBLookupComboBox
                Left = 138
                Top = 26
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
                Style.IsFontAssigned = True
                TabOrder = 2
                Width = 370
              end
              object cxDBLookupComboBox18: TcxDBLookupComboBox
                Left = 138
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 3
                Width = 370
              end
            end
            object pnl_vtRight: TcxGroupBox
              Left = 534
              Top = 15
              Align = alRight
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 1
              ExplicitTop = -4
              ExplicitHeight = 69
              Height = 50
              Width = 642
              object cxDBLookupComboBox20: TcxDBLookupComboBox
                Left = 123
                Top = 1
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
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 370
              end
              object cxLabel20: TcxLabel
                Left = 33
                Top = 2
                Caption = 'Statistik:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
            end
          end
          object cxGrid1: TcxGrid
            Left = 0
            Top = 623
            Width = 1179
            Height = 150
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            TabStop = False
            LockedStateImageOptions.Effect = lsieDark
            ExplicitWidth = 1189
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
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 95
            Align = alTop
            Caption = 'Rechte PCM - Archiv'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 47
            Width = 1179
            object cxLabel23: TcxLabel
              Left = 13
              Top = 17
              Caption = 'Archiv:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxDBLookupComboBox22: TcxDBLookupComboBox
              Left = 141
              Top = 16
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
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 370
            end
          end
          object cxGroupBox2: TcxGroupBox
            Left = 0
            Top = 142
            Align = alTop
            Caption = 'Rechte PCM - Backup'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 2
            Height = 47
            Width = 1179
            object cxLabel24: TcxLabel
              Left = 13
              Top = 17
              Caption = 'Backup:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxDBLookupComboBox23: TcxDBLookupComboBox
              Left = 141
              Top = 16
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
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 370
            end
          end
        end
      end
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
    Left = 464
    Top = 416
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
end
