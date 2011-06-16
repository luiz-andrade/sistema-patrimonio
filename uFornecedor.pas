unit uFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, DBCtrls, Mask, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, DB, DBClient, Provider, untWaterEffect;

type
  TfrmFornecedor = class(TForm)
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    pnLateral: TPanel;
    imgLateral: TImage;
    dsFornecedor: TDataSource;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    cdsFornecedorfornecedorId: TAutoIncField;
    cdsFornecedorrazaoSocial: TStringField;
    cdsFornecedorcnpj: TStringField;
    Timer: TTimer;
    Label1: TLabel;
    fornecedorId: TDBEdit;
    Label2: TLabel;
    razaoSocial: TDBEdit;
    Label3: TLabel;
    cnpj: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dspFornecedorAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure txtPesquisaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure cdsFornecedorAfterEdit(DataSet: TDataSet);
    procedure cdsFornecedorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsFornecedorDataChange(Sender: TObject; Field: TField);
    procedure dsFornecedorStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
		_empresaId : Integer;
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
		_fornecedorId : Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; empresaId: Integer);reintroduce;overload;
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses uDm, uFuncoes;

{$R *.dfm}

procedure TfrmFornecedor.btnApagarClick(Sender: TObject);
begin
	with cdsFornecedor do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsFornecedorrazaoSocial.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmFornecedor.btnCancelarClick(Sender: TObject);
begin
	with cdsFornecedor do
	begin
		Cancel;
	end;
end;

procedure TfrmFornecedor.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmFornecedor.btnGravarClick(Sender: TObject);
begin
	with cdsFornecedor do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate('fornecedorId', _fornecedorId, [loCaseInsensitive]);
	end;
end;

procedure TfrmFornecedor.btnNovoClick(Sender: TObject);
begin
	with cdsFornecedor do
	begin
		Append;
		tsInformacao.Show;
		razaoSocial.SetFocus;
	end;
end;

procedure TfrmFornecedor.cdsFornecedorAfterEdit(DataSet: TDataSet);
begin
	_fornecedorId := cdsFornecedorfornecedorId.Value;
end;

procedure TfrmFornecedor.cdsFornecedorReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmFornecedor.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	cdsfornecedor.CommandText := 'select * from fornecedor';
	cdsfornecedor.Open;
end;

procedure TfrmFornecedor.dsFornecedorDataChange(Sender: TObject; Field: TField);
begin
	if cdsFornecedor.IsEmpty then
	begin
		Caption := 'Cadastro de fornecedores';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Fornecedor - ', cdsFornecedorrazaoSocial.AsString);
		tsInformacao.Caption := Concat('Fornecedor - ', cdsFornecedorrazaoSocial.AsString);
	end;
end;

procedure TfrmFornecedor.dsFornecedorStateChange(Sender: TObject);
begin
	with cdsFornecedor do
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

procedure TfrmFornecedor.dspFornecedorAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
	if cdsFornecedorfornecedorId.IsNull then
  _fornecedorId := getLastId;
end;

procedure TfrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmFornecedor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	with cdsFornecedor do
  begin
  	if State in [dsInsert, dsEdit] then
  		Cancel;
    Close;
  end;
end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);
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

procedure TfrmFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmFornecedor.imgLateralMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmFornecedor.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral, 'Cadastro Fornecedores',Application.Title,Self.Height - 50,30);
end;

procedure TfrmFornecedor.txtPesquisaChange(Sender: TObject);
begin
	with cdsFornecedor do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('razaoSocial', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
