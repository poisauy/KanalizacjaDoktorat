object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FireDAC SQL Command Preprocessor'
  ClientHeight = 299
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    628
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 117
    Height = 13
    Caption = 'Before the Preprocessor'
  end
  object Label2: TLabel
    Left = 9
    Top = 163
    Width = 110
    Height = 13
    Caption = 'After the Preprocessor'
  end
  object Label3: TLabel
    Left = 389
    Top = 42
    Width = 34
    Height = 13
    Caption = 'Macros'
  end
  object Memo1: TMemo
    Left = 8
    Top = 61
    Width = 375
    Height = 94
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 8
    Top = 181
    Width = 612
    Height = 110
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object btnShowProcessor: TButton
    Left = 8
    Top = 8
    Width = 117
    Height = 25
    Caption = 'Show Processor Work'
    TabOrder = 2
    OnClick = btnShowProcessorClick
  end
  object ListBox1: TListBox
    Left = 389
    Top = 61
    Width = 231
    Height = 94
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 3
  end
  object FDQuery1: TFDQuery
    ActiveStoredUsage = []
    Connection = SharedDMVcl.FDConnection
    SQL.Strings = (
      'SELECT '
      '  { fn LENGTH(FIRST_NAME) }, '
      '  LAST_NAME,'
      '  FROM employee')
    Left = 225
    Top = 91
  end
end
