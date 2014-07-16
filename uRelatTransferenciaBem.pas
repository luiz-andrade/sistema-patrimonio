unit uRelatTransferenciaBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpRave, Provider, DB, DBClient, FMTBcd,
  SqlExpr, RpCon, RpConDS, DBCtrls, ExtCtrls, ComCtrls, ADODB, StrUtils,
  pngimage;

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
    cdsBensbemId: TAutoIncField;
    cdsBensidenficacao: TStringField;
    cdsBensdescricao: TStringField;
    cdsBensgrupoId: TStringField;
    cdsBensestadoId: TIntegerField;
    cdsBenslocalId: TStringField;
    cdsBensgestaoId: TIntegerField;
    cdsBensvalor: TBCDField;
    cdsBenstipoIdentificacao: TIntegerField;
    cdsBenssubgrupoId: TStringField;
    cdsBenssubLocalId: TStringField;
    cdsBenstipoAquisicao: TIntegerField;
    cdsBensquantidade: TFloatField;
    lvBens: TListView;
    cbBemIndividual: TCheckBox;
    btnAdicionar: TButton;
    pnLateral: TPanel;
    imgLateral: TImage;
    cdsAuxLocallocalId: TStringField;
    cdsAuxLocaltitulo: TStringField;
    cdsAuxLocalvLocalId: TStringField;
    cdsAuxLocalpessoaId: TIntegerField;
    cdsAuxLocalnomePessoa: TStringField;
    cdsAuxLocalmatriculaPessoa: TStringField;
    cdsAuxLocalmunicipioPessoa: TStringField;
    dsPessoa: TDataSource;
    cdsPessoa: TClientDataSet;
    cdsPessoapessoaId: TIntegerField;
    cdsPessoanome: TStringField;
    cdsPessoatipo: TSmallintField;
    cdsPessoalogradouro: TStringField;
    cdsPessoacep: TStringField;
    cdsPessoausuario_: TBooleanField;
    cdsPessoacnpjCpf: TStringField;
    dspPessoa: TDataSetProvider;
    cdsPessoamunicipio: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbOrgaoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure cbUnidadeClick(Sender: TObject);
    procedure dsAuxLocalDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    function listBens(List : TListView) : WideString;
  public
    { Public declarations }
  end;

var
  frmRelatTranferenciaBem: TfrmRelatTranferenciaBem;

implementation

uses uDm, uGlobais, uFuncoes;

{$R *.dfm}

procedure TfrmRelatTranferenciaBem.btnAdicionarClick(Sender: TObject);
var
	local : String;
  subLocal : String;
begin
	if dbLocal.KeyValue = null then
  	local := EmptyStr
  else
  	local := dbLocal.KeyValue;

	if dblSubLocal.KeyValue = null then
  	subLocal := EmptyStr
  else
  	subLocal := dblSubLocal.KeyValue;


	lvBens.Clear;
	with GetBensByLocal(Local, subLocal) do
  begin
		if not(IsEmpty) then
    begin
    	First;
      while not(Eof) do
      begin
      	with lvBens.Items.Add do
        begin
          Caption := FieldByName('bemId').Value;
          SubItems.Add(FieldByName('idenficacao').Value);
          SubItems.Add(FieldByName('descricao').Value);
        end;
        Next;
      end;
    end;
    Free;
  end;
end;

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
    with cdsBens do
    begin
      if cbBemIndividual.Checked then
      begin
        Close;
        CommandText :=Concat('select * from Bem where bemId in (', listBens(lvBens) ,')');
      end
      else
      begin
        Close;
        CommandText :=Concat('select * from Bem');
      end;
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

procedure TfrmRelatTranferenciaBem.cbUnidadeClick(Sender: TObject);
begin
	dblSubLocal.KeyValue := NULL;
end;

procedure TfrmRelatTranferenciaBem.dsAuxLocalDataChange(Sender: TObject;
  Field: TField);
begin
	if cbUnidade.Checked then
  begin
    edtMatricula.Text := cdsAuxLocalmatriculaPessoa.AsString;
    edtNome.Text      := cdsAuxLocalnomePessoa.AsString;
    edtMunicipio.Text := cdsAuxLocalmunicipioPessoa.AsString;
  end;
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
	cdsAuxLocal.Refresh;
	edtData.DateTime := Now;
end;

function TfrmRelatTranferenciaBem.listBens(List: TListView): WideString;
var
	C : Integer;
begin
	Result := EmptyStr;
	with List do
  begin
  	for C := 0 to Items.Count -1 do
    begin
    	if Items.Item[C].Checked then
	    	Result := Concat(Result, QuotedStr(Items.Item[C].Caption), ',');
    end;
    Result := LeftStr(Result, Length(Result)-1);
  end;
end;

end.
