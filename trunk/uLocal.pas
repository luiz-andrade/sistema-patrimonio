unit uLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBClient, Provider, Grids,
  DBGrids, Mask, DBCtrls, ToolWin;

type
  TfrmLocal = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    tsInformacao: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    btnPesquisar: TSpeedButton;
    dsLocal: TDataSource;
    cdsLocal: TClientDataSet;
    dspLocal: TDataSetProvider;
    DBGrid1: TDBGrid;
    cdsLocallocalId: TIntegerField;
    cdsLocaltitulo: TStringField;
    cdsLocalvLocalId: TIntegerField;
    cdsLocalpessoaId: TIntegerField;
    pnAcoes: TPanel;
    Label2: TLabel;
    titulo: TDBEdit;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    dsAuxLocal: TDataSource;
    vLocalId: TDBLookupComboBox;
    dsPessoa: TDataSource;
    Label3: TLabel;
    pessoaId: TDBLookupComboBox;
    cdsAuxLocal: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsLocalDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dsLocalStateChange(Sender: TObject);
    procedure cdsLocalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure btnApagarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
		{ Private declarations }
		_empresaId : Integer;
  public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmLocal: TfrmLocal;

implementation

uses uFuncoes, uDm, uGlobais;

{$R *.dfm}


constructor TfrmLocal.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsLocal.DataSet.Open;
	dsPessoa.DataSet.Open;
	dsAuxLocal.DataSet.Open;
end;

procedure TfrmLocal.btnApagarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsLocaltitulo.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmLocal.btnCancelarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Cancel;
	end;
end;

procedure TfrmLocal.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmLocal.btnGravarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
end;

procedure TfrmLocal.btnNovoClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Append;
		titulo.SetFocus;
	end;
end;

procedure TfrmLocal.cdsLocalReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_ICONERROR);
	Action := raAbort;
end;

procedure TfrmLocal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmLocal.dsLocalDataChange(Sender: TObject; Field: TField);
begin
	Caption := cdsLocaltitulo.AsString;
	tsInformacao.Caption := cdsLocaltitulo.AsString;
end;

procedure TfrmLocal.dsLocalStateChange(Sender: TObject);
begin
	with cdsLocal do
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

procedure TfrmLocal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmLocal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	dsLocal.DataSet.Close;
	dsPessoa.DataSet.Close;
	dsAuxLocal.DataSet.Close;
end;

procedure TfrmLocal.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmLocal.FormPaint(Sender: TObject);
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
