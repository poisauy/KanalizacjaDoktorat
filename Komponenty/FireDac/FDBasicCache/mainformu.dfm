object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cached Updates with FireDAC'
  ClientHeight = 472
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
    Height = 453
    Align = alLeft
    TabOrder = 1
    object OpenCloseQueryBtn: TButton
      Left = 16
      Top = 10
      Width = 177
      Height = 25
      Caption = 'Open Query'
      TabOrder = 0
      OnClick = OpenCloseQueryBtnClick
    end
    object EnableCachedUpdatesBtn: TButton
      Left = 16
      Top = 41
      Width = 177
      Height = 25
      Caption = 'Enable Cached Updates'
      TabOrder = 1
      OnClick = EnableCachedUpdatesBtnClick
    end
    object ShowCacheBtn: TButton
      Left = 16
      Top = 72
      Width = 177
      Height = 25
      Caption = 'Show Cache'
      Enabled = False
      TabOrder = 2
      OnClick = ShowCacheBtnClick
    end
    object ApplyUpdatesBtn: TButton
      Left = 16
      Top = 103
      Width = 177
      Height = 25
      Caption = 'Apply Updates'
      Enabled = False
      TabOrder = 3
      OnClick = ApplyUpdatesBtnClick
    end
    object CancelUpdatesBtn: TButton
      Left = 16
      Top = 134
      Width = 177
      Height = 25
      Caption = 'Cancel Updates'
      Enabled = False
      TabOrder = 4
      OnClick = CancelUpdatesBtnClick
    end
    object RevertRecordBtn: TButton
      Left = 16
      Top = 196
      Width = 177
      Height = 25
      Caption = 'Revert Record'
      Enabled = False
      TabOrder = 5
      OnClick = RevertRecordBtnClick
    end
    object UndoLastChangeBtn: TButton
      Left = 16
      Top = 227
      Width = 177
      Height = 25
      Caption = 'Undo Last Change'
      Enabled = False
      TabOrder = 6
      OnClick = UndoLastChangeBtnClick
    end
    object CreateSavePointBtn: TButton
      Left = 16
      Top = 258
      Width = 177
      Height = 25
      Caption = 'Create SavePoint'
      Enabled = False
      TabOrder = 7
      OnClick = CreateSavePointBtnClick
    end
    object RevertToSavePointBtn: TButton
      Left = 16
      Top = 289
      Width = 177
      Height = 25
      Caption = 'Revert To SavePoint'
      Enabled = False
      TabOrder = 8
      OnClick = RevertToSavePointBtnClick
    end
    object SaveToFileBtn: TButton
      Left = 16
      Top = 320
      Width = 177
      Height = 25
      Caption = 'Save To File'
      Enabled = False
      TabOrder = 9
      OnClick = SaveToFileBtnClick
    end
    object LoadFromFileBtn: TButton
      Left = 16
      Top = 351
      Width = 177
      Height = 25
      Caption = 'Load From File'
      TabOrder = 10
      OnClick = LoadFromFileBtnClick
    end
    object CommitUpdatesBtn: TButton
      Left = 16
      Top = 165
      Width = 177
      Height = 25
      Caption = 'Commit Updates'
      Enabled = False
      TabOrder = 11
      OnClick = CommitUpdatesBtnClick
    end
  end
  object Panel2: TPanel
    Left = 225
    Top = 0
    Width = 607
    Height = 453
    Align = alClient
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 193
      Width = 605
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 129
      ExplicitWidth = 170
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 605
      Height = 192
      Align = alTop
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 603
        Height = 40
        Align = alTop
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 4
          Top = 7
          Width = 240
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 41
        Width = 603
        Height = 150
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
    object Panel4: TPanel
      Left = 1
      Top = 196
      Width = 605
      Height = 256
      Align = alClient
      TabOrder = 1
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 603
        Height = 41
        Align = alTop
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 1
        Top = 42
        Width = 603
        Height = 213
        Align = alClient
        DataSource = DataSource2
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
    Top = 453
    Width = 832
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object FDQuery1: TFDQuery
    ActiveStoredUsage = []
    AfterOpen = FDQuery1AfterOpen
    AfterClose = FDQuery1AfterClose
    OnCalcFields = FDQuery1CalcFields
    OnUpdateRecord = FDQuery1UpdateRecord
    OnUpdateError = FDQuery1UpdateError
    OnReconcileError = FDQuery1ReconcileError
    Connection = SharedDMVcl.FDConnection
    UpdateOptions.AssignedValues = [uvUpdateMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'select * from customer')
    Left = 456
    Top = 248
    object FDQuery1UpdateStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'UpdateStatus'
      Size = 14
      Calculated = True
    end
    object FDQuery1CUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Origin = 'CUST_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object FDQuery1CONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Origin = 'CONTACT_FIRST'
      Size = 15
    end
    object FDQuery1CONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
      Origin = 'CONTACT_LAST'
    end
    object FDQuery1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
    end
    object FDQuery1ADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Origin = 'ADDRESS_LINE1'
      Size = 30
    end
    object FDQuery1ADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Origin = 'ADDRESS_LINE2'
      Size = 30
    end
    object FDQuery1CITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 25
    end
    object FDQuery1STATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Origin = 'STATE_PROVINCE'
      Size = 15
    end
    object FDQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 15
    end
    object FDQuery1POSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Origin = 'POSTAL_CODE'
      Size = 12
    end
    object FDQuery1ON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Origin = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 288
    Top = 87
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable1
    Left = 258
    Top = 340
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 584
    Top = 248
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 713
    Top = 248
  end
  object FDMemTable1: TFDMemTable
    Active = True
    OnCalcFields = FDQuery1CalcFields
    FieldDefs = <
      item
        Name = 'CUST_NO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CUSTOMER'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CONTACT_FIRST'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CONTACT_LAST'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHONE_NO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ADDRESS_LINE1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDRESS_LINE2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'STATE_PROVINCE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'POSTAL_CODE'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ON_HOLD'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 360
    Top = 336
    Content = {
      414442530F006027B1040000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003100050000000000060000070032000000
      080000FF09FF0A04000E00000043005500530054005F004E004F000B00010000
      000D000C000E00010F000110000111000112000E00000043005500530054005F
      004E004F00FEFF0A04001000000043005500530054004F004D00450052000B00
      020000000D0013001400190000000E00010F0001100001110001120010000000
      43005500530054004F004D0045005200150019000000FEFF0A04001A00000043
      004F004E0054004100430054005F00460049005200530054000B00030000000D
      00130014000F0000000E00011600010F000117000110000111000112001A0000
      0043004F004E0054004100430054005F004600490052005300540015000F0000
      00FEFF0A04001800000043004F004E0054004100430054005F004C0041005300
      54000B00040000000D0013001400140000000E00011600010F00011700011000
      0111000112001800000043004F004E0054004100430054005F004C0041005300
      5400150014000000FEFF0A040010000000500048004F004E0045005F004E004F
      000B00050000000D0013001400140000000E00011600010F0001170001100001
      110001120010000000500048004F004E0045005F004E004F00150014000000FE
      FF0A04001A00000041004400440052004500530053005F004C0049004E004500
      31000B00060000000D00130014001E0000000E00011600010F00011700011000
      0111000112001A00000041004400440052004500530053005F004C0049004E00
      4500310015001E000000FEFF0A04001A00000041004400440052004500530053
      005F004C0049004E00450032000B00070000000D00130014001E0000000E0001
      1600010F000117000110000111000112001A0000004100440044005200450053
      0053005F004C0049004E004500320015001E000000FEFF0A0400080000004300
      4900540059000B00080000000D0013001400190000000E00011600010F000117
      00011000011100011200080000004300490054005900150019000000FEFF0A04
      001C000000530054004100540045005F00500052004F00560049004E00430045
      000B00090000000D00130014000F0000000E00011600010F0001170001100001
      11000112001C000000530054004100540045005F00500052004F00560049004E
      004300450015000F000000FEFF0A04000E00000043004F0055004E0054005200
      59000B000A0000000D00130014000F0000000E00011600010F00011700011000
      0111000112000E00000043004F0055004E0054005200590015000F000000FEFF
      0A04001600000050004F005300540041004C005F0043004F00440045000B000B
      0000000D00130014000C0000000E00011600010F000117000110000111000112
      001600000050004F005300540041004C005F0043004F004400450015000C0000
      00FEFF0A04000E0000004F004E005F0048004F004C0044000B000C0000000D00
      13001400010000000E00011600010F000117000110000111000112000E000000
      4F004E005F0048004F004C004400150001000000FEFEFF18FEFF19FEFF1AFEFE
      FEFF1BFEFF1C1D0011000000FF1EFEFEFE0E004D0061006E0061006700650072
      001E005500700064006100740065007300520065006700690073007400720079
      0012005400610062006C0065004C006900730074000A005400610062006C0065
      0008004E0061006D0065000A0054006100620049004400240045006E0066006F
      0072006300650043006F006E00730074007200610069006E00740073001E004D
      0069006E0069006D0075006D0043006100700061006300690074007900180043
      006800650063006B004E006F0074004E0075006C006C00140043006F006C0075
      006D006E004C006900730074000C0043006F006C0075006D006E00100053006F
      007500720063006500490044000E006400740049006E00740033003200100044
      0061007400610054007900700065001400530065006100720063006800610062
      006C0065000800420061007300650012004F0049006E00550070006400610074
      00650010004F0049006E00570068006500720065001A004F0072006900670069
      006E0043006F006C004E0061006D00650018006400740041006E007300690053
      007400720069006E0067000800530069007A006500140053006F007500720063
      006500530069007A006500120041006C006C006F0077004E0075006C006C0014
      004F0041006C006C006F0077004E0075006C006C001C0043006F006E00730074
      007200610069006E0074004C00690073007400100056006900650077004C0069
      00730074000E0052006F0077004C006900730074001800520065006C00610074
      0069006F006E004C006900730074001C0055007000640061007400650073004A
      006F00750072006E0061006C001200530061007600650050006F0069006E0074
      000E004300680061006E00670065007300}
    object FDMemTable1UpdateStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'UpdateStatus'
      Calculated = True
    end
    object FDMemTable1CUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Required = True
    end
    object FDMemTable1CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object FDMemTable1CONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Size = 15
    end
    object FDMemTable1CONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
    end
    object FDMemTable1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
    end
    object FDMemTable1ADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Size = 30
    end
    object FDMemTable1ADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Size = 30
    end
    object FDMemTable1CITY: TStringField
      FieldName = 'CITY'
      Size = 25
    end
    object FDMemTable1STATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Size = 15
    end
    object FDMemTable1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 15
    end
    object FDMemTable1POSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Size = 12
    end
    object FDMemTable1ON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
  end
end
