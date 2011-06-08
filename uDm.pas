unit uDm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXMSSQL, FMTBcd, Provider, DBClient, ImgList,
	Controls, Forms, Windows, RpDefine, RpRave, RpCon, RpConDS, ADODB, AppEvnts;

type
  Tdm = class(TDataModule)
    ImageListAcoes: TImageList;
    ImageListBotoes: TImageList;
    rvpTR: TRvProject;
    rvdLocal: TRvDataSetConnection;
    rvdSubLocal: TRvDataSetConnection;
    rvdGestao: TRvDataSetConnection;
    rvdPessoa: TRvDataSetConnection;
    ADOConnection: TADOConnection;
    sqlTranferencia: TADOQuery;
    sqlTransferenciaBem: TADOQuery;
    sqlTranferenciatransferenciaId: TAutoIncField;
    sqlTranferenciaorigemId: TStringField;
    sqlTranferenciadestinoId: TStringField;
    sqlTranferenciadata: TDateTimeField;
    sqlTranferenciareceptorId: TIntegerField;
    sqlTranferenciacedenteId: TIntegerField;
    sqlTranferenciausuarioId: TIntegerField;
    sqlTranferenciaconcluida: TBooleanField;
    sqlTranferenciatipo: TSmallintField;
    sqlTranferenciaorigemSubLocal: TStringField;
    sqlTranferenciadestinoSubLocal: TStringField;
    sqlTransferenciaBemtransferenciaId: TIntegerField;
    sqlTransferenciaBembemId: TIntegerField;
    sqlTransferenciaBembemEstadoId: TIntegerField;
    sqlBem: TADOQuery;
    sqlBemAquisicao: TADOQuery;
    sqlBembemId: TAutoIncField;
    sqlBemidenficacao: TStringField;
    sqlBemdescricao: TStringField;
    sqlBemgrupoId: TStringField;
    sqlBemestadoId: TIntegerField;
    sqlBemlocalId: TStringField;
    sqlBemgestaoId: TIntegerField;
    sqlBemvalor: TBCDField;
    sqlBemtipoIdentificacao: TIntegerField;
    sqlBemsubgrupoId: TStringField;
    sqlBemsubLocalId: TStringField;
    sqlBemtipoAquisicao: TIntegerField;
    sqlBemquantidade: TFloatField;
    sqlBemAquisicaobemId: TIntegerField;
    sqlBemAquisicaodata: TDateTimeField;
    sqlBemAquisicaodataNota: TDateTimeField;
    sqlBemAquisicaofornecedorId: TIntegerField;
    sqlBemAquisicaonumeroNota: TStringField;
    sqlEstado: TADOQuery;
    sqlGestao: TADOQuery;
    sqlGrupo: TADOQuery;
    sqlGrupogrupoId: TStringField;
    sqlGrupodescricao: TStringField;
    sqlGrupoempresaId: TIntegerField;
    sqlGrupovGrupoId: TStringField;
    sqlSubGrupo: TADOQuery;
    sqlSubGrupogrupoId: TStringField;
    sqlSubGrupodescricao: TStringField;
    sqlSubGrupoempresaId: TIntegerField;
    sqlSubGrupovGrupoId: TStringField;
    sqlEmpresa: TADOQuery;
    sqlEmpresaempresaId: TAutoIncField;
    sqlEmpresarazaoSocial: TStringField;
    sqlEmpresanomeFantasia: TStringField;
    sqlEmpresachave: TMemoField;
    sqlEmpresapessoaId: TIntegerField;
    sqlEmpresalogotipo: TBlobField;
    sqlLocal: TADOQuery;
    sqlLocallocalId: TStringField;
    sqlLocaltitulo: TStringField;
    sqlLocalvLocalId: TStringField;
    sqlLocalpessoaId: TIntegerField;
    sqlSubLocal: TADOQuery;
    sqlSubLocallocalId: TStringField;
    sqlSubLocaltitulo: TStringField;
    sqlSubLocalvLocalId: TStringField;
    sqlSubLocalpessoaId: TIntegerField;
    sqlPessoa: TADOQuery;
    sqlPessoapessoaId: TAutoIncField;
    sqlPessoanome: TStringField;
    sqlPessoatipo: TSmallintField;
    sqlPessoalogradouro: TStringField;
    sqlPessoamunicipio: TStringField;
    sqlPessoacep: TStringField;
    sqlPessoafornecedor: TBooleanField;
    sqlPessoausuario: TBooleanField;
    sqlPessoacnpjCpf: TStringField;
    sqlFornecedor: TADOQuery;
    sqlFornecedorfornecedorId: TAutoIncField;
    sqlFornecedorrazaoSocial: TStringField;
    sqlFornecedorcnpj: TStringField;
    sqlFornecedorpessoaId: TIntegerField;
    sqlUsuario: TADOQuery;
    sqlUsuariousuarioId: TAutoIncField;
    sqlUsuariologin: TStringField;
    sqlUsuariosenha: TMemoField;
    sqlUsuariopessoaId: TIntegerField;
    sqlUsuariodesativado: TBooleanField;
    sqlUsuarioAcao: TADOQuery;
    sqlUsuarioAcaousuarioId: TIntegerField;
    sqlUsuarioAcaoacaoId: TIntegerField;
    sqlAcoes: TADOQuery;
    sqlAcoesacaoId: TAutoIncField;
    sqlAcoesdescricao: TStringField;
    sqlAcoesnomeAcao: TStringField;
    sqlvAcoes: TADOQuery;
    sqlvAcoesacaoId: TAutoIncField;
    sqlvAcoesdescricao: TStringField;
    sqlvAcoesnomeAcao: TStringField;
    ApplicationEvents: TApplicationEvents;
    procedure ADOConnectionBeforeConnect(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses uFuncoes, uErro;

{$R *.dfm}

procedure Tdm.ADOConnectionBeforeConnect(Sender: TObject);
begin
  with ADOConnection do
  begin
    Close;
    if FileExists(Concat(ExtractFilePath(Application.ExeName), 'dbxcon.udl')) then
		begin
      ConnectionString := Concat(	'FILE NAME=',
																	ExtractFilePath(Application.ExeName)
                                 ,'dbxcon.udl');
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

procedure Tdm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
	with TfrmErro.Create(Application) do
  begin
  	try
    	memErro.Text := E.Message;
    	ShowModal;
    finally
    	Free;
    end;
  end;
end;

end.
