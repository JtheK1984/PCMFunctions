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
  object dxLayoutControl1: TdxLayoutControl
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
      Left = 21
      Top = 409
      Margins.Left = 13
      Margins.Right = 13
      Margins.Bottom = 0
      AutoSize = False
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 22
      Width = 1009
    end
    object prgbr_RamUse: TcxProgressBar
      AlignWithMargins = True
      Left = 21
      Top = 361
      Margins.Left = 13
      Margins.Right = 13
      Margins.Bottom = 0
      AutoSize = False
      Style.TransparentBorder = False
      TabOrder = 0
      Height = 22
      Width = 1009
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Systeminfo'
      ItemIndex = 3
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Windows'
      Index = 0
    end
    object lbl_os: TdxLayoutLabeledItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = 'Betriebssystem:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_os_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = 'Label2'
      CaptionOptions.Width = 200
      Index = 1
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Prozessor'
      ItemIndex = 2
      Index = 1
    end
    object dxLayoutGroup12: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Arbeitsspeicher'
      ItemIndex = 1
      Index = 2
    end
    object dxLayoutGroup15: TdxLayoutGroup
      Parent = dxLayoutGroup13
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Auslastung'
      ItemIndex = 2
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Arbeitsspeicher:'
      CaptionOptions.Layout = clTop
      Control = prgbr_RamUse
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 1009
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_ProcUse: TdxLayoutLabeledItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = 'Prozessor:'
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'prgbr_ProcUse'
      CaptionOptions.Visible = False
      Control = prgbr_ProcUse
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 1009
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutLabeledItem1: TdxLayoutLabeledItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Computername:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_PCName_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutLabeledItem3: TdxLayoutLabeledItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Grafikaufl'#246'sung:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_Graphic_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutLabeledItem5: TdxLayoutLabeledItem
      Parent = dxLayoutGroup7
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Systemlaufwerk:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_SysDir_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup18: TdxLayoutGroup
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup19: TdxLayoutGroup
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutLabeledItem2: TdxLayoutLabeledItem
      Parent = dxLayoutGroup19
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Prozessorgeschwindigkeit:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_ProcSpeed_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup19
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutLabeledItem6: TdxLayoutLabeledItem
      Parent = dxLayoutGroup18
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Prozessoranzahl:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_ProcCount_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup18
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutLabeledItem8: TdxLayoutLabeledItem
      Parent = dxLayoutGroup8
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Prozessortyp:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_ProcType_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutLabeledItem4: TdxLayoutLabeledItem
      Parent = dxLayoutGroup11
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'freier Arbeitsspeicher:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_RAMFree_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutLabeledItem9: TdxLayoutLabeledItem
      Parent = dxLayoutGroup10
      AlignHorz = ahLeft
      AlignVert = avTop
      Offsets.Left = 8
      CaptionOptions.Text = 'Gesamter Arbeitsspeicher:'
      CaptionOptions.Width = 200
      Index = 0
    end
    object lbl_RAMTotal_data: TdxLayoutLabeledItem
      Parent = dxLayoutGroup10
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Label'
      Index = 1
    end
    object dxLayoutGroup13: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
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
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
