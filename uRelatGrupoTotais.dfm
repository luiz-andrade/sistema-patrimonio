object frmRelatTotaisGrupo: TfrmRelatTotaisGrupo
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de totais por grupo'
  ClientHeight = 462
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbGrupo: TCheckBox
    Left = 57
    Top = 45
    Width = 97
    Height = 17
    Caption = 'Grupo:'
    TabOrder = 0
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
    TabOrder = 1
  end
  object cbSubGrupo: TCheckBox
    Left = 57
    Top = 75
    Width = 105
    Height = 17
    Caption = 'SubGrupo:'
    Enabled = False
    TabOrder = 2
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
    TabOrder = 3
  end
  object cbGestao: TCheckBox
    Left = 57
    Top = 109
    Width = 105
    Height = 17
    Caption = 'Gest'#227'o:'
    TabOrder = 4
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
    TabOrder = 5
  end
  object btnVisualizar: TBitBtn
    Left = 400
    Top = 413
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Visualizar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = btnVisualizarClick
  end
  object btnFechar: TBitBtn
    Left = 508
    Top = 413
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = btnFecharClick
  end
  object dsAuxGrupos: TDataSource
    DataSet = cdsAuxGrupo
    Left = 24
    Top = 339
  end
  object dspGrupo: TDataSetProvider
    DataSet = dm.sqlGrupo
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 339
  end
  object dsGrupos: TDataSource
    DataSet = cdsGrupo
    Left = 176
    Top = 339
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from grupo where vGrupoId = 0'
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 176
    Top = 393
  end
  object dspAuxGrupo: TDataSetProvider
    DataSet = dm.sqlSubGrupo
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 393
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
  object dsGestao: TDataSource
    AutoEdit = False
    DataSet = cdsGestao
    Left = 257
    Top = 339
  end
  object cdsGestao: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from gestao'
    Params = <>
    ProviderName = 'dspGestao'
    Left = 337
    Top = 339
  end
  object dspGestao: TDataSetProvider
    DataSet = dm.sqlGestao
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 417
    Top = 339
  end
end
