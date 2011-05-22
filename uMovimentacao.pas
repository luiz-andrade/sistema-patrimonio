unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBClient, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids, FMTBcd, SqlExpr, RpDefine, RpCon, RpConDS;

type
  TfrmMovimentacao = class(TForm)
	private
		{ Private declarations }
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; 
			empresaId : Integer);reintroduce; overload;
	end;

var
	frmMovimentacao: TfrmMovimentacao;

implementation

uses uDm, uFuncoes, uGlobais;

{$R *.dfm}

{ TfrmMovimentacao }


constructor TfrmMovimentacao.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
end;

end.
