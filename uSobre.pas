unit uSobre;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, adodb, ComCtrls, pngimage,
  PngSpeedButton, untWaterEffect;

type
   TfrmSobre = class(TForm)
    Img1: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblAtualizacao: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    lblVersao: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    lblLicenca: TLabel;
    Panel1: TPanel;
    PngSpeedButton1: TPngSpeedButton;
    Image2: TImage;
    tmr1: TTimer;
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tmr1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
   private
    { Private declarations }
    Water: TWaterEffect;
    Bmp: TBitmap;
   public
    { Public declarations }
    x:integer;
   end;

var
   frmSobre: TfrmSobre;

implementation

uses uDM, DB, uFuncoes, uPrincipal;

{$R *.dfm}

procedure TfrmSobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #27 then
      Close;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  Bmp := TBitmap.Create;
  Bmp.Assign(img1.Picture.Graphic);
  img1.Picture.Graphic := nil;
  img1.Picture.Bitmap.Height := Bmp.Height;
  img1.Picture.Bitmap.Width := Bmp.Width;
  Water := TWaterEffect.Create;
  Water.SetSize(Bmp.Width,Bmp.Height);
  
  x:=img1.Height;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
//  strSql := 'select cofAtualizacao from config';
//  ConsultaSql(dm.qryPesquisa1, strSql);

  lblVersao.Caption     := GetVersionInfo;
  lblAtualizacao.Caption:= frmPrincipal.qryConfig.fieldByName('cofAtualizacao').AsString;
  lblLicenca.Caption    := 'Licenciado: '+ UpperCase(frmPrincipal.qryConfig.fieldByName('cofEmpRazao').AsString);
end;

procedure TfrmSobre.PngSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSobre.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Water.Blob(x,y,1,100);
end;

procedure TfrmSobre.tmr1Timer(Sender: TObject);
begin
  if Random(8)= 1 then
    Water.Blob(-1,-1,Random(1)+1,Random(500)+50);
  Water.Render(Bmp,img1.Picture.Bitmap);

  with img1.Canvas do
    begin
      Brush.Style:=bsClear;
      font.size:=12;
//      Font.Style:=[fsBold];
//      Font.Name := '¡• È';
      font.color:=$FFFFFF;
      TextOut((Bmp.Width - TextWidth(''))div 2+2,10,'');
    end;
end;

procedure TfrmSobre.FormDestroy(Sender: TObject);
begin
  Bmp.Free;
  Water.Free;
end;

end.
