unit uLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBClient, Provider, Grids,
  DBGrids, Mask, DBCtrls, ToolWin, pngimage, untWaterEffect;

type
  TfrmLocal = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    tsInformacao: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    dsLocal: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    titulo: TDBEdit;
    dsAuxLocal: TDataSource;
    dsPessoa: TDataSource;
    Label3: TLabel;
    pessoaId: TDBLookupComboBox;
    cdsAuxLocal: TClientDataSet;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoapessoaId: TIntegerField;
    cdsPessoanome: TStringField;
    cdsLocal: TClientDataSet;
    cdsLocaltitulo: TStringField;
    cdsLocalpessoaId: TIntegerField;
    dspLocal: TDataSetProvider;
    pnLateral: TPanel;
    imgLateral: TImage;
    Timer: TTimer;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dbgUnidades: TDBGrid;
    lblUnidades: TLabel;
    cdsAuxLocalpessoaNome: TStringField;
    dpsLocalAux: TDataSetProvider;
    DBNavigator1: TDBNavigator;
    cdsLocallocalId: TStringField;
    cdsLocalvLocalId: TStringField;
    cdsAuxLocallocalId: TStringField;
    cdsAuxLocalvLocalId: TStringField;
    Label1: TLabel;
    localId: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dspLocalAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cdsLocalAfterEdit(DataSet: TDataSet);
    procedure cdsAuxLocalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAuxLocalAfterDelete(DataSet: TDataSet);
    procedure cdsAuxLocalAfterPost(DataSet: TDataSet);
    procedure dbgUnidadesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txtPesquisaChange(Sender: TObject);
    procedure pcGeralChange(Sender: TObject);
  private
		{ Private declarations }
		_empresaId : Integer;
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
		_localId : String;
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
	cdsLocal.CommandText := 'select * from local where vLocalId = 0';
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
			if not(IsEmpty) then
			begin
				Delete;
				ApplyUpdates(-1);
			end;
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
	with cdsAuxLocal do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
	with cdsLocal do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate('localId', _localId, [loCaseInsensitive]);
	end;
end;

procedure TfrmLocal.btnNovoClick(Sender: TObject);
begin
	with cdsLocal do
	begin
		Append;
		tsInformacao.Show;
		titulo.SetFocus;
	end;
end;

procedure TfrmLocal.cdsAuxLocalAfterDelete(DataSet: TDataSet);
begin
	cdsLocal.Edit;
end;

procedure TfrmLocal.cdsAuxLocalAfterPost(DataSet: TDataSet);
begin
	cdsLocal.Edit;
end;

procedure TfrmLocal.cdsAuxLocalReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

procedure TfrmLocal.cdsLocalAfterEdit(DataSet: TDataSet);
begin
	_localId := cdsLocallocalId.AsString;
end;

procedure TfrmLocal.cdsLocalReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
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

procedure TfrmLocal.dbgUnidadesDrawColumnCell(Sender: TObject;
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

procedure TfrmLocal.dsLocalDataChange(Sender: TObject; Field: TField);
begin
	if cdsLocal.IsEmpty then
	begin
		Caption := 'Cadastro de locais';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Local - ', cdsLocaltitulo.AsString);
		tsInformacao.Caption := Concat('Local - ',cdsLocaltitulo.AsString);
	end;
end;

procedure TfrmLocal.dsLocalStateChange(Sender: TObject);
begin
	with cdsLocal do
	begin
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnApagar.Enabled   := not(State in [dsInsert, dsEdit]);
		dbgUnidades.Visible := not(State in [dsInsert]);
		lblUnidades.Visible := not(State in [dsInsert]);
		localId.Enabled     := not(State in [dsEdit, dsBrowse]);
		if State in [dsInsert] then
		begin
			Caption := 'Novo registro';
		end;
	end;
end;

procedure TfrmLocal.dspLocalAfterUpdateRecord(Sender: TObject;
	SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
	_localId := cdsLocallocalId.AsString;
end;

procedure TfrmLocal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmLocal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	// Fecha tabelas
  with 	dsAuxLocal.DataSet do
  begin
		if State in [dsInsert, dsEdit] then
			Cancel;
    Close;
  end;
	with dsLocal.DataSet do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
	dsPessoa.DataSet.Close;
end;

procedure TfrmLocal.FormCreate(Sender: TObject);
begin

	bmp := TBitmap.Create;
	bmp.Assign(imgLateral.Picture.Graphic);
	imgLateral.Picture.Graphic := nil;
	imgLateral.Picture.Bitmap.Height  := bmp.Height;
	imgLateral.Picture.Bitmap.Width   := bmp.Width;
	Water := TWaterEffect.Create;
	Water.SetSize(bmp.Width, bmp.Height);
	xImage := imgLateral.Height;
end;

procedure TfrmLocal.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmLocal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmLocal.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmLocal.imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmLocal.pcGeralChange(Sender: TObject);
begin
	btnApagar.Visible := (tsPesquisa.Showing);
end;

procedure TfrmLocal.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral,'Cadastro de locais',Application.Title,Self.Height - 50,30);
end;

procedure TfrmLocal.txtPesquisaChange(Sender: TObject);
begin
	with cdsLocal do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('titulo', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
