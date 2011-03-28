object frmLocais: TfrmLocais
  Left = 0
  Top = 0
  ClientHeight = 463
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pcGeral: TPageControl
    AlignWithMargins = True
    Left = 100
    Top = 3
    Width = 533
    Height = 457
    Margins.Left = 100
    ActivePage = tsInformacao
    Align = alClient
    TabOrder = 0
    object tsPesquisa: TTabSheet
      Caption = 'Perquisar'
      ExplicitLeft = 0
      ExplicitTop = 48
    end
    object tsInformacao: TTabSheet
      Caption = 'tsInformacao'
      ImageIndex = 1
    end
  end
end
