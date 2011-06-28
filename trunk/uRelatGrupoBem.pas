unit uRelatGrupoBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, RpDefine, RpCon, RpConDS, StdCtrls, Buttons,
  RpRave, DBCtrls, Provider, DBClient, ADODB, pngimage, ExtCtrls;

type
  TfrmRelatGrupoBem = class(TForm)
    rvdBensGrupo: TRvDataSetConnection;
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    cbGrupo: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    cbSubGrupo: TCheckBox;
    dblSubGrupo: TDBLookupComboBox;
    cdsAuxGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    dspAuxGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    dsGrupos: TDataSource;
    dsAuxGrupos: TDataSource;
    dspGestao: TDataSetProvider;
    cdsGestao: TClientDataSet;
    dsGestao: TDataSource;
    cbGestao: TCheckBox;
    dblGestaoId: TDBLookupComboBox;
    rvdGrupos: TRvDataSetConnection;
    rvdSubGrupos: TRvDataSetConnection;
    cbFornecedor: TCheckBox;
    dblFornecedor: TDBLookupComboBox;
    dsFornecedor: TDataSource;
    dsLocal: TDataSource;
    cdsLocal: TClientDataSet;
    dspLocal: TDataSetProvider;
    dsAuxLocal: TDataSource;
    cdsAuxLocal: TClientDataSet;
    dpsLocalAux: TDataSetProvider;
    dblLocal: TDBLookupComboBox;
    dblsubLocalId: TDBLookupComboBox;
    cbLocal: TCheckBox;
    cbSubLocal: TCheckBox;
    cbDescricao: TCheckBox;
    edtDescricao: TEdit;
    cdsPessoaForc: TClientDataSet;
    dpsPessoaForc: TDataSetProvider;
    cbRelaGrupos: TCheckBox;
    sqlGrupo: TADOQuery;
    sqlGrupogrupoId: TStringField;
    sqlGrupodescricao: TStringField;
    sqlGrupoempresaId: TIntegerField;
    sqlGrupovGrupoId: TStringField;
    sqlSubGrupo: TADOQuery;
    sqlSubGrupogrupoId: TStringField;
    sqlSubGrupodescricao: TStringField;
    sqlSubGrupoempresaId: TIntegerField;
    sqlSubGrupovGrupoId: TStringField;
    sqlBem: TADOQuery;
    sqlBembemId: TAutoIncField;
    sqlBemidenficacao: TStringField;
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
    pnLateral: TPanel;
    imgLateral: TImage;
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
		if not(cbRelaGrupos.Checked) then
		begin
			with sqlBem do
			begin
				Close;
				SQL.Clear;
				if cbFornecedor.Checked then
				begin
					SQL.Add( Concat('select * from bem ',
																'left join bemAquisicao on bemAquisicao.bemid = bem.bemId ',
																'where bemAquisicao.fornecedorId = :fornecedorId'));
				end
				else
				begin
					SQL.Add( Concat('select * from bem ',
																'left join bemAquisicao on bemAquisicao.bemid = bem.bemId ', 'where 1=1 '));
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
				end;
			end;
			//Modifica conteudo da consulta de sub-grupos.
			with sqlSubGrupo do
			begin
				if cbSubGrupo.Checked then
				begin
					Close;
					SQL.Clear;
					SQL.Add('select * from grupo where grupoId = :grupoId');
					Parameters.ParamByName('grupoId').Value := dblSubGrupo.KeyValue;
				end
				else
				begin
					Close;
					SQL.Clear;
					SQL.Add('select * from grupo');
				end;
			end;
			// Modifica conteudo da consulta de grupos.
			with sqlGrupo do
			begin
				if cbGrupo.Checked then
				begin
					Close;
					SQL.Clear;
					SQL.Add('select * from grupo where grupoId = :grupoId');
					Parameters.ParamByName('grupoId').Value := dblGrupo.KeyValue;
				end
				else
				begin
					Close;
					SQL.Clear;
					SQL.Text := 'select * from grupo where vGrupoId = 0';
				end;
			end;
			ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
			ExecuteReport('BENSGRUPOS');
		end
		else
		begin
			// Modifica conteudo da consulta de grupos.
			with sqlGrupo do
			begin
				Close;
				SQL.Clear;
				SQL.Text := 'select * from grupo where vGrupoId = 0';
			end;
			//Modifica conteudo da consulta de sub-grupos.
			with sqlSubGrupo do
			begin
				Close;
				SQL.Clear;
				SQL.Text := 'select * from grupo';
			end;
			ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
			ExecuteReport('GRUPOS');
		end;
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
	cdsAuxGrupo.Refresh;
	dsGestao.DataSet.Open;
  dsLocal.DataSet.Open;
  dsAuxLocal.DataSet.Open;
end;

end.
