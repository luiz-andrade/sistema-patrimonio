object frmPrincpal: TfrmPrincpal
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 461
    Width = 662
    Height = 19
    Panels = <>
    ExplicitTop = 286
    ExplicitWidth = 434
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 32
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
  end
  object ActionManager: TActionManager
    Left = 120
    Top = 33
    StyleName = 'Platform Default'
    object actPessoa: TAction
      Caption = 'Registro de pessoas'
    end
    object actLocais: TAction
      Caption = 'Locais'
      OnExecute = actLocaisExecute
    end
  end
end
