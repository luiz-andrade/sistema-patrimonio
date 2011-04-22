unit uDm;

interface

uses
  SysUtils, Classes, DBXMSSQL, DB, SqlExpr;

type
  Tdm = class(TDataModule)
    SQLConnection: TSQLConnection;
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
