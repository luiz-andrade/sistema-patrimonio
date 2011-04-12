unit uGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  Provider, DB, DBClient;

type
  TfrmGrupo = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    btnPesquisar: TSpeedButton;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dsGrupo: TDataSource;
    cdsGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupogrupoId: TIntegerField;
    cdsGrupodescricao: TStringField;
    cdsGrupoempresaId: TIntegerField;
    cdsGrupovGrupoId: TIntegerField;
    Label1: TLabel;
    descricao: TDBEdit;
    Label2: TLabel;
    vGrupoId: TDBLookupComboBox;
    cdsAuxGrupo: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    dsAuxGrupo: TDataSource;
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsGrupoStateChange(Sender: TObject);
    procedure dsGrupoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsGrupoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner: TComponent; empresaId: Integer);reintroduce;overload;
	end;

var
	frmGrupo: TfrmGrupo;

implementation

uses uGlobais, uFuncoes, uDm;

{$R *.dfm}

procedure TfrmGrupo.btnApagarClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsGrupodescricao.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmGrupo.btnCancelarClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		Cancel;
	end;
end;

procedure TfrmGrupo.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmGrupo.btnGravarClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
	with cdsAuxGrupo do
	begin
		Close;
		Open;
  end;
end;

procedure TfrmGrupo.btnNovoClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		Append;
		cdsGrupoempresaId.Value := _empresaId;
		descricao.SetFocus;
	end;
end;

procedure TfrmGrupo.cdsGrupoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmGrupo.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsGrupo.DataSet.Open;
	dsAuxGrupo.DataSet.Open;
end;

procedure TfrmGrupo.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmGrupo.dsGrupoDataChange(Sender: TObject; Field: TField);
begin
	Caption := cdsGrupodescricao.AsString;
	tsInformacao.Caption := cdsGrupodescricao.AsString;
end;

procedure TfrmGrupo.dsGrupoStateChange(Sender: TObject);
begin
	with cdsGrupo do
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

procedure TfrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmGrupo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	// Fecha tabelas.
	dsGrupo.DataSet.Close;
	dsAuxGrupo.DataSet.Close;
end;

procedure TfrmGrupo.FormPaint(Sender: TObject);
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
