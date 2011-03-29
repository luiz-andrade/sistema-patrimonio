program patrimonio;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincpal},
  uDm in 'uDm.pas' {dm: TDataModule},
  uLocais in 'uLocais.pas' {frmLocais},
  uGlobais in 'uGlobais.pas',
  uAcesso in 'uAcesso.pas' {frmAcesso},
  uFuncoes in 'uFuncoes.pas',
  uMd5 in 'uMd5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincpal, frmPrincpal);
  Application.CreateForm(TfrmAcesso, frmAcesso);
  Application.Run;
end.
