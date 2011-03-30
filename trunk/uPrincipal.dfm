object frmPrincpal: TfrmPrincpal
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
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 591
    Width = 860
    Height = 19
    Panels = <>
    ExplicitTop = 458
    ExplicitWidth = 735
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 735
    object ToolBar: TToolBar
      Left = 2
      Top = 2
      Width = 856
      Height = 57
      BorderWidth = 1
      ButtonHeight = 52
      ButtonWidth = 104
      EdgeInner = esNone
      EdgeOuter = esNone
      GradientEndColor = clWindow
      Images = dm.ImageListAcoes
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      ExplicitWidth = 731
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = actLocais
      end
      object ToolButton3: TToolButton
        Left = 104
        Top = 0
        Action = actPessoa
      end
      object ToolButton2: TToolButton
        Left = 208
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 216
        Top = 0
        Action = actGrupos
      end
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 58
    Width = 860
    Height = 29
    ActionManager = ActionManager
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
    ExplicitLeft = 312
    ExplicitTop = 136
    ExplicitWidth = 150
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 112
    object Operaes1: TMenuItem
      Caption = 'Opera'#231#245'es'
      object IncorporarBem1: TMenuItem
        Caption = 'Incorporar Bem'
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
        Caption = 'Grupos'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ransferencia1: TMenuItem
        Caption = 'Transferencia'
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
    object N4: TMenuItem
      Caption = '?'
    end
    object rocardeusurio1: TMenuItem
      Action = actTrocaUsuario
    end
  end
  object ActionManager: TActionManager
    Images = dm.ImageListAcoes
    Left = 112
    Top = 113
    StyleName = 'Platform Default'
    object actPessoa: TAction
      Caption = 'Registro de pessoas'
      ImageIndex = 3
    end
    object actLocais: TAction
      Caption = 'Locais'
      ImageIndex = 2
      OnExecute = actLocaisExecute
    end
    object actGrupos: TAction
      Caption = 'Grupos'
      ImageIndex = 1
    end
    object actTrocaUsuario: TAction
      Caption = 'Trocar de usu'#225'rio'
    end
  end
end
