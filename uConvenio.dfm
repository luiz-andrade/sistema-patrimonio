inherited frmConvenio: TfrmConvenio
  Caption = 'Cadastro de Conv'#234'nios'
  ExplicitWidth = 971
  ExplicitHeight = 678
  PixelsPerInch = 120
  TextHeight = 16
  inherited pcGeral: TPageControl
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 702
      ExplicitHeight = 606
      inherited pnPesquisa: TPanel
        inherited txtPesquisa: TEdit
          OnChange = txtPesquisaChange
        end
        inherited cbPesquisar: TComboBox
          Text = 'N'#250'mero'
          Items.Strings = (
            'N'#250'mero')
        end
      end
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'convenioId'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numeroConvenio'
            Title.Caption = 'N'#250'mero'
            Width = 430
            Visible = True
          end>
      end
    end
    inherited tsInformacao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 702
      ExplicitHeight = 606
      object Label1: TLabel
        Left = 21
        Top = 31
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        FocusControl = convenioId
      end
      object Label2: TLabel
        Left = 129
        Top = 31
        Width = 45
        Height = 16
        Caption = 'N'#250'mero'
        FocusControl = numeroConvenio
      end
      object Label17: TLabel
        Left = 21
        Top = 84
        Width = 30
        Height = 16
        Caption = 'Tipo:'
      end
      object convenioId: TDBEdit
        Left = 21
        Top = 52
        Width = 103
        Height = 24
        DataField = 'convenioId'
        DataSource = dsPrincipal
        TabOrder = 0
      end
      object numeroConvenio: TDBEdit
        Left = 129
        Top = 52
        Width = 555
        Height = 24
        DataField = 'numeroConvenio'
        DataSource = dsPrincipal
        TabOrder = 1
      end
      object dblConvenio: TDBLookupComboBox
        Left = 21
        Top = 103
        Width = 663
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'convenioTipoId'
        DataSource = dsPrincipal
        KeyField = 'convenioTipoId'
        ListField = 'descricao'
        ListSource = dsConvenioTipo
        NullValueKey = 16430
        TabOrder = 2
      end
    end
  end
  inherited dsPrincipal: TDataSource
    OnDataChange = dsPrincipalDataChange
  end
  inherited cdsPrincipal: TClientDataSet
    CommandText = 'select * from Convenio'
    object cdsPrincipalconvenioId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'convenioId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPrincipalnumeroConvenio: TStringField
      FieldName = 'numeroConvenio'
      Size = 50
    end
    object cdsPrincipalconvenioTipoId: TIntegerField
      FieldName = 'convenioTipoId'
    end
  end
  inherited dspPrincipal: TDataSetProvider
    DataSet = dm.sqlConvenio
  end
  object dsConvenioTipo: TDataSource
    DataSet = cdsConvenioTipo
    Left = 28
    Top = 232
  end
  object cdsConvenioTipo: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from convenioTipo'
    Params = <>
    ProviderName = 'dspConvenioTipo'
    Left = 27
    Top = 286
  end
  object dspConvenioTipo: TDataSetProvider
    DataSet = dm.sqlConvenioTipo
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 24
    Top = 339
  end
end
