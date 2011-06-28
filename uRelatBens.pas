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
    rvdRelatBens: TRvDataSetConnection;
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure cbLocalClick(Sender: TObject);
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
			ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('BENS');
	end;
end;

procedure TfrmRelatBens.cbLocalClick(Sender: TObject);
begin
	cbSubLocal.Enabled    := not(cbSubLocal.Enabled);
	dblsubLocalId.Enabled := not(dblsubLocalId.Enabled);
end;

procedure TfrmRelatBens.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	dsFornecedor.DataSet.Close;
	dsGestao.DataSet.Close;
	dsLocal.DataSet.Close;
	dsAuxLocal.DataSet.Close;
end;

procedure TfrmRelatBens.FormCreate(Sender: TObject);
begin
	dsFornecedor.DataSet.Open;
	dsGestao.DataSet.Open;
	dsLocal.DataSet.Open;
	dsAuxLocal.DataSet.Open;
	cdsAuxLocal.Refresh;
end;

end.
