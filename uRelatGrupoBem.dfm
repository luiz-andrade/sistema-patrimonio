object frmRelatGrupoBem: TfrmRelatGrupoBem
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de bens por grupo/SubGrupo'
  ClientHeight = 304
  ClientWidth = 545
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
  object btnFechar: TBitBtn
    Left = 440
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnVisualizar: TBitBtn
    Left = 336
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnVisualizarClick
  end
  object cbGrupo: TCheckBox
    Left = 52
    Top = 22
    Width = 97
    Height = 17
    Caption = 'Grupo:'
    TabOrder = 2
    OnClick = cbGrupoClick
  end
  object dblGrupo: TDBLookupComboBox
    Left = 163
    Top = 22
    Width = 305
    Height = 21
    KeyField = 'grupoId'
    ListField = 'grupoId;descricao'
    ListFieldIndex = 1
    ListSource = dsGrupos
    TabOrder = 3
  end
  object cbSubGrupo: TCheckBox
    Left = 52
    Top = 56
    Width = 105
    Height = 17
    Caption = 'SubGrupo:'
    Enabled = False
    TabOrder = 4
  end
  object dblSubGrupo: TDBLookupComboBox
    Left = 163
    Top = 52
    Width = 305
    Height = 21
    Enabled = False
    KeyField = 'grupoId'
    ListField = 'grupoId;descricao'
    ListFieldIndex = 1
    ListSource = dsAuxGrupos
    TabOrder = 5
  end
  object cbGestao: TCheckBox
    Left = 52
    Top = 83
    Width = 105
    Height = 17
    Caption = 'Gest'#227'o:'
    TabOrder = 6
  end
  object dblGestaoId: TDBLookupComboBox
    Left = 163
    Top = 79
    Width = 305
    Height = 21
    KeyField = 'gestaoId'
    ListField = 'gestaoId;gestao'
    ListFieldIndex = 1
    ListSource = dsGestao
    TabOrder = 7
  end
  object rvdBensGrupo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlBens
    Left = 152
    Top = 152
  end
  object sqlBens: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from bem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 239
    Top = 152
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
  object rvpTR: TRvProject
    ProjectFile = 'C:\Projetos\sistema-patrimonio\reports\reportMovimentacao.rav'
    Left = 56
    Top = 152
  end
  object cdsAuxGrupo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'vGrupoId'
    MasterFields = 'grupoId'
    MasterSource = dsGrupos
    Params = <>
    ProviderName = 'dspAuxGrupo'
    Left = 56
    Top = 256
    object cdsAuxGrupogrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsAuxGrupovGrupoId: TStringField
      FieldName = 'vGrupoId'
      Required = True
      Size = 10
    end
    object cdsAuxGrupoempresaId: TIntegerField
      FieldName = 'empresaId'
      Required = True
    end
    object cdsAuxGrupodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = dm.sqlGrupo
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 200
  end
  object dspAuxGrupo: TDataSetProvider
    DataSet = dm.sqlSubGrupo
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 256
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 240
    Top = 256
    object cdsGrupodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object cdsGrupoempresaId: TIntegerField
      FieldName = 'empresaId'
      Required = True
    end
    object cdsGrupogrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
  end
  object dsGrupos: TDataSource
    DataSet = cdsGrupo
    Left = 240
    Top = 196
  end
  object dsAuxGrupos: TDataSource
    DataSet = cdsAuxGrupo
    Left = 56
    Top = 200
  end
  object dspGestao: TDataSetProvider
    DataSet = dm.sqlGestao
    Options = [poReadOnly, poUseQuoteChar]
    Left = 481
    Top = 198
  end
  object cdsGestao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGestao'
    Left = 401
    Top = 198
  end
  object dsGestao: TDataSource
    AutoEdit = False
    DataSet = cdsGestao
    Left = 321
    Top = 198
  end
  object rvdGestao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = cdsGestao
    Left = 320
    Top = 152
  end
  object rvdGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = dm.sqlGrupo
    Left = 400
    Top = 152
  end
  object rvdSubGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = dm.sqlSubGrupo
    Left = 480
    Top = 152
  end
end
