unit uTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls, FMTBcd,
  SqlExpr;

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
    tbUnidadesvLocalId: TIntegerField;
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
												quantidade : Real = 1);
												
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

uses uDm, uGlobais;

{$R *.dfm}

{ TfrmTransferência }

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
end;

procedure TfrmTransferencia.btnImportarbemClick(Sender: TObject);
begin
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
					InsertBem(tbBensidenficacao.Value,
										tbBensdescricao.Value,
										tbBensgrupoId.Value,
										tbBenssubgrupoId.Value,
										StrToInt(Trim(tbBensestadoId.Value)),
										tbBenslocalId.Value,
										tbBenssubLocalId.Value,
										tbBensgestaoId.Value,
										0,
										tbBenstipoIdentificacao.Value,
										1,
										1);
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

procedure TfrmTransferencia.InsertBem(idenficacao, descricao, grupoId,
  subgrupoId: String; estadoId: Integer; localId, subLocalId: String;
  gestaoId: Integer; valor: Currency; tipoIdentificacao, tipoAquisicao: Integer;
  quantidade: Real);
begin
	with TSQLQuery.Create(Self) do
	begin
		try
			try
				Close;
				SQLConnection := dm.SQLConnection;
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
				with Params do
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
	with TSQLQuery.Create(Self) do
	begin
		try
			try
				Close;
				SQLConnection := dm.SQLConnection;
				SQL.Clear;
				SQL.Add('insert into grupo (grupoId, descricao, empresaId, vGrupoId)');
				SQL.Add('values (:grupoId, :descricao, :empresaId, :vGrupoId)');
				with Params do
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
	with TSQLQuery.Create(Self) do
	begin
		try
			try
				Close;
				SQLConnection := dm.SQLConnection;
				SQL.Clear;
				SQL.Add('insert into local (localId, titulo, vLocalId, pessoaId)');
				SQL.Add('values (:localId, :titulo, :vLocalId, :pessoaId)');
				with Params do
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
