unit uPrincipal;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, Menus, ComCtrls, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
	uGlobais, ToolWin, ExtCtrls, ActnCtrls, StdCtrls, ActnColorMaps;

type
	TfrmPrincipal = class(TForm)
		MainMenu: TMainMenu;
		Operaes1: TMenuItem;
		IncorporarBem1: TMenuItem;
		N1: TMenuItem;
		Registrodepessoas1: TMenuItem;
		N2: TMenuItem;
		ransferencia1: TMenuItem;
		N3: TMenuItem;
		Finalizarsistema1: TMenuItem;
		Relatrios1: TMenuItem;
		N4: TMenuItem;
		StatusBar: TStatusBar;
		Grupos1: TMenuItem;
		Locais1: TMenuItem;
		ActionManager: TActionManager;
		actPessoa: TAction;
		actLocais: TAction;
    rocardeusurio1: TMenuItem;
    actGrupos: TAction;
    actRegistroBens: TAction;
    pnToolBar: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    actSobre: TAction;
    Informaessobreoprojeto1: TMenuItem;
    actInfoEmpresa: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actMovimentacao: TAction;
    ToolButton9: TToolButton;
    Movimentao1: TMenuItem;
    N5: TMenuItem;
    Impotardados1: TMenuItem;
    Manuteno1: TMenuItem;
    Importar1: TMenuItem;
    RTermodeResponsabilidade1: TMenuItem;
		procedure actLocaisExecute(Sender: TObject);
		procedure actPessoaExecute(Sender: TObject);
    procedure actGruposExecute(Sender: TObject);
    procedure actRegistroBensExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actInfoEmpresaExecute(Sender: TObject);
    procedure actMovimentacaoExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Importar1Click(Sender: TObject);
    procedure RTermodeResponsabilidade1Click(Sender: TObject);
	private
		{ Private declarations }
		procedure updateInfo;
	public
		{ Public declarations }
	end;

var
	frmPrincipal: TfrmPrincipal;

implementation

uses uLocal, uAcesso, uDm, uPessoa, uGrupo, uBem, uFuncoes, uMd5, uSobre,
  uEmpresa, uMovimentacao, uTransferencia, uAlteracaoSenha,
  uRelatTransferenciaBem;

{$R *.dfm}

procedure TfrmPrincipal.actGruposExecute(Sender: TObject);
begin
	with TfrmGrupo.Create(Application, gEmpresaId) do
	begin
		try
			Show;
		finally
			//Free - Metodo configurado dentro do formulario;
		end;
	end;
end;

procedure TfrmPrincipal.actInfoEmpresaExecute(Sender: TObject);
begin
	with TfrmEmpresa.Create(Application, gEmpresaId) do
	begin
		try
			Show;
		finally
			//Free - Metodo configurado dentro do formulario;
		end;
  end;
end;

procedure TfrmPrincipal.actLocaisExecute(Sender: TObject);
begin
	with TfrmLocal.Create(Application, gEmpresaId) do
	begin
		try
			Show;
		finally
			//Free - Metodo configurado dentro do formulario;
		end;
	end;
end;

procedure TfrmPrincipal.actMovimentacaoExecute(Sender: TObject);
begin
	with TfrmMovimentacao.Create(Application, gEmpresaId) do
	begin
		try
			ShowModal;
		finally
			Free;
		end;
	end;
end;

procedure TfrmPrincipal.actPessoaExecute(Sender: TObject);
begin
	with TfrmPessoa.Create(Application, gEmpresaId) do
	begin
		try
			Show;
		finally
			//Free - Metodo configurado dentro do formulario;
		end;
	end;
end;

procedure TfrmPrincipal.actRegistroBensExecute(Sender: TObject);
begin
	with TfrmBem.Create(Application, gEmpresaId) do
	begin
		Show;
  end;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
	with TfrmSobre.Create(Application) do
	begin
		try
			ShowModal;
		finally
			Free;
		end;
	end;
end;

procedure TfrmPrincipal.updateInfo;
begin
	Caption := Concat('Patrimonio - ', gEmpresaFantasia);
	StatusBar.Panels[0].Text := 'Usuário:';
	StatusBar.Panels[1].Text := gUsuarioNome;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	CanClose := (Application.MessageBox(	'Deseja realmente sair do sistema?',
																			PChar(Application.Title),
																			MB_ICONQUESTION or MB_YESNO) = IDYES);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
	_auth : Boolean;
	Index : Integer;
begin
	_auth := Autenticacao;
	with ActionManager do
	begin
		for Index := 0 to ActionCount -1 do
		begin
			TAction(Actions[Index]).Enabled := _auth;
		end;
	end;
	updateInfo;
end;

procedure TfrmPrincipal.Importar1Click(Sender: TObject);
begin
	with TfrmTransferencia.Create(Application) do
	begin
		ShowModal;
  end;
end;

procedure TfrmPrincipal.RTermodeResponsabilidade1Click(Sender: TObject);
begin
	with TfrmRelatTranferenciaBem.Create(Application) do
	begin
		try
			ShowModal;
		finally
			Free;
		end;
	end;
end;

end.
