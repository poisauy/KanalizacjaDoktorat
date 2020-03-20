object SharedDMVcl: TSharedDMVcl
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 235
  Width = 356
  object FDConnection: TFDConnection
    ResourceOptions.AssignedValues = [rvDefaultStoreFolder, rvBackupFolder, rvDefaultStoreExt, rvBackupExt]
    ResourceOptions.BackupExt = '.BAK'
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 256
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 104
  end
end
