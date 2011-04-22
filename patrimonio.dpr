program patrimonio;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDm in 'uDm.pas' {dm: TDataModule},
  uLocal in 'uLocal.pas' {frmLocal},
  uGlobais in 'uGlobais.pas',
  uAcesso in 'uAcesso.pas' {frmAcesso},
  uFuncoes in 'uFuncoes.pas',
  uMd5 in 'uMd5.pas',
  uPessoa in 'uPessoa.pas' {frmPessoa},
  uGrupo in 'uGrupo.pas' {frmGrupo},
  uBem in 'uBem.pas' {frmBem},
  untWaterEffect in 'untWaterEffect.pas',
  uSobre in 'uSobre.pas' {frmSobre},
  uControlsTunning in 'uControlsTunning.pas',
  uAlteracaoSenha in 'uAlteracaoSenha.pas' {frmAlteracaoSenha},
  uEmpresa in 'uEmpresa.pas' {frmEmpresa},
  uTransferencia in 'uTransferencia.pas' {frmTransferência},
  uMovimentacao in 'uMovimentacao.pas' {frmMovimentacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle de Patrimônio';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
