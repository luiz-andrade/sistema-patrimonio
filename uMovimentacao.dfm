object frmMovimentacao: TfrmMovimentacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Movimenta'#231#227'o de Bens'
  ClientHeight = 600
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 49
    Align = alTop
    Alignment = taLeftJustify
    BorderWidth = 11
    Caption = 'Movimenta'#231#227'o/Transfer'#234'ncia'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 811
      Top = 12
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAECFD808CE73D54DD1C
        35D61A33D23B4DD48188DAEBEBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAEBAFF2950F33464FD2E5EFE2F63FB2454F41B40E7183CE11B34D3AFB2
        F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADBBFF3161FE4273FF3D6DFF2F62FFC9
        E0FFB3D2FF255DFF2552F71A3CDF1331DCAFB2F0FFFFFFFFFFFFFFFFFFE9EDFF
        3A64FF4C7AFF4674FF4573FF3668FFD0E2FFFFFFFFA3C8FF275EFF2958FE1A3C
        DF1B33D4EAEBFAFFFFFFFFFFFF7D96FE6993FE5080FF5382FF5281FF4676FF73
        9FFFFFFFFFFFFFFF9DC5FF285EFF2652F61A3CE08087DDFFFFFFFFFFFF567CFF
        76A0FF3D73FF2D66FF3069FF346DFF2B69FF709FFFFFFFFFFFFFFF93BDFF275E
        FF1E42E33A4DD7FFFFFFFFFFFF4E7AFF7EACFF7C98FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8CB8FF224CF01A36D5FFFFFFFFFFFF5580FF
        94BEFF6B89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F9D
        FF2B58F71B38D8FFFFFFFFFFFF6990FFB1D5FF5895FF3A77FF3C7BFF3E7BFF1F
        61FF7FA0FFFFFFFFFFFFFF608FFF3567FF3562F93E56E0FFFFFFFFFFFF8FA9FF
        B1D7FF9DCEFF89C4FF89C3FF78B4FF7E9DFFFFFFFFFFFFFF5785FF4172FF4373
        FF3865F88392EDFFFFFFFFFFFFEEF2FF73A1FFC7EAFF99D2FF8BC9FF5E9CFFD7
        DDFFFFFFFF507BFF4F83FF4D7CFF4B7AFF2E55F6EDEFFFFFFFFFFFFFFFFFFFFF
        BFD0FF92BFFFCEF4FFA4D7FF6AA8FF9BABFF4E77FF5A92FF5B8CFF5584FF3565
        FFB5C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1D2FF7BA6FFBAE3FFB6DEFF72
        A2FF7BADFF75A6FF6997FF3D6AFFB6C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF0F5FF99B0FF779CFF6791FF618BFF698CFF8EA6FFEFF2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
      ExplicitLeft = 809
      ExplicitTop = 10
    end
    object btnGravar: TBitBtn
      AlignWithMargins = True
      Left = 711
      Top = 12
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Gravar'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECD99A0707070807F791D1D9EDFFFFEBD9E1A4E3
        E0ECFFFFF6E1EAF4D1FFFFD8E1D9E3E3D8EB08FFFFD9E1EBD0FFFFD8D9D9EBE3
        D0E307F6FFD9E1F3D0FFFFD8D9D9E307EDF7A4F7F799D9EAD0FFFFD8D9D9D8D8
        D8D8D9D9D9E1E1E2D0FFFFD8D9DAE2E2E2E2E2E2E2E2E2E1D0FFFFD8D0ECF6F6
        F6F6F6F60808F7E1D0FFFFD8D0ECF6080707070707F6ECE1D0FFFFD8D0ECFFF6
        F6F6F6F6F6F6ECE1D0FFFFD890ECFF080707070707F6ECE1D0FFFFD890ECFFFF
        F6F6F6F6F6F6ECE1D0FFFFD888ECFFF60708070708F6EC91D9FFFFF4D8EC0808
        080707070707ECD8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnGravarClick
      ExplicitLeft = 783
      ExplicitTop = 15
      ExplicitHeight = 19
    end
  end
  object pgGeral: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 912
    Height = 545
    ActivePage = tsInformacao
    Align = alClient
    TabOrder = 1
    object tsConsulta: TTabSheet
      Caption = 'tsConsulta'
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 898
        Height = 470
        Cursor = crHandPoint
        Align = alClient
        DataSource = dsMovimentacao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'transferenciaId'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end>
      end
      object pnPesquisa: TPanel
        Left = 0
        Top = 476
        Width = 904
        Height = 41
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 5
        Caption = 'Pesquisa:'
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 415
        ExplicitWidth = 535
        object btnPesquisar: TSpeedButton
          AlignWithMargins = True
          Left = 804
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
          Width = 589
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
          Left = 651
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
          ExplicitLeft = 282
        end
      end
    end
    object tsInformacao: TTabSheet
      Caption = 'tsInformacao'
      ImageIndex = 1
      ExplicitLeft = -1
      ExplicitTop = -24
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 74
        Height = 13
        Caption = 'transferenciaId'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 42
        Height = 13
        Caption = 'origemId'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 24
        Top = 104
        Width = 45
        Height = 13
        Caption = 'destinoId'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 24
        Top = 144
        Width = 22
        Height = 13
        Caption = 'data'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 448
        Top = 104
        Width = 51
        Height = 13
        Caption = 'receptorId'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 448
        Top = 64
        Width = 49
        Height = 13
        Caption = 'cedenteId'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 597
        Top = 22
        Width = 45
        Height = 13
        Caption = 'usuarioId'
        FocusControl = DBEdit7
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 40
        Width = 134
        Height = 21
        DataField = 'transferenciaId'
        DataSource = dsMovimentacao
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 80
        Width = 134
        Height = 21
        DataField = 'origemId'
        DataSource = dsMovimentacao
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 120
        Width = 134
        Height = 21
        DataField = 'destinoId'
        DataSource = dsMovimentacao
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 24
        Top = 160
        Width = 446
        Height = 21
        DataField = 'data'
        DataSource = dsMovimentacao
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 448
        Top = 120
        Width = 134
        Height = 21
        DataField = 'receptorId'
        DataSource = dsMovimentacao
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 448
        Top = 80
        Width = 134
        Height = 21
        DataField = 'cedenteId'
        DataSource = dsMovimentacao
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 597
        Top = 38
        Width = 134
        Height = 21
        DataField = 'usuarioId'
        DataSource = dsMovimentacao
        TabOrder = 6
      end
      object DBCheckBox1: TDBCheckBox
        Left = 749
        Top = 39
        Width = 97
        Height = 17
        Caption = 'concluida'
        DataField = 'concluida'
        DataSource = dsMovimentacao
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 597
        Top = 80
        Width = 145
        Height = 21
        DataField = 'cedenteId'
        DataSource = dsMovimentacao
        KeyField = 'pessoaId'
        ListField = 'nome'
        ListSource = dsCedente
        TabOrder = 8
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 176
        Top = 80
        Width = 145
        Height = 21
        DataField = 'origemId'
        DataSource = dsMovimentacao
        KeyField = 'localId'
        ListField = 'titulo'
        ListSource = dsOrigem
        TabOrder = 9
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 597
        Top = 120
        Width = 145
        Height = 21
        DataField = 'receptorId'
        DataSource = dsMovimentacao
        KeyField = 'pessoaId'
        ListField = 'nome'
        ListSource = dsReceptor
        TabOrder = 10
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 176
        Top = 120
        Width = 145
        Height = 21
        DataField = 'destinoId'
        DataSource = dsMovimentacao
        KeyField = 'localId'
        ListField = 'titulo'
        ListSource = dsDestino
        TabOrder = 11
      end
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = cdsMovimentacao
    Left = 296
    Top = 368
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsMovimentacao'
    AfterOpen = cdsMovimentacaoAfterOpen
    Left = 296
    Top = 432
    object cdsMovimentacaotransferenciaId: TIntegerField
      FieldName = 'transferenciaId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMovimentacaoorigemId: TIntegerField
      FieldName = 'origemId'
      Required = True
    end
    object cdsMovimentacaodestinoId: TIntegerField
      FieldName = 'destinoId'
      Required = True
    end
    object cdsMovimentacaodata: TSQLTimeStampField
      FieldName = 'data'
    end
    object cdsMovimentacaoreceptorId: TIntegerField
      FieldName = 'receptorId'
      Required = True
    end
    object cdsMovimentacaocedenteId: TIntegerField
      FieldName = 'cedenteId'
      Required = True
    end
    object cdsMovimentacaousuarioId: TIntegerField
      FieldName = 'usuarioId'
      Required = True
    end
    object cdsMovimentacaoconcluida: TBooleanField
      FieldName = 'concluida'
      Required = True
    end
  end
  object dpsMovimentacao: TDataSetProvider
    DataSet = dm.sqlTranferencia
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poUseQuoteChar]
    Left = 200
    Top = 368
  end
  object dsOrigem: TDataSource
    DataSet = cdsOrigem
    Left = 376
    Top = 368
  end
  object cdsOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsLocal'
    Left = 375
    Top = 429
    object cdsOrigemlocalId: TIntegerField
      FieldName = 'localId'
    end
    object cdsOrigemtitulo: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object cdsOrigemvLocalId: TIntegerField
      FieldName = 'vLocalId'
      Required = True
    end
    object cdsOrigempessoaId: TIntegerField
      FieldName = 'pessoaId'
      Required = True
    end
  end
  object dpsLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    Options = [poReadOnly, poUseQuoteChar]
    Left = 428
    Top = 368
  end
  object dsDestino: TDataSource
    DataSet = cdsDestino
    Left = 480
    Top = 368
  end
  object cdsDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsLocal'
    Left = 479
    Top = 429
    object cdsDestinolocalId: TIntegerField
      FieldName = 'localId'
    end
    object cdsDestinotitulo: TStringField
      FieldName = 'titulo'
      Required = True
      Size = 100
    end
    object cdsDestinovLocalId: TIntegerField
      FieldName = 'vLocalId'
      Required = True
    end
    object cdsDestinopessoaId: TIntegerField
      FieldName = 'pessoaId'
      Required = True
    end
  end
  object dpsPessoa: TDataSetProvider
    DataSet = dm.sqlPessoa
    Options = [poReadOnly, poUseQuoteChar]
    Left = 601
    Top = 368
  end
  object dsCedente: TDataSource
    DataSet = cdsCedente
    Left = 540
    Top = 367
  end
  object cdsCedente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsPessoa'
    Left = 542
    Top = 428
    object cdsCedentepessoaId: TIntegerField
      FieldName = 'pessoaId'
    end
    object cdsCedentenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object cdsCedentetipo: TSmallintField
      FieldName = 'tipo'
      Required = True
    end
    object cdsCedentelogradouro: TStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object cdsCedentemunicipio: TStringField
      FieldName = 'municipio'
      Required = True
      Size = 10
    end
    object cdsCedentecep: TStringField
      FieldName = 'cep'
      Required = True
      Size = 10
    end
    object cdsCedentefornecedor: TBooleanField
      FieldName = 'fornecedor'
      Required = True
    end
    object cdsCedenteusuario: TBooleanField
      FieldName = 'usuario'
      Required = True
    end
  end
  object dsReceptor: TDataSource
    DataSet = cdsReceptor
    Left = 663
    Top = 367
  end
  object cdsReceptor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsPessoa'
    Left = 665
    Top = 428
    object cdsReceptorpessoaId: TIntegerField
      FieldName = 'pessoaId'
    end
    object cdsReceptornome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object cdsReceptortipo: TSmallintField
      FieldName = 'tipo'
      Required = True
    end
    object cdsReceptorlogradouro: TStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object cdsReceptormunicipio: TStringField
      FieldName = 'municipio'
      Required = True
      Size = 10
    end
    object cdsReceptorcep: TStringField
      FieldName = 'cep'
      Required = True
      Size = 10
    end
    object cdsReceptorfornecedor: TBooleanField
      FieldName = 'fornecedor'
      Required = True
    end
    object cdsReceptorusuario: TBooleanField
      FieldName = 'usuario'
      Required = True
    end
  end
end
