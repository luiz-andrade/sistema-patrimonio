object frmAcesso: TfrmAcesso
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 287
  ClientWidth = 482
  Color = clMedGray
  TransparentColor = True
  TransparentColorValue = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Shape: TShape
    Left = 0
    Top = 0
    Width = 482
    Height = 287
    Align = alClient
    Shape = stRoundRect
    ExplicitLeft = 13
    ExplicitTop = 8
    ExplicitWidth = 449
    ExplicitHeight = 262
  end
  object btnConfirmar: TSpeedButton
    AlignWithMargins = True
    Left = 122
    Top = 230
    Width = 90
    Height = 29
    Cursor = crHandPoint
    Margins.Left = 5
    Margins.Top = 7
    Margins.Right = 5
    Margins.Bottom = 7
    Caption = 'Confirmar'
  end
  object btnCancelar: TSpeedButton
    AlignWithMargins = True
    Left = 247
    Top = 230
    Width = 90
    Height = 29
    Cursor = crHandPoint
    Margins.Left = 5
    Margins.Top = 7
    Margins.Right = 5
    Margins.Bottom = 7
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object txtLogin: TLabeledEdit
    Left = 128
    Top = 56
    Width = 130
    Height = 21
    Ctl3D = True
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Login'
    ParentCtl3D = False
    TabOrder = 0
    TextHint = 'Entre com seu login'
  end
  object txtPassword: TLabeledEdit
    Left = 128
    Top = 112
    Width = 130
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    TabOrder = 1
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
    TabOrder = 2
  end
  object dsEmpresa: TDataSource
    DataSet = dm.cdsEmpresa
    Left = 304
    Top = 48
  end
end
