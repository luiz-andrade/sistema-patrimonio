object frmRelatTranferenciaBem: TfrmRelatTranferenciaBem
  Left = 0
  Top = 0
  Caption = 'TR - Termo de Respons'#225'bilidade'
  ClientHeight = 314
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
  end
  object CheckBox1: TCheckBox
    Left = 208
    Top = 32
    Width = 97
    Height = 17
    Caption = 'Org'#227'o/Empresa:'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 208
    Top = 64
    Width = 105
    Height = 17
    Caption = 'Unidades:'
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 323
    Top = 30
    Width = 203
    Height = 21
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 323
    Top = 60
    Width = 203
    Height = 21
    TabOrder = 5
  end
  object rvpTR: TRvProject
    Left = 64
    Top = 24
  end
  object sqlLocal: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from local'#13#10'where vLocalId = 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 64
    Top = 88
  end
  object rvdLocal: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlLocal
    Left = 160
    Top = 24
  end
  object sqlBens: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from bem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 64
    Top = 216
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
    Left = 160
    Top = 152
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
    Left = 64
    Top = 152
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
    Left = 160
    Top = 88
  end
  object rvdEmpresa: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = dm.sqlEmpresa
    Left = 160
    Top = 208
  end
end
