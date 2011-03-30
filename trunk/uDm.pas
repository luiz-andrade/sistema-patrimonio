unit uDm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXMSSQL, FMTBcd, Provider, DBClient, ImgList,
  Controls;

type
  Tdm = class(TDataModule)
    SQLConnection: TSQLConnection;
    cdsEmpresa: TClientDataSet;
    dspEpresa: TDataSetProvider;
    sqlEmpresa: TSQLQuery;
    sqlLocal: TSQLQuery;
    ImageListAcoes: TImageList;
    ImageListBotoes: TImageList;
    sqlLocallocalId: TIntegerField;
    sqlLocaltitulo: TStringField;
    sqlLocalvLocalId: TIntegerField;
    sqlLocalpessoaId: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
