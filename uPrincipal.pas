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
    ActionToolBar1: TActionToolBar;
    actGrupos: TAction;
    ToolButton4: TToolButton;
		procedure actLocaisExecute(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmPrincpal: TfrmPrincpal;

implementation

uses uLocais, uAcesso, uDm;

{$R *.dfm}

procedure TfrmPrincpal.actLocaisExecute(Sender: TObject);
begin
	with TfrmLocais.Create(Application, gEmpresaId) do
	begin
		try
			Show;
		finally
      //Free - Methodo configurado dentro do formulario;
		end;
	end;
end;

end.
