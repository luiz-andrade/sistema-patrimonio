unit uGestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Provider, pngimage, Grids, DBGrids, StdCtrls,
  ComCtrls, Buttons, Mask, DBCtrls, untWaterEffect;

type
  TfrmGestao = class(TForm)
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
    dsGestao: TDataSource;
    dspGestao: TDataSetProvider;
    cdsGestao: TClientDataSet;
    Timer: TTimer;
    cdsGestaogestaoId: TAutoIncField;
    cdsGestaogestao: TStringField;
    Label1: TLabel;
    gestaoId: TDBEdit;
    Label2: TLabel;
    gestao: TDBEdit;
    procedure TimerTimer(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsGestaoDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure dsGestaoStateChange(Sender: TObject);
    procedure txtPesquisaChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dspGestaoAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cdsGestaoAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
		_empresaId : Integer;
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
		_gestaoId : Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; empresaId: Integer);reintroduce;overload;
  end;

var
  frmGestao: TfrmGestao;

implementation

uses uFuncoes, uDm;

{$R *.dfm}

procedure TfrmGestao.btnApagarClick(Sender: TObject);
begin
	with cdsGestao do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsGestaogestao.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmGestao.btnCancelarClick(Sender: TObject);
begin
	with cdsGestao do
	begin
		Cancel;
	end;
end;

procedure TfrmGestao.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmGestao.btnGravarClick(Sender: TObject);
begin
	with cdsGestao do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate('gestaoId', _gestaoId, [loCaseInsensitive]);
	end;
end;

procedure TfrmGestao.btnNovoClick(Sender: TObject);
begin
	with cdsGestao do
	begin
		Append;
		tsInformacao.Show;
		gestao.SetFocus;
	end;
end;

procedure TfrmGestao.cdsGestaoAfterEdit(DataSet: TDataSet);
begin
  _gestaoId := cdsGestaogestaoId.Value;
end;

constructor TfrmGestao.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	cdsGestao.CommandText := 'select * from gestao';
	cdsGestao.Open;
end;

procedure TfrmGestao.dsGestaoDataChange(Sender: TObject; Field: TField);
begin
	if cdsGestao.IsEmpty then
	begin
		Caption := 'Cadastro de gestões';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Gestão - ', cdsGestaogestao.AsString);
		tsInformacao.Caption := Concat('Gestão - ', cdsGestaogestao.AsString);
	end;
end;

procedure TfrmGestao.dsGestaoStateChange(Sender: TObject);
begin
	with cdsGestao do
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

procedure TfrmGestao.dspGestaoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
	if cdsGestaogestaoId.IsNull then
  _gestaoId := getLastId;
end;

procedure TfrmGestao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmGestao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	with cdsGestao do
  begin
  	if State in [dsInsert, dsEdit] then
  		Cancel;
    Close;
  end;
end;

procedure TfrmGestao.FormCreate(Sender: TObject);
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

procedure TfrmGestao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmGestao.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmGestao.imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmGestao.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral, 'Cadastro de Gestões',Application.Title,Self.Height - 50,30);
end;

procedure TfrmGestao.txtPesquisaChange(Sender: TObject);
begin
	with cdsGestao do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('gestao', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
