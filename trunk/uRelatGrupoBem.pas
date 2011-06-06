unit uRelatGrupoBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, RpDefine, RpCon, RpConDS, StdCtrls, Buttons,
  RpRave, DBCtrls, Provider, DBClient;

type
  TfrmRelatGrupoBem = class(TForm)
    rvdBensGrupo: TRvDataSetConnection;
    sqlBens: TSQLDataSet;
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
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    cbGrupo: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    cbSubGrupo: TCheckBox;
    dblSubGrupo: TDBLookupComboBox;
    cdsAuxGrupo: TClientDataSet;
    cdsAuxGrupogrupoId: TStringField;
    cdsAuxGrupovGrupoId: TStringField;
    cdsAuxGrupoempresaId: TIntegerField;
    cdsAuxGrupodescricao: TStringField;
    dspGrupo: TDataSetProvider;
    dspAuxGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    cdsGrupodescricao: TStringField;
    cdsGrupoempresaId: TIntegerField;
    cdsGrupogrupoId: TStringField;
    dsGrupos: TDataSource;
    dsAuxGrupos: TDataSource;
    dspGestao: TDataSetProvider;
    cdsGestao: TClientDataSet;
    dsGestao: TDataSource;
    cbGestao: TCheckBox;
    dblGestaoId: TDBLookupComboBox;
    rvdGrupos: TRvDataSetConnection;
    rvdSubGrupos: TRvDataSetConnection;
    sqlGrupo: TSQLQuery;
    sqlGrupodescricao: TStringField;
    sqlGrupoempresaId: TIntegerField;
    sqlGrupogrupoId: TStringField;
    sqlGrupovGrupoId: TStringField;
    sqlSubGrupo: TSQLQuery;
    StringField2: TStringField;
    IntegerField5: TIntegerField;
    sqlSubGrupogrupoId: TStringField;
    sqlSubGrupovGrupoId: TStringField;
    cbFornecedor: TCheckBox;
    dblFornecedor: TDBLookupComboBox;
    dsFornecedor: TDataSource;
    dsLocal: TDataSource;
    cdsLocal: TClientDataSet;
    cdsLocaltitulo: TStringField;
    cdsLocalpessoaId: TIntegerField;
    cdsLocallocalId: TStringField;
    cdsLocalvLocalId: TStringField;
    dspLocal: TDataSetProvider;
    dsAuxLocal: TDataSource;
    cdsAuxLocal: TClientDataSet;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    cdsAuxLocallocalId: TStringField;
    cdsAuxLocalvLocalId: TStringField;
    dpsLocalAux: TDataSetProvider;
    dblLocal: TDBLookupComboBox;
    dblsubLocalId: TDBLookupComboBox;
    cbLocal: TCheckBox;
    cbSubLocal: TCheckBox;
    cbDescricao: TCheckBox;
    edtDescricao: TEdit;
    cdsPessoaForc: TClientDataSet;
    cdsPessoaForcfornecedorId: TIntegerField;
    cdsPessoaForcrazaoSocial: TStringField;
    cdsPessoaForccnpj: TStringField;
    cdsPessoaForcpessoaId: TIntegerField;
    dpsPessoaForc: TDataSetProvider;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbGrupoClick(Sender: TObject);
    procedure cbLocalClick(Sender: TObject);
    procedure cbDescricaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrupoBem: TfrmRelatGrupoBem;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmRelatGrupoBem.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelatGrupoBem.btnVisualizarClick(Sender: TObject);
begin
	with dm.rvpTR do
	begin
		with sqlBens do
		begin
			Close;
			if cbFornecedor.Checked then
			begin
				CommandText := Concat('select * from bem ',
															'inner join bemAquisicao on bemAquisicao.bemid = bem.bemId ',
															'where bemAquisicao.fornecedorId = :fornecedorId ');
			end
			else
			begin
				CommandText := 'select * from bem where 1=1  ';
			end;
			if cbGestao.Checked then
			begin
				CommandText := Concat(CommandText, ' and gestaoId = :gestaoId');
			end;
			if cbLocal.Checked then
			begin
				CommandText := Concat(CommandText, ' and localId = :localId');
			end;
			if cbSubLocal.Checked then
			begin
				CommandText := Concat(CommandText, ' and subLocalId = :subLocalId');
			end;
      if cbDescricao.Checked then
      begin
        CommandText := Concat(CommandText, ' and descricao like :descricao');
      end;
      // Parametros
      with Params do
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
      end;
		end;
		// Modifica conteudo da consulta de grupos.
		with sqlGrupo do
		begin
			if cbGrupo.Checked then
			begin
				Close;
				CommandText := 'select * from grupo where grupoId = :grupoId';
				Params.ParamByName('grupoId').Value := dblGrupo.KeyValue;
			end
			else
			begin
				Close;
				CommandText := 'select * from grupo where vGrupoId = 0';
			end;
		end;
		//Modifica conteudo da consulta de sub-grupos.
		with sqlSubGrupo do
		begin
			if cbSubGrupo.Checked then
			begin
				Close;
				CommandText := 'select * from grupo where grupoId = :grupoId';
				Params.ParamByName('grupoId').Value := dblSubGrupo.KeyValue;
			end
			else
			begin
				Close;
				CommandText := 'select * from grupo';
				//Params.ParamByName('vGrupoId').Value := dblGrupo.KeyValue;
			end;
		end;
		ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('BENSGRUPOS');
	end;
end;

procedure TfrmRelatGrupoBem.cbDescricaoClick(Sender: TObject);
begin
  edtDescricao.Enabled := not(edtDescricao.Enabled);
end;

procedure TfrmRelatGrupoBem.cbGrupoClick(Sender: TObject);
begin
	cbSubGrupo.Enabled  := not (cbSubGrupo.Enabled);
	dblSubGrupo.Enabled :=not(dblSubGrupo.Enabled);
end;

procedure TfrmRelatGrupoBem.cbLocalClick(Sender: TObject);
begin
  dblsubLocalId.Enabled := not(dblsubLocalId.Enabled);
  cbSubLocal.Enabled    := not(cbSubLocal.Enabled);
end;

procedure TfrmRelatGrupoBem.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
begin
	dsGrupos.DataSet.Close;
	dsAuxGrupos.DataSet.Close;
	dsGestao.DataSet.Close;
	dsFornecedor.DataSet.Close;
  dsLocal.DataSet.Close;
  dsAuxLocal.DataSet.Close;
end;

procedure TfrmRelatGrupoBem.FormCreate(Sender: TObject);
begin
	dsFornecedor.DataSet.Open;
	dsGrupos.DataSet.Open;
	dsAuxGrupos.DataSet.Open;
	dsGestao.DataSet.Open;
  dsLocal.DataSet.Open;
  dsAuxLocal.DataSet.Open;
end;

end.
