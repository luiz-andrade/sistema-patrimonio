unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBClient, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids, FMTBcd, SqlExpr, ADODB;

type
  TfrmMovimentacao = class(TForm)
    dsMovimentacao: TDataSource;
    cdsMovimentacao: TClientDataSet;
    dpsMovimentacao: TDataSetProvider;
    cdsMovimentacaotransferenciaId: TIntegerField;
    cdsMovimentacaoreceptorId: TIntegerField;
    cdsMovimentacaocedenteId: TIntegerField;
    cdsMovimentacaousuarioId: TIntegerField;
    cdsMovimentacaoconcluida: TBooleanField;
    pnTopo: TPanel;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    dsOrigem: TDataSource;
    cdsOrigem: TClientDataSet;
    dpsOrigem: TDataSetProvider;
    dsDestino: TDataSource;
    cdsDestino: TClientDataSet;
    pgGeral: TPageControl;
    tsConsulta: TTabSheet;
    tsInformacao: TTabSheet;
    Label1: TLabel;
    transferenciaId: TDBEdit;
    Label2: TLabel;
    origemSubLocal: TDBEdit;
    Label3: TLabel;
    destinoSubLocal: TDBEdit;
    Label4: TLabel;
    data: TDBEdit;
    Label7: TLabel;
    usuarioId: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dblOrigemId: TDBLookupComboBox;
    dblLdestinoSubLocal: TDBLookupComboBox;
    dsCedente: TDataSource;
    cdsCedente: TClientDataSet;
    dsReceptor: TDataSource;
    cdsReceptor: TClientDataSet;
    cdsDestinotitulo: TStringField;
    cdsDestinopessoaId: TIntegerField;
    cdsOrigemtitulo: TStringField;
    cdsOrigempessoaId: TIntegerField;
    cdsCedentepessoaId: TIntegerField;
    cdsCedentenome: TStringField;
    cdsCedentetipo: TSmallintField;
    cdsCedentelogradouro: TStringField;
    cdsCedentemunicipio: TStringField;
    cdsCedentecep: TStringField;
    cdsCedentefornecedor: TBooleanField;
    cdsCedenteusuario: TBooleanField;
    cdsReceptorpessoaId: TIntegerField;
    cdsReceptornome: TStringField;
    cdsReceptortipo: TSmallintField;
    cdsReceptorlogradouro: TStringField;
    cdsReceptormunicipio: TStringField;
    cdsReceptorcep: TStringField;
    cdsReceptorfornecedor: TBooleanField;
    cdsReceptorusuario: TBooleanField;
    DBGrid1: TDBGrid;
    pnPesquisa: TPanel;
    btnPesquisar: TSpeedButton;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    btnConcluir: TBitBtn;
    tsBens: TTabSheet;
    pnAcoesProduto: TPanel;
    btnRemover: TBitBtn;
    btnAddBem: TBitBtn;
    ledtIdentificacao: TLabeledEdit;
    dsMovimentacaoBem: TDataSource;
    cdsMovimentacaoBem: TClientDataSet;
    dpsMovimentacaoBem: TDataSetProvider;
    cdsMovimentacaoBemtransferenciaId: TIntegerField;
    cdsMovimentacaoBembemId: TIntegerField;
    DBGrid2: TDBGrid;
    btnNovo: TBitBtn;
    cdsMovimentacaotipo: TSmallintField;
    tipo: TDBRadioGroup;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    cdsMovimentacaoorigemId: TStringField;
    cdsMovimentacaodestinoId: TStringField;
    cdsOrigemlocalId: TStringField;
    cdsOrigemvLocalId: TStringField;
    cdsDestinolocalId: TStringField;
    cdsDestinovLocalId: TStringField;
    cdsMovimentacaoBembemEstadoId: TIntegerField;
    Label5: TLabel;
    Label6: TLabel;
    receptorId: TDBEdit;
    cedenteId: TDBEdit;
    dblCedenteId: TDBLookupComboBox;
    dblReceptorId: TDBLookupComboBox;
    dsOrigemLocal: TDataSource;
    cdsOrigemLocal: TClientDataSet;
    cdsOrigemLocaltitulo: TStringField;
    cdsOrigemLocalpessoaId: TIntegerField;
    cdsOrigemLocallocalId: TStringField;
    cdsOrigemLocalvLocalId: TStringField;
    dspOrigemLocal: TDataSetProvider;
    dblOrigemLocal: TDBLookupComboBox;
    origemId: TDBEdit;
    Label8: TLabel;
    cdsMovimentacaoorigemSubLocal: TStringField;
    cdsMovimentacaodestinoSubLocal: TStringField;
    dpsDestino: TDataSetProvider;
    dsDestinoLocal: TDataSource;
    cdsDestinoLocal: TClientDataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    dpsDestinoLocal: TDataSetProvider;
    destinoId: TDBEdit;
    Label9: TLabel;
    dblDestinoId: TDBLookupComboBox;
    dpsCedente: TDataSetProvider;
    dpsReceptor: TDataSetProvider;
    cdsMovimentacaodata: TDateTimeField;
    sp_finalizaTransferencia: TADOStoredProc;
    dsBem: TDataSource;
    cdsBem: TClientDataSet;
    cdsBembemId: TIntegerField;
    cdsBemidenficacao: TStringField;
    cdsBemdescricao: TStringField;
    cdsBemestadoId: TIntegerField;
    cdsBemtipoIdentificacao: TIntegerField;
    cdsBemgestaoId: TIntegerField;
    cdsBemgrupoId: TStringField;
    cdsBemlocalId: TStringField;
    cdsBemsubgrupoId: TStringField;
    cdsBemsubLocalId: TStringField;
    cdsBemtipoAquisicao: TIntegerField;
    cdsBemquantidade: TFloatField;
    cdsBemvalor: TBCDField;
    dspBem: TDataSetProvider;
    cdsMovimentacaoBemidenficacao: TStringField;
    cdsMovimentacaoBemdescricao: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure dsMovimentacaoStateChange(Sender: TObject);
    procedure btnAddBemClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsOrigemDataChange(Sender: TObject; Field: TField);
    procedure dsDestinoDataChange(Sender: TObject; Field: TField);
    procedure cdsMovimentacaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMovimentacaoBemReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dpsMovimentacaoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dsMovimentacaoDataChange(Sender: TObject; Field: TField);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure cdsMovimentacaoAfterInsert(DataSet: TDataSet);
    procedure ledtIdentificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	private
		{ Private declarations }
		_empresaId : Integer;
		_transferenciaId : Integer;
		procedure AddBem(identificacao : String; origemId : String);
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; 
			empresaId : Integer);reintroduce; overload;
	end;

