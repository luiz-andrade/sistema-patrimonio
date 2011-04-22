unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmMovimentacao = class(TForm)
  private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; 
			empresaId : Integer);reintroduce; overload;
	end;

var
	frmMovimentacao: TfrmMovimentacao;

implementation

{$R *.dfm}

{ TfrmMovimentacao }

constructor TfrmMovimentacao.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
end;

end.
