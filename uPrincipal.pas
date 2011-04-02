unit uPrincipal;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, Menus, ComCtrls, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
	uGlobais, ToolWin, ExtCtrls, ActnCtrls;

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
    actTrocaUsuario: TAction;
    rocardeusurio1: TMenuItem;
    Panel1: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    actGrupos: TAction;
    ToolButton4: TToolButton;
		procedure actLocaisExecute(Sender: TObject);
    procedure actPessoaExecute(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmPrincpal: TfrmPrincpal;

implementation

uses uLocal, uAcesso, uDm, uPessoa;

{$R *.dfm}

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

end.
