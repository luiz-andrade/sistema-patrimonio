unit uAcesso;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, DB, ExtCtrls, Buttons, StdCtrls, DBCtrls, SqlExpr;

type
	TfrmAcesso = class(TForm)
		dsEmpresa: TDataSource;
		txtLogin: TLabeledEdit;
		txtPassword: TLabeledEdit;
		dcbEmpresa: TDBLookupComboBox;
		Shape: TShape;
		btnConfirmar: TSpeedButton;
		btnCancelar: TSpeedButton;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure btnCancelarClick(Sender: TObject);
	private
		{ Private declarations }
		_empresaId : Integer;
		function validaUsuário(login : string; senha : String) : Boolean;
	public
		{ Public declarations }
		_liberado : Boolean;
		constructor Create(AOwner : TComponent; empresaId : Integer)overload;reintroduce;
	end;

var
	frmAcesso: TfrmAcesso;

implementation

uses uDm;

{$R *.dfm}

{ TfrmAcesso }

procedure TfrmAcesso.btnCancelarClick(Sender: TObject);
begin
	Application.Terminate;
end;

constructor TfrmAcesso.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	_liberado  := False;
end;

procedure TfrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

function TfrmAcesso.validaUsuário(login, senha: String): Boolean;
var
	qryConsulta : TSQLQuery;
begin
	
end;

end.
