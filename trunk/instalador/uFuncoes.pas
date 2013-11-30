unit uFuncoes;

interface

uses DB, SysUtils, Classes, Forms, Dialogs, Windows,
			Messages, Graphics, ExtCtrls, ADODB;

procedure VerticalText(Form : TForm; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
procedure VerticalText(img : TImage; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
function GetLocalVersion: String;
function cript(str: WideString): WideString;
implementation


/// <summary>
///   Escreve texto na vertical.
/// </summary>
procedure VerticalText(Form : TForm; Texto1, Texto2 : String; Top : Integer; FontSize : Integer); 
var
	lf : TLogFont;
	tf : TFont;
	Fonte : String;
	TamanhoFont : Integer;
begin
	Fonte := 'Arial';
	TamanhoFont := FontSize;
	with Form.Canvas do
	begin
		SetBkMode(Handle, TRANSPARENT);
		Font.Name := Fonte;
		Font.Size := TamanhoFont;
		Font.Color := clWhite;
		Font.Style := [fsBold];
		tf := TFont.Create;
		tf.Assign(Font);
		GetObject(tf.Handle, sizeof(lf), @lf);
		lf.lfEscapement  := 900;
		lf.lfOrientation := 300;
		tf.Handle := CreateFontIndirect(lf);
		Font.Assign(tf);
		tf.Free;
		TextOut(5,Top,Texto1);
	end;
	with Form.Canvas do
	begin
		SetBkMode(Handle, TRANSPARENT);
		Font.Name := 'Arial';
		Font.Size := 10;
		Font.Color := clBlack;
		Font.Style := [fsBold];
		tf := TFont.Create;
		tf.Assign(Font);
		GetObject(tf.Handle, sizeof(lf), @lf);
		lf.lfEscapement  := 900;
		lf.lfOrientation := 400;
		tf.Handle := CreateFontIndirect(lf);
		Font.Assign(tf);
		tf.Free;
		TextOut(50,Top,Texto2);
	end;
end;

/// <summary>
///   Escreve texto na vertical.
/// </summary>
procedure VerticalText(Img : TImage; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
var
	lf : TLogFont;
	tf : TFont;
	Fonte : String;
	TamanhoFont : Integer;
begin
	Fonte := 'Arial';
	TamanhoFont := FontSize;
	with Img.Canvas do
	begin
		SetBkMode(Handle, TRANSPARENT);
		Font.Name := Fonte;
		Font.Size := TamanhoFont;
		Font.Color := clWhite;
		Font.Style := [fsBold];
		tf := TFont.Create;
		tf.Assign(Font);
		GetObject(tf.Handle, sizeof(lf), @lf);
		lf.lfEscapement  := 900;
		lf.lfOrientation := 300;
		tf.Handle := CreateFontIndirect(lf);
		Font.Assign(tf);
		tf.Free;
		TextOut(-2,Top,Texto1);
	end;
	with Img.Canvas do
	begin
		SetBkMode(Handle, TRANSPARENT);
		Font.Name := 'Arial';
		Font.Size := 10;
		Font.Color := clBlack;
		Font.Style := [fsBold];
		tf := TFont.Create;
		tf.Assign(Font);
		GetObject(tf.Handle, sizeof(lf), @lf);
		lf.lfEscapement  := 900;
		lf.lfOrientation := 400;
		tf.Handle := CreateFontIndirect(lf);
		Font.Assign(tf);
		tf.Free;
		TextOut(45,Top,Texto2);
	end;
end;

/// <summary>
///   Retorna versão do executável atual.
/// </summary>
function GetLocalVersion: String;
type
	 PFFI = ^vs_FixedFileInfo;
var
	 F       : PFFI;
   Handle  : Dword;
	 Len     : Longint;
	 Data    : Pchar;
	 Buffer  : Pointer;
	 Tamanho : Dword;
	 Parquivo: Pchar;
	 Arquivo : String;
begin
	 Arquivo  := Application.ExeName;
	 Parquivo := StrAlloc(Length(Arquivo) + 1);
	 StrPcopy(Parquivo, Arquivo);
	 Len := GetFileVersionInfoSize(Parquivo, Handle);
	 Result := '';
	 if Len > 0 then
	 begin
			Data:=StrAlloc(Len+1);
			if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
			begin
				 VerQueryValue(Data, '',Buffer,Tamanho);
				 F := PFFI(Buffer);
				 Result := Format('%d.%d.%d.%d',
													[HiWord(F^.dwFileVersionMs),
													 LoWord(F^.dwFileVersionMs),
													 HiWord(F^.dwFileVersionLs),
													 Loword(F^.dwFileVersionLs)]
												 );
			end;
			StrDispose(Data);
	 end;
	 StrDispose(Parquivo);
end;

function cript(str: WideString): WideString;
var
	c: integer;
begin
	result := '';
	for c := 1 to length(str) do 
		result := chr(ord(str[c]) xor $DD) + result;
end;

end.
