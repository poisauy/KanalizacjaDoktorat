object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Centralized Cached Updates with Master-Detail'
  ClientHeight = 433
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    631
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 38
    Width = 240
    Height = 25
    DataSource = dscCustomerRB
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 69
    Width = 615
    Height = 142
    Anchors = [akLeft, akTop, akRight]
    DataSource = dscCustomerRB
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CustomerRecordStatus'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_FIRST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_LAST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_LINE1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_LINE2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE_PROVINCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTAL_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ON_HOLD'
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 8
    Top = 217
    Width = 240
    Height = 25
    DataSource = dscSalesRB
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 6
    Top = 248
    Width = 617
    Height = 157
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dscSalesRB
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SalesRecordStatus'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_REP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDER_STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDER_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIP_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_NEEDED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_ORDERED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_VALUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISCOUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_TYPE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGED'
        Visible = True
      end>
  end
  object btnApplyUpdates: TButton
    Left = 8
    Top = 7
    Width = 120
    Height = 25
    Caption = 'Call ApplyUpdates'
    Enabled = False
    TabOrder = 4
    OnClick = btnApplyUpdatesClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 631
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnUndoLastChange: TButton
    Left = 381
    Top = 8
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Undo Last Change'
    TabOrder = 6
    OnClick = btnUndoLastChangeClick
  end
  object btnCancelUpdates: TButton
    Left = 510
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Cancel Updates'
    Enabled = False
    TabOrder = 7
    OnClick = btnCancelUpdatesClick
  end
  object CustomerQueryRB: TFDQuery
    ActiveStoredUsage = []
    OnCalcFields = StatusCalcFields
    OnUpdateRecord = CustomerQueryRBUpdateRecord
    Connection = SharedDMVcl.FDConnection
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'CUST_NO_GEN'
    UpdateOptions.AutoIncFields = 'CUST_NO'
    SQL.Strings = (
      'SELECT * FROM Customer')
    Left = 416
    Top = 136
    object CustomerQueryRBCustomerRecordStatus: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CustomerRecordStatus'
      Size = 14
    end
    object CustomerQueryRBCUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Origin = 'CUST_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CustomerQueryRBCUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object CustomerQueryRBCONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Origin = 'CONTACT_FIRST'
      Size = 15
    end
    object CustomerQueryRBCONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
      Origin = 'CONTACT_LAST'
    end
    object CustomerQueryRBPHONE_NO: TStringField
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
    end
    object CustomerQueryRBADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Origin = 'ADDRESS_LINE1'
      Size = 30
    end
    object CustomerQueryRBADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Origin = 'ADDRESS_LINE2'
      Size = 30
    end
    object CustomerQueryRBCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 25
    end
    object CustomerQueryRBSTATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Origin = 'STATE_PROVINCE'
      Size = 15
    end
    object CustomerQueryRBCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 15
    end
    object CustomerQueryRBPOSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Origin = 'POSTAL_CODE'
      Size = 12
    end
    object CustomerQueryRBON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Origin = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
  end
  object SalesQueryRB: TFDQuery
    ActiveStoredUsage = []
    OnCalcFields = StatusCalcFields
    IndexFieldNames = 'CUST_NO'
    MasterSource = CustomerSourceRB
    MasterFields = 'CUST_NO'
    OnUpdateRecord = SalesQueryRBUpdateRecord
    Connection = SharedDMVcl.FDConnection
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT * FROM Sales')
    Left = 416
    Top = 288
    object SalesQueryRBSalesRecordStatus: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SalesRecordStatus'
      Size = 14
    end
    object SalesQueryRBPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Origin = 'PO_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 8
    end
    object SalesQueryRBCUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Origin = 'CUST_NO'
      Required = True
    end
    object SalesQueryRBSALES_REP: TSmallintField
      FieldName = 'SALES_REP'
      Origin = 'SALES_REP'
    end
    object SalesQueryRBORDER_STATUS: TStringField
      FieldName = 'ORDER_STATUS'
      Origin = 'ORDER_STATUS'
      Required = True
      Size = 7
    end
    object SalesQueryRBORDER_DATE: TSQLTimeStampField
      FieldName = 'ORDER_DATE'
      Origin = 'ORDER_DATE'
      Required = True
    end
    object SalesQueryRBSHIP_DATE: TSQLTimeStampField
      FieldName = 'SHIP_DATE'
      Origin = 'SHIP_DATE'
    end
    object SalesQueryRBDATE_NEEDED: TSQLTimeStampField
      FieldName = 'DATE_NEEDED'
      Origin = 'DATE_NEEDED'
    end
    object SalesQueryRBPAID: TStringField
      FieldName = 'PAID'
      Origin = 'PAID'
      FixedChar = True
      Size = 1
    end
    object SalesQueryRBQTY_ORDERED: TIntegerField
      FieldName = 'QTY_ORDERED'
      Origin = 'QTY_ORDERED'
      Required = True
    end
    object SalesQueryRBTOTAL_VALUE: TCurrencyField
      FieldName = 'TOTAL_VALUE'
      Origin = 'TOTAL_VALUE'
      Required = True
    end
    object SalesQueryRBDISCOUNT: TSingleField
      FieldName = 'DISCOUNT'
      Origin = 'DISCOUNT'
      Required = True
    end
    object SalesQueryRBITEM_TYPE: TStringField
      FieldName = 'ITEM_TYPE'
      Origin = 'ITEM_TYPE'
      Required = True
      Size = 12
    end
    object SalesQueryRBAGED: TFMTBCDField
      FieldName = 'AGED'
      Origin = 'AGED'
      Precision = 18
      Size = 9
    end
  end
  object CustomerSourceRB: TDataSource
    DataSet = CustomerQueryRB
    Left = 522
    Top = 136
  end
  object dscCustomerRB: TDataSource
    DataSet = CustomerQueryRB
    OnDataChange = OnDataChange
    Left = 307
    Top = 136
  end
  object dscSalesRB: TDataSource
    DataSet = SalesQueryRB
    OnDataChange = OnDataChange
    Left = 302
    Top = 288
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 417
    Top = 81
  end
end
