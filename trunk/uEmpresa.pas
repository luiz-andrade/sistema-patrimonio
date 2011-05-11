unit uEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, untWaterEffect, StdCtrls, Buttons, Provider, DB,
  DBClient, DBCtrls, Mask, ExtDlgs;

type
  TfrmEmpresa = class(TForm)
    pnLateral: TPanel;
    imgLateral: TImage;
    Timer: TTimer;
    pnAcoes: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnFechar: TBitBtn;
    dsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    cdsEmpresaempresaId: TIntegerField;
    cdsEmpresarazaoSocial: TStringField;
    cdsEmpresanomeFantasia: TStringField;
    cdsEmpresachave: TMemoField;
    dpsEmpresa: TDataSetProvider;
    Label1: TLabel;
    empresaId: TDBEdit;
    Label2: TLabel;
    razaoSocial: TDBEdit;
    Label3: TLabel;
    nomeFantasia: TDBEdit;
    Label4: TLabel;
    chave: TDBMemo;
    cdsEmpresapessoaId: TIntegerField;
    Label5: TLabel;
    edtPessoaId: TDBEdit;
    pessoaId: TDBLookupComboBox;
    cdsPessoa: TClientDataSet;
    cdsPessoapessoaId: TIntegerField;
    cdsPessoanome: TStringField;
    dspPessoa: TDataSetProvider;
    dsPessoa: TDataSource;
    logotipo: TDBImage;
    cdsEmpresalogotipo: TBlobField;
    Label6: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGravarClick(Sender: TObject);
    procedure dsEmpresaStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
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
  frmEmpresa: TfrmEmpresa;

implementation

uses uFuncoes, uDm;

{$R *.dfm}

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
	with cdsEmpresa do
	begin
		if State in [dsEdit, dsInsert] then
		begin
			Cancel;
		end;
	end;
end;

procedure TfrmEmpresa.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmEmpresa.btnGravarClick(Sender: TObject);
begin
	with cdsEmpresa do
	begin
		if State in [dsEdit, dsInsert] then
		begin
			Post;
			ApplyUpdates(-1);
			Close;
			Open;
		end;
	end;
end;

constructor TfrmEmpresa.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	// Abre tabela principal.
	cdsEmpresa.Open;
	cdsPessoa.Open;
end;

procedure TfrmEmpresa.dsEmpresaStateChange(Sender: TObject);
begin
	with cdsEmpresa do
	begin
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
	end;
end;

procedure TfrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmEmpresa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	with cdsEmpresa do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
	cdsPessoa.Close;
end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
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

procedure TfrmEmpresa.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmEmpresa.imgLateralMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmEmpresa.Label6Click(Sender: TObject);
begin
	with OpenPictureDialog do
	begin
		Execute();
		if not (Trim(FileName) = EmptyStr) then
		begin
			if not(cdsEmpresa.State in [dsInsert,dsEdit]) then
				cdsEmpresa.Edit;
			cdsEmpresalogotipo.LoadFromFile(FileName);
		end;
	end;
end;

procedure TfrmEmpresa.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral, 'Informações da empresa',Application.Title,Self.Height - 50,30);
end;

end.
