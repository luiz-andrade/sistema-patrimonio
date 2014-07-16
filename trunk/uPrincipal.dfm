object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 798
  ClientWidth = 1125
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object StatusBar: TStatusBar
    Left = 0
    Top = 779
    Width = 1125
    Height = 19
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Bevel = pbNone
        Width = 100
      end
      item
        Width = 300
      end
      item
        Bevel = pbNone
        Width = 50
      end>
  end
  object pnToolBar: TPanel
    Left = 0
    Top = 0
    Width = 1125
    Height = 81
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object ToolBar: TToolBar
      Left = 5
      Top = 5
      Width = 1115
      Height = 71
      Align = alClient
      ButtonHeight = 56
      ButtonWidth = 128
      EdgeInner = esNone
      EdgeOuter = esNone
      GradientEndColor = clWhite
      GradientStartColor = clWhite
      Images = dm.ImageListAcoes
      Indent = 2
      GradientDirection = gdHorizontal
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      object ToolButton1: TToolButton
        Left = 2
        Top = 0
        Cursor = crHandPoint
        Action = actLocais
      end
      object ToolButton3: TToolButton
        Left = 130
        Top = 0
        Cursor = crHandPoint
        Action = actPessoa
      end
      object ToolButton4: TToolButton
        Left = 258
        Top = 0
        Cursor = crHandPoint
        Action = actGrupos
      end
      object ToolButton2: TToolButton
        Left = 386
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 394
        Top = 0
        Cursor = crHandPoint
        Action = actRegistroBens
      end
      object ToolButton6: TToolButton
        Left = 522
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 530
        Top = 0
        Cursor = crHandPoint
        Action = actInfoEmpresa
      end
      object ToolButton9: TToolButton
        Left = 658
        Top = 0
        Cursor = crHandPoint
        Action = actMovimentacao
      end
      object ToolButton8: TToolButton
        Left = 786
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton10: TToolButton
        Left = 794
        Top = 0
        Caption = 'Relat'#243'rios'
        DropdownMenu = PopupMenu
        ImageIndex = 6
      end
      object ToolButton11: TToolButton
        Left = 922
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton12: TToolButton
        Left = 930
        Top = 0
        Action = actFornecedor
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 112
    object Operaes1: TMenuItem
      Caption = 'Opera'#231#245'es'
      object IncorporarBem1: TMenuItem
        Action = actRegistroBens
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Registrodepessoas1: TMenuItem
        Action = actPessoa
      end
      object CadastrodeFornecedores1: TMenuItem
        Action = actFornecedor
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Convnios1: TMenuItem
        Action = actConvenio
      end
      object Processos1: TMenuItem
        Action = actProcesso
      end
      object Empenhos1: TMenuItem
        Action = actEmpenho
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Locais1: TMenuItem
        Action = actLocais
      end
      object Grupos1: TMenuItem
        Action = actGrupos
      end
      object CadastrodeGestes1: TMenuItem
        Action = actGestao
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ransferencia1: TMenuItem
        Caption = 'Transferencia'
        Visible = False
      end
      object Movimentao1: TMenuItem
        Action = actMovimentacao
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object DepreciaodeBens1: TMenuItem
        Action = actDepreciacao
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Finalizarsistema1: TMenuItem
        Caption = 'Finalizar sistema'
        OnClick = Finalizarsistema1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RTermodeResponsabilidade1: TMenuItem
        Action = actRelatTr
      end
      object Bensporgrupo1: TMenuItem
        Action = actRelatGrupo
      end
      object RelaodeUnidades2: TMenuItem
        Action = actRelatUnidade
      end
      object Relatriodetotaisporgrupo2: TMenuItem
        Action = actRelatTotGrupo
      end
      object RelatriodeBensPatrimoniais2: TMenuItem
        Action = actBenPatrimonial
      end
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Importar1: TMenuItem
        Action = actImportarDados
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Atualizarsistemas1: TMenuItem
        Caption = 'Atualizar sistema'
        OnClick = Atualizarsistemas1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Backup1: TMenuItem
        Caption = 'Executar rotina de Backup'
        OnClick = Backup1Click
      end
    end
    object N4: TMenuItem
      Caption = '?'
      object Informaessobreoprojeto1: TMenuItem
        Action = actSobre
      end
    end
    object rocardeusurio1: TMenuItem
      Caption = 'Trocar de usu'#225'rio'
      OnClick = FormShow
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actLocais
            Caption = '&Locais'
            ImageIndex = 2
          end
          item
            Action = actPessoa
            Caption = '&Registro de pessoas'
            ImageIndex = 3
          end
          item
            Action = actGrupos
            Caption = '&Grupos'
            ImageIndex = 1
          end
          item
            Caption = '-'
          end
          item
            Action = actRegistroBens
            Caption = 'R&egistro de bens'
            ImageIndex = 0
          end>
      end>
    Images = dm.ImageListAcoes
    OnExecute = ActionManagerExecute
    Left = 112
    Top = 113
    StyleName = 'Platform Default'
    object actPessoa: TAction
      Caption = 'Registro de pessoas'
      ImageIndex = 3
      OnExecute = actPessoaExecute
    end
    object actLocais: TAction
      Caption = 'Locais'
      ImageIndex = 2
      OnExecute = actLocaisExecute
    end
    object actGrupos: TAction
      Caption = 'Grupos'
      ImageIndex = 1
      OnExecute = actGruposExecute
    end
    object actRegistroBens: TAction
      Caption = 'Registro de bens'
      ImageIndex = 0
      OnExecute = actRegistroBensExecute
    end
    object actSobre: TAction
      Caption = 'Informa'#231#245'es sobre o projeto'
      OnExecute = actSobreExecute
    end
    object actInfoEmpresa: TAction
      Caption = 'Empresa'
      ImageIndex = 4
      OnExecute = actInfoEmpresaExecute
    end
    object actMovimentacao: TAction
      Caption = 'Movimenta'#231#227'o'
      ImageIndex = 5
      OnExecute = actMovimentacaoExecute
    end
    object actRelatUnidade: TAction
      Caption = 'Rela'#231#227'o de Unidades'
      OnExecute = actRelatUnidadeExecute
    end
    object actRelatGrupo: TAction
      Caption = 'Relat'#243'rio de Bens Por Grupo'
      OnExecute = actRelatGrupoExecute
    end
    object actRelatTr: TAction
      Caption = 'TR - Termo de Responsabilidade'
      OnExecute = actRelatTrExecute
    end
    object actImportarDados: TAction
      Caption = 'Importar dados'
      OnExecute = actImportarDadosExecute
    end
    object actRelatTotGrupo: TAction
      Caption = 'Relat'#243'rio de totais por grupo'
      OnExecute = actRelatTotGrupoExecute
    end
    object actFornecedor: TAction
      Caption = 'Fornecedores'
      ImageIndex = 4
      OnExecute = actFornecedorExecute
    end
    object actGestao: TAction
      Caption = 'Gest'#245'es'
      OnExecute = actGestaoExecute
    end
    object actBenPatrimonial: TAction
      Caption = 'Relat'#243'rio de Bens Patrimoniais'
      OnExecute = actBenPatrimonialExecute
    end
    object actDepreciacao: TAction
      Caption = 'Deprecia'#231#227'o de Bens'
      OnExecute = actDepreciacaoExecute
    end
    object actConvenio: TAction
      Caption = 'Conv'#234'nios'
      OnExecute = actConvenioExecute
    end
    object actProcesso: TAction
      Caption = 'Processos'
      OnExecute = actProcessoExecute
    end
    object actEmpenho: TAction
      Caption = 'Empenhos'
      OnExecute = actEmpenhoExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 184
    Top = 112
    object RTermodeResponsabilidade2: TMenuItem
      Action = actRelatTr
    end
    object Bensporgrupo2: TMenuItem
      Action = actRelatGrupo
    end
    object RelaodeUnidades1: TMenuItem
      Action = actRelatUnidade
    end
    object Relatriodetotaisporgrupo1: TMenuItem
      Action = actRelatTotGrupo
    end
    object RelatriodeBensPatrimoniais1: TMenuItem
      Action = actBenPatrimonial
    end
  end
end
