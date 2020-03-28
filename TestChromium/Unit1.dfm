object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 663
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 153
    Width = 765
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -24
    ExplicitTop = 150
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 397
    Width = 765
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 161
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 153
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 111
      Top = 1
      Width = 653
      Height = 151
      Align = alRight
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Wczytaj DB'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 765
    Height = 241
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object sgMacierz: TStringGrid
      Left = 113
      Top = 0
      Width = 652
      Height = 241
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDrawCell = sgMacierzDrawCell
      OnGetEditMask = sgMacierzGetEditMask
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 113
      Height = 241
      Align = alLeft
      Caption = 'Panel3'
      TabOrder = 1
      object Button3: TButton
        Left = 16
        Top = 112
        Width = 75
        Height = 25
        Caption = 'Zapisz zmiany'
        TabOrder = 0
        OnClick = Button3Click
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 400
    Width = 765
    Height = 263
    Align = alBottom
    Caption = 'Panel4'
    TabOrder = 2
    object Button2: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Wykres'
      TabOrder = 0
      OnClick = Button2Click
    end
    object ChromiumWindow1: TChromiumWindow
      Left = 1
      Top = 56
      Width = 763
      Height = 206
      Align = alBottom
      TabOrder = 1
      OnClose = ChromiumWindow1Close
      OnBeforeClose = ChromiumWindow1BeforeClose
      OnAfterCreated = ChromiumWindow1AfterCreated
    end
  end
  object DataSource1: TDataSource
    DataSet = qMacierz
    Left = 264
    Top = 16
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=kandula.db.elephantsql.com'
      'Password=8uTsC8y3Lkgh_tiyw6mr-GgxJa8zjWEr'
      'Database=xtsbjcwv'
      'User_Name=xtsbjcwv'
      'CharacterSet=UTF8'
      'DriverID=PG')
    Left = 144
    Top = 16
  end
  object qMacierz: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT m.id, m.row_id, m.col_id, m.value, w_row.nazwa as row_naz' +
        'wa, w_col.nazwa as col_nazwa'
      '  FROM dane.macierze m, dane.warianty w_row, dane.warianty w_col'
      'WHERE m.row_id = w_row.id'
      '     AND m.col_id = w_col.id'
      'ORDER BY row_id, col_id')
    Left = 208
    Top = 16
  end
  object qWarianty: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, nazwa FROM dane.warianty ORDER BY id')
    Left = 216
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 136
    Top = 480
  end
end
