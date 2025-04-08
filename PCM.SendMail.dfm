object frm_Sendmail: Tfrm_Sendmail
  Left = 0
  Top = 0
  Caption = 'PCM: E-Mail erstellen'
  ClientHeight = 1178
  ClientWidth = 1890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object lactrl_Mail: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1890
    Height = 1178
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm_PCM.dxLayoutSkinLookAndFeel1
    object btn_Send: TcxButton
      Left = 12
      Top = 12
      Width = 100
      Height = 178
      Caption = 'Senden'
      OptionsImage.Glyph.SourceDPI = 96
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
        63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
        3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
        423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
        233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
        6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
        696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
        6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
        7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2253
        656E64223E0D0A09093C706F6C79676F6E20636C6173733D22426C7565222070
        6F696E74733D22322C323020382C32322E342032342C31302031322C32342031
        322C33302031362E332C32352E372032322C32382033302C32202623393B222F
        3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btn_SendClick
    end
    object btn_An: TcxButton
      Left = 119
      Top = 49
      Width = 100
      Height = 30
      Caption = 'An'
      TabOrder = 3
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btn_AnClick
    end
    object btn_CC: TcxButton
      Left = 119
      Top = 86
      Width = 100
      Height = 30
      Caption = 'CC'
      TabOrder = 5
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btn_AnClick
    end
    object edt_An: TcxTextEdit
      Left = 226
      Top = 49
      AutoSize = False
      Style.Edges = [bBottom]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Height = 30
      Width = 1652
    end
    object edt_CC: TcxTextEdit
      Left = 226
      Top = 86
      AutoSize = False
      Style.Edges = [bBottom]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Height = 30
      Width = 1652
    end
    object edt_Betreff: TcxTextEdit
      Left = 226
      Top = 160
      AutoSize = False
      Style.Edges = [bBottom]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
      Height = 30
      Width = 1652
    end
    object pnl_Browser: TcxGroupBox
      Left = 12
      Top = 197
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      Style.Color = 7566195
      Style.TransparentBorder = False
      TabOrder = 10
      Height = 969
      Width = 1866
      object WVWindowParent1: TWVWindowParent
        Left = 2
        Top = 2
        Width = 1862
        Height = 965
        Align = alClient
        TabStop = True
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 1
      end
    end
    object btn_Von: TcxButton
      Left = 119
      Top = 12
      Width = 100
      Height = 30
      BiDiMode = bdLeftToRight
      Caption = 'Von'
      DropDownMenu = ppm_Von
      Kind = cxbkOfficeDropDown
      OptionsImage.Layout = blGlyphTop
      ParentBiDiMode = False
      TabOrder = 1
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edt_Von: TcxTextEdit
      Left = 226
      Top = 12
      AutoSize = False
      Style.Edges = [bBottom]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Height = 30
      Width = 1652
    end
    object edt_BCC: TcxTextEdit
      Left = 226
      Top = 123
      AutoSize = False
      Style.Edges = [bBottom]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 8
      Height = 30
      Width = 1652
    end
    object btn_BCC: TcxButton
      Left = 119
      Top = 123
      Width = 100
      Height = 30
      Caption = 'BCC'
      TabOrder = 7
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btn_AnClick
    end
    object lagrp_MailRoot: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lagrp_Mail: TdxLayoutGroup
      Parent = lagrp_MailRoot
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object lagrp_MailHeader: TdxLayoutGroup
      Parent = lagrp_Mail
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object laitm_MailSend: TdxLayoutItem
      Parent = lagrp_MailHeader
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_Send
      ControlOptions.OriginalHeight = 90
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_MailMail: TdxLayoutGroup
      Parent = lagrp_MailHeader
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lagrp_MailAn: TdxLayoutGroup
      Parent = lagrp_MailAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object laitm_MailBetreffEdt: TdxLayoutItem
      Parent = lagrp_MailBetreff
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Betreff:            '
      CaptionOptions.Visible = False
      Control = edt_Betreff
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_MailCC: TdxLayoutGroup
      Parent = lagrp_MailAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object lagrp_MailAdresses: TdxLayoutGroup
      Parent = lagrp_MailMail
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 4
      ShowBorder = False
      Index = 0
    end
    object laitm_MailAnBtn: TdxLayoutItem
      Parent = lagrp_MailAn
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'AN'
      CaptionOptions.Visible = False
      Control = btn_An
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_MailAnEdt: TdxLayoutItem
      Parent = lagrp_MailAn
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edt_An
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_MailCCBtn: TdxLayoutItem
      Parent = lagrp_MailCC
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      CaptionOptions.Width = 100
      Control = btn_CC
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_MailCCEdt: TdxLayoutItem
      Parent = lagrp_MailCC
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edt_CC
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagrp_MailBetreff: TdxLayoutGroup
      Parent = lagrp_MailAdresses
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object laitm_Browser: TdxLayoutItem
      Parent = lagrp_Mail
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = pnl_Browser
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 105
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_MailBetreffLbl: TdxLayoutLabeledItem
      Parent = lagrp_MailBetreff
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.Text = 'Betreff'
      CaptionOptions.Width = 100
      Index = 0
    end
    object lagrp_MailVon: TdxLayoutGroup
      Parent = lagrp_MailAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object laitm_MailVonEdt: TdxLayoutItem
      Parent = lagrp_MailVon
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edt_Von
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 1652
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laitm_MailVonBtn: TdxLayoutItem
      Parent = lagrp_MailVon
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_Von
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagrp_MailBCC: TdxLayoutGroup
      Parent = lagrp_MailAdresses
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      Visible = False
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object laitm_MailBccBtn: TdxLayoutItem
      Parent = lagrp_MailBCC
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btn_BCC
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laitm_MailBCCEdt: TdxLayoutItem
      Parent = lagrp_MailBCC
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edt_BCC
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 1652
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object qry_Work: TFDQuery
    Active = True
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      
        '                                                                ' +
        '          SELECT * FROM manager_email_signatur')
    Left = 728
    Top = 592
    object qry_WorkID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qry_WorkID_Emailkonfiguration: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_Emailkonfiguration'
      Origin = 'ID_Emailkonfiguration'
    end
    object qry_WorkLeerzeilenVorGruss: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenVorGruss'
      Origin = 'LeerzeilenVorGruss'
    end
    object qry_WorkGruss: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Gruss'
      Origin = 'Gruss'
      Size = 255
    end
    object qry_WorkLeerzeilenNachGruss: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenNachGruss'
      Origin = 'LeerzeilenNachGruss'
    end
    object qry_WorkAbsender: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Absender'
      Origin = 'Absender'
      Size = 255
    end
    object qry_WorkLeerzeilenNachName: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenNachName'
      Origin = 'LeerzeilenNachName'
    end
    object qry_WorkHoehe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Hoehe'
      Origin = 'Hoehe'
    end
    object qry_WorkBreite: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Breite'
      Origin = 'Breite'
    end
    object qry_WorkPfadBild: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PfadBild'
      Origin = 'PfadBild'
      Size = 255
    end
    object qry_WorkLeerzeilenNachBild: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenNachBild'
      Origin = 'LeerzeilenNachBild'
    end
    object qry_WorkName: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Name'
      Origin = '`Name`'
      Size = 255
    end
    object qry_WorkStrase: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Strase'
      Origin = 'Strase'
      Size = 255
    end
    object qry_WorkPLZ_Ort: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLZ_Ort'
      Origin = 'PLZ_Ort'
      Size = 255
    end
    object qry_WorkLeerzeilenNachAdresse: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenNachAdresse'
      Origin = 'LeerzeilenNachAdresse'
    end
    object qry_WorkTelefon: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Telefon'
      Origin = 'Telefon'
      Size = 255
    end
    object qry_WorkMobil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Mobil'
      Origin = 'Mobil'
      Size = 255
    end
    object qry_WorkEMail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMail'
      Origin = 'EMail'
      Size = 255
    end
    object qry_WorkLeerzeilenNachMail: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LeerzeilenNachMail'
      Origin = 'LeerzeilenNachMail'
    end
    object qry_WorkText: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'Text'
      Origin = '`Text`'
      BlobType = ftMemo
    end
    object qry_WorkBild: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'Bild'
      Origin = 'Bild'
    end
  end
  object brmgr_Mail: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'PopupMenu1')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 1064
    Top = 409
    PixelsPerInch = 96
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
  end
  object ppm_Von: TdxBarPopupMenu
    BarManager = brmgr_Mail
    ItemLinks = <>
    UseOwnFont = False
    Left = 840
    Top = 752
    PixelsPerInch = 96
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    DefaultPort = 2132
    Left = 1109
    Top = 120
  end
  object IDSMTP_Mail: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketSMTP
    AuthType = satSASL
    SASLMechanisms = <>
    Left = 276
    Top = 672
  end
  object IdSSLIOHandlerSocketSMTP: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 264
    Top = 396
  end
  object WVBrowser1: TWVBrowser
    DefaultURL = 'https://www.bing.com'
    TargetCompatibleBrowserVersion = '95.0.1020.44'
    AllowSingleSignOnUsingOSPrimaryAccount = False
    OnAfterCreated = WVBrowser1AfterCreated
    OnExecuteScriptCompleted = WVBrowser1ExecuteScriptCompleted
    Left = 200
    Top = 156
  end
end
