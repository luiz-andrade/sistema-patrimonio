unit uBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls, DB, Provider,
  DBClient, Mask, DBCtrls, pngimage, untWaterEffect, uControlsTunning;

type
  TfrmBem = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    btnPesquisar: TSpeedButton;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    dsBem: TDataSource;
		cdsBem: TClientDataSet;
    dspBem: TDataSetProvider;
    cdsBembemId: TIntegerField;
    cdsBemidenficacao: TStringField;
    cdsBemdescricao: TStringField;
    cdsBemgrupoId: TIntegerField;
    cdsBemestadoId: TIntegerField;
    cdsBemlocaId: TIntegerField;
    cdsBemgestaoId: TIntegerField;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    idenficacao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtGrupo: TDBEdit;
    Label5: TLabel;
    edtEstado: TDBEdit;
    Label6: TLabel;
    edtLocalizacao: TDBEdit;
    Label7: TLabel;
    editGestao: TDBEdit;
    dbmDescricao: TDBMemo;
    tsAquisicao: TTabSheet;
    dblGrupo: TDBLookupComboBox;
    dblEstado: TDBLookupComboBox;
    dblLocal: TDBLookupComboBox;
    dblGestao: TDBLookupComboBox;
    dsGrupo: TDataSource;
    dsEstado: TDataSource;
    dsLocalizacao: TDataSource;
		dsGestao: TDataSource;
    cdsGrupo: TClientDataSet;
    cdsEstado: TClientDataSet;
    cdsLocalizacao: TClientDataSet;
    cdsGestao: TClientDataSet;
    dspGrupo: TDataSetProvider;
    dspEstado: TDataSetProvider;
    dspLocalizacao: TDataSetProvider;
    dspGestao: TDataSetProvider;
    dsAquisicao: TDataSource;
    cdsAquisicao: TClientDataSet;
    dspAquisicao: TDataSetProvider;
    cdsAquisicaobemId: TIntegerField;
    cdsAquisicaodata: TSQLTimeStampField;
		cdsAquisicaodataNota: TSQLTimeStampField;
    cdsAquisicaofornecedorId: TIntegerField;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    dblFornecedor: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    dsFornecedor: TDataSource;
    cdsFornecedor: TClientDataSet;
    dspFornecedor: TDataSetProvider;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    Timer: TTimer;
    pnLateral: TPanel;
    imgLateral: TImage;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsBemStateChange(Sender: TObject);
    procedure dsBemDataChange(Sender: TObject; Field: TField);
    procedure cdsBemReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsBemAfterOpen(DataSet: TDataSet);
		procedure cdsAquisicaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsAquisicaoStateChange(Sender: TObject);
    procedure pcGeralChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	private
		{ Private declarations }
		_empresaId : Integer;
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmBem: TfrmBem;

implementation

uses uFuncoes, uDm, uGlobais;

{$R *.dfm}

procedure TfrmBem.btnApagarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsBemidenficacao.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			with cdsAquisicao do
			begin
				Delete;
				ApplyUpdates(-1);
			end;
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmBem.btnCancelarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Cancel;
		end;
	end;
	with cdsAquisicao do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Cancel;
		end;
	end;
end;

procedure TfrmBem.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmBem.btnGravarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Post;
			ApplyUpdates(-1);
			Close;
			Open;
		end;
	end;
	with cdsAquisicao do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Post;
			ApplyUpdates(-1);
			Close;
			Open;
		end;
	end;
end;

procedure TfrmBem.btnNovoClick(Sender: TObject);
begin
	with cdsBem do
	begin
		Append;
		tsInformacao.Show;
		idenficacao.SetFocus;
	end;
end;

procedure TfrmBem.cdsAquisicaoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

procedure TfrmBem.cdsBemAfterOpen(DataSet: TDataSet);
begin
	cdsAquisicao.Open;
end;

procedure TfrmBem.cdsBemReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmBem.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsBem.DataSet.Open;
	dsGestao.DataSet.Open;
	dsLocalizacao.DataSet.Open;
	dsEstado.DataSet.Open;
	dsGrupo.DataSet.Open;
	dsFornecedor.DataSet.Open;
end;

procedure TfrmBem.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmBem.dsAquisicaoStateChange(Sender: TObject);
begin
	with cdsAquisicao do
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

procedure TfrmBem.dsBemDataChange(Sender: TObject; Field: TField);
begin
	if cdsBem.IsEmpty then
	begin
		Caption := 'Cadastro de Bens';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Bem - ',cdsBemidenficacao.AsString);
		tsInformacao.Caption := Concat('Bem - ',cdsBemidenficacao.AsString);
	end;
end;

procedure TfrmBem.dsBemStateChange(Sender: TObject);
begin
	with cdsBem do
	begin
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnApagar.Enabled   := not(State in [dsInsert, dsEdit]);
		tsAquisicao.TabVisible := not(State in [dsInsert]) and not(IsEmpty);
		if State in [dsInsert] then
		begin
			Caption := 'Novo registro';
		end;
	end;
end;

procedure TfrmBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmBem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	dsBem.DataSet.Close;
	dsAquisicao.DataSet.Close;
	dsGestao.DataSet.Close;
	dsLocalizacao.DataSet.Close;
	dsEstado.DataSet.Close;
	dsGrupo.DataSet.Close;
	dsFornecedor.DataSet.Close;
end;

procedure TfrmBem.FormCreate(Sender: TObject);
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

procedure TfrmBem.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmBem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmBem.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmBem.imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmBem.pcGeralChange(Sender: TObject);
begin
	with pcGeral do
	begin
		pnAcoes.Visible := (ActivePage = tsInformacao) or  (ActivePage = tsAquisicao);
	end;
end;

procedure TfrmBem.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral,'Registro de bens',Application.Title,Self.Height - 50,30);
end;

end.
