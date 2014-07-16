unit uEmpenho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDefaultUnit, Provider, DB, DBClient, ExtCtrls, Grids, DBGrids,
  StdCtrls, ComCtrls, Buttons, pngimage, Mask, DBCtrls;

type
  TfrmEmpenho = class(TfrmDefaultForm)
    cdsPrincipalempenhoId: TAutoIncField;
    cdsPrincipalnumeroEmpenho: TStringField;
    numeroEmpenho: TDBEdit;
    empenhoId: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure txtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpenho: TfrmEmpenho;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmEmpenho.btnNovoClick(Sender: TObject);
begin
  inherited;
  numeroEmpenho.SetFocus;
end;

procedure TfrmEmpenho.dsPrincipalDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
	if cdsPrincipal.IsEmpty then
	begin
		Caption := 'Cadastro de Empenhos';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Empenho - ',cdsPrincipalnumeroEmpenho.AsString);
		tsInformacao.Caption := Concat('Empenho - ',cdsPrincipalnumeroEmpenho.AsString);
	end;
end;

procedure TfrmEmpenho.FormCreate(Sender: TObject);
begin
  inherited;
  pIndexName := 'empenhoId';
  pVeriticalText := 'Cadastro de Empenho';
end;

procedure TfrmEmpenho.txtPesquisaChange(Sender: TObject);
begin
  inherited;
	with cdsPrincipal do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('numeroEmpenho', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
