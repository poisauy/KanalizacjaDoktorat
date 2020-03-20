object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Configuration'
  ClientHeight = 440
  ClientWidth = 708
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 310
    Top = 57
  end
  object FDConnection1: TFDConnection
    Left = 264
    Top = 132
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 186
    Top = 210
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    Left = 264
    Top = 210
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 343
    Top = 210
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 422
    Top = 210
  end
end
