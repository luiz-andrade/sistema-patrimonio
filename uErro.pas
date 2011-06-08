unit uErro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Buttons;

type
  TfrmErro = class(TForm)
    memErro: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Image: TImage;
    btnContinuar: TBitBtn;
    btnFinalizar: TBitBtn;
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErro: TfrmErro;

implementation

{$R *.dfm}

procedure TfrmErro.btnContinuarClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmErro.btnFinalizarClick(Sender: TObject);
begin
	Application.Terminate;
end;

end.
