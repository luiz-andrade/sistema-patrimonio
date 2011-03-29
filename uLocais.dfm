object frmLocais: TfrmLocais
  Left = 0
  Top = 0
  ClientHeight = 483
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object pcGeral: TPageControl
    AlignWithMargins = True
    Left = 85
    Top = 3
    Width = 640
    Height = 477
    Margins.Left = 85
    ActivePage = tsPesquisa
    Align = alClient
    HotTrack = True
    Style = tsButtons
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = -2
    object tsPesquisa: TTabSheet
      Caption = 'Perquisar'
      object pnPesquisa: TPanel
        Left = 0
        Top = 405
        Width = 632
        Height = 41
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 5
        Caption = 'Pesquisa:'
        ParentBackground = False
        TabOrder = 0
        object btnPesquisar: TSpeedButton
          AlignWithMargins = True
          Left = 532
          Top = 10
          Width = 90
          Height = 24
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 2
          Align = alRight
          Caption = 'Pesquisar'
          ExplicitLeft = 226
          ExplicitTop = 6
          ExplicitHeight = 29
        end
        object txtPesquisa: TEdit
          AlignWithMargins = True
          Left = 55
          Top = 12
          Width = 317
          Height = 21
          Margins.Left = 50
          Margins.Top = 7
          Margins.Right = 4
          Align = alClient
          TabOrder = 0
          TextHint = 'Entre com a informa'#231#227'o que deseja pesquisar'
        end
        object cbPesquisar: TComboBox
          AlignWithMargins = True
          Left = 379
          Top = 12
          Width = 145
          Height = 21
          Margins.Top = 7
          Align = alRight
          ItemIndex = 0
          TabOrder = 1
          Text = 'Descri'#231#227'o'
          Items.Strings = (
            'Descri'#231#227'o')
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 626
        Height = 399
        Cursor = crHandPoint
        Align = alClient
        DataSource = dsLocal
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'localId'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'titulo'
            Title.Caption = 'Titulo'
            Width = 525
            Visible = True
          end>
      end
    end
    object tsInformacao: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 31
        Height = 13
        Caption = 'localId'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 169
        Top = 11
        Width = 24
        Height = 13
        Caption = 'titulo'
        FocusControl = DBEdit2
      end
      object pnAcoes: TPanel
        Left = 500
        Top = 0
        Width = 132
        Height = 446
        Align = alRight
        TabOrder = 0
        ExplicitLeft = 501
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 27
        Width = 134
        Height = 21
        DataField = 'localId'
        DataSource = dsLocal
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 169
        Top = 27
        Width = 321
        Height = 21
        DataField = 'titulo'
        DataSource = dsLocal
        TabOrder = 2
      end
    end
  end
  object dsLocal: TDataSource
    DataSet = cdsLocal
    OnDataChange = dsLocalDataChange
    Left = 24
    Top = 16
  end
  object cdsLocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsLocal'
    Left = 24
    Top = 64
    object cdsLocallocalId: TIntegerField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLocaltitulo: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object cdsLocalvLocalId: TIntegerField
      FieldName = 'vLocalId'
      Required = True
    end
    object cdsLocalpessoaId: TIntegerField
      FieldName = 'pessoaId'
      Required = True
    end
  end
  object dpsLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    UpdateMode = upWhereKeyOnly
    Left = 24
    Top = 120
  end
end
