object frmAcesso: TfrmAcesso
  Left = 0
  Top = 0
  ClientHeight = 287
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnAcoes: TPanel
    Left = 0
    Top = 246
    Width = 482
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnConfirmar: TSpeedButton
      AlignWithMargins = True
      Left = 287
      Top = 7
      Width = 90
      Height = 27
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alRight
      Caption = 'Confirmar'
      ExplicitLeft = 226
      ExplicitTop = 6
      ExplicitHeight = 29
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 387
      Top = 7
      Width = 90
      Height = 27
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alRight
      Caption = 'Cancelar'
      ExplicitLeft = 391
      ExplicitTop = 6
      ExplicitHeight = 29
    end
  end
  object txtLogin: TLabeledEdit
    Left = 128
    Top = 48
    Width = 121
    Height = 21
    Ctl3D = True
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Login'
    ParentCtl3D = False
    TabOrder = 1
    TextHint = 'Entre com seu login'
  end
  object txtPassword: TLabeledEdit
    Left = 128
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    TabOrder = 2
    TextHint = 'Entre com sua senha'
  end
  object dcbEmpresa: TDBLookupComboBox
    Left = 128
    Top = 152
    Width = 145
    Height = 21
    KeyField = 'empresaId'
    ListField = 'nomeFantasia'
    ListSource = dsEmpresa
    TabOrder = 3
  end
  object dsEmpresa: TDataSource
    DataSet = dm.cdsEmpresa
    Left = 24
    Top = 32
  end
end
