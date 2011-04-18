unit uPrincipal;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, Menus, ComCtrls, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
	uGlobais, ToolWin, ExtCtrls, ActnCtrls, StdCtrls, ActnColorMaps;

type
	TfrmPrincpal = class(TForm)
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
		procedure actLocaisExecute(Sender: TObject);
		procedure actPessoaExecute(Sender: TObject);
    procedure actGruposExecute(Sender: TObject);
    procedure actRegistroBensExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
		procedure updateInfo;
	public
		{ Public declarations }
	end;

var
	frmPrincpal: TfrmPrincpal;

implementation

uses uLocal, uAcesso, uDm, uPessoa, uGrupo, uBem, uFuncoes, uMd5, uSobre;

{$R *.dfm}

procedure TfrmPrincpal.actGruposExecute(Sender: TObject);
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

procedure TfrmPrincpal.actLocaisExecute(Sender: TObject);
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

procedure TfrmPrincpal.actPessoaExecute(Sender: TObject);
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

procedure TfrmPrincpal.actRegistroBensExecute(Sender: TObject);
begin
	with TfrmBem.Create(Application, gEmpresaId) do
	begin
		Show;
  end;
end;

procedure TfrmPrincpal.actSobreExecute(Sender: TObject);
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

procedure TfrmPrincpal.updateInfo;
begin
	Caption := Concat('Patrimonio - ', gEmpresaFantasia);
	StatusBar.Panels[0].Text := 'Usuário:';
	StatusBar.Panels[1].Text := gUsuarioNome;
end;

procedure TfrmPrincpal.FormShow(Sender: TObject);
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

end.
