unit uProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDefaultUnit, Provider, DB, DBClient, ExtCtrls, Grids, DBGrids,
  StdCtrls, ComCtrls, Buttons, pngimage, Mask, DBCtrls;

type
  TfrmProcesso = class(TfrmDefaultForm)
    cdsPrincipalprocessoId: TAutoIncField;
    cdsPrincipalnumeroProcesso: TStringField;
    processoId: TDBEdit;
    Label1: TLabel;
    numeroProcesso: TDBEdit;
    Label2: TLabel;
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure txtPesquisaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcesso: TfrmProcesso;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmProcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  numeroProcesso.SetFocus;
end;

procedure TfrmProcesso.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  inherited;
	if cdsPrincipal.IsEmpty then
	begin
		Caption := 'Cadastro de Processos';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Processo - ',cdsPrincipalnumeroProcesso.AsString);
		tsInformacao.Caption := Concat('Processo - ',cdsPrincipalnumeroProcesso.AsString);
	end;
end;

procedure TfrmProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  pIndexName := 'processoId';
  pVeriticalText := 'Cadastro de Processos';
end;

procedure TfrmProcesso.txtPesquisaChange(Sender: TObject);
begin
  inherited;
	with cdsPrincipal do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('numeroProcesso', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
