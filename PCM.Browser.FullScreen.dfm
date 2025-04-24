object frm_PCM_Browser_FullScreen: Tfrm_PCM_Browser_FullScreen
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnl_D: TcxGroupBox
    Left = 0
    Top = 191
    Align = alBottom
    PanelStyle.Active = True
    TabOrder = 0
    Visible = False
    OnResize = pnl_DResize
    ExplicitTop = 174
    ExplicitWidth = 618
    Height = 250
    Width = 624
  end
  object splt_D: TcxSplitter
    Left = 0
    Top = 186
    Width = 624
    Height = 5
    AlignSplitter = salTop
    Control = pnl_D
    Visible = False
    ExplicitTop = 169
    ExplicitWidth = 618
  end
end
