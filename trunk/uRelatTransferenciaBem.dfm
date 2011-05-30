object frmRelatTranferenciaBem: TfrmRelatTranferenciaBem
  Left = 0
  Top = 0
  Caption = 'TR - Termo de Respons'#225'bilidade'
  ClientHeight = 406
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 174
    Top = 13
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object btnVisualizar: TBitBtn
    Left = 352
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnVisualizarClick
  end
  object btnFechar: TBitBtn
    Left = 456
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object cbOrgao: TCheckBox
    Left = 56
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Org'#227'o/Empresa:'
    TabOrder = 2
    OnClick = cbOrgaoClick
  end
  object cbUnidade: TCheckBox
    Left = 56
    Top = 104
    Width = 105
    Height = 17
    Caption = 'Unidades:'
    Enabled = False
    TabOrder = 3
  end
  object dbLocal: TDBLookupComboBox
    Left = 171
    Top = 70
    Width = 438
    Height = 21
    KeyField = 'localId'
    ListField = 'localId;titulo'
    ListFieldIndex = 1
    ListSource = dsLocal
    TabOrder = 4
  end
  object dblSubLocal: TDBLookupComboBox
    Left = 171
    Top = 100
    Width = 438
    Height = 21
    Enabled = False
    KeyField = 'localId'
    ListField = 'localId;titulo'
    ListFieldIndex = 1
    ListSource = dsAuxLocal
    TabOrder = 5
  end
  object edtNome: TLabeledEdit
    Left = 171
    Top = 152
    Width = 224
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome:'
    TabOrder = 6
  end
  object edtMunicipio: TLabeledEdit
    Left = 406
    Top = 152
    Width = 203
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Munic'#237'pio:'
    TabOrder = 7
  end
  object edtMatricula: TLabeledEdit
    Left = 56
    Top = 152
    Width = 97
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Matricula:'
    TabOrder = 8
  end
  object edtNTranferencia: TLabeledEdit
    Left = 56
    Top = 30
    Width = 97
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' TR:'
    TabOrder = 9
  end
  object edtData: TDateTimePicker
    Left = 174
    Top = 30
    Width = 186
    Height = 21
    Date = 40691.646961932870000000
    Time = 40691.646961932870000000
    TabOrder = 10
  end
  object rvpTR: TRvProject
    Left = 632
    Top = 32
  end
  object sqlLocal: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from local'#13#10'where vLocalId = 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 304
    Top = 336
  end
  object rvdLocal: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlLocal
    Left = 304
    Top = 288
  end
  object sqlBens: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from bem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 216
    Top = 336
    object sqlBensbemId: TIntegerField
      FieldName = 'bemId'
      Required = True
    end
    object sqlBensidenficacao: TStringField
      FieldName = 'idenficacao'
      Required = True
      Size = 50
    end
    object sqlBensdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object sqlBensgrupoId: TStringField
      FieldName = 'grupoId'
      Required = True
      Size = 10
    end
    object sqlBensestadoId: TIntegerField
      FieldName = 'estadoId'
      Required = True
    end
    object sqlBenslocalId: TStringField
      FieldName = 'localId'
      Required = True
      Size = 10
    end
    object sqlBensgestaoId: TIntegerField
      FieldName = 'gestaoId'
    end
    object sqlBensvalor: TFMTBCDField
      FieldName = 'valor'
      Required = True
      currency = True
      Precision = 19
      Size = 4
    end
    object sqlBenstipoIdentificacao: TIntegerField
      FieldName = 'tipoIdentificacao'
      Required = True
    end
    object sqlBenssubgrupoId: TStringField
      FieldName = 'subgrupoId'
      Size = 10
    end
    object sqlBenssubLocalId: TStringField
      FieldName = 'subLocalId'
      Size = 10
    end
    object sqlBenstipoAquisicao: TIntegerField
      FieldName = 'tipoAquisicao'
      Required = True
    end
    object sqlBensquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
  end
  object rvdBens: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlBens
    Left = 216
    Top = 288
  end
  object sqlSubLocal: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'select local.*, unidade.Titulo as empresa_orgao'#13#10'from local inne' +
      'r join local as unidade on unidade.localId = local.vLocalId'#13#10'whe' +
      're local.vLocalId <> 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 440
    Top = 336
    object sqlSubLocallocalId: TStringField
      FieldName = 'localId'
      Required = True
      Size = 10
    end
    object sqlSubLocaltitulo: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object sqlSubLocalvLocalId: TStringField
      FieldName = 'vLocalId'
      Size = 10
    end
    object sqlSubLocalpessoaId: TIntegerField
      FieldName = 'pessoaId'
    end
    object sqlSubLocalempresa_orgao: TStringField
      FieldName = 'empresa_orgao'
      Required = True
      Size = 100
    end
  end
  object rvdSubLocal: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlSubLocal
    Left = 496
    Top = 336
  end
  object rvdEmpresa: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = dm.sqlEmpresa
    Left = 592
    Top = 328
  end
  object dpsLocalAux: TDataSetProvider
    DataSet = dm.sqlSubLocal
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 280
  end
  object dsAuxLocal: TDataSource
    DataSet = cdsAuxLocal
    Left = 26
    Top = 280
  end
  object cdsAuxLocal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'vLocalId'
    MasterFields = 'localId'
    MasterSource = dsLocal
    Params = <>
    ProviderName = 'dpsLocalAux'
    Left = 80
    Top = 280
    object StringField1: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object IntegerField3: TIntegerField
      FieldName = 'pessoaId'
      LookupKeyFields = 'pessoaId'
      LookupResultField = 'nome'
      KeyFields = 'pessoaId'
    end
    object cdsAuxLocallocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsAuxLocalvLocalId: TStringField
      FieldName = 'vLocalId'
      Required = True
      Size = 10
    end
  end
  object dspLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 328
  end
  object cdsLocal: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local where vLocalId = 0'
    Params = <>
    ProviderName = 'dspLocal'
    Left = 80
    Top = 328
    object cdsLocaltitulo: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object cdsLocalpessoaId: TIntegerField
      FieldName = 'pessoaId'
    end
    object cdsLocallocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsLocalvLocalId: TStringField
      FieldName = 'vLocalId'
      Size = 10
    end
  end
  object dsLocal: TDataSource
    DataSet = cdsLocal
    Left = 24
    Top = 328
  end
end
