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
    CheckBox1: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    CheckBox2: TCheckBox;
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
    rdvSubGrupos: TRvDataSetConnection;
    rdvGrupos: TRvDataSetConnection;
    dsGrupos: TDataSource;
    dsAuxGrupos: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
		ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('GRUPOS');
	end;
end;

procedure TfrmRelatGrupoBem.FormCloseQuery(Sender: TObject;
	var CanClose: Boolean);
begin
	dsGrupos.DataSet.Close;
	dspAuxGrupo.DataSet.Close;
end;

procedure TfrmRelatGrupoBem.FormCreate(Sender: TObject);
begin
	dsGrupos.DataSet.Open;
	dspAuxGrupo.DataSet.Open;
end;

end.