var
	frmMovimentacao: TfrmMovimentacao;

implementation

uses uDm, uFuncoes, uGlobais;

{$R *.dfm}

{ TfrmMovimentacao }

/// <summary>
///   Adiciona um bem a movimentação.
/// </summary>
procedure TfrmMovimentacao.AddBem(identificacao: String; origemId : String);
begin
	with GetBemByIdentif(identificacao, origemId) do
	begin
		try
			try
				if not(IsEmpty) then
				begin
					cdsMovimentacaoBem.Append;
					cdsMovimentacaoBembemId.Value       := FieldByName('bemId').AsInteger;
          cdsMovimentacaoBembemEstadoId.Value := FieldByName('estadoId').AsInteger;
					cdsMovimentacaoBem.Post;
					cdsMovimentacao.Edit;
				end
				else
				begin
					Application.MessageBox(	'Bem não encontrado, na origem especificada!', 
																	PChar(Application.Title),
																	MB_ICONASTERISK);
				end;
			except
				cdsMovimentacaoBem.Cancel;
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmMovimentacao.btnAddBemClick(Sender: TObject);
begin
	if not(cdsMovimentacaoconcluida.Value) then
  begin
		AddBem(ledtIdentificacao.Text, cdsMovimentacaoorigemSubLocal.AsString);
  end;
end;

