unit uRelatTransferenciaBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpRave, Provider, DB, DBClient, FMTBcd,
  SqlExpr, RpCon, RpConDS, DBCtrls, ExtCtrls, ComCtrls, ADODB;

type
  TfrmRelatTranferenciaBem = class(TForm)
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    rvdTrBens: TRvDataSetConnection;
    rvdTrSubLocal: TRvDataSetConnection;
    cbOrgao: TCheckBox;
    cbUnidade: TCheckBox;
    dbLocal: TDBLookupComboBox;
    dblSubLocal: TDBLookupComboBox;
    dpsLocalAux: TDataSetProvider;
    dsAuxLocal: TDataSource;
    cdsAuxLocal: TClientDataSet;
    dspLocal: TDataSetProvider;
    cdsLocal: TClientDataSet;
    dsLocal: TDataSource;
    edtNome: TLabeledEdit;
    edtMunicipio: TLabeledEdit;
    edtMatricula: TLabeledEdit;
    edtNTranferencia: TLabeledEdit;
    edtData: TDateTimePicker;
    Label1: TLabel;
    dpsEmpresa: TDataSetProvider;
    dsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    rvdEmpresa: TRvDataSetConnection;
    cdsBens: TClientDataSet;
    dpsBens: TDataSetProvider;
    sqlLocal: TADOQuery;
    sqlLocallocalId: TStringField;
    sqlLocaltitulo: TStringField;
    sqlLocalvLocalId: TStringField;
    sqlLocalpessoaId: TIntegerField;
    sqlSubLocal: TADOQuery;
    sqlSubLocallocalId: TStringField;
    sqlSubLocaltitulo: TStringField;
    sqlSubLocalvLocalId: TStringField;
    sqlSubLocalpessoaId: TIntegerField;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbOrgaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatTranferenciaBem: TfrmRelatTranferenciaBem;

implementation

uses uDm, uGlobais;

{$R *.dfm}

procedure TfrmRelatTranferenciaBem.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelatTranferenciaBem.btnVisualizarClick(Sender: TObject);
begin
	with dm.rvpTR do
	begin
		// Verifica se foi selecionado uma Unidade
		with sqlSubLocal do
		begin
			Close;
			if cbOrgao.Checked then
			begin
				if cbUnidade.Checked then
				begin
					SQL.Text := Concat('select local.*, unidade.Titulo as empresa_orgao ',
																'from local inner join local as unidade on unidade.localId = local.vLocalId ',
																'where local.vLocalId = :vLocalId and local.localId = :localId');
					Parameters.ParamByName('localId').Value := dblSubLocal.KeyValue;
					Parameters.ParamByName('vLocalId').Value := dbLocal.KeyValue;
				end
				else
				begin
					SQL.Text  := Concat('select local.*, unidade.Titulo as empresa_orgao ',
																'from local inner join local as unidade on unidade.localId = local.vLocalId ',
																'where local.vLocalId = :vLocalId');
					Parameters.ParamByName('vLocalId').Value := dbLocal.KeyValue;
				end;
			end
			else
			begin
				SQL.Text  := Concat('select local.*, unidade.Titulo as empresa_orgao ',
															'from local inner join local as unidade on unidade.localId = local.vLocalId ');
			end;
		end;
		with cdsEmpresa do
		begin
			Close;
			CommandText := 'select empresa.*, pessoa.nome from empresa left join pessoa on pessoa.pessoaId = empresa.pessoaId  where empresa.empresaId = :empresaId';
			Params.ParamByName('empresaId').Value := gEmpresaId;
			Open;
		end;
		SetParam('nomeReceptor',edtNome.Text);
		SetParam('matriculaReceptor', edtMatricula.Text);
		SetParam('municipioReceptor', edtMunicipio.Text);
		SetParam('data', FormatDateTime('dd/MM/yyyy', edtData.Date));
		SetParam('numeroTr',edtNTranferencia.Text);
		ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('TR');
	end;
end;

procedure TfrmRelatTranferenciaBem.cbOrgaoClick(Sender: TObject);
begin
	cbUnidade.Enabled   := not(cbUnidade.Enabled);
	dblSubLocal.Enabled := not(dblSubLocal.Enabled); 
end;

procedure TfrmRelatTranferenciaBem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	dsLocal.DataSet.Close;
	dsAuxLocal.DataSet.Close;
end;

procedure TfrmRelatTranferenciaBem.FormCreate(Sender: TObject);
begin
	dsLocal.DataSet.Open;
	dsAuxLocal.DataSet.Open;
	edtData.DateTime := Now;
end;

end.
