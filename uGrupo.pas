unit uGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  Provider, DB, DBClient;

type
  TfrmGrupo = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    btnPesquisar: TSpeedButton;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dsGrupo: TDataSource;
    cdsGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupogrupoId: TIntegerField;
    cdsGrupodescricao: TStringField;
    cdsGrupoempresaId: TIntegerField;
    cdsGrupovGrupoId: TIntegerField;
    Label1: TLabel;
    descricao: TDBEdit;
    Label2: TLabel;
    vGrupoId: TDBLookupComboBox;
    cdsAuxGrupo: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    dsAuxGrupo: TDataSource;
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner: TComponent; empresaId: Integer);reintroduce;overload;
	end;

var
	frmGrupo: TfrmGrupo;

implementation

uses uGlobais, uFuncoes, uDm;

{$R *.dfm}

constructor TfrmGrupo.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsGrupo.DataSet.Open;
	dsAuxGrupo.DataSet.Open;
end;

procedure TfrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmGrupo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	// Fecha tabelas.
	dsGrupo.DataSet.Close;
	dsAuxGrupo.DataSet.Close;
end;

procedure TfrmGrupo.FormPaint(Sender: TObject);
begin
	with Canvas do
	begin
		Brush.Style := bsSolid;
		Pen.Color := $00804000;
		Brush.Color := clWhite;
		Rectangle(0,1,65,Self.ClientHeight);

		Font.Name  :=   'Arial';
		Font.Color := $00837369;
		Font.Size  := 6;

		Pen.Color := $00804000;
		Brush.Color := $00804000;
		Rectangle(42,55,65,Self.ClientHeight);
	end;
	VerticalText(Self,'Cadastro de locais',Application.Title,Self.Height - 50,30);
end;

end.
