unit uDm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXMSSQL, FMTBcd, Provider, DBClient;

type
  Tdm = class(TDataModule)
    SQLConnection: TSQLConnection;
    cdsEmpresa: TClientDataSet;
    dspEpresa: TDataSetProvider;
    sqiEmpresa: TSQLQuery;
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
