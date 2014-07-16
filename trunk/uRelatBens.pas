unit uRelatBens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Provider, DBClient, StdCtrls, DBCtrls, pngimage, ExtCtrls,
  Buttons, RpDefine, RpCon, RpConDS, ADODB, Grids, DBGrids;

type
  TfrmRelatBens = class(TForm)
    cbGestao: TCheckBox;
    dblGestaoId: TDBLookupComboBox;
    cbFornecedor: TCheckBox;
    dblFornecedor: TDBLookupComboBox;
    dblLocal: TDBLookupComboBox;
    dblsubLocalId: TDBLookupComboBox;
    cbLocal: TCheckBox;
    cbSubLocal: TCheckBox;
    cbDescricao: TCheckBox;
    edtDescricao: TEdit;
    cdsPessoaForc: TClientDataSet;
    dpsPessoaForc: TDataSetProvider;
    dsFornecedor: TDataSource;
    dsGestao: TDataSource;
    cdsGestao: TClientDataSet;
    dspGestao: TDataSetProvider;
    dsAuxLocal: TDataSource;
    cdsAuxLocal: TClientDataSet;
    dpsLocalAux: TDataSetProvider;
    dsLocal: TDataSource;
    cdsLocal: TClientDataSet;
    dspLocal: TDataSetProvider;
    pnLateral: TPanel;
    imgLateral: TImage;
    sqlBem: TADOQuery;
    sqlBembemId: TAutoIncField;
    sqlBemdescricao: TStringField;
    sqlBemgrupoId: TStringField;
    sqlBemestadoId: TIntegerField;
    sqlBemlocalId: TStringField;
    sqlBemgestaoId: TIntegerField;
    sqlBemvalor: TBCDField;
    sqlBemtipoIdentificacao: TIntegerField;
    sqlBemsubgrupoId: TStringField;
    sqlBemsubLocalId: TStringField;
    sqlBemtipoAquisicao: TIntegerField;
    sqlBemquantidade: TFloatField;
    sqlBemdata: TDateTimeField;
    sqlBemdataNota: TDateTimeField;
    sqlBemfornecedorId: TIntegerField;
    sqlBemnumeroNota: TStringField;
    rvdRelatBens: TRvDataSetConnection;
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cbEmpenho: TCheckBox;
    cbConvenio: TCheckBox;
    cbProcesso: TCheckBox;
    cbNotaFiscal: TCheckBox;
    edtNotaFiscal: TEdit;
    sqlBemvalorAquisicao: TBCDField;
    sqlBemnumeroConvenio: TStringField;
    sqlBemnumeroProcesso: TStringField;
    sqlBemnumeroEmpenho: TStringField;
    dblConvenio: TDBLookupComboBox;
    dblProcesso: TDBLookupComboBox;
    dblEmprenho: TDBLookupComboBox;
    dblModalidade: TDBLookupComboBox;
    cbModalidade: TCheckBox;
    dsModalidade: TDataSource;
    cdsModalidade: TClientDataSet;
    dspModalidade: TDataSetProvider;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    dspEmpenho: TDataSetProvider;
    cdsEmpenho: TClientDataSet;
    dsEmpenho: TDataSource;
    dsConvenio: TDataSource;
    cdsConvenio: TClientDataSet;
    dspConvenio: TDataSetProvider;
    sqlBemidentificacaoAnterior: TStringField;
    sqlBemidentificacao: TStringField;
    sqlBemdescricaoModalidade: TStringField;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure cbLocalClick(Sender: TObject);
    procedure cbDescricaoClick(Sender: TObject);
    procedure cbNotaFiscalClick(Sender: TObject);
    procedure cbProcessoClick(Sender: TObject);
    procedure cbConvenioClick(Sender: TObject);
    procedure cbEmpenhoClick(Sender: TObject);
    procedure cbModalidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatBens: TfrmRelatBens;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmRelatBens.btnFecharClick(Sender: TObject);
begin
	Close; 
end;

