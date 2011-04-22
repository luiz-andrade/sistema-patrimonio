unit uAcesso;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, DB, ExtCtrls, Buttons, StdCtrls, DBCtrls, SqlExpr, pngimage;

type
	TfrmAcesso = class(TForm)
		dsEmpresa: TDataSource;
		txtLogin: TLabeledEdit;
		txtPassword: TLabeledEdit;
    Image1: TImage;
    lblEmpresa: TLabel;
    imgLogar: TImage;
    imgCancelar: TImage;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dsEmpresaDataChange(Sender: TObject; Field: TField);
    procedure imgLogarClick(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		_liberado : Boolean;
		constructor Create(AOwner : TComponent; empresaId : Integer)overload;reintroduce;
	end;

var
	frmAcesso: TfrmAcesso;

implementation

uses uDm, uFuncoes, uMd5, uGlobais;

{$R *.dfm}

{ TfrmAcesso }

constructor TfrmAcesso.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	_liberado  := False;
end;

procedure TfrmAcesso.dsEmpresaDataChange(Sender: TObject; Field: TField);
begin
	with dsEmpresa.DataSet do
	begin
		if not(IsEmpty) then
		begin
			lblEmpresa.Caption := FieldByName('nomeFantasia').AsString;
		end;
	end;
end;

procedure TfrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmAcesso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	CanClose := _liberado;
end;

procedure TfrmAcesso.FormCreate(Sender: TObject);
begin
	dsEmpresa.DataSet.Open;
end;

procedure TfrmAcesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key = #13 then 
	begin
		if ActiveControl = txtPassword then
		begin
			if not(txtLogin.Text = EmptyStr) and not(txtPassword.Text = EmptyStr) then
			begin
        imgLogarClick(Self);
      end;
		end;
		SelectNext(ActiveControl, True, True);
	end;
end;

procedure TfrmAcesso.imgCancelarClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TfrmAcesso.imgLogarClick(Sender: TObject);
begin
	with validaAcesso(txtLogin.Text, txtPassword.Text) do
	begin
		if not(IsEmpty) then
		begin
			_liberado  := True;
			// Informações da empresa.
			with dsEmpresa.DataSet do
			begin
				gEmpresaId        := FieldByName('empresaId').AsInteger;
				gEmpresaFantasia  := FieldByName('nomeFantasia').AsString;
				gEmpresaChave     := FieldByName('chave').AsString;
			end;
			// Informações do usuário.
			gUsuarioId    := FieldByName('usuarioId').AsInteger;
			gUsuarioNome  := FieldByName('nome').AsString;
			gUsuarioLogin := FieldByName('login').AsString;
			gUsuarioSenha := FieldByName('senha').AsString;
		end
		else
		begin
			Application.MessageBox(	'Usuário ou senha inválido, tente novamente!',
															PChar(Application.Title),
															MB_ICONINFORMATION);
		end;
		Free;
	end;
	Close;
end;

end.
