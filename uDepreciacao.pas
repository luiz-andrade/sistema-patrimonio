unit uDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Buttons, Provider, DB, DBClient,
  DBCtrls, ADODB;

type
  TfrmDepreciacao = class(TForm)
    cbGrupo: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    cbSubGrupo: TCheckBox;
    dblSubGrupo: TDBLookupComboBox;
    dsAuxGrupos: TDataSource;
    cdsAuxGrupo: TClientDataSet;
    dspAuxGrupo: TDataSetProvider;
    dspGrupo: TDataSetProvider;
    dsGrupos: TDataSource;
    cdsGrupo: TClientDataSet;
    btnAplicar: TBitBtn;
    btnFechar: TBitBtn;
    pnLateral: TPanel;
    imgLateral: TImage;
    Label1: TLabel;
    edtPercentual: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure cbSubGrupoClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure cbGrupoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepreciacao: TfrmDepreciacao;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmDepreciacao.btnAplicarClick(Sender: TObject);
begin
	with TADOCommand.Create(Self) do
  begin
  	try
      Connection := dm.ADOConnection;
      CommandType:= cmdText;
      CommandText:=Concat('update bem ',
                          'set valor = valorAquisicao - (valorAquisicao * (:percentual / 100)) ');
      Parameters.ParamByName('percentual').Value := (edtPercentual.Text);
      if cbGrupo.Checked then
      begin
        CommandText := Concat(CommandText, 'where grupoId =:grupoId ');
        Parameters.ParamByName('grupoId').Value := dblGrupo.KeyValue;
        if cbSubGrupo.Checked then
        begin
          CommandText := Concat(CommandText, 'and subgrupoId =:subgrupoId ');
          Parameters.ParamByName('subgrupoId').Value := dblSubGrupo.KeyValue;
        end;
      end;
      try
      Execute();
      Application.MessageBox(	'Percentual de depreciação aplicado com sucesso!',
      											 	PChar(Application.Title),
                              MB_ICONINFORMATION);
      except
        Raise;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmDepreciacao.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmDepreciacao.cbGrupoClick(Sender: TObject);
begin
	cbSubGrupo.Enabled := not (cbSubGrupo.Enabled);
end;

procedure TfrmDepreciacao.cbSubGrupoClick(Sender: TObject);
begin
	dblSubGrupo.Enabled := not dblSubGrupo.Enabled;
end;

procedure TfrmDepreciacao.edtPercentualKeyPress(Sender: TObject; var Key: Char);
var
	Caracteres: TSysCharSet;
begin
	Caracteres:= [#08,#13,#44,'0'..'9'];//backspace, enter, virgula e numeros de zero a nove.
  if not CharInSet(Key,Caracteres) then
  begin
    key:=#0;
  end;
  if Key = #13 then 
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

procedure TfrmDepreciacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	cdsGrupo.Close;
	cdsAuxGrupo.Close;
end;

procedure TfrmDepreciacao.FormCreate(Sender: TObject);
begin
	cdsGrupo.Open;
	cdsAuxGrupo.Open;
	cdsAuxGrupo.Refresh;
end;

end.

