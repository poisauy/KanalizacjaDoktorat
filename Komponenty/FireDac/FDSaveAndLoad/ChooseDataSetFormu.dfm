object ChooseDataSetForm: TChooseDataSetForm
  Left = 0
  Top = 0
  Caption = 'ChooseDataSetForm'
  ClientHeight = 224
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    367
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 176
    Height = 13
    Caption = 'Select a DataSet to load and click OK'
  end
  object Button1: TButton
    Left = 203
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Load'
    Default = True
    ModalResult = 1
    TabOrder = 0
    ExplicitLeft = 471
    ExplicitTop = 266
  end
  object Button2: TButton
    Left = 284
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    ExplicitLeft = 552
    ExplicitTop = 266
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 27
    Width = 351
    Height = 155
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DataSource1: TDataSource
    Left = 177
    Top = 117
  end
end
