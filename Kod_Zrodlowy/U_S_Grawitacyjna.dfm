object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Import / Sie'#263' Grawitacyjna'
  ClientHeight = 881
  ClientWidth = 1246
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
    Width = 1017
    Height = 249
    Caption = '1.  Import danych z Excela - Sie'#263' Grawitacyjna.'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 16
      Top = 40
      Width = 1211
      Height = 737
      ActivePage = ts3
      TabOrder = 0
      object ts1: TTabSheet
        Caption = '1. Hierarchiczny model - AHP '
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1005
        ExplicitHeight = 393
      end
      object ts2: TTabSheet
        Caption = '2. SG_Warstwa_I'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts3: TTabSheet
        Caption = '3. SG_Warstwa_II'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts4: TTabSheet
        Caption = '4. SG_Warstwa_III'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts5: TTabSheet
        Caption = '5. SG_Warstwa_IV'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts6: TTabSheet
        Caption = '6. SG_Warstwa_V'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts7: TTabSheet
        Caption = '7. SG_Por'#243'wnanie'
        ImageIndex = 6
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object ts8: TTabSheet
        Caption = '8. SG_Zbior'#243'wka_indeks'
        ImageIndex = 7
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  object Button1: TButton
    Left = 552
    Top = 839
    Width = 161
    Height = 25
    Caption = 'Zamknij'
    TabOrder = 1
    OnClick = Button1Click
  end
end
