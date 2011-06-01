object frmTransferencia: TfrmTransferencia
  Left = 0
  Top = 0
  BorderWidth = 4
  Caption = 'Transferencia de dados.'
  ClientHeight = 514
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 39
    Width = 773
    Height = 475
    ActivePage = tsBens
    Align = alClient
    TabOrder = 0
    object tsGrupos: TTabSheet
      Caption = 'Grupos'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 406
        Align = alClient
        DataSource = dsGrupos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
      end
      object Panel2: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          765
          41)
        object btnImportarGrupo: TButton
          Left = 687
          Top = 9
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarGrupoClick
        end
        object pbGrupos: TProgressBar
          Left = 4
          Top = 13
          Width = 257
          Height = 16
          TabOrder = 1
        end
      end
    end
    object tsSubGrupos: TTabSheet
      Caption = 'SubGrupos'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 406
        Align = alClient
        DataSource = dsSubGrupos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid3DrawColumnCell
      end
      object Panel3: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          765
          41)
        object btnImportarSubGrupo: TButton
          Left = 688
          Top = 9
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarSubGrupoClick
        end
        object pbSubGrupos: TProgressBar
          Left = 4
          Top = 13
          Width = 257
          Height = 16
          TabOrder = 1
        end
      end
    end
    object tsOrgao: TTabSheet
      Caption = 'Org'#227'o'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 406
        Align = alClient
        DataSource = dsOrgaos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid4DrawColumnCell
      end
      object Panel4: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          765
          41)
        object btnImportarOrgao: TButton
          Left = 687
          Top = 9
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarOrgaoClick
        end
        object pbOrgao: TProgressBar
          Left = 4
          Top = 13
          Width = 257
          Height = 16
          TabOrder = 1
        end
      end
    end
    object tsUnidades: TTabSheet
      Caption = 'Unidades'
      ImageIndex = 4
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 406
        Align = alClient
        DataSource = dsUnidades
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid5DrawColumnCell
      end
      object Panel5: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          765
          41)
        object btnImportarUnidade: TButton
          Left = 687
          Top = 9
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarUnidadeClick
        end
        object pbUnidades: TProgressBar
          Left = 4
          Top = 13
          Width = 257
          Height = 16
          TabOrder = 1
        end
      end
    end
    object tsBens: TTabSheet
      Caption = 'Bens'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 765
        Height = 406
        Align = alClient
        DataSource = dsBens
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
      object Panel1: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          765
          41)
        object btnImportarbem: TButton
          Left = 689
          Top = 9
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarbemClick
        end
        object pbBens: TProgressBar
          Left = 4
          Top = 13
          Width = 257
          Height = 16
          TabOrder = 1
        end
      end
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 767
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 41
      Height = 33
      Align = alLeft
      Alignment = taCenter
      Caption = 'Arquivo:'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object edtArquivo: TEdit
      AlignWithMargins = True
      Left = 44
      Top = 5
      Width = 608
      Height = 23
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 21
    end
    object btnSelecionar: TButton
      AlignWithMargins = True
      Left = 658
      Top = 4
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '...'
      TabOrder = 1
      OnClick = btnSelecionarClick
    end
    object btnConectar: TButton
      AlignWithMargins = True
      Left = 689
      Top = 4
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Fagner\Des' +
      'ktop\Importador - Vers'#227'o Access 2003.mdb;Persist Security Info=F' +
      'alse;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 448
    Top = 104
  end
  object OpenDialog: TOpenDialog
    Filter = '.mdb Files|*.mdb'
    Left = 368
    Top = 104
  end
  object tbBens: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'bem'
    Left = 56
    Top = 104
    object tbBensbemId: TAutoIncField
      FieldName = 'bemId'
      ReadOnly = True
    end
    object tbBensidenficacao: TWideStringField
      FieldName = 'idenficacao'
      Size = 50
    end
    object tbBensdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object tbBensgrupoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'grupoId'
      Size = 255
    end
    object tbBensestadoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'estadoId'
      Size = 255
    end
    object tbBenslocalId: TWideStringField
      DisplayWidth = 10
      FieldName = 'localId'
      Size = 255
    end
    object tbBensgestaoId: TIntegerField
      FieldName = 'gestaoId'
    end
    object tbBensvalor: TBCDField
      FieldName = 'valor'
      Precision = 19
    end
    object tbBenstipoIdentificacao: TIntegerField
      FieldName = 'tipoIdentificacao'
    end
    object tbBenssubgrupoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'subgrupoId'
      Size = 255
    end
    object tbBenssubLocalId: TWideStringField
      DisplayWidth = 10
      FieldName = 'subLocalId'
      Size = 255
    end
  end
  object tbGrupos: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'grupo'
    Left = 104
    Top = 104
    object tbGruposgrupoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'grupoId'
      Size = 255
    end
    object tbGruposdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object tbGruposempresaId: TIntegerField
      FieldName = 'empresaId'
    end
  end
  object tbSubGrupos: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'grupo_sub'
    Left = 168
    Top = 104
    object tbSubGruposgrupoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'grupoId'
      Size = 255
    end
    object tbSubGruposdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object tbSubGruposempresaId: TIntegerField
      FieldName = 'empresaId'
    end
    object tbSubGruposvGrupoId: TWideStringField
      DisplayWidth = 10
      FieldName = 'vGrupoId'
      Size = 255
    end
  end
  object tbOrgaos: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'orgao_empresa'
    Left = 232
    Top = 104
    object tbOrgaoslocalId: TWideStringField
      DisplayWidth = 10
      FieldName = 'localId'
      Size = 255
    end
    object tbOrgaostitulo: TWideStringField
      FieldName = 'titulo'
      Size = 100
    end
    object tbOrgaosempresaId: TIntegerField
      FieldName = 'empresaId'
    end
  end
  object tbUnidades: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'orgao_empresa_unidade'
    Left = 296
    Top = 104
    object tbUnidadeslocalId: TWideStringField
      DisplayWidth = 10
      FieldName = 'localId'
      Size = 255
    end
    object tbUnidadestitulo: TWideStringField
      FieldName = 'titulo'
      Size = 100
    end
    object tbUnidadesvLocalId: TIntegerField
      FieldName = 'vLocalId'
    end
  end
  object dsBens: TDataSource
    DataSet = tbBens
    Left = 56
    Top = 168
  end
  object dsGrupos: TDataSource
    DataSet = tbGrupos
    Left = 104
    Top = 168
  end
  object dsSubGrupos: TDataSource
    DataSet = tbSubGrupos
    Left = 168
    Top = 168
  end
  object dsOrgaos: TDataSource
    DataSet = tbOrgaos
    Left = 232
    Top = 168
  end
  object dsUnidades: TDataSource
    DataSet = tbUnidades
    Left = 296
    Top = 168
  end
end