procedure TfrmMovimentacao.btnCancelarClick(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		if State in[dsInsert, dsEdit] then
			Cancel;
	end;
	with cdsMovimentacaoBem do
	begin
		if State in[dsInsert, dsEdit] then
			Cancel;
	end;
end;

procedure TfrmMovimentacao.btnConcluirClick(Sender: TObject);
begin
	with sp_finalizaTransferencia do
	begin
		try
			if not(cdsMovimentacaotransferenciaId.IsNull) then
			begin
				_transferenciaId := cdsMovimentacaotransferenciaId.Value;
        Parameters.Refresh;
				Parameters.ParamByName('@transferenciaId').Value := cdsMovimentacaotransferenciaId.Value;
				ExecProc;
				with cdsMovimentacao do
				begin
					Close;
					Open;
					Locate('transferenciaId', _transferenciaId, [loCaseInsensitive]);
				end;
			end;
		except
			raise;
		end;
	end;
end;

procedure TfrmMovimentacao.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmMovimentacao.btnGravarClick(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		if not(cdsMovimentacaotransferenciaId.IsNull) then
			_transferenciaId := cdsMovimentacaotransferenciaId.Value;
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate('transferenciaId', _transferenciaId, [loCaseInsensitive])
	end;
	with cdsMovimentacaoBem do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
end;

procedure TfrmMovimentacao.btnNovoClick(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		try
			Append;
			cdsMovimentacaousuarioId.Value := gUsuarioId;
			cdsMovimentacaoconcluida.Value := False;
			cdsMovimentacaotipo.Value      := 1;
			tsInformacao.Show;
		except
			Cancel;
			raise;
		end;
	end;
end;

procedure TfrmMovimentacao.btnRemoverClick(Sender: TObject);
begin
	with cdsMovimentacaoBem do
	begin
		if not(IsEmpty) then
		begin
			Delete;
			cdsMovimentacao.Edit;
		end;
	end;
end;

procedure TfrmMovimentacao.cdsMovimentacaoAfterInsert(DataSet: TDataSet);
begin
{     cdsMovimentacaoorigemId.Value  := '01';
     cdsMovimentacaoorigemSubLocal.Value  := '01.01';
     cdsMovimentacaodestinoId.Value := '01';
     cdsMovimentacaodestinoSubLocal.Value  := '01.01';
     }
end;

procedure TfrmMovimentacao.cdsMovimentacaoBemReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
	var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

procedure TfrmMovimentacao.cdsMovimentacaoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmMovimentacao.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	// Abre tabela principal.
	cdsMovimentacao.Open;
	cdsMovimentacaoBem.Open;
	// Abre dependências.
  cdsOrigemLocal.Open;
	cdsOrigem.Open;
	cdsReceptor.Open;
	cdsCedente.Open;
  cdsDestinoLocal.Open;
	cdsDestino.Open;
	tsConsulta.Show;
end;

procedure TfrmMovimentacao.dpsMovimentacaoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
	if cdsMovimentacaotransferenciaId.IsNull then
	_transferenciaId := getLastId;
end;

procedure TfrmMovimentacao.dsDestinoDataChange(Sender: TObject; Field: TField);
begin
	// Atribui o id_pessoa para a transação.
	with cdsMovimentacao do
	begin
		if (State in [dsInsert, dsEdit]) {and (cdsMovimentacaoreceptorId.IsNull)} then
		begin
			cdsMovimentacaoreceptorId.Value := cdsDestinopessoaId.Value;
		end;
	end;
end;

procedure TfrmMovimentacao.dsMovimentacaoDataChange(Sender: TObject;
  Field: TField);
begin
	with cdsMovimentacao do
	begin
		btnConcluir.Enabled := 	not(State in [dsInsert, dsEdit]);
		tsBens.TabVisible   := not(State in [dsInsert]) and not(IsEmpty);
	end;
	btnAddBem.Enabled       := not(cdsMovimentacaoconcluida.Value);
	btnRemover.Enabled      := not(cdsMovimentacaoconcluida.Value);
	dsMovimentacao.AutoEdit := not(cdsMovimentacaoconcluida.Value);
	btnConcluir.Visible :=  not(cdsMovimentacaoconcluida.AsBoolean) 
													and not(cdsMovimentacao.IsEmpty);
end;

procedure TfrmMovimentacao.dsMovimentacaoStateChange(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
	end;
end;

procedure TfrmMovimentacao.dsOrigemDataChange(Sender: TObject; Field: TField);
begin
	// Atribui o id_pessoa para a transação.
	with cdsMovimentacao do
	begin
		if (State in [dsInsert, dsEdit]) {and (cdsMovimentacaocedenteId.IsNull)} then
		begin
			cdsMovimentacaocedenteId.Value := cdsOrigempessoaId.Value;
		end;
	end;
end;

procedure TfrmMovimentacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	// Fecha tabela master e dependencias.
	with cdsMovimentacao do
	begin
		if State in [dsEdit, dsInsert] then
			Cancel;
		Close;
	end;
	with cdsMovimentacaoBem do
	begin
		if State in [dsEdit, dsInsert] then
			Cancel;
		Close;
	end;
	cdsReceptor.Close;
	cdsCedente.Close;
	cdsOrigem.Close;
  cdsOrigemLocal.Close;
	cdsDestino.Close;
  cdsDestinoLocal.Close;
end;

procedure TfrmMovimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmMovimentacao.ledtIdentificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not(Trim(TEdit(Sender).Text) = EmptyStr)then
  begin
   btnAddBem.Click;
  end;
end;

end.
