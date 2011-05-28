unit uRelatTransferenciaBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpDefine, RpRave, Provider, DB, DBClient, FMTBcd,
  SqlExpr, RpCon, RpConDS, DBCtrls;

type
  TfrmRelatTranferenciaBem = class(TForm)
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    rvpTR: TRvProject;
    sqlLocal: TSQLDataSet;
    rvdLocal: TRvDataSetConnection;
    sqlBens: TSQLDataSet;
    rvdBens: TRvDataSetConnection;
    sqlSubLocal: TSQLDataSet;
    rvdSubLocal: TRvDataSetConnection;
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
    rvdEmpresa: TRvDataSetConnection;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    sqlSubLocalempresa_orgao: TStringField;
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatTranferenciaBem: TfrmRelatTranferenciaBem;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmRelatTranferenciaBem.btnVisualizarClick(Sender: TObject);
begin
	with rvpTR do
	begin
	  ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('TR');
	end;
end;

end.
