unit uTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls, FMTBcd;

type
  TfrmTransferencia = class(TForm)
    ADOConnection: TADOConnection;
    PageControl1: TPageControl;
    tsBens: TTabSheet;
    tsGrupos: TTabSheet;
    tsSubGrupos: TTabSheet;
    tsOrgao: TTabSheet;
    tsUnidades: TTabSheet;
    OpenDialog: TOpenDialog;
    tbBens: TADOTable;
    tbGrupos: TADOTable;
    tbSubGrupos: TADOTable;
    tbOrgaos: TADOTable;
    tbUnidades: TADOTable;
    tbGruposgrupoId: TWideStringField;
    tbGruposdescricao: TWideStringField;
    tbGruposempresaId: TIntegerField;
    tbSubGruposgrupoId: TWideStringField;
    tbSubGruposdescricao: TWideStringField;
    tbSubGruposempresaId: TIntegerField;
    tbSubGruposvGrupoId: TWideStringField;
    tbOrgaoslocalId: TWideStringField;
    tbOrgaostitulo: TWideStringField;
    tbOrgaosempresaId: TIntegerField;
    tbUnidadeslocalId: TWideStringField;
    tbUnidadestitulo: TWideStringField;
    tbBensbemId: TAutoIncField;
    tbBensidenficacao: TWideStringField;
    tbBensdescricao: TWideStringField;
    tbBensgrupoId: TWideStringField;
    tbBensestadoId: TWideStringField;
    tbBenslocalId: TWideStringField;
    tbBensgestaoId: TIntegerField;
    tbBensvalor: TBCDField;
    tbBenstipoIdentificacao: TIntegerField;
    tbBenssubgrupoId: TWideStringField;
    tbBenssubLocalId: TWideStringField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    dsBens: TDataSource;
    dsGrupos: TDataSource;
    dsSubGrupos: TDataSource;
    dsOrgaos: TDataSource;
    dsUnidades: TDataSource;
    Panel1: TPanel;
    btnImportarbem: TButton;
    Panel2: TPanel;
    btnImportarGrupo: TButton;
    Panel3: TPanel;
    btnImportarSubGrupo: TButton;
    Panel4: TPanel;
    btnImportarOrgao: TButton;
    Panel5: TPanel;
    btnImportarUnidade: TButton;
    Panel6: TPanel;
    edtArquivo: TEdit;
    Label1: TLabel;
    btnSelecionar: TButton;
    btnConectar: TButton;
    pbGrupos: TProgressBar;
    pbSubGrupos: TProgressBar;
    pbOrgao: TProgressBar;
    pbUnidades: TProgressBar;
    pbBens: TProgressBar;
    btLimparGrupo: TButton;
    btnLimparLocais: TButton;
    btnLimparBens: TButton;
    tbUnidadesvLocalId: TWideStringField;
    tsFornecedor: TTabSheet;
    tsGestao: TTabSheet;
    Panel7: TPanel;
    btnImportaFornecedor: TButton;
    pbFornecedor: TProgressBar;
    btnApagarFornecedor: TButton;
    dsFornecedor: TDataSource;
    DBGrid6: TDBGrid;
    tbFornecedor: TADOTable;
    tbFornecedorpessoaId: TAutoIncField;
    tbFornecedornome: TWideStringField;
    tbFornecedortipo: TSmallintField;
    tbFornecedorcnpjCpf: TWideStringField;
    tbGestao: TADOTable;
    dsGestao: TDataSource;
    tbGestaogestaoId: TWideStringField;
    tbGestaonome: TWideStringField;
    DBGrid7: TDBGrid;
    Panel8: TPanel;
    Button1: TButton;
    pbGestao: TProgressBar;
    Button2: TButton;
    tbBensquantidade: TIntegerField;
    tbBenstipoAquisicao: TIntegerField;
    tbBensfornecedorId: TIntegerField;
    procedure btnConectarClick(Sender: TObject);
    procedure btnImportarGrupoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImportarSubGrupoClick(Sender: TObject);
    procedure btnImportarOrgaoClick(Sender: TObject);
    procedure btnImportarUnidadeClick(Sender: TObject);
    procedure btnImportarbemClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btLimparGrupoClick(Sender: TObject);
    procedure btnLimparLocaisClick(Sender: TObject);
    procedure btnLimparBensClick(Sender: TObject);
    procedure btnImportaFornecedorClick(Sender: TObject);
    procedure btnApagarFornecedorClick(Sender: TObject);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
		{ Private declarations }
		procedure insertGrupo(grupoId : String; descricao : String; 
			empresaId : Integer; vGrupoId : String);
		procedure insertLocal(localId : String; titulo : String; vLocalId : String;
			pessoaId : Integer);
		procedure InsertBem(idenficacao : String;
												descricao : String;
												grupoId : String;
												subgrupoId : String;
												estadoId : Integer;
												localId : String;
												subLocalId : String;
												gestaoId : Integer;
												valor : Currency  = 0;
												tipoIdentificacao : Integer = 1;
												tipoAquisicao : Integer  = 1;
												quantidade : Real = 1;
												fornecedorId : Integer = -1);
		procedure InsertFornecedor(nome : String; cnpj : String);
		procedure InsertAquisicaoBem(	bemId : Integer; fornecedorId : Integer;
																	numeroNota : String);
		procedure InsertGestao(gestao : String);
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

