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
  object cbRelaGrupos: TCheckBox
    Left = 56
    Top = 16
    Width = 201
    Height = 17
    Caption = 'Imprimir somente rela'#231#227'o de grupos.'
    TabOrder = 16
  end
  object rvdBensGrupo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = sqlBem
    Left = 384
    Top = 328
  end
  object cdsAuxGrupo: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from grupo order by grupoId'
    IndexFieldNames = 'vGrupoId'
    MasterFields = 'grupoId'
    MasterSource = dsGrupos
    Params = <>
    ProviderName = 'dspAuxGrupo'
    Left = 24
    Top = 393
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
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 425
    Top = 270
  end
  object cdsGestao: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from gestao'
    Params = <>
    ProviderName = 'dspGestao'
    Left = 345
    Top = 270
  end
  object dsGestao: TDataSource
    AutoEdit = False
    DataSet = cdsGestao
    Left = 265
    Top = 270
  end
  object rvdGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = sqlGrupo
    Left = 384
    Top = 384
  end
  object rvdSubGrupos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = sqlSubGrupo
    Left = 384
    Top = 440
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
    CommandText = 'select * from fornecedor'
    Params = <>
    ProviderName = 'dpsPessoaForc'
    Left = 176
    Top = 453
  end
  object dpsPessoaForc: TDataSetProvider
    DataSet = dm.sqlFornecedor
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 453
  end
  object sqlGrupo: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from grupo where vGrupoId = 0')
    Left = 312
    Top = 384
    object sqlGrupogrupoId: TStringField
      AutoGenerateValue = arAutoInc
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object sqlGrupodescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlGrupoempresaId: TIntegerField
      FieldName = 'empresaId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGrupovGrupoId: TStringField
      FieldName = 'vGrupoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object sqlSubGrupo: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from grupo where vGrupoId <> 0')
    Left = 312
    Top = 440
    object sqlSubGrupogrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object sqlSubGrupodescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlSubGrupoempresaId: TIntegerField
      FieldName = 'empresaId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSubGrupovGrupoId: TStringField
      FieldName = 'vGrupoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object sqlBem: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bem')
    Left = 312
    Top = 328
    object sqlBembemId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'bemId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlBemidenficacao: TStringField
      FieldName = 'idenficacao'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlBemdescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlBemgrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlBemestadoId: TIntegerField
      FieldName = 'estadoId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlBemlocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlBemgestaoId: TIntegerField
      FieldName = 'gestaoId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlBemvalor: TBCDField
      FieldName = 'valor'
      ProviderFlags = [pfInUpdate]
      currency = True
      Precision = 19
    end
    object sqlBemtipoIdentificacao: TIntegerField
      FieldName = 'tipoIdentificacao'
      ProviderFlags = [pfInUpdate]
    end
    object sqlBemsubgrupoId: TStringField
      FieldName = 'subgrupoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlBemsubLocalId: TStringField
      FieldName = 'subLocalId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlBemtipoAquisicao: TIntegerField
      FieldName = 'tipoAquisicao'
      ProviderFlags = [pfInUpdate]
    end
    object sqlBemquantidade: TFloatField
      FieldName = 'quantidade'
      ProviderFlags = [pfInUpdate]
    end
  end
end
