object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 219
  Width = 245
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\dbdemos.gdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'MonitorBy=Remote'
      'DriverID=IB')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object TablesQry: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME'
      '  FROM RDB$RELATIONS'
      #9'WHERE ((RDB$SYSTEM_FLAG = 0) OR '
      #9'      (RDB$SYSTEM_FLAG IS NULL)) AND'
      #9'      (RDB$VIEW_SOURCE IS NULL)'
      #9'ORDER BY RDB$RELATION_NAME')
    Left = 40
    Top = 96
  end
  object FieldsQry: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from &TableName WHERE 1=2')
    Left = 96
    Top = 96
    MacroData = <
      item
        Value = 'Customer'
        Name = 'TABLENAME'
      end>
  end
  object SelectQry: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT &FieldList FROM &TableName')
    Left = 152
    Top = 96
    MacroData = <
      item
        Value = 'Company'
        Name = 'FIELDLIST'
      end
      item
        Value = 'Customer'
        Name = 'TABLENAME'
      end>
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 56
    Top = 152
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 176
    Top = 152
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    EventKinds = [ekCmdPrepare]
    Tracing = True
    Left = 158
    Top = 33
  end
end
