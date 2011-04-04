unit uPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  DB, DBClient, Provider;

type
  TfrmPessoa = class(TForm)
		pcGeral: TPageControl;
		tsPesquisa: TTabSheet;
		pnPesquisa: TPanel;
		btnPesquisar: TSpeedButton;
		txtPesquisa: TEdit;
		cbPesquisar: TComboBox;
		DBGrid1: TDBGrid;
		tsInformacao: TTabSheet;
		Label2: TLabel;
		pnAcoes: TPanel;
		btnNovo: TBitBtn;
		btnGravar: TBitBtn;
		btnCancelar: TBitBtn;
		btnApagar: TBitBtn;
		btnFechar: TBitBtn;
    nome: TDBEdit;
    dsPessoa: TDataSource;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoapessoaId: TIntegerField;
    cdsPessoanome: TStringField;
		procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure dsPessoaStateChange(Sender: TObject);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsPessoaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmPessoa: TfrmPessoa;

implementation

uses uFuncoes, uDm, uGlobais;

{$R *.dfm}

procedure TfrmPessoa.btnApagarClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsPessoanome.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmPessoa.btnCancelarClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		Cancel;
	end;
end;

procedure TfrmPessoa.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmPessoa.btnGravarClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;

end;

procedure TfrmPessoa.btnNovoClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		Append;
		nome.SetFocus;
	end;
end;

procedure TfrmPessoa.cdsPessoaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_ICONERROR);
	Action := raAbort;
end;

constructor TfrmPessoa.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	tsPesquisa.Show;
	_empresaId := empresaId;
	// Abre tabelas.
	dsPessoa.DataSet.Open;
end;


procedure TfrmPessoa.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmPessoa.dsPessoaDataChange(Sender: TObject; Field: TField);
begin
	Caption := cdsPessoanome.AsString;
	tsInformacao.Caption := cdsPessoanome.AsString;
end;

procedure TfrmPessoa.dsPessoaStateChange(Sender: TObject);
begin
	with cdsPessoa do
	begin
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnApagar.Enabled   := not(State in [dsInsert, dsEdit]);
		if State in [dsInsert] then
		begin
			Caption := 'Novo registro';
		end;
	end;
end;

procedure TfrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmPessoa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	cdsPessoa.Close;
end;

procedure TfrmPessoa.FormPaint(Sender: TObject);
begin
	with Canvas do
	begin
		Brush.Style := bsSolid;
		Pen.Color := $00804000;
		Brush.Color := clWhite;
		Rectangle(0,1,65,Self.ClientHeight);

		Font.Name  :=   'Arial';
		Font.Color := $00837369;
		Font.Size  := 6;

		Pen.Color := $00804000;
		Brush.Color := $00804000;
		Rectangle(42,55,65,Self.ClientHeight);
	end;
	VerticalText(Self,'Cadastro de locais',Application.Title,Self.Height - 50,30);
end;

end.
