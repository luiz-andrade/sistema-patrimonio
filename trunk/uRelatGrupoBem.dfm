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
  object CheckBox1: TCheckBox
    Left = 48
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Grupo:'
    TabOrder = 2
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
  object CheckBox2: TCheckBox
    Left = 48
    Top = 56
    Width = 105
    Height = 17
    Caption = 'SubGrupo:'
    TabOrder = 4
  end
  object dblSubGrupo: TDBLookupComboBox
    Left = 163
    Top = 52
    Width = 305
    Height = 21
    KeyField = 'grupoId'
    ListField = 'grupoId;descricao'
    ListFieldIndex = 1
    ListSource = dsAuxGrupos
    TabOrder = 5
  end
  object rvdBensGrupo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlBens
    Left = 136
    Top = 88
  end
  object sqlBens: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from bem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 64
    Top = 88
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
    Left = 64
    Top = 144
  end
  object cdsAuxGrupo: TClientDataSet
    Active = True
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
  object rdvSubGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    Left = 339
    Top = 105
  end
  object rdvGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    Left = 405
    Top = 105
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
end
