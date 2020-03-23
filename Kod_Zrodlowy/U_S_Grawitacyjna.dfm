object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Import / Sie'#263' Grawitacyjna'
  ClientHeight = 680
  ClientWidth = 1002
  Color = 15859445
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 24
    Width = 977
    Height = 601
    Caption = '1.  Import danych z Excela - Sie'#263' Grawitacyjna.'
    TabOrder = 0
    object AdvPageControl1: TAdvPageControl
      Left = 152
      Top = 176
      Width = 257
      Height = 225
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWindowText
      ActiveFont.Height = -11
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = []
      DoubleBuffered = True
      MultiLine = True
      ParentShowHint = False
      ShowHint = False
      TabSheet3D = True
      TabBackGroundColor = 33023
      TabMargin.RightMargin = 0
      TabOverlap = 0
      TabStyle = tsDelphi
      Version = '2.0.1.5'
      PersistPagesState.Location = plRegistry
      PersistPagesState.Enabled = False
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 584
      Top = 240
      Width = 289
      Height = 193
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 424
    Top = 631
    Width = 161
    Height = 25
    Caption = 'Zamknij'
    TabOrder = 1
    OnClick = Button1Click
  end
end
