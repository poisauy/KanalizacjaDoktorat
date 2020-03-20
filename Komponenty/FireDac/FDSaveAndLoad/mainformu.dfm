object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Save and Loading from Files'
  ClientHeight = 483
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 384
    Top = 48
    Width = 203
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 464
    Align = alLeft
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 370
      Width = 85
      Height = 13
      Caption = 'Store Merge Data'
    end
    object Label2: TLabel
      Left = 14
      Top = 416
      Width = 86
      Height = 13
      Caption = 'Store Merge Meta'
    end
    object btnEnableCachedUpdates: TButton
      Left = 16
      Top = 8
      Width = 177
      Height = 25
      Caption = 'Enable Cached Updates'
      TabOrder = 0
      OnClick = btnEnableCachedUpdatesClick
    end
    object btnApplyUpdates: TButton
      Left = 16
      Top = 39
      Width = 177
      Height = 25
      Caption = 'Apply Updates'
      Enabled = False
      TabOrder = 1
      OnClick = btnApplyUpdatesClick
    end
    object btnCancelUpdates: TButton
      Left = 16
      Top = 70
      Width = 177
      Height = 25
      Caption = 'Cancel Updates'
      Enabled = False
      TabOrder = 2
      OnClick = btnCancelUpdatesClick
    end
    object btnSaveToFile: TButton
      Left = 16
      Top = 101
      Width = 177
      Height = 25
      Caption = 'Save To File'
      Enabled = False
      TabOrder = 3
      OnClick = btnSaveToFileClick
    end
    object btnLoadFromFile: TButton
      Left = 16
      Top = 188
      Width = 177
      Height = 25
      Caption = 'Load From File'
      TabOrder = 4
      OnClick = btnLoadFromFileClick
    end
    object cbxPrettyPrint: TCheckBox
      Left = 16
      Top = 165
      Width = 177
      Height = 17
      Caption = 'Save Using Pretty Print'
      TabOrder = 5
      OnClick = cbxPrettyPrintClick
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 257
      Width = 185
      Height = 107
      Caption = 'Save Options'
      TabOrder = 6
      object cbxData: TCheckBox
        Left = 17
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Data'
        TabOrder = 0
        OnClick = cbxDataClick
      end
      object cbxDelta: TCheckBox
        Left = 17
        Top = 39
        Width = 97
        Height = 17
        Caption = 'Delta'
        TabOrder = 1
        OnClick = cbxDeltaClick
      end
      object cbxMetadata: TCheckBox
        Left = 17
        Top = 62
        Width = 97
        Height = 17
        Caption = 'Metadata'
        TabOrder = 2
        OnClick = cbxMetadataClick
      end
      object cbxVisible: TCheckBox
        Left = 17
        Top = 85
        Width = 97
        Height = 17
        Caption = 'Visible'
        TabOrder = 3
        OnClick = cbxVisibleClick
      end
    end
    object cbxStoreMergeData: TComboBox
      Left = 14
      Top = 389
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 7
      Text = 'dmNone'
      OnChange = cbxStoreMergeDataChange
      Items.Strings = (
        'dmNone'
        'dmDataSet'
        'dmDataAppend'
        'dmDataMerged'
        'mDeltaSet'
        'dmDeltaAppend'
        'dmDeltaMerge')
    end
    object cbxStoreMergeMeta: TComboBox
      Left = 14
      Top = 435
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 8
      Text = 'mmNone'
      OnChange = cbxStoreMergeMetaChange
      Items.Strings = (
        'mmNone'
        'mmMerge'
        'mmAdd'
        'mmUpdate'
        'mmAddOrError'
        'mmError')
    end
    object btnSaveToStream: TButton
      Left = 16
      Top = 134
      Width = 177
      Height = 25
      Caption = 'Save To Stream'
      Enabled = False
      TabOrder = 9
      OnClick = btnSaveToStreamClick
    end
    object btnLoadFromStream: TButton
      Left = 16
      Top = 219
      Width = 177
      Height = 25
      Caption = 'Load From Stream'
      TabOrder = 10
      OnClick = btnLoadFromStreamClick
    end
  end
  object Panel2: TPanel
    Left = 225
    Top = 0
    Width = 607
    Height = 464
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 605
      Height = 457
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 603
        Height = 115
        Align = alTop
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 4
          Top = 79
          Width = 240
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 120
          Top = 8
          Width = 458
          Height = 65
          Lines.Strings = (
            'SELECT * FROM CUSTOMER'
            '  WHERE STATE_PROVINCE= '#39'CA'#39)
          TabOrder = 1
        end
        object btnRunQuery: TButton
          Left = 4
          Top = 6
          Width = 110
          Height = 25
          Caption = 'Run Query'
          TabOrder = 2
          OnClick = btnRunQueryClick
        end
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 116
        Width = 603
        Height = 340
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 464
    Width = 832
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnClearQuery: TButton
    Left = 231
    Top = 39
    Width = 110
    Height = 25
    Caption = 'Clear Query'
    TabOrder = 4
    OnClick = btnClearQueryClick
  end
  object FDQuery1: TFDQuery
    ActiveStoredUsage = []
    OnCalcFields = FDQuery1CalcFields
    FieldOptions.AutoCreateMode = acCombineComputed
    Connection = SharedDMVcl.FDConnection
    ResourceOptions.AssignedValues = [rvBackup]
    ResourceOptions.Backup = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from customer')
    Left = 293
    Top = 214
    object FDQuery1UpdateStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'UpdateStatus'
      Size = 14
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 294
    Top = 166
  end
  object DataSource2: TDataSource
    Left = 294
    Top = 267
  end
  object SaveDialog1: TSaveDialog
    Filter = 'XML File|*.xml|JSON File|*.json|Binary File|*.bin|All Files|*.*'
    Left = 409
    Top = 166
  end
  object OpenDialog1: TOpenDialog
    Filter = 'XML File|*.xml|JSON File|*.json|Binary File|*.bin|All Files|*.*'
    Left = 497
    Top = 166
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 715
    Top = 215
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 717
    Top = 271
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 717
    Top = 339
  end
end
