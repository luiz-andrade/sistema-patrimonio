unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Buttons, StdCtrls, DBCtrls;

type
	TfrmAcesso = class(TForm)
		dsEmpresa: TDataSource;
		pnAcoes: TPanel;
		btnConfirmar: TSpeedButton;
		btnCancelar: TSpeedButton;
    txtLogin: TLabeledEdit;
    txtPassword: TLabeledEdit;
    dcbEmpresa: TDBLookupComboBox;
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

uses uDm;

{$R *.dfm}

{ TfrmAcesso }

constructor TfrmAcesso.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	_liberado  := False;
end;

end.
