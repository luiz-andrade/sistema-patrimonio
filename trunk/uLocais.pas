unit uLocais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBClient, Provider, Grids,
  DBGrids, Mask, DBCtrls, ToolWin;

type
  TfrmLocais = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    tsInformacao: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    btnPesquisar: TSpeedButton;
    dsLocal: TDataSource;
    cdsLocal: TClientDataSet;
    dpsLocal: TDataSetProvider;
    DBGrid1: TDBGrid;
    cdsLocallocalId: TIntegerField;
    cdsLocaltitulo: TStringField;
    cdsLocalvLocalId: TIntegerField;
    cdsLocalpessoaId: TIntegerField;
    pnAcoes: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
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
  private
		{ Private declarations }
		_empresaId : Integer;
  public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmLocais: TfrmLocais;

implementation

uses uFuncoes, uDm, uGlobais;

{$R *.dfm}

procedure TfrmLocais.btnApagarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',FieldByName('titulo').AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
    end;
	end;
end;

procedure TfrmLocais.btnCancelarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Cancel;
	end;
end;

procedure TfrmLocais.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocais.btnGravarClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Post;
		ApplyUpdates(-1);
	end;
end;

procedure TfrmLocais.btnNovoClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Append;
		FieldByName('vLocalId').Value := 0;
		FieldByName('pessoaId').Value := 1;
	end;
end;

procedure TfrmLocais.cdsLocalReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_ICONERROR);
	Action := raAbort;
end;

constructor TfrmLocais.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	cdsLocal.Open;
end;

procedure TfrmLocais.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmLocais.dsLocalDataChange(Sender: TObject; Field: TField);
begin
	Caption := cdsLocaltitulo.AsString;
	tsInformacao.Caption := cdsLocaltitulo.AsString;
end;

procedure TfrmLocais.dsLocalStateChange(Sender: TObject);
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

procedure TfrmLocais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmLocais.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	cdsLocal.Close;
end;

procedure TfrmLocais.FormPaint(Sender: TObject);
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
