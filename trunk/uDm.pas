unit uDm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXMSSQL, FMTBcd, Provider, DBClient, ImgList,
	Controls, Forms, Windows, RpDefine, RpRave, RpCon, RpConDS;

type
  Tdm = class(TDataModule)
    SQLConnection: TSQLConnection;
    sqlEmpresa: TSQLQuery;
    sqlLocal: TSQLQuery;
    ImageListAcoes: TImageList;
    ImageListBotoes: TImageList;
    sqlLocaltitulo: TStringField;
    sqlLocalpessoaId: TIntegerField;
    sqlPessoa: TSQLQuery;
    sqlPessoapessoaId: TIntegerField;
    sqlPessoanome: TStringField;
    sqlGrupo: TSQLQuery;
    sqlGrupodescricao: TStringField;
    sqlGrupoempresaId: TIntegerField;
    sqlBem: TSQLQuery;
    sqlBembemId: TIntegerField;
    sqlBemidenficacao: TStringField;
    sqlBemdescricao: TStringField;
    sqlBemestadoId: TIntegerField;
    sqlBemgestaoId: TIntegerField;
    sqlGestao: TSQLQuery;
    sqlEstado: TSQLQuery;
    sqlEstadoestadoId: TIntegerField;
    sqlEstadodescricao: TStringField;
    sqlGestaogestaoId: TIntegerField;
    sqlBemAquisicao: TSQLQuery;
    sqlBemAquisicaobemId: TIntegerField;
    sqlBemAquisicaodata: TSQLTimeStampField;
    sqlBemAquisicaodataNota: TSQLTimeStampField;
    sqlBemAquisicaofornecedorId: TIntegerField;
    sqlFornecedor: TSQLQuery;
    sqlFornecedorfornecedorId: TIntegerField;
    sqlFornecedorrazaoSocial: TStringField;
    sqlFornecedorcnpj: TStringField;
    sqlFornecedorpessoaId: TIntegerField;
    sqlPessoatipo: TSmallintField;
    sqlPessoalogradouro: TStringField;
    sqlPessoamunicipio: TStringField;
    sqlPessoacep: TStringField;
    sqlUsuario: TSQLQuery;
    sqlUsuariousuarioId: TIntegerField;
    sqlUsuariologin: TStringField;
    sqlUsuariosenha: TMemoField;
    sqlUsuariopessoaId: TIntegerField;
    sqlUsuariodesativado: TBooleanField;
    sqlPessoafornecedor: TBooleanField;
    sqlPessoausuario: TBooleanField;
    sqlEmpresaempresaId: TIntegerField;
    sqlEmpresarazaoSocial: TStringField;
    sqlEmpresanomeFantasia: TStringField;
    sqlEmpresachave: TMemoField;
    sqlTranferencia: TSQLQuery;
    sqlTransferenciaBem: TSQLQuery;
    sqlTranferenciatransferenciaId: TIntegerField;
    sqlTranferenciareceptorId: TIntegerField;
    sqlTranferenciacedenteId: TIntegerField;
    sqlTranferenciausuarioId: TIntegerField;
    sqlTranferenciaconcluida: TBooleanField;
    sqlTransferenciaBemtransferenciaId: TIntegerField;
    sqlTransferenciaBembemId: TIntegerField;
    sqlTranferenciatipo: TSmallintField;
    sqlTranferenciadata: TSQLTimeStampField;
    sqlPessoacnpjCpf: TStringField;
    sqlBemvalor: TFMTBCDField;
    sqlBemAquisicaonumeroNota: TStringField;
    sqlEmpresapessoaId: TIntegerField;
    sqlBemtipoIdentificacao: TIntegerField;
    sqlEmpresalogotipo: TBlobField;
    sqlSubLocal: TSQLQuery;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    sqlSubGrupo: TSQLQuery;
    StringField2: TStringField;
    IntegerField5: TIntegerField;
    sqlLocallocalId: TStringField;
    sqlLocalvLocalId: TStringField;
    sqlSubLocallocalId: TStringField;
    sqlSubLocalvLocalId: TStringField;
    sqlGrupogrupoId: TStringField;
    sqlGrupovGrupoId: TStringField;
    sqlSubGrupogrupoId: TStringField;
    sqlSubGrupovGrupoId: TStringField;
    sqlBemgrupoId: TStringField;
    sqlBemlocalId: TStringField;
    sqlBemsubgrupoId: TStringField;
    sqlBemsubLocalId: TStringField;
    sqlTranferenciaorigemId: TStringField;
    sqlTranferenciadestinoId: TStringField;
    sqlBemtipoAquisicao: TIntegerField;
    sqlBemquantidade: TFloatField;
    sqlGestaogestao: TStringField;
    rvpTR: TRvProject;
    sqlUsuarioAcao: TSQLQuery;
    sqlAcoes: TSQLQuery;
    sqlAcoesacaoId: TIntegerField;
    sqlAcoesdescricao: TStringField;
    sqlAcoesnomeAcao: TStringField;
    sqlvAcoes: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    rvdLocal: TRvDataSetConnection;
    rvdSubLocal: TRvDataSetConnection;
    rvdGestao: TRvDataSetConnection;
    procedure SQLConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses uFuncoes;

{$R *.dfm}

procedure Tdm.SQLConnectionBeforeConnect(Sender: TObject);
begin
	with SQLConnection do
	begin
		Close;
		if FileExists(Concat(ExtractFilePath(Application.ExeName), 'dbxcon.inf')) then
		begin
			Params.LoadFromFile(Concat(ExtractFilePath(Application.ExeName), 'dbxcon.inf'));
		end
		else
		begin
			Application.MessageBox(	'Não foi possivel encontrar o arquivo de conexão!',
															PChar(Application.Title),
															MB_ICONERROR);
			Application.Terminate;
		end;
	end;
end;

end.
