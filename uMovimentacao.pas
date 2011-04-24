unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBClient, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids;

type
  TfrmMovimentacao = class(TForm)
    dsMovimentacao: TDataSource;
    cdsMovimentacao: TClientDataSet;
    dpsMovimentacao: TDataSetProvider;
    cdsMovimentacaotransferenciaId: TIntegerField;
    cdsMovimentacaoorigemId: TIntegerField;
    cdsMovimentacaodestinoId: TIntegerField;
    cdsMovimentacaodata: TSQLTimeStampField;
    cdsMovimentacaoreceptorId: TIntegerField;
    cdsMovimentacaocedenteId: TIntegerField;
    cdsMovimentacaousuarioId: TIntegerField;
    cdsMovimentacaoconcluida: TBooleanField;
    pnTopo: TPanel;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    dsOrigem: TDataSource;
    cdsOrigem: TClientDataSet;
    dpsLocal: TDataSetProvider;
    dsDestino: TDataSource;
    cdsDestino: TClientDataSet;
    pgGeral: TPageControl;
    tsConsulta: TTabSheet;
    tsInformacao: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    dpsPessoa: TDataSetProvider;
    dsCedente: TDataSource;
    cdsCedente: TClientDataSet;
    dsReceptor: TDataSource;
    cdsReceptor: TClientDataSet;
    cdsDestinolocalId: TIntegerField;
    cdsDestinotitulo: TStringField;
    cdsDestinovLocalId: TIntegerField;
    cdsDestinopessoaId: TIntegerField;
    cdsOrigemlocalId: TIntegerField;
    cdsOrigemtitulo: TStringField;
    cdsOrigemvLocalId: TIntegerField;
    cdsOrigempessoaId: TIntegerField;
    cdsCedentepessoaId: TIntegerField;
    cdsCedentenome: TStringField;
    cdsCedentetipo: TSmallintField;
    cdsCedentelogradouro: TStringField;
    cdsCedentemunicipio: TStringField;
    cdsCedentecep: TStringField;
    cdsCedentefornecedor: TBooleanField;
    cdsCedenteusuario: TBooleanField;
    cdsReceptorpessoaId: TIntegerField;
    cdsReceptornome: TStringField;
    cdsReceptortipo: TSmallintField;
    cdsReceptorlogradouro: TStringField;
    cdsReceptormunicipio: TStringField;
    cdsReceptorcep: TStringField;
    cdsReceptorfornecedor: TBooleanField;
    cdsReceptorusuario: TBooleanField;
    DBGrid1: TDBGrid;
    pnPesquisa: TPanel;
    btnPesquisar: TSpeedButton;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsMovimentacaoAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

uses uDm;

{$R *.dfm}

{ TfrmMovimentacao }

procedure TfrmMovimentacao.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmMovimentacao.btnGravarClick(Sender: TObject);
begin
	with cdsMovimentacao do
	begin
		Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
end;

procedure TfrmMovimentacao.cdsMovimentacaoAfterOpen(DataSet: TDataSet);
begin
	// Abre dependências.
	cdsReceptor.Open;
	cdsCedente.Open;
	cdsOrigem.Open;
	cdsDestino.Open;
end;

constructor TfrmMovimentacao.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	// Abre tabela principal.
	cdsMovimentacao.Open;
end;

procedure TfrmMovimentacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	// Fecha dependencias.
	with cdsMovimentacao do
	begin
		if State in [dsEdit, dsInsert] then
			Cancel;
		Close;
	end;
	cdsReceptor.Close;
	cdsCedente.Close;
	cdsOrigem.Close;
	cdsDestino.Close;
end;

procedure TfrmMovimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
	
end;

end.
