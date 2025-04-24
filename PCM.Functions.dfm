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
  object lactrl_System: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1051
    Height = 479
    Align = alClient
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = dxLayoutCxLookAndFeel1
    object prgbr_ProcUse: TcxProgressBar
      AlignWithMargins = True
      Left = 22
      Top = 245
      Margins.Left = 13
      Margins.Right = 13
      Margins.Bottom = 0
      AutoSize = False
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 22
      Width = 1007
    end
    object prgbr_RamUse: TcxProgressBar
      AlignWithMargins = True
      Left = 22
      Top = 217
      Margins.Left = 13
      Margins.Right = 13
      Margins.Bottom = 0
      AutoSize = False
      Style.TransparentBorder = False
      TabOrder = 0
      Height = 22
      Width = 1007
    end
    object lactrl_SystemGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lagrp_System: TdxLayoutGroup
      Parent = lactrl_SystemGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      ItemIndex = 3
      ShowBorder = False
      Index = 0
    end
    object lagrp_SystemWindows: TdxLayoutGroup
      Parent = lagrp_System
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      Index = 0
    end
    object laitm_SystemOSlbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemOS
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemOS: TdxLayoutLabeledItem
      Parent = lagrp_SystemOS
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Width = 200
      Index = 1
    end
    object lagrp_SystemCPU: TdxLayoutGroup
      Parent = lagrp_System
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object lagrp_SystemRam: TdxLayoutGroup
      Parent = lagrp_System
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      Index = 2
    end
    object lagrp_SystemAuslastungDetails: TdxLayoutGroup
      Parent = lagrp_SystemAuslastung
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 0
    end
    object laitm_SystemRamUSE: TdxLayoutItem
      Parent = lagrp_SystemAuslastungDetails
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Layout = clTop
      Control = prgbr_RamUse
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 1009
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_SystemCPUUSE: TdxLayoutItem
      Parent = lagrp_SystemAuslastungDetails
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Layout = clTop
      Control = prgbr_ProcUse
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 1009
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_SystemOS: TdxLayoutGroup
      Parent = lagrp_SystemWindows
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_SystemPCNAME: TdxLayoutGroup
      Parent = lagrp_SystemWindows
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object laitm_SystemPCNAMElbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemPCNAME
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemPCNAME: TdxLayoutLabeledItem
      Parent = lagrp_SystemPCNAME
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_SystemGraphiclbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemGraphic
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemGraphic: TdxLayoutLabeledItem
      Parent = lagrp_SystemGraphic
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object lagrp_SystemGraphic: TdxLayoutGroup
      Parent = lagrp_SystemWindows
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object laitm_SystemSysdirlbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemSysdir
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemSysdir: TdxLayoutLabeledItem
      Parent = lagrp_SystemSysdir
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object lagrp_SystemSysdir: TdxLayoutGroup
      Parent = lagrp_SystemWindows
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object lagrp_SystemCPUType: TdxLayoutGroup
      Parent = lagrp_SystemCPU
      AlignHorz = ahClient
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_SystemCPUCount: TdxLayoutGroup
      Parent = lagrp_SystemCPU
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lagrp_SystemCPUSpeed: TdxLayoutGroup
      Parent = lagrp_SystemCPU
      AlignHorz = ahClient
      AlignVert = avTop
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object laitm_SystemCPUSpeedlbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUSpeed
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemCPUSpeed: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUSpeed
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_SystemCPUCountlbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUCount
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemCPUCount: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUCount
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_SystemCPUTypelbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUType
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemCPUType: TdxLayoutLabeledItem
      Parent = lagrp_SystemCPUType
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object lagrp_SystemRamTotal: TdxLayoutGroup
      Parent = lagrp_SystemRam
      AlignHorz = ahClient
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lagrp_SystemRamTotalFree: TdxLayoutGroup
      Parent = lagrp_SystemRam
      AlignHorz = ahClient
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object laitm_SystemRamTotalFreelbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemRamTotalFree
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemRamTotalFree: TdxLayoutLabeledItem
      Parent = lagrp_SystemRamTotalFree
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object laitm_SystemRamTotallbl: TdxLayoutLabeledItem
      Parent = lagrp_SystemRamTotal
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Width = 200
      Index = 0
    end
    object laitm_SystemRamTotal: TdxLayoutLabeledItem
      Parent = lagrp_SystemRamTotal
      AlignHorz = ahClient
      AlignVert = avTop
      Index = 1
    end
    object lagrp_SystemAuslastung: TdxLayoutGroup
      Parent = lagrp_System
      AlignHorz = ahClient
      AlignVert = avTop
      ShowBorder = False
      Index = 3
    end
  end
  object tmr_GetRamUsage: TTimer
    Interval = 500
    OnTimer = tmr_GetRamUsageTimer
    Left = 96
    Top = 521
  end
  object imglst_16x16: TcxImageList
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
  object lalaflst_System: TdxLayoutLookAndFeelList
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
