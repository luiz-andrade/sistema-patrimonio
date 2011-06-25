unit uGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  Provider, DB, DBClient, untWaterEffect, pngimage;

type
  TfrmGrupo = class(TForm)
    pcGeral: TPageControl;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    txtPesquisa: TEdit;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    tsInformacao: TTabSheet;
    dsGrupo: TDataSource;
    cdsGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupodescricao: TStringField;
    cdsGrupoempresaId: TIntegerField;
    Label1: TLabel;
    descricao: TDBEdit;
    cdsAuxGrupo: TClientDataSet;
    dsAuxGrupo: TDataSource;
    pnLateral: TPanel;
    imgLateral: TImage;
    Timer: TTimer;
    pnAcoes: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dbgSubGrupo: TDBGrid;
    lblSubGrupo: TLabel;
    DBNavigator1: TDBNavigator;
    cdsGrupogrupoId: TStringField;
    cdsAuxGrupogrupoId: TStringField;
    cdsAuxGrupovGrupoId: TStringField;
    Label3: TLabel;
    grupoId: TDBEdit;
    dspAuxGrupo: TDataSetProvider;
    cdsAuxGrupoempresaId: TIntegerField;
    cdsAuxGrupodescricao: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsGrupoStateChange(Sender: TObject);
    procedure dsGrupoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsGrupoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsGrupoAfterEdit(DataSet: TDataSet);
    procedure cdsGrupoAfterInsert(DataSet: TDataSet);
    procedure cdsAuxGrupoAfterInsert(DataSet: TDataSet);
    procedure cdsAuxGrupoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAuxGrupoAfterDelete(DataSet: TDataSet);
    procedure cdsAuxGrupoAfterPost(DataSet: TDataSet);
    procedure dbgSubGrupoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txtPesquisaChange(Sender: TObject);
    procedure dspGrupoAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure pcGeralChange(Sender: TObject);
	private
		{ Private declarations }
		_empresaId : Integer;
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
		_grupoId : String;
	public
		{ Public declarations }
		constructor Create(AOwner: TComponent; empresaId: Integer);reintroduce;overload;
	end;

var
	frmGrupo: TfrmGrupo;

implementation

uses uGlobais, uFuncoes, uDm;

{$R *.dfm}

procedure TfrmGrupo.btnApagarClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		if Application.MessageBox(PChar(Concat('Confirmar a deleção do registro: ',cdsGrupodescricao.AsString)), PChar(Application.Title), MB_ICONQUESTION or MB_YESNO) = IDYES then
		begin
			Delete;
			ApplyUpdates(-1);
		end;
	end;
end;

procedure TfrmGrupo.btnCancelarClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		Cancel;
	end;
end;

procedure TfrmGrupo.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmGrupo.btnGravarClick(Sender: TObject);
begin
	with cdsAuxGrupo do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
	end;

	with cdsGrupo do
	begin
		if State in [dsInsert, dsEdit] then
			Post;
		ApplyUpdates(-1);
		Close;
		Open;
		Locate('grupoId', _grupoId, [loCaseInsensitive]);
	end;
end;

procedure TfrmGrupo.btnNovoClick(Sender: TObject);
begin
	with cdsGrupo do
	begin
		Append;
		tsInformacao.Show;
		descricao.SetFocus;
	end;
end;

procedure TfrmGrupo.cdsAuxGrupoAfterDelete(DataSet: TDataSet);
begin
	cdsGrupo.Edit;
end;

procedure TfrmGrupo.cdsAuxGrupoAfterInsert(DataSet: TDataSet);
begin
	cdsAuxGrupoempresaId.Value := _empresaId;
end;

procedure TfrmGrupo.cdsAuxGrupoAfterPost(DataSet: TDataSet);
begin
	cdsGrupo.Edit;
end;

procedure TfrmGrupo.cdsAuxGrupoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

procedure TfrmGrupo.cdsGrupoAfterEdit(DataSet: TDataSet);
begin
	_grupoId := cdsGrupogrupoId.AsString;
end;

procedure TfrmGrupo.cdsGrupoAfterInsert(DataSet: TDataSet);
begin
	cdsGrupoempresaId.Value := _empresaId;
end;

procedure TfrmGrupo.cdsGrupoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	raise Exception.Create(E.Message);
	Action := raAbort;
end;

constructor TfrmGrupo.Create(AOwner: TComponent; empresaId: Integer);
begin
	inherited Create(AOwner);
	_empresaId := empresaId;
	tsPesquisa.Show;
	// Abre tabelas.
	cdsGrupo.CommandText := 'select * from grupo where vGrupoId = 0';
	dsGrupo.DataSet.Open;
	dsAuxGrupo.DataSet.Open;
end;

procedure TfrmGrupo.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
	DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmGrupo.dbgSubGrupoDrawColumnCell(Sender: TObject;
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

procedure TfrmGrupo.dsGrupoDataChange(Sender: TObject; Field: TField);
begin
	if cdsGrupo.IsEmpty then
	begin
		Caption := 'Cadastro de grupos';
		tsInformacao.Caption := 'Cadastrar';
	end
	else
	begin
		Caption := Concat('Grupo - ', cdsGrupodescricao.AsString);
		tsInformacao.Caption := Concat('Grupo - ', cdsGrupodescricao.AsString);
	end;
end;

procedure TfrmGrupo.dsGrupoStateChange(Sender: TObject);
begin
	with cdsGrupo do
	begin
		btnNovo.Enabled     := not(State in [dsInsert, dsEdit]);
		btnGravar.Enabled   := (State in [dsInsert, dsEdit]);
		btnCancelar.Enabled := (State in [dsInsert, dsEdit]);
		btnApagar.Enabled   := not(State in [dsInsert, dsEdit]);
		dbgSubGrupo.Visible := not(State in [dsInsert]);
		lblSubGrupo.Visible := not(State in [dsInsert]);
		grupoId.Enabled     := not(State in [dsEdit, dsBrowse]);
		if State in [dsInsert] then
		begin
			Caption := 'Novo registro';
		end;
	end;
end;

procedure TfrmGrupo.dspGrupoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  _grupoId :=cdsGrupogrupoId.AsString;
end;

procedure TfrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree; // Configura formulario para ser destruido ao fechar.
end;

procedure TfrmGrupo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	// Fecha tabelas.
  with dsAuxGrupo.DataSet do
  begin
		if State in [dsInsert, dsEdit] then
			Cancel;
    Close;
  end;
	with dsGrupo.DataSet do
	begin
		if State in [dsInsert, dsEdit] then
			Cancel;
		Close;
  end;
end;

procedure TfrmGrupo.FormCreate(Sender: TObject);
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

procedure TfrmGrupo.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then btnFechar.Click;
end;

procedure TfrmGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then SelectNext(ActiveControl, True, True);
end;

procedure TfrmGrupo.imgLateralMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmGrupo.pcGeralChange(Sender: TObject);
begin
	btnApagar.Visible := (tsPesquisa.Showing);
  btnNovo.Visible   := (tsPesquisa.Showing);
end;

procedure TfrmGrupo.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgLateral.Picture.Bitmap);
	VerticalText(imgLateral, 'Cadastro de grupos',Application.Title,Self.Height - 50,30);
end;

procedure TfrmGrupo.txtPesquisaChange(Sender: TObject);
begin
	with cdsGrupo do
	begin
		if not(IsEmpty) then
		begin
			case cbPesquisar.ItemIndex of
				0 : Locate('descricao', txtPesquisa.Text, [loPartialKey]);
			end;
		end;
	end;
end;

end.
