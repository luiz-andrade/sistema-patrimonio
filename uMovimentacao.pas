unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBClient, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids, FMTBcd, SqlExpr, RpDefine, RpCon, RpConDS;

type
  TfrmMovimentacao = class(TForm)
    dsMovimentacao: TDataSource;
    cdsMovimentacao: TClientDataSet;
    dpsMovimentacao: TDataSetProvider;
    cdsMovimentacaotransferenciaId: TIntegerField;
    cdsMovimentacaoorigemId: TIntegerField;
    cdsMovimentacaodestinoId: TIntegerField;
    cdsMovimentacaoreceptorId: TIntegerField;
    cdsMovimentacaocedenteId: TIntegerField;
    cdsMovimentacaousuarioId: TIntegerField;
    cdsMovimentacaoconcluida: TBooleanField;
    pnTopo: TPanel;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    dsOrigem: TDataSource;
    cdsOrigem: TClientDataSet;
    dpsLocal: TDataSetProvider;
    dsDestino: TDataSource;
    cdsDestino: TClientDataSet;
    pgGeral: TPageControl;
    tsConsulta: TTabSheet;
    tsInformacao: TTabSheet;
    Label1: TLabel;
    transferenciaId: TDBEdit;
    Label2: TLabel;
    origemId: TDBEdit;
    Label3: TLabel;
    destinoId: TDBEdit;
    Label4: TLabel;
    data: TDBEdit;
    Label5: TLabel;
    receptorId: TDBEdit;
    Label6: TLabel;
    cedenteId: TDBEdit;
    Label7: TLabel;
    usuarioId: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dblCedenteId: TDBLookupComboBox;
    dblOrigemId: TDBLookupComboBox;
    dblReceptorId: TDBLookupComboBox;
    dblDestinoId: TDBLookupComboBox;
    dpsPessoa: TDataSetProvider;
    dsCedente: TDataSource;
    cdsCedente: TClientDataSet;
    dsReceptor: TDataSource;
    cdsReceptor: TClientDataSet;
    cdsDestinolocalId: TIntegerField;
    cdsDestinotitulo: TStringField;
    cdsDestinovLocalId: TIntegerField;
    cdsDestinopessoaId: TIntegerField;
    cdsOrigemlocalId: TIntegerField;
    cdsOrigemtitulo: TStringField;
    cdsOrigemvLocalId: TIntegerField;
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
    cdsMovimentacaodata: TSQLTimeStampField;
    cdsMovimentacaotipo: TSmallintField;
    tipo: TDBRadioGroup;
    btnCancelar: TBitBtn;
    sp_finalizaTransferencia: TSQLStoredProc;
    cdsMovimentacaoTituloOrigem: TStringField;
    cdsMovimentacaoTituloDestino: TStringField;
    btnImprimir: TBitBtn;
    Label8: TLabel;
    img: TImage;
    cdsMovimentacaoBemDescricaoBem: TStringField;
    rdstMovimentacao: TRvDataSetConnection;
    rdstMovimentacaoBem: TRvDataSetConnection;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsMovimentacaoAfterOpen(DataSet: TDataSet);
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
    procedure tipoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
	private
		{ Private declarations }
		_empresaId : Integer;
		_transferenciaId : Integer;
		procedure AddBem(bemId : Integer; origemId : Integer);
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
procedure TfrmMovimentacao.AddBem(bemId: Integer; origemId : Integer);
begin
	with GetBemById(bemId, origemId) do
	begin
		try
			try
				if not(IsEmpty) then
				begin
					cdsMovimentacaoBem.Append;
					cdsMovimentacaoBembemId.Value := FieldByName('bemId').AsInteger;
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
	AddBem(StrToInt(ledtIdentificacao.Text), cdsMovimentacaoorigemId.Value);
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
				Params.ParamByName('@transferenciaId').Value := cdsMovimentacaotransferenciaId.Value;
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

procedure TfrmMovimentacao.cdsMovimentacaoAfterOpen(DataSet: TDataSet);
begin
	// Abre dependências.
	cdsMovimentacaoBem.Open;
	cdsReceptor.Open;
	cdsCedente.Open;
	cdsOrigem.Open;
	cdsDestino.Open;
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
	tsConsulta.Show;
end;

procedure TfrmMovimentacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	with TDBGrid(Sender) do
	begin
		with Canvas do
		begin
			if not(gdSelected in State) then
			begin
				with DataSource.DataSet do
				begin
					if not(Odd(RecNo)) then
					begin
						Brush.Color := corZebra;
					end;
					if FieldByName('concluida').AsBoolean then
					begin
						Font.Color := clGreen;
					end
					else
					begin
						Font.Color := clRed;
					end;
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
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
		btnConcluir.Enabled := 	not(State in [dsInsert, dsEdit]) 
														and not(cdsMovimentacaoBem.IsEmpty) 
														and not(cdsMovimentacaoconcluida.Value);
	end;
	btnAddBem.Enabled       := not(cdsMovimentacaoconcluida.Value);
	btnRemover.Enabled      := not(cdsMovimentacaoconcluida.Value);
	dsMovimentacao.AutoEdit := not(cdsMovimentacaoconcluida.Value);
end;

procedure TfrmMovimentacao.dsMovimentacaoStateChange(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		tsBens.TabVisible   := not(State in [dsInsert]) and not(IsEmpty);
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
	cdsDestino.Close;
end;

procedure TfrmMovimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmMovimentacao.tipoChange(Sender: TObject);
begin
	receptorId.Enabled     := (cdsMovimentacaotipo.Value = 2);
	dblReceptorId.Enabled  := (cdsMovimentacaotipo.Value = 2);
	destinoId.Enabled      := not(cdsMovimentacaotipo.Value = 2);
	dblDestinoId.Enabled   := not(cdsMovimentacaotipo.Value = 2);
	if cdsMovimentacao.State in[dsInsert,dsEdit] then
		cdsMovimentacaodestinoId.Value := cdsMovimentacaoorigemId.Value;
end;

end.
