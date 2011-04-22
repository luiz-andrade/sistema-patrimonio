unit uAlteracaoSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage;

type
  TfrmAlteracaoSenha = class(TForm)
    lbleLogin: TLabeledEdit;
    lbleNovaSenha: TLabeledEdit;
    pnAcoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lbleSenhaAnterior: TLabeledEdit;
    Img: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
		{ Private declarations }
		_login : String;
		_OldPws   : WideString;
		_nUser : Boolean;
  public
		{ Public declarations }
		_resulPws : WideString;
		constructor Create(AOwner : TComponent; login, 
			OldPws : String; nUser : Boolean);reintroduce;overload;
  end;

var
  frmAlteracaoSenha: TfrmAlteracaoSenha;

implementation

uses uMd5;

{$R *.dfm}

procedure TfrmAlteracaoSenha.btnConfirmarClick(Sender: TObject);
var
	encptedOldPws : WideString;
begin
	encptedOldPws := MD5Print(MD5String(lbleSenhaAnterior.Text));
	if (encptedOldPws = _OldPws) or (_nUser) then
	begin
		_resulPws := MD5Print(MD5String(lbleNovaSenha.Text));
		Close;
	end
	else
	begin
		Application.MessageBox(	'A senha atual não confere!',
														PChar(Application.Title),
														MB_ICONEXCLAMATION);
	end;
end;

constructor TfrmAlteracaoSenha.Create(AOwner: TComponent; login, OldPws: String;
	nUser : Boolean);
begin
	inherited Create(AOwner);
	_login  := login;
	_OldPws := OldPws;
	_nUser  := nUser;
	// Alteração de componente no formulario;
	lbleLogin.Text := _login;
end;

procedure TfrmAlteracaoSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveMDIChild, True, True);
	
end;

procedure TfrmAlteracaoSenha.btnCancelarClick(Sender: TObject);
begin
	Close;
end;

end.
