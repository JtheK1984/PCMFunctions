object frm_Browser_FullScreen: Tfrm_Browser_FullScreen
  Left = 0
  Top = 0
  Caption = 'frm_Browser_FullScreen'
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
    ExplicitTop = 183
  end
end
