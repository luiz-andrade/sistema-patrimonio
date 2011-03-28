object dm: Tdm
  OldCreateOrder = False
  Height = 332
  Width = 416
  object SQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=127.0.0.1'
      'DataBase=patrimonio'
      'User_Name='
      'Password='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=True'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False')
    VendorLib = 'sqlncli10.dll'
    Connected = True
    Left = 40
    Top = 32
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEpresa'
    Left = 152
    Top = 32
  end
  object dspEpresa: TDataSetProvider
    DataSet = sqiEmpresa
    Left = 240
    Top = 32
  end
  object sqiEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select *'
      'from empresa')
    SQLConnection = SQLConnection
    Left = 317
    Top = 32
  end
end
