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
    rvpTR: TRvProject;
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
    rvdGestao: TRvDataSetConnection;
    rvdGrupos: TRvDataSetConnection;
    rvdSubGrupos: TRvDataSetConnection;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbGrupoClick(Sender: TObject);
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
	with rvpTR do
	begin
		with sqlBens do
		begin
			Close;
			CommandText := 'select * from bem where 1=1 ';
			if cbGrupo.Checked then
			begin
				CommandText := Concat(CommandText, 'and grupoId = :grupoId ');
				Params.ParamByName('grupoId').Value := dblGrupo.KeyValue;
			end;
			if cbSubGrupo.Checked then
			begin
				CommandText := Concat(CommandText, 'and subGrupoId = :subGrupoId ');
				Params.ParamByName('subGrupoId').Value := dblSubGrupo.KeyValue;
			end;
			if cbGestao.Checked then
			begin
				CommandText := Concat(CommandText, 'and gestaoId = :gestaoId ');
				Params.ParamByName('gestaoId').Value := dblGestaoId.KeyValue;
			end;
		end;
		ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('BENSGRUPOS');
	end;
end;

procedure TfrmRelatGrupoBem.cbGrupoClick(Sender: TObject);
begin
	cbSubGrupo.Enabled  := not (cbSubGrupo.Enabled);
	dblSubGrupo.Enabled :=not(dblSubGrupo.Enabled);
end;

procedure TfrmRelatGrupoBem.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
begin
	dsGrupos.DataSet.Close;
	dsAuxGrupos.DataSet.Close;
	dsGestao.DataSet.Close;
end;

procedure TfrmRelatGrupoBem.FormCreate(Sender: TObject);
begin
	dsGrupos.DataSet.Open;
	dsAuxGrupos.DataSet.Open;
	dsGestao.DataSet.Open;
end;

end.