uses uDm, uGlobais, uFuncoes;

{$R *.dfm}

{ TfrmTransferência }

procedure TfrmTransferencia.btLimparGrupoClick(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
      CommandText :=  'delete grupo';
			Execute;
			Application.MessageBox('Todos o grupos foram apagados com sucesso!', 
															PChar(Application.Title),
															MB_ICONASTERISK);
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.btnApagarFornecedorClick(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete fornecedor';
			Execute();
			Application.MessageBox('Todos o fornecedores foram apagados com sucesso!', 
															PChar(Application.Title),
															MB_ICONASTERISK);
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.btnConectarClick(Sender: TObject);
begin
	with ADOConnection do
	begin
		Close;
		ConnectionString := Concat(	'Provider=Microsoft.Jet.OLEDB.4.0;',
																'Data Source=',
																edtArquivo.Text,';',
																'Persist Security Info=False;');
	end;
	tbBens.Open;
	tbGrupos.Open;
	tbSubGrupos.Open;
	tbOrgaos.Open;
	tbUnidades.Open;
	tbFornecedor.Open;
	tbGestao.Open;
end;

procedure TfrmTransferencia.btnImportaFornecedorClick(Sender: TObject);
begin
	with tbFornecedor do
	begin
		if Active then
		begin
		pbFornecedor.Max := RecordCount;
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					InsertFornecedor(tbFornecedornome.Value, tbFornecedorcnpjCpf.Value);
					pbFornecedor.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Fornecedores conclúida!!');
end;

procedure TfrmTransferencia.btnImportarbemClick(Sender: TObject);
var
	gestaoId : Integer;
begin
	gestaoId := 0;
	with tbBens do
	begin
		if Active then
		begin
		pbBens.Max := RecordCount;
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					if not(tbBensgestaoId.IsNull) then
					begin
						if tbGestao.Locate('gestaoId', tbBensgestaoId.Value, [loCaseInsensitive]) then
						begin
							gestaoId := getGestaoId(tbGestaonome.Value);
						end;
					end;
					InsertBem(tbBensidenficacao.Value,
										tbBensdescricao.Value,
										tbBensgrupoId.Value,
										tbBenssubgrupoId.Value,
										StrToInt(Trim(tbBensestadoId.Value)),
										tbBenslocalId.Value,
										tbBenssubLocalId.Value,
										gestaoId,
										tbBensvalor.Value,
										tbBenstipoIdentificacao.Value,
										tbBenstipoAquisicao.Value,
										tbBensquantidade.Value,
										tbBensfornecedorId.Value);
					pbBens.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Bens conclúida!!');
end;

procedure TfrmTransferencia.btnImportarGrupoClick(Sender: TObject);
begin
	with tbGrupos do
	begin
		pbGrupos.Max := RecordCount;
		if Active then
		begin
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					insertGrupo(	tbGruposgrupoId.Value, 
												tbGruposdescricao.Value,
												tbGruposempresaId.Value,
												'0');
					pbGrupos.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Grupos conclúida!!');
end;

procedure TfrmTransferencia.btnImportarOrgaoClick(Sender: TObject);
begin
	with tbOrgaos do
	begin
		if Active then
		pbOrgao.Max := RecordCount;
		begin
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					insertLocal(tbOrgaoslocalId.Value,
											tbOrgaostitulo.Value,
											'0',
											0);
					pbOrgao.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Orgãos conclúida!!');
end;

procedure TfrmTransferencia.btnImportarSubGrupoClick(Sender: TObject);
begin
	with tbSubGrupos do
	begin
		if Active then
		begin
		pbSubGrupos.Max := RecordCount;
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					insertGrupo(	tbSubGruposgrupoId.Value, 
												tbSubGruposdescricao.Value,
												tbSubGruposempresaId.Value,
												tbSubGruposvGrupoId.Value);
					pbSubGrupos.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Sub-Grupos conclúida!!');
end;

procedure TfrmTransferencia.btnImportarUnidadeClick(Sender: TObject);
begin
	with tbUnidades do
	begin
		if Active then
		begin
		pbUnidades.Max := RecordCount;
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
					insertLocal(tbUnidadeslocalId.Value,
											tbUnidadestitulo.Value,
											tbUnidadesvLocalId.AsString,
											0);
					pbUnidades.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Unidades conclúida!!');
end;

procedure TfrmTransferencia.btnSelecionarClick(Sender: TObject);
begin
	OpenDialog.Execute();
	edtArquivo.Text := OpenDialog.FileName;
end;

procedure TfrmTransferencia.Button1Click(Sender: TObject);
begin
	with tbGestao do
	begin
		if Active then
		begin
		pbGestao.Max := RecordCount;
			if not(IsEmpty) then
			begin
				First;
				while not(Eof) do
				begin
          InsertGestao(tbGestaonome.Value);
					pbGestao.Position := RecNo;
					Next;
				end;
			end;
		end;
	end;
	ShowMessage('Importação de Gestão conclúida!!');
end;

procedure TfrmTransferencia.Button2Click(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete gestao';
			Execute;
			Application.MessageBox('Todos as gestões foram apagados com sucesso!', 
															PChar(Application.Title),
															MB_ICONASTERISK);
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.btnLimparBensClick(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
	begin
		try
			// Remove Itens da transferencia.
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete transferenciaBem';
			Execute;
			// Remove transferencia.
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete transferencia';
			Execute;
    	// Apagar informações de aquisição.
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete bemAquisicao';
			Execute;
    	// Apagar bens
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete bem';
			Execute;
			Application.MessageBox('Todos o bens foram apagados com sucesso!', 
															PChar(Application.Title),
															MB_ICONASTERISK);
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.btnLimparLocaisClick(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			CommandText := 'delete local';
			Execute();
			Application.MessageBox('Todos o locais foram apagados com sucesso!', 
															PChar(Application.Title),
															MB_ICONASTERISK);
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid1DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid2DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid3DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid4DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid5DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid6DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.DBGrid7DrawColumnCell(Sender: TObject;
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
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmTransferencia.FormShow(Sender: TObject);
begin
	tsGrupos.Show;
end;

procedure TfrmTransferencia.InsertAquisicaoBem(bemId: Integer; 
	fornecedorId: Integer; numeroNota: String);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('insert into bemAquisicao(bemId, data, dataNota, fornecedorId, numeroNota)');
				SQL.Add('values(:bemId, :data, :dataNota, :fornecedorId, :numeroNota)');
				with Parameters do
				begin
					ParamByName('bemId').Value        := bemId;
					ParamByName('data').Value         := Now;
					ParamByName('dataNota').Value     := Now;
					ParamByName('fornecedorId').Value := fornecedorId;
					ParamByName('numeroNota').Value   := numeroNota;
				end;
				ExecSQL;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.InsertBem(idenficacao, descricao, grupoId,
  subgrupoId: String; estadoId: Integer; localId, subLocalId: String;
	gestaoId: Integer; valor: Currency; tipoIdentificacao, tipoAquisicao: Integer;
	quantidade: Real; fornecedorId : Integer);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				with SQL do
				begin
					Clear;
					Add('insert into bem(idenficacao, descricao ,grupoId, estadoId, localId, ');
					Add('gestaoId, valor, tipoIdentificacao, subgrupoId, ');
					Add('subLocalId, tipoAquisicao, quantidade) ');
					Add('Values (:idenficacao, :descricao, :grupoId, :estadoId, :localId, ');
					Add(':gestaoId, :valor, :tipoIdentificacao, :subgrupoId, ');
					Add(':subLocalId, :tipoAquisicao, :quantidade)');
				end;
				with Parameters do
				begin
					ParamByName('idenficacao').Value        := idenficacao;
					ParamByName('descricao').Value          := descricao;
					ParamByName('grupoId').Value            := grupoId;
					ParamByName('estadoId').Value           := estadoId;
					ParamByName('localId').Value            := localId;
					ParamByName('gestaoId').Value           := gestaoId;
					ParamByName('valor').Value              := valor;
					ParamByName('tipoIdentificacao').Value  := tipoIdentificacao;
					ParamByName('subgrupoId').Value         := subgrupoId;
					ParamByName('subLocalId').Value         := subLocalId;
					ParamByName('tipoAquisicao').Value      := tipoAquisicao;
					ParamByName('quantidade').Value         := quantidade;
				end;
				ExecSQL();
				if not(fornecedorId = 0) then
				begin
					with tbFornecedor do
					begin
						if Locate('pessoaId', fornecedorId, [loCaseInsensitive]) then
						begin
							InsertAquisicaoBem(	getLastId, 
																	GetFornecedorId(tbFornecedornome.Value),
																	'Não Informado');
							;
						end;
					end;
				end;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.InsertFornecedor(nome, cnpj: String);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('insert into fornecedor(razaoSocial, cnpj)');
				SQL.Add('values(:razaoSocial, :cnpj)');
				Parameters.ParamByName('razaoSocial').Value := nome;
				Parameters.ParamByName('cnpj').Value        := cnpj;
				ExecSQL;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.InsertGestao(gestao: String);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('insert into gestao (gestao)');
				SQL.Add('values (:gestao)');
				with Parameters do
				begin
					ParamByName('gestao').Value    := gestao;
				end;
				ExecSQL();
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.insertGrupo(grupoId, descricao: String;
	empresaId: Integer; vGrupoId: String);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('insert into grupo (grupoId, descricao, empresaId, vGrupoId)');
				SQL.Add('values (:grupoId, :descricao, :empresaId, :vGrupoId)');
				with Parameters do
				begin
					ParamByName('grupoId').Value    := grupoId;
					ParamByName('descricao').Value  := descricao;
					ParamByName('empresaId').Value  := empresaId;
					ParamByName('vGrupoId').Value   := vGrupoId;
				end;
				ExecSQL();
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure TfrmTransferencia.insertLocal(localId, titulo, vLocalId: String;
	pessoaId: Integer);
begin
	with TADOQuery.Create(Self) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('insert into local (localId, titulo, vLocalId, pessoaId)');
				SQL.Add('values (:localId, :titulo, :vLocalId, :pessoaId)');
				with Parameters do
				begin
					ParamByName('localId').Value    := localId;
					ParamByName('titulo').Value  := titulo;
					ParamByName('vLocalId').Value  := vLocalId;
					ParamByName('pessoaId').Value   := pessoaId;
				end;
				ExecSQL();
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

end.
