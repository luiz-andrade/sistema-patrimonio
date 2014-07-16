unit uConvenio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDefaultUnit, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  pngimage, DB, Provider, DBClient, Mask, DBCtrls;

type
  TfrmConvenio = class(TfrmDefaultForm)
    cdsPrincipalconvenioId: TAutoIncField;
    cdsPrincipalnumeroConvenio: TStringField;
    cdsPrincipalconvenioTipoId: TIntegerField;
    Label1: TLabel;
    convenioId: TDBEdit;
    Label2: TLabel;
    numeroConvenio: TDBEdit;
    dblConvenio: TDBLookupComboBox;
    Label17: TLabel;
    dsConvenioTipo: TDataSource;
    cdsConvenioTipo: TClientDataSet;
    dspConvenioTipo: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
    procedure txtPesquisaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConvenio: TfrmConvenio;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmConvenio.btnNovoClick(Sender: TObject);
begin
  inherited;
  numeroConvenio.SetFocus;
end;

procedure TfrmConvenio.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  inherited;
	if cdsPrincipal.IsEmpty then
	begin
		Caption := 'Cadastro de Convênios';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Convênio - ',cdsPrincipalnumeroConvenio.AsString);
		tsInformacao.Caption := Concat('Convênio - ',cdsPrincipalnumeroConvenio.AsString);
	end;
end;

procedure TfrmConvenio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  dsConvenioTipo.DataSet.Close;
end;

procedure TfrmConvenio.FormCreate(Sender: TObject);
begin
  inherited;
  pIndexName := 'convenioId';
  pVeriticalText := 'Cadastro de Convênios';
  dsConvenioTipo.DataSet.Open;
end;

procedure TfrmConvenio.txtPesquisaChange(Sender: TObject);
begin
  inherited;
	with cdsPrincipal do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('numeroConvenio', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
