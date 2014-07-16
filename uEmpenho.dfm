inherited frmEmpenho: TfrmEmpenho
  Caption = 'Cadastro de Empenhos'
  PixelsPerInch = 120
  TextHeight = 16
  inherited pcGeral: TPageControl
    inherited tsPesquisa: TTabSheet
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
            FieldName = 'empenhoId'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numeroEmpenho'
            Title.Caption = 'N'#250'mero'
            Width = 430
            Visible = True
          end>
      end
    end
    inherited tsInformacao: TTabSheet
      object Label1: TLabel
        Left = 21
        Top = 31
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        FocusControl = empenhoId
      end
      object Label2: TLabel
        Left = 129
        Top = 31
        Width = 45
        Height = 16
        Caption = 'N'#250'mero'
        FocusControl = numeroEmpenho
      end
      object numeroEmpenho: TDBEdit
        Left = 129
        Top = 52
        Width = 555
        Height = 24
        DataField = 'numeroEmpenho'
        DataSource = dsPrincipal
        TabOrder = 0
      end
      object empenhoId: TDBEdit
        Left = 21
        Top = 52
        Width = 103
        Height = 24
        DataField = 'empenhoId'
        DataSource = dsPrincipal
        TabOrder = 1
      end
    end
  end
  inherited dsPrincipal: TDataSource
    OnDataChange = dsPrincipalDataChange
  end
  inherited cdsPrincipal: TClientDataSet
    object cdsPrincipalempenhoId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'empenhoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPrincipalnumeroEmpenho: TStringField
      FieldName = 'numeroEmpenho'
      Size = 50
    end
  end
  inherited dspPrincipal: TDataSetProvider
    DataSet = dm.sqlEmpenho
  end
end
