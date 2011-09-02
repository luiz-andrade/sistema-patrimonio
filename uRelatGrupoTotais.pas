unit uRelatGrupoTotais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Provider, DBCtrls, StdCtrls, Buttons, pngimage,
  ExtCtrls;

type
  TfrmRelatTotaisGrupo = class(TForm)
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
    pnLateral: TPanel;
    imgLateral: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbGrupoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatTotaisGrupo: TfrmRelatTotaisGrupo;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmRelatTotaisGrupo.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelatTotaisGrupo.btnVisualizarClick(Sender: TObject);
begin
	with dm.rvpTR do
	begin
		// Filtro de grupos
		with dm.totaisSubGrupos do
		begin
			Close;
			SQL.Clear;
			SQL.Add('select	grupo.grupoId,');
			SQL.Add('	grupo.descricao,');
			SQL.Add('								grupo.vGrupoId,');
			SQL.Add('	coalesce(SUM(bem.valor),0) as total,');
      SQL.Add('coalesce(SUM(bem.quantidade),0) as quantidade');
			SQL.Add('from grupo inner join bem');
			SQL.Add('			on grupo.grupoId = bem.subgrupoId');
      if cbGrupo.Checked then
      begin
				SQL.Add('where vGrupoId = :vGrupoId');
 				Parameters.ParamByName('vGrupoId').Value := dblGrupo.KeyValue;
			end;
			if cbSubGrupo.Checked then
			begin
				SQL.Add('and grupo.grupoId = :grupoId');
				Parameters.ParamByName('grupoId').Value := dblSubGrupo.KeyValue;
			end;
			if cbGestao.Checked then
			begin
				SQL.Add('and bem.gestaoId = :gestaoId');
				Parameters.ParamByName('gestaoId').Value := dblGestaoId.KeyValue;
			end;
			SQL.Add('group by	grupo.grupoId,');
			SQL.Add('	grupo.descricao,');
			SQL.Add('			grupo.vGrupoId');
    	SQL.Add('order by grupo.grupoId')
		end;
		// Filtro de grupos
		with dm.totaisGrupos do
		begin
				Close;
				SQL.Clear;
				SQL.Add('select	grupo.grupoId,');
				SQL.Add('		grupo.descricao,');
				SQL.Add('		coalesce(SUM(bem.valor),0) as total,');
        SQL.Add('coalesce(SUM(bem.quantidade),0) as quantidade');
				SQL.Add('from grupo inner join bem');
				SQL.Add('			on grupo.grupoId = bem.grupoId');
				SQL.Add('where vGrupoId = 0');
				if cbGrupo.Checked then
				begin
					SQL.Add('and grupo.grupoId = :grupoId');
					Parameters.ParamByName('grupoId').Value := dblGrupo.KeyValue;
				end;
				if cbGestao.Checked then
				begin
					SQL.Add('and bem.gestaoId = :gestaoId');
					Parameters.ParamByName('gestaoId').Value := dblGestaoId.KeyValue;
				end;
				SQL.Add('group by	grupo.grupoId,');
				SQL.Add('			grupo.descricao');
        SQL.Add('order by grupo.grupoId')
		end;
		ProjectFile := Concat(ExtractFilePath(Application.ExeName), 'Reports\', 'reportMovimentacao.rav');
		ExecuteReport('TOTAISGRUPO');
	end;
end;

procedure TfrmRelatTotaisGrupo.cbGrupoClick(Sender: TObject);
begin
	dblSubGrupo.Enabled   := not(dblSubGrupo.Enabled);
	cbSubGrupo.Enabled := not(cbSubGrupo.Enabled);
end;

procedure TfrmRelatTotaisGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	cdsGrupo.Close;
	cdsAuxGrupo.Close;
	cdsGestao.Close;
end;

procedure TfrmRelatTotaisGrupo.FormCreate(Sender: TObject);
begin
	cdsGrupo.Open;
	cdsAuxGrupo.Open;
	cdsAuxGrupo.Refresh;
	cdsGestao.Open;
end;

end.
