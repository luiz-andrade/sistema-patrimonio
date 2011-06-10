unit uRelatGrupoTotais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Provider, DBCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    cbGrupo: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    cbSubGrupo: TCheckBox;
    dblSubGrupo: TDBLookupComboBox;
    dsAuxGrupos: TDataSource;
    dspGrupo: TDataSetProvider;
    dsGrupos: TDataSource;
    cdsGrupo: TClientDataSet;
    dspAuxGrupo: TDataSetProvider;
    cdsAuxGrupo: TClientDataSet;
    dsGestao: TDataSource;
    cdsGestao: TClientDataSet;
    dspGestao: TDataSetProvider;
    cbGestao: TCheckBox;
    dblGestaoId: TDBLookupComboBox;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnFecharClick(Sender: TObject);
begin
	Close;
end;

end.
