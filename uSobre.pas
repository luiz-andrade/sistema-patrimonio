unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls, untWaterEffect;

type
  TfrmSobre = class(TForm)
    memoInfo: TMemo;
    Timer: TTimer;
    btnFechar: TButton;
    pnTopo: TPanel;
    imgCental: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure imgCentalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
  private
		{ Private declarations }
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uFuncoes, uGlobais;

{$R *.dfm}

procedure TfrmSobre.btnFecharClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
	bmp := TBitmap.Create;
	bmp.Assign(imgCental.Picture.Graphic);
	imgCental.Picture.Graphic := nil;
	imgCental.Picture.Bitmap.Height  := bmp.Height;
	imgCental.Picture.Bitmap.Width   := bmp.Width;
	Water := TWaterEffect.Create;
	Water.SetSize(bmp.Width, bmp.Height);
	xImage := imgCental.Height;
end;

procedure TfrmSobre.FormDestroy(Sender: TObject);
begin
	bmp.Free;
	Water.Free;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
	with memoInfo do
	begin
		Clear;
		Lines.Add(Concat('Registrado para: ', gEmpresaFantasia));
		Lines.Add(Concat('Registro: ', gEmpresaChave));
	end;
end;

procedure TfrmSobre.imgCentalMouseMove(Sender: TObject; Shift: TShiftState; X,
	Y: Integer);
begin
	Water.Blob(X,Y,1,100);
end;

procedure TfrmSobre.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgCental.Picture.Bitmap);
	with imgCental.Canvas do
	begin
		Brush.Style := bsClear;
		TextOut(26, 10, Concat('Versão: ', GetLocalVersion));
	end;
end;

end.
