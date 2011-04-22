unit uPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  DB, DBClient, Provider, pngimage, untWaterEffect;

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
    nome: TDBEdit;
    dsPessoa: TDataSource;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoapessoaId: TIntegerField;
    cdsPessoanome: TStringField;
    pnLateral: TPanel;
    imgLateral: TImage;
    Timer: TTimer;
    cdsPessoatipo: TSmallintField;
    cdsPessoalogradouro: TStringField;
    cdsPessoamunicipio: TStringField;
    cdsPessoacep: TStringField;
    Label1: TLabel;
    logradouro: TDBEdit;
    Label3: TLabel;
    municipio: TDBEdit;
    Label4: TLabel;
    cep: TDBEdit;
    tipo: TDBRadioGroup;
    tsUsuario: TTabSheet;
    tsFornecedor: TTabSheet;
    dsPessoaUsuario: TDataSource;
    cdsPessoaUsuario: TClientDataSet;
    dspPessoaUsuario: TDataSetProvider;
    cdsPessoaUsuariousuarioId: TIntegerField;
    cdsPessoaUsuariologin: TStringField;
    cdsPessoaUsuariosenha: TMemoField;
    cdsPessoaUsuariopessoaId: TIntegerField;
    Label5: TLabel;
    usuarioId: TDBEdit;
    Label6: TLabel;
    login: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    pessoaId: TDBEdit;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnDefinirSenha: TSpeedButton;
    desativado: TDBCheckBox;
    cdsPessoaUsuariodesativado: TBooleanField;
    senha: TDBEdit;
    dsPessoaFornc: TDataSource;
    cdsPessoaForc: TClientDataSet;
    dpsPessoaForc: TDataSetProvider;
    cdsPessoaForcfornecedorId: TIntegerField;
    cdsPessoaForcrazaoSocial: TStringField;
    cdsPessoaForccnpj: TStringField;
    cdsPessoaForcpessoaId: TIntegerField;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    razaoSocial: TDBEdit;
    Label11: TLabel;
    cnpj: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    cdsPessoafornecedor: TBooleanField;
    cdsPessoausuario_: TBooleanField;
    fornecedor: TDBCheckBox;
    usuario: TDBCheckBox;
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
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pcGeralChange(Sender: TObject);
    procedure dsPessoaUsuarioStateChange(Sender: TObject);
    procedure btnDefinirSenhaClick(Sender: TObject);
    procedure cdsPessoaAfterOpen(DataSet: TDataSet);
    procedure cdsPessoaUsuarioAfterInsert(DataSet: TDataSet);
    procedure cdsPessoaUsuarioReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsPessoaForncStateChange(Sender: TObject);
    procedure cdsPessoaAfterInsert(DataSet: TDataSet);
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
			with cdsPessoaUsuario do
			begin
				if not(IsEmpty) then
				begin
					Delete;
					ApplyUpdates(-1);
				end;
			end;
			with cdsPessoaForc do
			begin
				if not(IsEmpty) then
				begin
					Delete;
					ApplyUpdates(-1);
				end;
			end;
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmPessoa.btnCancelarClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Cancel;
		end;
	end;
	with cdsPessoaUsuario do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Cancel;
		end;
	end;
	with cdsPessoaForc do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Cancel;
		end;
	end;
end;

procedure TfrmPessoa.btnDefinirSenhaClick(Sender: TObject);
begin
	with cdsPessoaUsuario do
	begin
		if not (State in [dsInsert, dsEdit]) then
			Edit;
		senha.Field.Value := alteraSenhaUsuario(login.Text, gUsuarioSenha, (State in [dsInsert]));
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
		if State in [dsInsert, dsEdit] then
		begin
			Post;
			ApplyUpdates(-1);
			Close;
			Open;
		end;
	end;
	with cdsPessoaUsuario do
	begin
		if State in [dsInsert, dsEdit] then
		begin
			Post;
			ApplyUpdates(-1);
			Close;
			Open;
		end;
	end;
	with cdsPessoaForc do
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

procedure TfrmPessoa.btnNovoClick(Sender: TObject);
begin
	with cdsPessoa do
	begin
		Append;
		nome.SetFocus;
	end;
end;

procedure TfrmPessoa.cdsPessoaAfterInsert(DataSet: TDataSet);
begin 
	// Configura valores inicais para novos registros.
	cdsPessoausuario_.Value   := False;
	cdsPessoafornecedor.Value := False;
	cdsPessoatipo.Value       := 1;
end;

procedure TfrmPessoa.cdsPessoaAfterOpen(DataSet: TDataSet);
begin
	with cdsPessoaUsuario do
	begin
		Open;
	end;
	with cdsPessoaForc do
	begin
		Open;
	end;
end;

procedure TfrmPessoa.cdsPessoaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

procedure TfrmPessoa.cdsPessoaUsuarioAfterInsert(DataSet: TDataSet);
begin
	cdsPessoaUsuariodesativado.Value := True;
end;

procedure TfrmPessoa.cdsPessoaUsuarioReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
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
	with cdsPessoa do
	begin
		if IsEmpty then
		begin
			Caption := 'Cadastro de pessoas';
			tsInformacao.Caption := 'Cadastrar';
		end
		else
		begin
			Caption := Concat('Pessoa - ',cdsPessoanome.AsString);
			tsInformacao.Caption := Concat('Pessoa - ', cdsPessoanome.AsString);
		end;
			tsUsuario.TabVisible    := (not(State in [dsInsert]) and not(IsEmpty) and cdsPessoausuario_.Value);
			tsFornecedor.TabVisible := (not(State in [dsInsert]) and not(IsEmpty) and cdsPessoafornecedor.Value);
	end;
end;

procedure TfrmPessoa.dsPessoaForncStateChange(Sender: TObject);
begin
	with cdsPessoaForc do
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

procedure TfrmPessoa.dsPessoaUsuarioStateChange(Sender: TObject);
begin
	with cdsPessoaUsuario do
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
	with cdsPessoa do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
	with cdsPessoaUsuario do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
	with cdsPessoaForc do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
end;

procedure TfrmPessoa.FormCreate(Sender: TObject);
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

procedure TfrmPessoa.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmPessoa.FormKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmPessoa.FormPaint(Sender: TObject);
begin
	VerticalText(Self,'Cadastro de locais',Application.Title,Self.Height - 50,30);
end;

procedure TfrmPessoa.imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
	Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmPessoa.pcGeralChange(Sender: TObject);
begin
	with pcGeral do
	begin
		pnAcoes.Visible := not(ActivePage = tsPesquisa);
	end;
end;

procedure TfrmPessoa.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral,'Cadastro de locais',Application.Title,Self.Height - 50,30);
end;

end.
