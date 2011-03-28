unit uLocais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls;

type
  TfrmLocais = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    tsInformacao: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
		{ Private declarations }
		_empresaId : Integer;
  public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmLocais: TfrmLocais;

implementation

{$R *.dfm}

constructor TfrmLocais.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
end;

procedure TfrmLocais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

end.