procedure TfrmRelatBens.btnVisualizarClick(Sender: TObject);
begin
	with dm.rvpTR do
	begin
		with sqlBem do
		begin
			Close;
			SQL.Clear;
			if cbFornecedor.Checked then
			begin
				SQL.Add( Concat('select *, modalidade.descricao as descricaoModalidade from bem ',
                        'left join bemAquisicao on bemAquisicao.bemid = bem.bemId ',
                        'left join processo on bemAquisicao.processoId = processo.processoId ',
                        'left join empenho on bemAquisicao.empenhoId = empenho.empenhoId ',
                        'left join convenio on bemAquisicao.convenioId = convenio.convenioId ',
                        'left join convenioTipo on convenio.convenioTipoId = convenioTipo.convenioTipoId ',
                        'left join modalidade on bemAquisicao.modalidadeId = modalidade.modalidadeId ',
                        'where bemAquisicao.fornecedorId = :fornecedorId '));
			end
			else
			begin
				SQL.Add( Concat('select *, modalidade.descricao as descricaoModalidade from bem ',
												'left join bemAquisicao on bemAquisicao.bemid = bem.bemId ',
                        'left join processo on bemAquisicao.processoId = processo.processoId ',
                        'left join empenho on bemAquisicao.empenhoId = empenho.empenhoId ',
                        'left join convenio on bemAquisicao.convenioId = convenio.convenioId ',
                        'left join convenioTipo on convenio.convenioTipoId = convenioTipo.convenioTipoId ',
                        'left join modalidade on bemAquisicao.modalidadeId = modalidade.modalidadeId ',
                        'where 1=1 '));
			end;
			if cbGestao.Checked then
			begin
				SQL.Add('and gestaoId = :gestaoId');
			end;
			if cbLocal.Checked then
			begin
				SQL.Add('and localId = :localId');
			end;
			if cbSubLocal.Checked then
			begin
				SQL.Add(' and subLocalId = :subLocalId');
			end;
			if cbDescricao.Checked then
			begin
				SQL.Add(' and descricao like :descricao');
			end;
      if cbProcesso.Checked then
      begin
        SQL.Add(' and processo.processoId = :processoId');
      end;
      if cbConvenio.Checked then
      begin
        SQL.Add(' and convenio.convenioId = :convenioId');
      end;
      if cbEmpenho.Checked then
      begin
        SQL.Add(' and empenho.empenhoId = :empenhoId');
      end;
      if cbNotaFiscal.Checked then
      begin
        SQL.Add(' and numeroNota = :numeroNota');
      end;
      if cbModalidade.Checked then
      begin
        SQL.Add(' and modalidade.modalidadeId = :modalidadeId');;
      end;
			// Parametros
			with Parameters do
			begin
				if cbGestao.Checked then
				begin
					ParamByName('gestaoId').Value := dblGestaoId.KeyValue;
				end;
				if cbLocal.Checked then
				begin
					ParamByName('localId').Value := dblLocal.KeyValue;
				end;
				if cbSubLocal.Checked then
				begin
					ParamByName('subLocalId').Value := dblsubLocalId.KeyValue;
				end;
				if cbFornecedor.Checked then
				begin
					ParamByName('fornecedorId').Value := dblFornecedor.KeyValue;
				end;
				if cbDescricao.Checked then
				begin
					ParamByName('descricao').Value := Concat('%', edtDescricao.Text, '%');
				end;
        if cbProcesso.Checked then
        begin
          ParamByName('processoId').Value := dblProcesso.KeyValue;
        end;
        if cbConvenio.Checked then
        begin
          ParamByName('convenioId').Value := dblConvenio.KeyValue;
        end;
        if cbEmpenho.Checked then
        begin
          ParamByName('empenhoId').Value := dblEmprenho.KeyValue;
        end;
        if cbNotaFiscal.Checked then
        begin
          ParamByName('numeroNota').Value := edtNotaFiscal.Text;
        end;
        if cbModalidade.Checked then
        begin
          ParamByName('modalidadeId').Value := dblModalidade.KeyValue;
        end;
			end;
		end;
			ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('BENS');
	end;
end;

procedure TfrmRelatBens.cbConvenioClick(Sender: TObject);
begin
  dblConvenio.Enabled := not (dblConvenio.Enabled);
end;

procedure TfrmRelatBens.cbDescricaoClick(Sender: TObject);
begin
	edtDescricao.Enabled := not (edtDescricao.Enabled);
end;

procedure TfrmRelatBens.cbEmpenhoClick(Sender: TObject);
begin
  dblEmprenho.Enabled := not (dblEmprenho.Enabled);
end;

procedure TfrmRelatBens.cbLocalClick(Sender: TObject);
begin
	cbSubLocal.Enabled    := not(cbSubLocal.Enabled);
	dblsubLocalId.Enabled := not(dblsubLocalId.Enabled);
end;

procedure TfrmRelatBens.cbModalidadeClick(Sender: TObject);
begin
  dblModalidade.Enabled := not (dblModalidade.Enabled);
end;

procedure TfrmRelatBens.cbNotaFiscalClick(Sender: TObject);
begin
  edtNotaFiscal.Enabled := not (edtNotaFiscal.Enabled);
end;

procedure TfrmRelatBens.cbProcessoClick(Sender: TObject);
begin
  dblProcesso.Enabled := not (dblProcesso.Enabled);
end;

procedure TfrmRelatBens.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	dsFornecedor.DataSet.Close;
	dsGestao.DataSet.Close;
	dsLocal.DataSet.Close;
  cdsEmpenho.Close;
  cdsConvenio.Close;
  cdsProcesso.Close;
  cdsModalidade.Close;
	dsAuxLocal.DataSet.Close;
end;

procedure TfrmRelatBens.FormCreate(Sender: TObject);
begin
	dsFornecedor.DataSet.Open;
	dsGestao.DataSet.Open;
	dsLocal.DataSet.Open;
	dsAuxLocal.DataSet.Open;

  cdsEmpenho.Open;
  cdsConvenio.Open;
  cdsProcesso.Open;
  cdsModalidade.Open;

	cdsAuxLocal.Refresh;
end;

end.
