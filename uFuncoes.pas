unit uFuncoes;

interface

uses uMd5, DB, SqlExpr, uDm, SysUtils, Classes, Forms, Dialogs, Windows, Messages, Graphics;

function validaAcesso(login : String; pws : String) : TDataSet;
procedure VerticalText(Form : TForm; Texto1, Texto2 : String; Top : Integer; FontSize : Integer); 

implementation

/// <summary>
///   Consulta informações do usuário.
/// </summary>
function validaAcesso(login : String; pws : String) : TDataSet;
var
	qryValidaAcesso : TSQLQuery;
begin
	Result := nil;
	qryValidaAcesso := TSQLQuery.Create(nil);
	with qryValidaAcesso do
	begin
		try
			Close;
			SQLConnection := dm.SQLConnection;
			SQL.Add('select * from usuario where login=:login and senha=:senha');
			ParamByName('login').Value := login;
			ParamByName('senha').Value := MD5Print(MD5String(pws));
			try
				Open;
				Result := qryValidaAcesso;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

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
		Font.Color := $00804000;
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
		Font.Color := clWhite;
		Font.Style := [fsBold];
		tf := TFont.Create;
		tf.Assign(Font);
		GetObject(tf.Handle, sizeof(lf), @lf);
		lf.lfEscapement  := 900;
		lf.lfOrientation := 400;
		tf.Handle := CreateFontIndirect(lf);
		Font.Assign(tf);
		tf.Free;
		TextOut(42,Top,Texto2);
	end;
end;

end.
