object frmRelatGrupoBem: TfrmRelatGrupoBem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de bens por grupo/SubGrupo'
  ClientHeight = 502
  ClientWidth = 704
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
    Left = 576
    Top = 448
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnVisualizar: TBitBtn
    Left = 472
    Top = 448
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Visualizar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnVisualizarClick
  end
  object cbGrupo: TCheckBox
    Left = 57
    Top = 45
    Width = 97
    Height = 17
    Caption = 'Grupo:'
    TabOrder = 2
    OnClick = cbGrupoClick
  end
  object dblGrupo: TDBLookupComboBox
    Left = 168
    Top = 43
    Width = 400
    Height = 21
    KeyField = 'grupoId'
    ListField = 'grupoId;descricao'
    ListFieldIndex = 1
    ListSource = dsGrupos
    TabOrder = 3
  end
  object cbSubGrupo: TCheckBox
    Left = 57
    Top = 79
    Width = 105
    Height = 17
    Caption = 'SubGrupo:'
    Enabled = False
    TabOrder = 4
  end
  object dblSubGrupo: TDBLookupComboBox
    Left = 168
    Top = 75
    Width = 400
    Height = 21
    Enabled = False
    KeyField = 'grupoId'
    ListField = 'grupoId;descricao'
    ListFieldIndex = 1
    ListSource = dsAuxGrupos
    TabOrder = 5
  end
  object cbGestao: TCheckBox
    Left = 57
    Top = 109
    Width = 105
    Height = 17
    Caption = 'Gest'#227'o:'
    TabOrder = 6
  end
  object dblGestaoId: TDBLookupComboBox
    Left = 168
    Top = 105
    Width = 400
    Height = 21
    KeyField = 'gestaoId'
    ListField = 'gestaoId;gestao'
    ListFieldIndex = 1
    ListSource = dsGestao
    TabOrder = 7
  end
  object cbFornecedor: TCheckBox
    Left = 57
    Top = 140
    Width = 105
    Height = 17
    Caption = 'Fornecedor:'
    TabOrder = 8
  end
  object dblFornecedor: TDBLookupComboBox
    Left = 168
    Top = 136
    Width = 400
    Height = 21
    KeyField = 'fornecedorId'
    ListField = 'fornecedorId;razaoSocial'
    ListFieldIndex = 1
    ListSource = dsFornecedor
    TabOrder = 9
  end
  object dblLocal: TDBLookupComboBox
    Left = 168
    Top = 165
    Width = 400
    Height = 21
    KeyField = 'localId'
    ListField = 'localId;titulo'
    ListFieldIndex = 1
    ListSource = dsLocal
    TabOrder = 10
  end
  object dblsubLocalId: TDBLookupComboBox
    Left = 168
    Top = 194
    Width = 400
    Height = 21
    Enabled = False
    KeyField = 'localId'
    ListField = 'localId;titulo'
    ListFieldIndex = 1
    ListSource = dsAuxLocal
    NullValueKey = 46
    TabOrder = 11
  end
  object cbLocal: TCheckBox
    Left = 57
    Top = 166
    Width = 105
    Height = 17
    Caption = 'Org'#227'o/Empresa:'
    TabOrder = 12
    OnClick = cbLocalClick
  end
  object cbSubLocal: TCheckBox
    Left = 57
    Top = 196
    Width = 105
    Height = 17
    Caption = 'Unidade:'
    Enabled = False
    TabOrder = 13
  end
  object cbDescricao: TCheckBox
    Left = 57
    Top = 223
    Width = 105
    Height = 17
    Caption = 'Descri'#231#227'o:'
    TabOrder = 14
    OnClick = cbDescricaoClick
  end
  object edtDescricao: TEdit
    Left = 168
    Top = 221
    Width = 400
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object rvdBensGrupo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlBens
    Left = 96
    Top = 288
  end
  object sqlBens: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select *'#13#10'from bem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection
    Left = 175
    Top = 288
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
  object cdsAuxGrupo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'vGrupoId'
    MasterFields = 'grupoId'
    MasterSource = dsGrupos
    Params = <>
    ProviderName = 'dspAuxGrupo'
    Left = 24
    Top = 393
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
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 339
  end
  object dspAuxGrupo: TDataSetProvider
    DataSet = dm.sqlSubGrupo
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 393
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from grupo where vGrupoId = 0'
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 176
    Top = 393
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
    Left = 176
    Top = 339
  end
  object dsAuxGrupos: TDataSource
    DataSet = cdsAuxGrupo
    Left = 24
    Top = 339
  end
  object dspGestao: TDataSetProvider
    DataSet = dm.sqlGestao
    ResolveToDataSet = True
    Left = 425
    Top = 302
  end
  object cdsGestao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGestao'
    Left = 345
    Top = 302
  end
  object dsGestao: TDataSource
    AutoEdit = False
    DataSet = cdsGestao
    Left = 265
    Top = 302
  end
  object rvdGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlGrupo
    Left = 344
    Top = 256
  end
  object rvdSubGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = sqlSubGrupo
    Left = 424
    Top = 256
  end
  object sqlGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select *'
      'from grupo')
    SQLConnection = dm.SQLConnection
    Left = 23
    Top = 239
    object sqlGrupodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object sqlGrupoempresaId: TIntegerField
      FieldName = 'empresaId'
      Required = True
    end
    object sqlGrupogrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object sqlGrupovGrupoId: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vGrupoId'
      Size = 10
    end
  end
  object sqlSubGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select *'
      'from grupo')
    SQLConnection = dm.SQLConnection
    Left = 23
    Top = 289
    object StringField2: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object IntegerField5: TIntegerField
      FieldName = 'empresaId'
      Required = True
    end
    object sqlSubGrupogrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object sqlSubGrupovGrupoId: TStringField
      FieldName = 'vGrupoId'
      Required = True
      Size = 10
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cdsPessoaForc
    Left = 24
    Top = 453
  end
  object dsLocal: TDataSource
    DataSet = cdsLocal
    Left = 648
    Top = 264
  end
  object cdsLocal: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local where vLocalId = 0'
    Params = <>
    ProviderName = 'dspLocal'
    Left = 648
    Top = 320
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
  object dspLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 648
    Top = 376
  end
  object dsAuxLocal: TDataSource
    DataSet = cdsAuxLocal
    Left = 560
    Top = 264
  end
  object cdsAuxLocal: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local'
    IndexFieldNames = 'vLocalId'
    MasterFields = 'localId'
    MasterSource = dsLocal
    Params = <>
    ProviderName = 'dpsLocalAux'
    Left = 560
    Top = 320
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
  object dpsLocalAux: TDataSetProvider
    DataSet = dm.sqlSubLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 560
    Top = 376
  end
  object cdsPessoaForc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsPessoaForc'
    Left = 176
    Top = 453
    object cdsPessoaForcfornecedorId: TIntegerField
      FieldName = 'fornecedorId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPessoaForcrazaoSocial: TStringField
      FieldName = 'razaoSocial'
      Required = True
      Size = 100
    end
    object cdsPessoaForccnpj: TStringField
      FieldName = 'cnpj'
      Required = True
      EditMask = '00\.000\.000\/0000\-00;0; '
    end
    object cdsPessoaForcpessoaId: TIntegerField
      FieldName = 'pessoaId'
      Required = True
    end
  end
  object dpsPessoaForc: TDataSetProvider
    DataSet = dm.sqlFornecedor
    Left = 96
    Top = 453
  end
end
