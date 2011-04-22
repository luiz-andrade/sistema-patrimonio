unit uFuncoes;

interface

uses 	uMd5, DB, SqlExpr, uDm, SysUtils, Classes, Forms, Dialogs, Windows, 
			Messages, Graphics, ExtCtrls;

function validaAcesso(login : String; pws : String) : TDataSet;
procedure VerticalText(Form : TForm; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
procedure VerticalText(img : TImage; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
function Autenticacao : Boolean;
function alteraSenhaUsuario(login, oldPws : String; nUser : Boolean) : WideString;
function GetLocalVersion: String;


implementation

uses uAcesso, uAlteracaoSenha;

/// <summary>
///   Exibe tela de autenticação do usuário.
/// </summary>
function Autenticacao : Boolean;
begin
	with TfrmAcesso.Create(Application) do
	begin
		try
			ShowModal;
			Result := _liberado;
		finally
			Free;
		end;
	end;
end;

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
			with SQL do
			begin
				Add('select usuario.usuarioId, usuario.login, pessoa.nome, usuario.senha');
				Add('from usuario inner join pessoa on pessoa.pessoaId = usuario.pessoaId');
				Add('where usuario.login=:login and usuario.senha=:senha');
				Add('and desativado = :desativado');
			end;
			ParamByName('login').AsString := login;
			ParamByName('senha').AsString := MD5Print(MD5String(pws));
			ParamByName('desativado').AsBoolean := False;
			try
				Open;
				Result := qryValidaAcesso;
			except
				raise;
			end;
		finally
			//Free; - Objeto destruido no escopo da chamada.
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

function alteraSenhaUsuario(login, oldPws : String; nUser : Boolean) : WideString;
begin
	with TfrmAlteracaoSenha.Create(Application, login, oldPws, nUser) do
	begin
		try
			ShowModal;
			Result := _resulPws;
		finally
			Free;
		end;
	end;
end;

end.
