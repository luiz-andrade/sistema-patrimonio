program Instalador;

uses
  Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FormPrinicipal},
  untWaterEffect in 'untWaterEffect.pas',
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrinicipal, FormPrinicipal);
  Application.CreateForm(TFormPrinicipal, FormPrinicipal);
  Application.Run;
end.
