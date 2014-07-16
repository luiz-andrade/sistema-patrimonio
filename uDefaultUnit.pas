unit uDefaultUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, untWaterEffect, StdCtrls, Buttons, DBCtrls,
  Grids, DBGrids, ComCtrls, DB, Provider, DBClient;

type
  TfrmDefaultForm = class(TForm)
    pnLateral: TPanel;
    imgLateral: TImage;
    Timer: TTimer;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    dsPrincipal: TDataSource;
    cdsPrincipal: TClientDataSet;
    dspPrincipal: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsPrincipalAfterEdit(DataSet: TDataSet);
    procedure cdsPrincipalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dspPrincipalAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
  private
    { Private declarations }
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
    _empresaId : Integer;
    _dataIndex : Integer;
    _indexName : String;
    _verticalText : String;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; empresaId : Integer);reintroduce;overload;
    property pEmpresaId : Integer read _empresaId;
    property pDataIndex : Integer read _dataIndex write _dataIndex;
    property pIndexName : String read _indexName write _indexName;
    property pVeriticalText : String read _verticalText write _verticalText;
  end;

var
  frmDefaultForm: TfrmDefaultForm;

implementation

uses uFuncoes, uGlobais, uDm;

{$R *.dfm}

procedure TfrmDefaultForm.btnApagarClick(Sender: TObject);
begin
	with cdsPrincipal do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro atual?')), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			if not(IsEmpty) then
			begin
				Delete;
				ApplyUpdates(-1);
			end;
		end;
	end;
end;

procedure TfrmDefaultForm.btnCancelarClick(Sender: TObject);
begin
	with cdsPrincipal do
	begin
		Cancel;
	end;
end;

procedure TfrmDefaultForm.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDefaultForm.btnGravarClick(Sender: TObject);
begin
	with cdsPrincipal do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate(pIndexName, pDataIndex, [loCaseInsensitive]);
	end;
end;

procedure TfrmDefaultForm.btnNovoClick(Sender: TObject);
begin
	with cdsPrincipal do
	begin
		Append;
		tsInformacao.Show;
	end;
end;

procedure TfrmDefaultForm.cdsPrincipalAfterEdit(DataSet: TDataSet);
begin
  pDataIndex := cdsPrincipal.FieldByName(pIndexName).AsInteger;
end;

procedure TfrmDefaultForm.cdsPrincipalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmDefaultForm.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	dsPrincipal.DataSet.Open;
end;

procedure TfrmDefaultForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	with TDBGrid(Sender) do
	begin
		with Canvas do
		begin
			if not(gdSelected in State) then
			begin
				with DataSource.DataSet do
				begin
					if not(Odd(RecNo)) then
					begin
						Brush.Color := corZebra;
					end;
				end;
			end;
		FillRect(Rect);
		DefaultDrawDataCell(Rect, Column.Field, State);
		end;
	end;
end;

procedure TfrmDefaultForm.dspPrincipalAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
	if cdsPrincipal.FieldByName(pIndexName).IsNull then
	  pDataIndex := getLastId;
end;

procedure TfrmDefaultForm.dsPrincipalStateChange(Sender: TObject);
begin
	with cdsPrincipal do
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

procedure TfrmDefaultForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmDefaultForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	with dsPrincipal.DataSet do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
	end;
end;

procedure TfrmDefaultForm.FormCreate(Sender: TObject);
begin
	bmp := TBitmap.Create;
	bmp.Assign(imgLateral.Picture.Graphic);
	imgLateral.Picture.Graphic := nil;
	imgLateral.Picture.Bitmap.Height  := bmp.Height;
	imgLateral.Picture.Bitmap.Width   := bmp.Width;
	Water := TWaterEffect.Create;
	Water.SetSize(bmp.Width, bmp.Height);
	xImage := imgLateral.Height;
end;

procedure TfrmDefaultForm.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmDefaultForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmDefaultForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmDefaultForm.FormShow(Sender: TObject);
begin
  DBGrid1.Columns[1].Width := DBGrid1.Width - DBGrid1.Columns[0].Width - 50;
end;

procedure TfrmDefaultForm.imgLateralMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmDefaultForm.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral,Self.pVeriticalText,Application.Title,Self.Height - 50,30);
end;

end.
