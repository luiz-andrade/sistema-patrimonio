object frmTransferencia: TfrmTransferencia
  Left = 0
  Top = 0
  BorderWidth = 4
  Caption = 'Transferencia de dados.'
  ClientHeight = 672
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 51
    Width = 1011
    Height = 621
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsBens
    Align = alClient
    TabOrder = 0
    object tsGrupos: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '1 - Grupos'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsGrupos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
      end
      object Panel2: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object btnImportarGrupo: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarGrupoClick
        end
        object pbGrupos: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object btLimparGrupo: TButton
          Left = 674
          Top = 12
          Width = 195
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'Apagar grupos e subgrupos'
          TabOrder = 2
          OnClick = btLimparGrupoClick
        end
      end
    end
    object tsSubGrupos: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '2 - SubGrupos'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsSubGrupos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid3DrawColumnCell
      end
      object Panel3: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object btnImportarSubGrupo: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarSubGrupoClick
        end
        object pbSubGrupos: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
      end
    end
    object tsOrgao: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '3 - Org'#227'o'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsOrgaos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid4DrawColumnCell
      end
      object Panel4: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object btnImportarOrgao: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarOrgaoClick
        end
        object pbOrgao: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object btnLimparLocais: TButton
          Left = 672
          Top = 12
          Width = 194
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'Apagar Orgaos e unidades'
          TabOrder = 2
          OnClick = btnLimparLocaisClick
        end
      end
    end
    object tsUnidades: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '4 - Unidades'
      ImageIndex = 4
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsUnidades
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid5DrawColumnCell
      end
      object Panel5: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object btnImportarUnidade: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarUnidadeClick
        end
        object pbUnidades: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
      end
    end
    object tsFornecedor: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '5 - Fornecedores'
      ImageIndex = 5
      object Panel7: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1003
          54)
        object btnImportaFornecedor: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportaFornecedorClick
        end
        object pbFornecedor: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object btnApagarFornecedor: TButton
          Left = 672
          Top = 12
          Width = 194
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'Apagar todos os Fonecedores'
          TabOrder = 2
          OnClick = btnApagarFornecedorClick
        end
      end
      object DBGrid6: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsFornecedor
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid6DrawColumnCell
      end
    end
    object tsGestao: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '6 - Gest'#227'o'
      ImageIndex = 6
      object DBGrid7: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsGestao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid7DrawColumnCell
      end
      object Panel8: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object Button1: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = Button1Click
        end
        object pbGestao: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object Button2: TButton
          Left = 681
          Top = 12
          Width = 195
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'Apagar todos as gest'#227'o'
          TabOrder = 2
          OnClick = Button2Click
        end
      end
    end
    object tsBens: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '7 - Bens'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1003
        Height = 535
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsBens
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
      object Panel1: TPanel
        Left = 0
        Top = 535
        Width = 1003
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1003
          54)
        object btnImportarbem: TButton
          Left = 884
          Top = 12
          Width = 119
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'importar'
          TabOrder = 0
          OnClick = btnImportarbemClick
        end
        object pbBens: TProgressBar
          Left = 5
          Top = 17
          Width = 336
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object btnLimparBens: TButton
          Left = 672
          Top = 12
          Width = 194
          Height = 32
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = []
          Caption = 'Apagar todos os bens'
          TabOrder = 2
          OnClick = btnLimparBensClick
        end
      end
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 1003
    Height = 43
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 52
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Alignment = taCenter
      Caption = 'Arquivo:'
      Layout = tlCenter
      ExplicitHeight = 17
    end
    object edtArquivo: TEdit
      AlignWithMargins = True
      Left = 56
      Top = 7
      Width = 796
      Height = 29
      Margins.Left = 4
      Margins.Top = 7
      Margins.Right = 4
      Margins.Bottom = 7
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 25
    end
    object btnSelecionar: TButton
      AlignWithMargins = True
      Left = 860
      Top = 5
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Margins.Left = 4
      Margins.Top = 5
      Margins.Right = 4
      Margins.Bottom = 5
      Align = alRight
      Caption = '...'
      TabOrder = 1
      OnClick = btnSelecionarClick
    end
    object btnConectar: TButton
      AlignWithMargins = True
      Left = 901
      Top = 5
      Width = 98
      Height = 33
      Cursor = crHandPoint
      Margins.Left = 4
      Margins.Top = 5
      Margins.Right = 4
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 624
    Top = 104
  end
  object OpenDialog: TOpenDialog
    Filter = '.mdb Files|*.mdb'
    Left = 544
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
    object tbBensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object tbBenstipoAquisicao: TIntegerField
      FieldName = 'tipoAquisicao'
    end
    object tbBensfornecedorId: TIntegerField
      FieldName = 'fornecedorId'
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
    object tbUnidadesvLocalId: TWideStringField
      FieldName = 'vLocalId'
      Size = 255
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
  object dsFornecedor: TDataSource
    DataSet = tbFornecedor
    Left = 360
    Top = 168
  end
  object tbFornecedor: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'fornecedor'
    Left = 360
    Top = 104
    object tbFornecedorpessoaId: TAutoIncField
      FieldName = 'pessoaId'
      ReadOnly = True
    end
    object tbFornecedornome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object tbFornecedortipo: TSmallintField
      FieldName = 'tipo'
    end
    object tbFornecedorcnpjCpf: TWideStringField
      FieldName = 'cnpjCpf'
    end
  end
  object tbGestao: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'gestao'
    Left = 440
    Top = 104
    object tbGestaogestaoId: TWideStringField
      FieldName = 'gestaoId'
      Size = 50
    end
    object tbGestaonome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dsGestao: TDataSource
    DataSet = tbGestao
    Left = 440
    Top = 168
  end
end
