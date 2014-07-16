inherited frmProcesso: TfrmProcesso
  Caption = 'Cadastro de Processo'
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
            FieldName = 'processoId'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numeroProcesso'
            Title.Caption = 'Nome'
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
        FocusControl = processoId
      end
      object Label2: TLabel
        Left = 129
        Top = 31
        Width = 45
        Height = 16
        Caption = 'N'#250'mero'
        FocusControl = numeroProcesso
      end
      object processoId: TDBEdit
        Left = 21
        Top = 52
        Width = 103
        Height = 24
        DataField = 'processoId'
        DataSource = dsPrincipal
        TabOrder = 0
      end
      object numeroProcesso: TDBEdit
        Left = 129
        Top = 52
        Width = 555
        Height = 24
        DataField = 'numeroProcesso'
        DataSource = dsPrincipal
        TabOrder = 1
      end
    end
  end
  inherited dsPrincipal: TDataSource
    OnDataChange = dsPrincipalDataChange
  end
  inherited cdsPrincipal: TClientDataSet
    object cdsPrincipalprocessoId: TAutoIncField
      FieldName = 'processoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPrincipalnumeroProcesso: TStringField
      FieldName = 'numeroProcesso'
      Size = 50
    end
  end
  inherited dspPrincipal: TDataSetProvider
    DataSet = dm.sqlProcesso
  end
end
