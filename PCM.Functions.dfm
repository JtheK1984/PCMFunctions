object frm_PCM_System: Tfrm_PCM_System
  Left = 0
  Top = 0
  Caption = 'frm_PCM_System'
  ClientHeight = 479
  ClientWidth = 1051
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object pnl_design: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 479
    Width = 1051
    object cxPageControl1: TcxPageControl
      Left = 3
      Top = 3
      Width = 1045
      Height = 473
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.Images = cxImageList1
      Properties.Style = 11
      ExplicitLeft = 392
      ExplicitTop = 162
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 467
      ClientRectLeft = 2
      ClientRectRight = 1039
      ClientRectTop = 28
      object cxTabSheet1: TcxTabSheet
        Caption = 'Systeminfo'
        ImageIndex = 0
        ExplicitTop = 23
        ExplicitWidth = 1043
        ExplicitHeight = 450
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          ExplicitWidth = 1043
          ExplicitHeight = 450
          Height = 439
          Width = 1037
          object grpbx_SysInfo_CPU: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 121
            Margins.Left = 0
            Margins.Top = 6
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Prozessor'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            ExplicitWidth = 1037
            Height = 87
            Width = 1031
            object lbl_ProcCount: TcxLabel
              Left = 16
              Top = 35
              Caption = 'Prozessoranzahl:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_ProcCount_data: TcxLabel
              Left = 500
              Top = 36
              Caption = 'PROCESSORCOUNT'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_ProcSpeed: TcxLabel
              Left = 16
              Top = 55
              Caption = 'Prozessorgeschwindigkeit:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_ProcSpeed_data: TcxLabel
              Left = 500
              Top = 55
              Caption = 'PROCESSORSPEED'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_ProcType: TcxLabel
              Left = 16
              Top = 16
              Caption = 'Prozessortyp:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_ProcType_data: TcxLabel
              Left = 500
              Top = 16
              Caption = 'PROCESSORTYPE'
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
          object grpbx_SysInfo_Ram: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 214
            Margins.Left = 0
            Margins.Top = 6
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Arbeitsspeicher'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 1
            ExplicitWidth = 1037
            Height = 66
            Width = 1031
            object lbl_RAMFree: TcxLabel
              Left = 16
              Top = 35
              Caption = 'freier Arbeitsspeicher:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_RAMFree_data: TcxLabel
              Left = 500
              Top = 35
              Caption = 'RAM FREE'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_RAMTotal: TcxLabel
              Left = 16
              Top = 16
              Caption = 'Gesamter Arbeitsspeicher:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_RAMTotal_data: TcxLabel
              Left = 500
              Top = 16
              Caption = 'RAM TOTAL'
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
          object grpbx_SysInfo_Resource: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 286
            Margins.Left = 0
            Margins.Top = 6
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Auslastung'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 2
            ExplicitWidth = 1037
            Height = 138
            Width = 1031
            object prgbr_ProcUse: TcxProgressBar
              AlignWithMargins = True
              Left = 16
              Top = 94
              Margins.Left = 13
              Margins.Right = 13
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              TabOrder = 0
              ExplicitWidth = 1009
              Height = 22
              Width = 999
            end
            object prgbr_RamUse: TcxProgressBar
              AlignWithMargins = True
              Left = 16
              Top = 44
              Margins.Left = 13
              Margins.Right = 13
              Margins.Bottom = 0
              Align = alTop
              AutoSize = False
              TabOrder = 1
              ExplicitWidth = 1009
              Height = 22
              Width = 999
            end
            object lbl_ProcUse: TcxLabel
              AlignWithMargins = True
              Left = 16
              Top = 74
              Margins.Left = 13
              Margins.Top = 8
              Margins.Right = 13
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Prozessor:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
              ExplicitTop = 59
              ExplicitWidth = 1005
            end
            object lbl_RamUse: TcxLabel
              AlignWithMargins = True
              Left = 16
              Top = 24
              Margins.Left = 13
              Margins.Top = 9
              Margins.Right = 13
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Arbeitsspeicher:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
              ExplicitTop = 5
              ExplicitWidth = 1005
            end
          end
          object grpbx_SysInfo_Sys: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 9
            Margins.Left = 0
            Margins.Top = 6
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Windows'
            ParentBackground = False
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 3
            ExplicitWidth = 1037
            Height = 106
            Width = 1031
            object lbl_Graphic: TcxLabel
              Left = 16
              Top = 56
              Caption = 'Grafikaufl'#246'sung:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_Graphic_data: TcxLabel
              Left = 500
              Top = 56
              Caption = 'Label2'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_os: TcxLabel
              Left = 16
              Top = 16
              Caption = 'Betriebssystem:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_os_data: TcxLabel
              Left = 500
              Top = 16
              Caption = 'Label2'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_PCName: TcxLabel
              Left = 16
              Top = 36
              Caption = 'Computername:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_PCName_data: TcxLabel
              Left = 500
              Top = 36
              Caption = 'Label2'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_SysDir: TcxLabel
              Left = 16
              Top = 75
              Caption = 'Systemlaufwerk:'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object lbl_SysDir_data: TcxLabel
              Left = 500
              Top = 75
              Caption = 'Label2'
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
      end
    end
  end
  object tmr_GetRamUsage: TTimer
    Interval = 500
    OnTimer = tmr_GetRamUsageTimer
    Left = 96
    Top = 521
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 20710061
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000EC300000EC301C76FA8640000033249444154384F65916B
          48936118863FA8FE54101591951049D0C91F0E2DD84C530B0AB23426CB74F3B0
          9373CDE9D4CD7D9A4D735A696A2E8FF5792ECD96968C742ECC3CD061585B3ACB
          D23C5586893F3A5011C6DD5C5F8DF28287F7CF7B3DCFFD3E2FF13F49F22477A9
          2C41AB5092E6744DD63C792AE3D3A9D3678614C969267992AA3A5D93AD5692E9
          FEF475270AA54A97A6D14C97535530DDEB86D5F6CA5EA3F61AC3C0D004069E4F
          C26C1941654D0B7CFC0F7CA3352791E2A4CF7AE353DCEEB2A0A6A50BB537EEA2
          B4A119DAFC4AE497EA9199538E30AE0211C2143059015F68CDC98968D9C7865B
          0F61EA7B619F368677D33398FB3A8DDE3E1B02055938142442989004574462AF
          6FC0575A7312CA8F9FCD348D406578890BF746D0641EC7D58E2730F63CC1619E
          1AA17699C35739CE3D4CDFC509787CE95C449D15C1D5C3F0A326B033A71F9E9A
          36B8C55480192C0347948AE34235D802128CDDDE8B1BF063E267E2DBDE40D0F4
          1CECE26E04159870407B1B7EEA3A8894B9D05D6E4431D584BCD2AB08E3457FA2
          35273279E274CC350B0E16F4C1BF78105EF95670745D1016B52032ED128234B5
          F0905F819FEA0A3889DAEF84A77839ADFE264E9EF856A01F85D4380B36D50F4E
          A11189959D384C5228EF9942729315178D43082EEC826F563B767233CC8467A0
          B3895072725C695FE031FBD4BDE77AC0ABB181AB6DC0F98E5188AB1FA3F08E15
          0B24D7F5C143A5C72E4523563102B3699D20A204E2D7FCEB2F10DE3A8B13FA37
          C868B6C03FA50ADC8A078EA7F08ADA51D8FA083EE937B125B61AAE220A6BF74B
          2669DDDE40183B587FDF06797907F6D923AA6F0E60BBA4023E67DAE112530FCB
          D88C230143518BD5E13AB84695604D80F827AD13843421757EF8F538FAADCFD0
          D6D10D83B1071E121D36C55EC33A3E056FB2D1D1C03DAE122BD9B9D8262AC532
          AF506702914CF9B9D9D089A977EF3133F701A313E348C8ABC17A2185CD62EA6F
          8285732BBF081B8F9F05E1E6EDDC01272CC2374A20A192C9549BAEACECC72D83
          019DBDBDD8CD55C385A703435A0286E4125871257009D162C98E83666283E7BF
          5FF907168BC53C1A1C922691C5B7679ECD9B3D129D30BF9219FE7E8537EFE752
          0FF6A463B24326885F7EE8F77F30340F1C0000000049454E44AE426082}
      end>
  end
end
