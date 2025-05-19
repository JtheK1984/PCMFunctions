object dm_PCM: Tdm_PCM
  Height = 521
  Width = 780
  PixelsPerInch = 144
  object lalalflst_main: TdxLayoutLookAndFeelList
    object laCxlaf_main1: TdxLayoutSkinLookAndFeel
      Offsets.ControlOffsetHorz = 5
      Offsets.ControlOffsetVert = 5
      Offsets.ItemOffset = 6
      Offsets.RootItemsAreaOffsetHorz = 11
      Offsets.RootItemsAreaOffsetVert = 11
      LookAndFeel.NativeStyle = False
      PixelsPerInch = 144
    end
    object laCxlaf_main2: TdxLayoutSkinLookAndFeel
      Offsets.ControlOffsetHorz = 5
      Offsets.ControlOffsetVert = 5
      Offsets.ItemOffset = 6
      Offsets.RootItemsAreaOffsetHorz = 11
      Offsets.RootItemsAreaOffsetVert = 11
      PixelsPerInch = 144
    end
  end
  object con_PCM: TFDConnection
    Params.Strings = (
      'Database=pcm'
      'User_Name=root'
      'Password=pcm'
      'Server=pcmapps.ddns.net'
      'Port=3307'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 192
    Top = 12
  end
end
