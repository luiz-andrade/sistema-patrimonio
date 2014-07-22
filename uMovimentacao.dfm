object frmMovimentacao: TfrmMovimentacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o de Bens'
  ClientHeight = 787
  ClientWidth = 1203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 1203
    Height = 64
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Alignment = taLeftJustify
    BorderWidth = 11
    Caption = 'Movimenta'#231#227'o/Transfer'#234'ncia'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 1067
      Top = 12
      Width = 124
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
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
    end
    object btnGravar: TBitBtn
      AlignWithMargins = True
      Left = 804
      Top = 12
      Width = 124
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
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
    end
    object btnConcluir: TBitBtn
      AlignWithMargins = True
      Left = 410
      Top = 12
      Width = 125
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Concluir'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E9F277B4CEA2
        CEE0909A9F7C7C7C9B5B357A73709C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EEF8FB97CDE531A0CF0F94C815AADDA3D8EB828485F1DCCFA84305C6723A8181
        81FFFFFFFFFFFFFFFFFFFFFFFF62BADF1997CB2DB2E52BB3E624ACDF1FA9DCB5
        DFEF8E8E8EB6652EA94403B24C01B06E3CFFFFFFFFFFFFFFFFFFFFFFFF269ECE
        3DBBEE37B6E933B2E52DAFE228ADE0B6E1F0AC734AAB4600B96E3BBB6521C05C
        04F3CAA8FFFFFFFFFFFFFFFFFF279DCE48BFF243BAED3DB7EA36B4E72FB0E3B8
        E3F3AD6430B17138C0C2C4BE9674C2610ACF6C06F9BD6BFFFFFFFFFFFF2CA3D5
        54C5F84EBFF247BCEF3EB6E936B2E5B8E3F3A7BDBBADD8E6B3DFEEB2DCECC196
        69D16B01E3820BFFFFFFFFFFFF2EA5D461CBFE59C4F74DC0F33FB9EC34B4E843
        B6E04AB4D90098CB0097CA2AA1CCB4D8E7E59B4EDD7905FFFFFFFFFFFF30A8DA
        69CFFF5ECAFE58C8FB6BCCF978C5ED7FD0F811A1D50097CA0096C90090C344A0
        C5FFFFFFE38B29FFFFFFFFFFFF2DAADE87DDFF71C7F23E9FCB107CAD89D2F938
        B6EA3DB7EA34B2E50E9ED1008BBE057EB0FFFFFFFFFFFFFFFFFFFFFFFF6CC1E3
        338EBC0073A8007DB01E8EBE45BCEF58C7FA4EC1F441BAED36B5E823ADE01087
        B5FFFFFFFFFFFFFFFFFFFFFFFF9BD2E782C2E8005388006A9E0076A90074A710
        A1D43FBAED51C4F840BBEF28A1D2CCE6F1FFFFFFFFFFFFFFFFFFFFFFFFF4FBFD
        7BD3FB4693C100598E005B8F00649763A3C2C1DEEC78DBFB3ABDEEDCF0F9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFE9FD73D7FD79D1FB66ACD60C6C9E9F
        C6DCFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDBF1F983CAE36DC4E999D5EEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnConcluirClick
    end
    object btnNovo: TBitBtn
      AlignWithMargins = True
      Left = 542
      Top = 12
      Width = 124
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Nova'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAEBDA66A66623791814
        6C011369002271145E9E5ED2E6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF98CF980A83080990000794000A8F001686002C7700386A001B690487C1
        87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BD29B048D0704A309049F0933CC6666
        FF9966FF9966FF990B89003A6C00276B0186BF86FFFFFFFFFFFFFFFFFFE0F0E0
        1390160BA8170AA3160AA315539B51FFF8FFFFF7FF66FF990099000191003B6C
        001B6B04D1E5D1FFFFFFFFFFFF71B47129B0370FA92311AA2310A922539B51FF
        F9FFFFFAFF66FF99029B06009A00108900396B005E9E5EFFFFFFFFFFFF309B30
        38BF4F33CC6666FF9966FF9933CC66F9F4F9FEF7FC66FF9966FF9966FF9966FF
        99347400217514FFFFFFFFFFFF1D992342C45D539B51FCE9F9F0E4ECF1EBF0F1
        EFF1F5F3F4FFF8FCFFF8FFFFF4FF66FF991D8300146D00FFFFFFFFFFFF1F9C25
        58CF76539B51FDECFDF2E9F2F0EBF0ECEBECEFEEEFF8F3F8FFF8FFFFF5FF66FF
        99118E00126E00FFFFFFFFFFFF37A43879DE99539B51539B51539B518EC18EF1
        EBF1F2ECF133CC66539B51539B5133CC66109403237D18FFFFFFFFFFFF79BE79
        70D68D51D47C2ECA602FC960539B51F2E8F2F0E4ED66FF9914AD2B0EA72007A3
        1212900565A865FFFFFFFFFFFFE7F5E730AB368CE8B03ACF6D2FCB64539B51FE
        ECFEFCE7F766FF9916AF2E11AA220AA91810860BDAEDDAFFFFFFFFFFFFFFFFFF
        AAE0AA3FB84E89E8AF4CD57B219827539B51539B5133CC6616B02F11AF260792
        0C97D197FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAE0AA31AC3775DB9476E19D50
        D2783BC65F30C05024B2391192159BD49BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE7F5E779BF793CA93C24A32B229F2733A13471B771E0F2E0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnNovoClick
    end
    object btnCancelar: TBitBtn
      AlignWithMargins = True
      Left = 935
      Top = 12
      Width = 125
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Cancelar'
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF09EAE2F3FFFFFFFF09FFFFFFFFFFECEAEA0909EAFFFFFFF4EBFFFFFF
        ECE2EA09090909E909FFFFE3ECFFFFFFEA090909090909EBF4FFFFE209FFFFFF
        09EBEBE109090909EBFFFFE1ECFFFFFFFFFFEB0909090909E2FFFFD9E2FFFFFF
        FFF6E20909E2EA09EAFFFFE1E109FFFFF6E1090909EBF409E2FFFFE3E9E1E2E3
        E1F3F309E2FFFFEAECFFFF09E1E9E9EAEAEB09E209FFFFFFFFFFFFFFECE20909
        0909E109FFFFFFFFFFFFFFFFFFECE2D9E1E309FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnImprimir: TBitBtn
      AlignWithMargins = True
      Left = 279
      Top = 12
      Width = 124
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Imprimir'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC8C8C89D9D9D90
        9090B8B8B8EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EDEDEDB9B9B9A8A8A8DEDEDEFFFFFF9C9C9C8080808181819D9D9DC9C9C9F6F6
        F6FFFFFFFFFFFFFFFFFFFFFFFFB5B5B5C3C3C3FDFDFDFFFFFFFFFFFFFFFFFF9B
        9B9B7A7A7A6C6C6C7777777F7F7F7F7F7FA1A1A1D4D4D4FFFFFFFFFFFFADADAD
        FFFFFFFFFFFFE2E2E2C4C4C4C3C3C39292927A7A7A7C7C7C7D7D7D7070706767
        677C7C7C787878FFFFFFFFFFFFA7A7A7E0E0E0CDCDCDDCDCDCEBEBEBE9E9E9BF
        BFBFACACACA1A1A18A8A8A7D7D7D7A7A7A8181817D7D7DFFFFFFFFFFFFA6A6A6
        F5F5F5EAEAEAE3E3E3DCDCDCDCDCDCE9E9E9DDDDDDCCCCCCBABABAB1AEB0AFA4
        AD968E95787577FFFFFFFFFFFFABABABEEEEEEDFDFDFDCDCDCE8E8E8FEFEFEF9
        F9F9F3F3F3F1F1F1EBEBEBDBD2D92DC04B72CC7C8F8A8FFFFFFFFFFFFFBEBEBE
        B8B8B8D4D4D5A1A2A365686B86888BB8BABBE0E0E1F5F5F5FCFCFCFFFCFFE7E5
        E6B3B3B3C0BFC0FFFFFFFFFFFFFFFFFFF1F1F1D1D2D2847F7BFFE7C7CAB39D96
        887B6E6A6666696CADADAEC6C6C69F9F9FD3D3D3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF4F4F4A7A19BFFF3DAFFEAD0FFEBCCFFF0CBE4C6A7969899E2E2E2FDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C8C8E5DBD1FFF2E3FFEBDAFF
        E8D4FFEED6B8AA9CE3E3E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F8ABAAAAFFFFFFFFF8EEFFF3E8FFF3E5FFFDEA91918EFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C2EAEAEBFFFFFFFFFFFFFFFFFFFF
        FFFFABA7A3D8D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F8E0E0E0C8C9C9BEBFBFBEBFBFADADACBABBBBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnImprimirClick
    end
    object btnApagar: TBitBtn
      AlignWithMargins = True
      Left = 673
      Top = 12
      Width = 124
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Apagar'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FC8488D5383CBA14
        1BAF141AAC383AB28585CDF2F2FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB2B6F11324C40020D80023E00020D90019CC0011BD000BB01417A7B4B4
        E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B7F40420D6002FFF002AFB002DF800
        2BF20029EE001FE50012CA000DB50409A4B4B4E7FFFFFFFFFFFFFFFFFFF5F5FD
        1932D50035FF97A9E86888F40034FF002DFF0033FA95B1FD4570FB0019D4000D
        B61316A7F2F2FBFFFFFFFFFFFF818BE4254EF80034FFCACDDCF5EFDEB1C0EF06
        3DFFB1C4FAFFFFFBFFFFFF6187FD0012CA000CB28484CEFFFFFFFFFFFF3A51DF
        3D6AFF083CFE97A3E2F4F1E1F6F3EAE4E8F3FFFFF8FFFFFFF3F7FF446DFD0022
        E70012BE373BB6FFFFFFFFFFFF2341E34B76FF2255FF0D41FE5C7AF0EFEDEBF6
        F6F3FFFFFBCDDAFE174AFF002AFC002CF30019CB121AB2FFFFFFFFFFFF2545E7
        6489FF2E5FFF3364FF0639FCDADCEDFBF9F3FFFFFBADC0FE0033FF0236FF0030
        FA0020DA121CB5FFFFFFFFFFFF3C58E983A2FF3D6CFF3C6CFF526DE9FFFBE9B2
        BFF3D4DAF9FFFFFF6D8FFF0033FF0032FF0023E23941C2FFFFFFFFFFFF8492F1
        688AFA7096FF2958F7BABEDEF5F3E71543F70E41FDE7ECFBFFFFFF2958FE0035
        FF0021DA878DDAFFFFFFFFFFFFF3F4FF294EEF97B6FF4C75F95B6CD8546BE133
        65FF2D5FFF1745FCC7D1FA4C73FF0135FF1629CBF4F4FDFFFFFFFFFFFFFFFFFF
        B7C2FF2F53F396B3FF6F95FF3966FA396AFF2F60FF2153FE083CFF0C40FF0725
        DCBABFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8C3FF294DF26688FA88A9FF6A
        8FFF4F7AFF3E6DFF204CF61E38DDBAC0F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F5FE8C99F5405DED2C4CEC2A4AE94059E58D99ECF5F6FDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btnApagarClick
    end
  end
  object pgGeral: TPageControl
    AlignWithMargins = True
    Left = 4
    Top = 68
    Width = 1195
    Height = 715
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsBens
    Align = alClient
    TabOrder = 1
    OnChange = pgGeralChange
    object tsConsulta: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Consulta'
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 58
        Width = 1179
        Height = 568
        Cursor = crHandPoint
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsMovimentacao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleHotTrack]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'transferenciaId'
            Title.Caption = 'N'#250'mero da transfer'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'concluida'
            Title.Caption = 'Conclu'#237'da'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomeUsuario'
            Title.Caption = 'Usu'#225'rio'
            Width = 100
            Visible = True
          end>
      end
      object pnPesquisa: TPanel
        Left = 0
        Top = 630
        Width = 1187
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 5
        Caption = 'Pesquisa:'
        ParentBackground = False
        TabOrder = 1
        object btnPesquisar: TSpeedButton
          AlignWithMargins = True
          Left = 1057
          Top = 12
          Width = 118
          Height = 33
          Cursor = crHandPoint
          Margins.Left = 7
          Margins.Top = 7
          Margins.Right = 7
          Align = alRight
          Caption = 'Pesquisar'
          OnClick = btnPesquisarClick
          ExplicitLeft = 1054
          ExplicitTop = 13
          ExplicitHeight = 31
        end
        object txtPesquisa: TEdit
          AlignWithMargins = True
          Left = 70
          Top = 14
          Width = 777
          Height = 30
          Margins.Left = 65
          Margins.Top = 9
          Margins.Right = 5
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
          TextHint = 'Entre com a informa'#231#227'o que deseja pesquisar'
          ExplicitHeight = 25
        end
        object cbPesquisar: TComboBox
          AlignWithMargins = True
          Left = 856
          Top = 14
          Width = 190
          Height = 25
          Margins.Left = 4
          Margins.Top = 9
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alRight
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'N'#250'mero'
          Items.Strings = (
            'N'#250'mero')
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1187
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
      end
    end
    object tsInformacao: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Informa'#231#245'es sobre a transfer'#234'ncia'
      ImageIndex = 1
      object Label1: TLabel
        Left = 31
        Top = 31
        Width = 54
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'N'#250'mero:'
        FocusControl = transferenciaId
      end
      object Label2: TLabel
        Left = 30
        Top = 183
        Width = 102
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Unidade Origem:'
        FocusControl = origemSubLocal
      end
      object Label3: TLabel
        Left = 565
        Top = 183
        Width = 104
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Unidade Destino:'
        FocusControl = destinoSubLocal
      end
      object Label4: TLabel
        Left = 214
        Top = 31
        Width = 148
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Data da movimenta'#231#227'o:'
        FocusControl = data
      end
      object Label7: TLabel
        Left = 748
        Top = 31
        Width = 50
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Usuario:'
        FocusControl = usuarioId
      end
      object Label5: TLabel
        Left = 566
        Top = 230
        Width = 61
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Receptor:'
        FocusControl = receptorId
      end
      object Label6: TLabel
        Left = 31
        Top = 230
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cedente:'
        FocusControl = cedenteId
      end
      object Label8: TLabel
        Left = 30
        Top = 124
        Width = 153
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Org'#227'o/ Empresa Origem:'
        FocusControl = origemId
      end
      object Label9: TLabel
        Left = 565
        Top = 122
        Width = 155
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Org'#227'o/ Empresa Destino:'
        FocusControl = destinoId
      end
      object transferenciaId: TDBEdit
        Left = 31
        Top = 51
        Width = 176
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'transferenciaId'
        DataSource = dsMovimentacao
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object origemSubLocal: TDBEdit
        Left = 30
        Top = 199
        Width = 175
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'origemSubLocal'
        DataSource = dsMovimentacao
        TabOrder = 1
      end
      object destinoSubLocal: TDBEdit
        Left = 565
        Top = 199
        Width = 175
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'destinoSubLocal'
        DataSource = dsMovimentacao
        TabOrder = 2
      end
      object data: TDBEdit
        Left = 214
        Top = 51
        Width = 148
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'data'
        DataSource = dsMovimentacao
        ReadOnly = True
        TabOrder = 3
      end
      object usuarioId: TDBEdit
        Left = 748
        Top = 51
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'nomeUsuario'
        DataSource = dsMovimentacao
        Enabled = False
        TabOrder = 4
      end
      object DBCheckBox1: TDBCheckBox
        Left = 1097
        Top = 4
        Width = 84
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Conclu'#237'da'
        DataField = 'concluida'
        DataSource = dsMovimentacao
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object dblOrigemId: TDBLookupComboBox
        Left = 213
        Top = 199
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'origemSubLocal'
        DataSource = dsMovimentacao
        DropDownRows = 50
        DropDownWidth = 400
        KeyField = 'localId'
        ListField = 'localId;titulo'
        ListFieldIndex = 1
        ListSource = dsOrigem
        TabOrder = 6
      end
      object dblLdestinoSubLocal: TDBLookupComboBox
        Left = 748
        Top = 199
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'destinoSubLocal'
        DataSource = dsMovimentacao
        DropDownRows = 50
        DropDownWidth = 400
        KeyField = 'localId'
        ListField = 'localId;titulo'
        ListFieldIndex = 1
        ListSource = dsDestino
        TabOrder = 7
      end
      object tipo: TDBRadioGroup
        Left = 370
        Top = 29
        Width = 373
        Height = 49
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Tipo de movimenta'#231#227'o:'
        Columns = 2
        DataField = 'tipo'
        DataSource = dsMovimentacao
        Items.Strings = (
          'Movimenta'#231#227'o Interna'
          'Movimenta'#231#227'o Externa')
        ParentBackground = True
        TabOrder = 8
        Values.Strings = (
          '1'
          '2')
      end
      object receptorId: TDBEdit
        Left = 566
        Top = 251
        Width = 175
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'receptorId'
        DataSource = dsMovimentacao
        ReadOnly = True
        TabOrder = 9
      end
      object cedenteId: TDBEdit
        Left = 31
        Top = 251
        Width = 176
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'cedenteId'
        DataSource = dsMovimentacao
        ReadOnly = True
        TabOrder = 10
      end
      object dblCedenteId: TDBLookupComboBox
        Left = 214
        Top = 251
        Width = 313
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'cedenteId'
        DataSource = dsMovimentacao
        KeyField = 'pessoaId'
        ListField = 'nome'
        ListSource = dsCedente
        TabOrder = 11
      end
      object dblReceptorId: TDBLookupComboBox
        Left = 748
        Top = 251
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'receptorId'
        DataSource = dsMovimentacao
        KeyField = 'pessoaId'
        ListField = 'nome'
        ListSource = dsReceptor
        TabOrder = 12
      end
      object dblOrigemLocal: TDBLookupComboBox
        Left = 213
        Top = 145
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'origemId'
        DataSource = dsMovimentacao
        DropDownRows = 50
        DropDownWidth = 400
        KeyField = 'localId'
        ListField = 'localId;titulo'
        ListFieldIndex = 1
        ListSource = dsOrigemLocal
        TabOrder = 13
      end
      object origemId: TDBEdit
        Left = 30
        Top = 145
        Width = 175
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'origemId'
        DataSource = dsMovimentacao
        TabOrder = 14
      end
      object destinoId: TDBEdit
        Left = 565
        Top = 143
        Width = 175
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'destinoId'
        DataSource = dsMovimentacao
        TabOrder = 15
      end
      object dblDestinoId: TDBLookupComboBox
        Left = 748
        Top = 143
        Width = 314
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'destinoId'
        DataSource = dsMovimentacao
        DropDownRows = 50
        DropDownWidth = 400
        KeyField = 'localId'
        ListField = 'localId;titulo'
        ListFieldIndex = 1
        ListSource = dsDestinoLocal
        TabOrder = 16
      end
    end
    object tsBens: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Bens vinculados a tranfer'#234'ncia'
      ImageIndex = 2
      object pnAcoesProduto: TPanel
        Left = 0
        Top = 0
        Width = 1187
        Height = 64
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderWidth = 11
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object btnRemover: TBitBtn
          Left = 1052
          Top = 11
          Width = 124
          Height = 42
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alRight
          Caption = 'Remover'
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FC8488D5383CBA14
            1BAF141AAC383AB28585CDF2F2FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB2B6F11324C40020D80023E00020D90019CC0011BD000BB01417A7B4B4
            E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B7F40420D6002FFF002AFB002DF800
            2BF20029EE001FE50012CA000DB50409A4B4B4E7FFFFFFFFFFFFFFFFFFF5F5FD
            1932D50035FF97A9E86888F40034FF002DFF0033FA95B1FD4570FB0019D4000D
            B61316A7F2F2FBFFFFFFFFFFFF818BE4254EF80034FFCACDDCF5EFDEB1C0EF06
            3DFFB1C4FAFFFFFBFFFFFF6187FD0012CA000CB28484CEFFFFFFFFFFFF3A51DF
            3D6AFF083CFE97A3E2F4F1E1F6F3EAE4E8F3FFFFF8FFFFFFF3F7FF446DFD0022
            E70012BE373BB6FFFFFFFFFFFF2341E34B76FF2255FF0D41FE5C7AF0EFEDEBF6
            F6F3FFFFFBCDDAFE174AFF002AFC002CF30019CB121AB2FFFFFFFFFFFF2545E7
            6489FF2E5FFF3364FF0639FCDADCEDFBF9F3FFFFFBADC0FE0033FF0236FF0030
            FA0020DA121CB5FFFFFFFFFFFF3C58E983A2FF3D6CFF3C6CFF526DE9FFFBE9B2
            BFF3D4DAF9FFFFFF6D8FFF0033FF0032FF0023E23941C2FFFFFFFFFFFF8492F1
            688AFA7096FF2958F7BABEDEF5F3E71543F70E41FDE7ECFBFFFFFF2958FE0035
            FF0021DA878DDAFFFFFFFFFFFFF3F4FF294EEF97B6FF4C75F95B6CD8546BE133
            65FF2D5FFF1745FCC7D1FA4C73FF0135FF1629CBF4F4FDFFFFFFFFFFFFFFFFFF
            B7C2FF2F53F396B3FF6F95FF3966FA396AFF2F60FF2153FE083CFF0C40FF0725
            DCBABFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8C3FF294DF26688FA88A9FF6A
            8FFF4F7AFF3E6DFF204CF61E38DDBAC0F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF4F5FE8C99F5405DED2C4CEC2A4AE94059E58D99ECF5F6FDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnRemoverClick
        end
        object btnAddBem: TBitBtn
          AlignWithMargins = True
          Left = 920
          Top = 11
          Width = 125
          Height = 42
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 7
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Adicionar'
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAEBDA66A66623791814
            6C011369002271145E9E5ED2E6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF98CF980A83080990000794000A8F001686002C7700386A001B690487C1
            87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BD29B048D0704A309049F0933CC6666
            FF9966FF9966FF990B89003A6C00276B0186BF86FFFFFFFFFFFFFFFFFFE0F0E0
            1390160BA8170AA3160AA315539B51FFF8FFFFF7FF66FF990099000191003B6C
            001B6B04D1E5D1FFFFFFFFFFFF71B47129B0370FA92311AA2310A922539B51FF
            F9FFFFFAFF66FF99029B06009A00108900396B005E9E5EFFFFFFFFFFFF309B30
            38BF4F33CC6666FF9966FF9933CC66F9F4F9FEF7FC66FF9966FF9966FF9966FF
            99347400217514FFFFFFFFFFFF1D992342C45D539B51FCE9F9F0E4ECF1EBF0F1
            EFF1F5F3F4FFF8FCFFF8FFFFF4FF66FF991D8300146D00FFFFFFFFFFFF1F9C25
            58CF76539B51FDECFDF2E9F2F0EBF0ECEBECEFEEEFF8F3F8FFF8FFFFF5FF66FF
            99118E00126E00FFFFFFFFFFFF37A43879DE99539B51539B51539B518EC18EF1
            EBF1F2ECF133CC66539B51539B5133CC66109403237D18FFFFFFFFFFFF79BE79
            70D68D51D47C2ECA602FC960539B51F2E8F2F0E4ED66FF9914AD2B0EA72007A3
            1212900565A865FFFFFFFFFFFFE7F5E730AB368CE8B03ACF6D2FCB64539B51FE
            ECFEFCE7F766FF9916AF2E11AA220AA91810860BDAEDDAFFFFFFFFFFFFFFFFFF
            AAE0AA3FB84E89E8AF4CD57B219827539B51539B5133CC6616B02F11AF260792
            0C97D197FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAE0AA31AC3775DB9476E19D50
            D2783BC65F30C05024B2391192159BD49BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE7F5E779BF793CA93C24A32B229F2733A13471B771E0F2E0FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = btnAddBemClick
        end
        object ledtIdentificacao: TLabeledEdit
          Left = 167
          Top = 20
          Width = 159
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 136
          EditLabel.Height = 17
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Identifica'#231#227'o do bem: '
          LabelPosition = lpLeft
          TabOrder = 2
          OnKeyDown = ledtIdentificacaoKeyDown
        end
      end
      object DBGrid2: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 68
        Width = 1179
        Height = 611
        Cursor = crHandPoint
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        DataSource = dsMovimentacaoBem
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'identificacao'
            Title.Caption = 'Identifica'#231#227'o do Bem'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 740
            Visible = True
          end>
      end
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = cdsMovimentacao
    OnStateChange = dsMovimentacaoStateChange
    OnDataChange = dsMovimentacaoDataChange
    Left = 194
    Top = 406
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from transferencia order by transferenciaId desc'
    Params = <>
    ProviderName = 'dpsMovimentacao'
    AfterInsert = cdsMovimentacaoAfterInsert
    OnReconcileError = cdsMovimentacaoReconcileError
    Left = 194
    Top = 467
    object cdsMovimentacaotransferenciaId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'transferenciaId'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '00000000'
    end
    object cdsMovimentacaoreceptorId: TIntegerField
      FieldName = 'receptorId'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentacaocedenteId: TIntegerField
      FieldName = 'cedenteId'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentacaousuarioId: TIntegerField
      FieldName = 'usuarioId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMovimentacaoconcluida: TBooleanField
      FieldName = 'concluida'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayValues = 'Sim;N'#227'o'
    end
    object cdsMovimentacaotipo: TSmallintField
      FieldName = 'tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMovimentacaoorigemId: TStringField
      FieldName = 'origemId'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsMovimentacaodestinoId: TStringField
      FieldName = 'destinoId'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsMovimentacaoorigemSubLocal: TStringField
      FieldName = 'origemSubLocal'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsMovimentacaodestinoSubLocal: TStringField
      FieldName = 'destinoSubLocal'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsMovimentacaodata: TDateTimeField
      FieldName = 'data'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentacaonomeUsuario: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeUsuario'
      LookupDataSet = cdsPessoaUsuario
      LookupKeyFields = 'usuarioId'
      LookupResultField = 'login'
      KeyFields = 'usuarioId'
      Size = 255
      Lookup = True
    end
  end
  object dpsMovimentacao: TDataSetProvider
    DataSet = dm.sqlTranferencia
    Options = [poAllowCommandText, poRetainServerOrder, poUseQuoteChar]
    AfterUpdateRecord = dpsMovimentacaoAfterUpdateRecord
    Left = 192
    Top = 527
  end
  object dsOrigem: TDataSource
    DataSet = cdsOrigem
    OnDataChange = dsOrigemDataChange
    Left = 785
    Top = 406
  end
  object cdsOrigem: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local order by localId'
    IndexFieldNames = 'vLocalId'
    MasterFields = 'localId'
    MasterSource = dsOrigemLocal
    Params = <>
    ProviderName = 'dspOrigemLocal'
    Left = 785
    Top = 467
    object cdsOrigemtitulo: TStringField
      FieldName = 'titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsOrigempessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrigemlocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsOrigemvLocalId: TStringField
      FieldName = 'vLocalId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dpsOrigem: TDataSetProvider
    DataSet = dm.sqlSubLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 785
    Top = 527
  end
  object dsDestino: TDataSource
    DataSet = cdsDestino
    OnDataChange = dsDestinoDataChange
    Left = 524
    Top = 406
  end
  object cdsDestino: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local order by localId'
    IndexFieldNames = 'vLocalId'
    MasterFields = 'localId'
    MasterSource = dsDestinoLocal
    Params = <>
    ProviderName = 'dpsDestino'
    Left = 524
    Top = 467
    object cdsDestinotitulo: TStringField
      FieldName = 'titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsDestinopessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDestinolocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsDestinovLocalId: TStringField
      FieldName = 'vLocalId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dsCedente: TDataSource
    DataSet = cdsCedente
    Left = 286
    Top = 406
  end
  object cdsCedente: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from pessoa'
    Params = <>
    ProviderName = 'dpsCedente'
    Left = 286
    Top = 467
    object cdsCedentepessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsCedentenome: TStringField
      FieldName = 'nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsCedentetipo: TSmallintField
      FieldName = 'tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCedentelogradouro: TStringField
      FieldName = 'logradouro'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsCedentecep: TStringField
      FieldName = 'cep'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsCedenteusuario: TBooleanField
      FieldName = 'usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCedentemunicipio: TStringField
      FieldName = 'municipio'
      Size = 100
    end
  end
  object dsReceptor: TDataSource
    DataSet = cdsReceptor
    Left = 361
    Top = 406
  end
  object cdsReceptor: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from pessoa'
    Params = <>
    ProviderName = 'dpsReceptor'
    Left = 361
    Top = 467
    object cdsReceptorpessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsReceptornome: TStringField
      FieldName = 'nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsReceptortipo: TSmallintField
      FieldName = 'tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsReceptorlogradouro: TStringField
      FieldName = 'logradouro'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsReceptorcep: TStringField
      FieldName = 'cep'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsReceptorusuario: TBooleanField
      FieldName = 'usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsReceptormunicipio: TStringField
      FieldName = 'municipio'
      Size = 100
    end
  end
  object dsMovimentacaoBem: TDataSource
    DataSet = cdsMovimentacaoBem
    OnDataChange = dsMovimentacaoBemDataChange
    Left = 88
    Top = 406
  end
  object cdsMovimentacaoBem: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from transferenciaBem'
    IndexFieldNames = 'transferenciaId'
    MasterFields = 'transferenciaId'
    MasterSource = dsMovimentacao
    Params = <>
    ProviderName = 'dpsMovimentacaoBem'
    OnReconcileError = cdsMovimentacaoBemReconcileError
    Left = 88
    Top = 467
    object cdsMovimentacaoBemtransferenciaId: TIntegerField
      FieldName = 'transferenciaId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMovimentacaoBembemId: TIntegerField
      FieldName = 'bemId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000000'
    end
    object cdsMovimentacaoBembemEstadoId: TIntegerField
      FieldName = 'bemEstadoId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMovimentacaoBemidenficacao: TStringField
      FieldKind = fkLookup
      FieldName = 'identificacao'
      LookupDataSet = cdsBem
      LookupKeyFields = 'bemId'
      LookupResultField = 'identificacao'
      KeyFields = 'bemId'
      Size = 50
      Lookup = True
    end
    object cdsMovimentacaoBemdescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'descricao'
      LookupDataSet = cdsBem
      LookupKeyFields = 'bemId'
      LookupResultField = 'descricao'
      KeyFields = 'bemId'
      Size = 1000
      Lookup = True
    end
  end
  object dpsMovimentacaoBem: TDataSetProvider
    DataSet = dm.sqlTransferenciaBem
    Options = [poAllowCommandText, poRetainServerOrder, poUseQuoteChar]
    Left = 88
    Top = 527
  end
  object dsOrigemLocal: TDataSource
    DataSet = cdsOrigemLocal
    Left = 861
    Top = 406
  end
  object cdsOrigemLocal: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local where vLocalId = 0 order by localId'
    Params = <>
    ProviderName = 'dspOrigemLocal'
    Left = 861
    Top = 467
    object cdsOrigemLocaltitulo: TStringField
      FieldName = 'titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsOrigemLocalpessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrigemLocallocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsOrigemLocalvLocalId: TStringField
      FieldName = 'vLocalId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dspOrigemLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 861
    Top = 527
  end
  object dpsDestino: TDataSetProvider
    DataSet = dm.sqlSubLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 524
    Top = 527
  end
  object dsDestinoLocal: TDataSource
    DataSet = cdsDestinoLocal
    Left = 605
    Top = 406
  end
  object cdsDestinoLocal: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from local where vLocalId = 0 order by localId'
    Params = <>
    ProviderName = 'dpsDestinoLocal'
    Left = 605
    Top = 467
    object StringField1: TStringField
      FieldName = 'titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object IntegerField1: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInUpdate]
    end
    object StringField2: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'vLocalId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dpsDestinoLocal: TDataSetProvider
    DataSet = dm.sqlLocal
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 605
    Top = 527
  end
  object dpsCedente: TDataSetProvider
    DataSet = dm.sqlPessoa
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 285
    Top = 527
  end
  object dpsReceptor: TDataSetProvider
    DataSet = dm.sqlPessoa
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 527
  end
  object sp_finalizaTransferencia: TADOStoredProc
    Connection = dm.ADOConnection
    ProcedureName = 'sp_finalizaTransferencia'
    Parameters = <>
    Left = 768
    Top = 80
  end
  object dsBem: TDataSource
    DataSet = cdsBem
    Left = 696
    Top = 406
  end
  object cdsBem: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from bem'
    Params = <>
    ProviderName = 'dspBem'
    Left = 696
    Top = 467
    object cdsBembemId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'bemId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsBemidentificacao: TStringField
      FieldName = 'identificacao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsBemdescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 255
    end
    object cdsBemestadoId: TIntegerField
      FieldName = 'estadoId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBemtipoIdentificacao: TIntegerField
      FieldName = 'tipoIdentificacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBemgestaoId: TIntegerField
      FieldName = 'gestaoId'
      ProviderFlags = [pfInUpdate]
    end
    object cdsBemgrupoId: TStringField
      FieldName = 'grupoId'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsBemlocalId: TStringField
      FieldName = 'localId'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsBemsubgrupoId: TStringField
      FieldName = 'subgrupoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsBemsubLocalId: TStringField
      FieldName = 'subLocalId'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsBemtipoAquisicao: TIntegerField
      FieldName = 'tipoAquisicao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBemquantidade: TFloatField
      FieldName = 'quantidade'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBemvalor: TBCDField
      FieldName = 'valor'
      ProviderFlags = [pfInUpdate]
      currency = True
      Precision = 19
    end
  end
  object dspBem: TDataSetProvider
    DataSet = dm.sqlBem
    Options = [poAutoRefresh, poAllowCommandText, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 527
  end
  object rvdMovimentacaoBem: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = sqlTransferenciaBem
    Left = 88
    Top = 344
  end
  object rvdMovimentacao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = sqlTranferencia
    Left = 192
    Top = 344
  end
  object sqlTranferencia: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'transferenciaId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from transferencia'
      'where transferenciaId = :transferenciaId')
    Left = 360
    Top = 200
    object sqlTranferenciatransferenciaId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'transferenciaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '00000000'
    end
    object sqlTranferenciaorigemId: TStringField
      FieldName = 'origemId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlTranferenciadestinoId: TStringField
      FieldName = 'destinoId'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlTranferenciadata: TDateTimeField
      FieldName = 'data'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciareceptorId: TIntegerField
      FieldName = 'receptorId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciacedenteId: TIntegerField
      FieldName = 'cedenteId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciausuarioId: TIntegerField
      FieldName = 'usuarioId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciaconcluida: TBooleanField
      FieldName = 'concluida'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciatipo: TSmallintField
      FieldName = 'tipo'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTranferenciaorigemSubLocal: TStringField
      FieldName = 'origemSubLocal'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlTranferenciadestinoSubLocal: TStringField
      FieldName = 'destinoSubLocal'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object sqlTransferenciaBem: TADOQuery
    Connection = dm.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'transferenciaId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select transferenciaBem.*, bem.descricao, bem.identificacao'
      
        ' from transferenciaBem inner join bem on transferenciaBem.bemid ' +
        '= bem.bemid'
      'where transferenciaId = :transferenciaId')
    Left = 456
    Top = 200
    object sqlTransferenciaBemtransferenciaId: TIntegerField
      FieldName = 'transferenciaId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTransferenciaBembemId: TIntegerField
      FieldName = 'bemId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTransferenciaBembemEstadoId: TIntegerField
      FieldName = 'bemEstadoId'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTransferenciaBemdescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object sqlTransferenciaBemidentificacao: TStringField
      FieldName = 'identificacao'
      Size = 50
    end
  end
  object dsPessoaUsuario: TDataSource
    DataSet = cdsPessoaUsuario
    Left = 448
    Top = 408
  end
  object cdsPessoaUsuario: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from usuario'
    IndexFieldNames = 'pessoaId'
    MasterFields = 'pessoaId'
    Params = <>
    ProviderName = 'dspPessoaUsuario'
    Left = 448
    Top = 467
    object cdsPessoaUsuariousuarioId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'usuarioId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsPessoaUsuariologin: TStringField
      FieldName = 'login'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsPessoaUsuariosenha: TMemoField
      FieldName = 'senha'
      ProviderFlags = [pfInUpdate]
      Required = True
      BlobType = ftMemo
    end
    object cdsPessoaUsuariopessoaId: TIntegerField
      FieldName = 'pessoaId'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPessoaUsuariodesativado: TBooleanField
      FieldName = 'desativado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspPessoaUsuario: TDataSetProvider
    DataSet = dm.sqlUsuario
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 528
  end
end
