unit uRelatTransferenciaBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpRave, Provider, DB, DBClient, FMTBcd,
  SqlExpr, RpCon, RpConDS, DBCtrls, ExtCtrls, ComCtrls;

type
  TfrmRelatTranferenciaBem = class(TForm)
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    sqlLocal: TSQLDataSet;
    sqlBens: TSQLDataSet;
    rvdTrBens: TRvDataSetConnection;
    sqlSubLocal: TSQLDataSet;
    rvdTrSubLocal: TRvDataSetConnection;
    sqlSubLocallocalId: TStringField;
    sqlSubLocaltitulo: TStringField;
    sqlSubLocalvLocalId: TStringField;
    sqlSubLocalpessoaId: TIntegerField;
    sqlBensbemId: TIntegerField;
    sqlBensidenficacao: TStringField;
    sqlBensdescricao: TStringField;
    sqlBensgrupoId: TStringField;
    sqlBensestadoId: TIntegerField;
    sqlBenslocalId: TStringField;
    sqlBensgestaoId: TIntegerField;
    sqlBensvalor: TFMTBCDField;
    sqlBenstipoIdentificacao: TIntegerField;
    sqlBenssubgrupoId: TStringField;
    sqlBenssubLocalId: TStringField;
    sqlBenstipoAquisicao: TIntegerField;
    sqlBensquantidade: TFloatField;
    cbOrgao: TCheckBox;
    cbUnidade: TCheckBox;
    dbLocal: TDBLookupComboBox;
    dblSubLocal: TDBLookupComboBox;
    sqlSubLocalempresa_orgao: TStringField;
    dpsLocalAux: TDataSetProvider;
    dsAuxLocal: TDataSource;
    cdsAuxLocal: TClientDataSet;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    cdsAuxLocallocalId: TStringField;
    cdsAuxLocalvLocalId: TStringField;
    dspLocal: TDataSetProvider;
    cdsLocal: TClientDataSet;
    cdsLocaltitulo: TStringField;
    cdsLocalpessoaId: TIntegerField;
    cdsLocallocalId: TStringField;
    cdsLocalvLocalId: TStringField;
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
    cdsEmpresaempresaId: TIntegerField;
    cdsEmpresarazaoSocial: TStringField;
    cdsEmpresanomeFantasia: TStringField;
    cdsEmpresachave: TMemoField;
    cdsEmpresapessoaId: TIntegerField;
    cdsEmpresalogotipo: TBlobField;
    rvdEmpresa: TRvDataSetConnection;
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
					CommandText := Concat('select local.*, unidade.Titulo as empresa_orgao ',
																'from local inner join local as unidade on unidade.localId = local.vLocalId ',
																'where local.vLocalId = :vLocalId and local.localId = :localId');
					Params.ParamByName('localId').Value := dblSubLocal.KeyValue;
					Params.ParamByName('vLocalId').Value := dbLocal.KeyValue;
				end
				else
				begin
					CommandText := Concat('select local.*, unidade.Titulo as empresa_orgao ',
																'from local inner join local as unidade on unidade.localId = local.vLocalId ',
																'where local.vLocalId = :vLocalId');
					Params.ParamByName('vLocalId').Value := dbLocal.KeyValue;
				end;
			end
			else
			begin
				CommandText := Concat('select local.*, unidade.Titulo as empresa_orgao ',
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
	cdsLocal.CommandText := 'select * from local where vLocalId = 0';
	dsLocal.DataSet.Open;
	dsAuxLocal.DataSet.Open;
	edtData.DateTime := Now;
end;

end.
