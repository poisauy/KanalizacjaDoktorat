object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FireDAC Array DML Demonstration'
  ClientHeight = 291
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    635
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 50
    Height = 13
    Caption = 'Start Date'
  end
  object Label3: TLabel
    Left = 16
    Top = 59
    Width = 44
    Height = 13
    Caption = 'End Date'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 88
    Top = 26
    Width = 121
    Height = 21
    Date = 42876.674699143520000000
    Time = 42876.674699143520000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 88
    Top = 53
    Width = 121
    Height = 21
    Date = 42876.674836574070000000
    Time = 42876.674836574070000000
    TabOrder = 1
  end
  object UsingArrayDMLButton: TButton
    Left = 219
    Top = 22
    Width = 231
    Height = 25
    Caption = 'Create And Populate Table Using Array DML'
    TabOrder = 2
    OnClick = UsingArrayDMLButtonClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 84
    Width = 611
    Height = 182
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object UsingQueriesButton: TButton
    Left = 219
    Top = 53
    Width = 231
    Height = 25
    Caption = 'Create And Populate Table Using Queries'
    TabOrder = 4
    OnClick = UsingQueriesButtonClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 272
    Width = 635
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnShowArrayDMLMode: TButton
    Left = 493
    Top = 54
    Width = 134
    Height = 25
    Caption = 'Show ArrayDMLMode'
    TabOrder = 6
    OnClick = btnShowArrayDMLModeClick
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 368
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 472
    Top = 168
  end
  object FDQuery1: TFDQuery
    ActiveStoredUsage = []
    Connection = SharedDMVcl.FDConnection
    OnExecuteError = FDQuery1ExecuteError
    Left = 275
    Top = 169
  end
  object DataSource1: TDataSource
    Left = 80
    Top = 168
  end
  object FDMetaInfoQuery1: TFDMetaInfoQuery
    Connection = SharedDMVcl.FDConnection
    Left = 471
    Top = 225
  end
end
