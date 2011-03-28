unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Buttons;

type
	TfrmAcesso = class(TForm)
		dsEmpresa: TDataSource;
		pnAcoes: TPanel;
		btnConfirmar: TSpeedButton;
		btnCancelar: TSpeedButton;
	private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer)reintroduce;overload;
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
end;

end.
