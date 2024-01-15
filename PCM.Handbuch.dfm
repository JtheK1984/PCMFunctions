object frm_Handbuch: Tfrm_Handbuch
  Left = 0
  Top = 0
  Caption = 'frm_Handbuch'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 441
    Width = 624
    object cxPageControl1: TcxPageControl
      Left = 3
      Top = 3
      Width = 618
      Height = 435
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ExplicitLeft = 176
      ExplicitTop = 144
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 429
      ClientRectLeft = 2
      ClientRectRight = 612
      ClientRectTop = 29
      object cxTabSheet1: TcxTabSheet
        Caption = 'HTML'
        ImageIndex = 0
        ExplicitLeft = 5
        ExplicitTop = 32
        ExplicitWidth = 0
        ExplicitHeight = 0
        object EdgeBrowser: TEdgeBrowser
          Left = 0
          Top = 0
          Width = 610
          Height = 400
          Align = alClient
          TabOrder = 0
          TabStop = True
          AllowSingleSignOnUsingOSPrimaryAccount = False
          TargetCompatibleBrowserVersion = '117.0.2045.28'
          UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
          ExplicitWidth = 624
          ExplicitHeight = 441
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'PDF'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 281
        ExplicitHeight = 158
        object EdgeBrowser1: TEdgeBrowser
          Left = 0
          Top = 0
          Width = 610
          Height = 400
          Align = alClient
          TabOrder = 0
          TabStop = True
          AllowSingleSignOnUsingOSPrimaryAccount = False
          TargetCompatibleBrowserVersion = '117.0.2045.28'
          UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
          ExplicitWidth = 624
          ExplicitHeight = 441
        end
      end
    end
  end
end
