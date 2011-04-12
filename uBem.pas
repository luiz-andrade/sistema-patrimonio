unit uBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls, DB, Provider,
  DBClient, Mask, DBCtrls;

type
  TfrmBem = class(TForm)
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
    dsBem: TDataSource;
    cdsBem: TClientDataSet;
    dspBem: TDataSetProvider;
    cdsBembemId: TIntegerField;
    cdsBemidenficacao: TStringField;
    cdsBemdescricao: TStringField;
    cdsBemgrupoId: TIntegerField;
    cdsBemestadoId: TIntegerField;
    cdsBemlocaId: TIntegerField;
    cdsBemgestaoId: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    idenficacao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    procedure FormPaint(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsBemStateChange(Sender: TObject);
    procedure dsBemDataChange(Sender: TObject; Field: TField);
    procedure cdsBemReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
	private
		{ Private declarations }
		_empresaId : Integer;
	public
		{ Public declarations }
		constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
	end;

var
	frmBem: TfrmBem;

implementation

uses uFuncoes, uDm;

{$R *.dfm}

procedure TfrmBem.btnApagarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsBemidenficacao.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmBem.btnCancelarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		Cancel;
	end;
end;

procedure TfrmBem.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmBem.btnGravarClick(Sender: TObject);
begin
	with cdsBem do
	begin
		Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;
end;

procedure TfrmBem.btnNovoClick(Sender: TObject);
begin
	with cdsBem do
	begin
		Append;
		idenficacao.SetFocus;
	end;
end;

procedure TfrmBem.cdsBemReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmBem.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsBem.DataSet.Open;
	{
	dsPessoa.DataSet.Open;
	dsAuxLocal.DataSet.Open;
	}
end;

procedure TfrmBem.dsBemDataChange(Sender: TObject; Field: TField);
begin
	Caption := cdsBemidenficacao.AsString;
	tsInformacao.Caption := cdsBemidenficacao.AsString;
end;

procedure TfrmBem.dsBemStateChange(Sender: TObject);
begin
	with cdsBem do
	begin
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnApagar.Enabled   := not(State in [dsInsert, dsEdit]);
		if State in [dsInsert] then
		begin
			Caption := 'Novo registro';
		end;
	end;
end;

procedure TfrmBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmBem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	dsBem.DataSet.Close;
end;

procedure TfrmBem.FormPaint(Sender: TObject);
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
	VerticalText(Self,'Registro de bens',Application.Title,Self.Height - 50,30);
end;

end.
