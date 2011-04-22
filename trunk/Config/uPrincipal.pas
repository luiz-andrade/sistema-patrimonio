unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DB, SqlExpr, DBXMSSQL, Grids, ValEdit,
  Buttons;

type
  TfrmPrincipal = class(TForm)
    pnTopo: TPanel;
    img: TImage;
    Label1: TLabel;
    pgGeral: TPageControl;
    tsConexao: TTabSheet;
    vleConexao: TValueListEditor;
    pnAcoesConexao: TPanel;
    btnCarregarCnofig: TBitBtn;
    btnGravar: TBitBtn;
    btnTestar: TBitBtn;
    SaveDialog: TSaveDialog;
    procedure btnCarregarCnofigClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDm;

{$R *.dfm}

function cript(str: WideString): WideString;
var
  c: integer;
begin
  result := '';
	for c := 1 to length(str) do 
		result := chr(ord(str[c]) xor $DD) + result;
end;

procedure TfrmPrincipal.btnTestarClick(Sender: TObject);
begin
	with dm.SQLConnection do
	begin
		Close;
		try
			Params := vleConexao.Strings;
			Open;
			Close;
			Application.MessageBox(	'Conexão executado com sucesso!!',
															PChar(Application.Title),
															MB_ICONASTERISK);
		except
			Close;
			Raise;
		end;
	end;
end;

procedure TfrmPrincipal.btnCarregarCnofigClick(Sender: TObject);
begin
	with vleConexao do
	begin
		if not(FileExists(Concat(ExtractFilePath(Application.ExeName),'dbxcon.inf'))) then
		begin
			Strings := dm.SQLConnection.Params;
		end
		else
		begin
			Strings.LoadFromFile(Concat(ExtractFilePath(Application.ExeName),'dbxcon.inf'));
		end;
	end;
end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
	with SaveDialog do
	begin
		Execute(Application.Handle);
		if not(FileName = EmptyStr) then
			vleConexao.Strings.SaveToFile(FileName);
	end;
end;

end.
