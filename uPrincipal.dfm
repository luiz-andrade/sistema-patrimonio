object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 610
  ClientWidth = 860
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 591
    Width = 860
    Height = 19
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
    Width = 860
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object ToolBar: TToolBar
      Left = 5
      Top = 5
      Width = 850
      Height = 52
      Align = alClient
      ButtonHeight = 52
      ButtonWidth = 104
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
        Left = 106
        Top = 0
        Cursor = crHandPoint
        Action = actPessoa
      end
      object ToolButton4: TToolButton
        Left = 210
        Top = 0
        Cursor = crHandPoint
        Action = actGrupos
      end
      object ToolButton2: TToolButton
        Left = 314
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 322
        Top = 0
        Cursor = crHandPoint
        Action = actRegistroBens
      end
      object ToolButton6: TToolButton
        Left = 426
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 434
        Top = 0
        Cursor = crHandPoint
        Action = actInfoEmpresa
      end
      object ToolButton9: TToolButton
        Left = 538
        Top = 0
        Cursor = crHandPoint
        Action = actMovimentacao
      end
      object ToolButton8: TToolButton
        Left = 642
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 5
        Style = tbsSeparator
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
      object Locais1: TMenuItem
        Action = actLocais
      end
      object Grupos1: TMenuItem
        Action = actGrupos
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ransferencia1: TMenuItem
        Caption = 'Transferencia'
      end
      object Movimentao1: TMenuItem
        Action = actMovimentacao
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Finalizarsistema1: TMenuItem
        Caption = 'Finalizar sistema'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Importar1: TMenuItem
        Caption = 'Importar dados'
        OnClick = Importar1Click
      end
    end
    object N4: TMenuItem
      Caption = '?'
      object Informaessobreoprojeto1: TMenuItem
        Action = actSobre
      end
      object N5: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object Impotardados1: TMenuItem
        Caption = 'Impotar dados'
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
  end
end
