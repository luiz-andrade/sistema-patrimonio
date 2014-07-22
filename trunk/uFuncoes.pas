unit uFuncoes;

interface

uses 	uMd5, DB, uDm, SysUtils, Classes, Forms, Dialogs, Windows,
			Messages, Graphics, ExtCtrls, ADODB, Inifiles;

function validaAcesso(login : String; pws : String) : TDataSet;
procedure VerticalText(Form : TForm; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
procedure VerticalText(img : TImage; Texto1, Texto2 : String; Top : Integer; FontSize : Integer);overload;
function GetBemById(bemId : Integer) : TDataSet;overload;
function GetBemById(bemId : Integer; locaId : String) : TDataSet;overload;
function GetBemByIdentif(identificacao : String; locaId : String) : TDataSet;overload;
function GetBensByLocal(locaId : String; subLocalId : String = '') : TDataSet;
function Autenticacao : Boolean;
function alteraSenhaUsuario(login, oldPws : String; nUser : Boolean) : WideString;
function GetLocalVersion: String;
function getLastId() : Integer;
function cript(str: WideString): WideString;
procedure gravaUsuarioAcao(usuarioId : Integer; acaoId : Integer);
procedure removeUsuarioAcao(usuarioId : Integer; acaoId : Integer);
function verificaUsuarioAcao(usuarioId : Integer; acao : String) : Boolean;
function GetFornecedorId(razaoSocial : String) : Integer;
function getGestaoId(nome : String) : Integer;
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
	qryValidaAcesso : TADOQuery;
begin
	Result := nil;
	qryValidaAcesso := TADOQuery.Create(nil);
	with qryValidaAcesso do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			with SQL do
			begin
				Add('select usuario.usuarioId, usuario.login, pessoa.nome, usuario.senha');
				Add('from usuario inner join pessoa on pessoa.pessoaId = usuario.pessoaId');
				Add('where usuario.login=:login and usuario.senha=:senha');
				Add('and desativado = :desativado');
			end;
      with Parameters do
      begin
        ParamByName('login').Value := login;
        ParamByName('senha').Value := MD5Print(MD5String(pws));
        ParamByName('desativado').Value := False;
      end;
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

function cript(str: WideString): WideString;
var
	c: integer;
begin
	result := '';
	for c := 1 to length(str) do
		result := chr(ord(str[c]) xor $DD) + result;
end;

function GetBemById(bemId : Integer) : TDataSet;
var
	qryBem : TADOQuery;
begin
	qryBem := TADOQuery.Create(nil);
	with qryBem do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			SQL.Clear;
			SQL.Add('select * from bem where bemId = :bemId');
			Parameters.ParamByName('bemId').Value := bemId;
			Open;
			Result := qryBem;
		except
			raise;
		end;
	end;
end;

function GetBemByIdentif(identificacao : String; locaId : String) : TDataSet;overload;
var
	qryBem : TADOQuery;
begin
	qryBem := TADOQuery.Create(nil);
	with qryBem do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			SQL.Clear;
			SQL.Add('select * from bem where identificacao = :identificacao and SublocalId = :localId');
			Parameters.ParamByName('identificacao').Value   := identificacao;
			Parameters.ParamByName('localId').Value := locaId;
			Open;
			Result := qryBem;
		except
			raise;
		end;
	end;
end;

function GetBensByLocal(locaId : String; subLocalId : String = '') : TDataSet;
var
	qryBem : TADOQuery;
begin
	qryBem := TADOQuery.Create(nil);
	with qryBem do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			SQL.Clear;
			SQL.Add('select * from bem where localId = :localId');
      if Trim(subLocalId) <> '' then
      begin
      	SQL.Add('and SublocalId = :SublocalId');
      	Parameters.ParamByName('SublocalId').Value := subLocalId;
      end;
			Parameters.ParamByName('localId').Value := locaId;
			Open;
			Result := qryBem;
		except
			raise;
		end;
	end;
end;

function GetBemById(bemId : Integer; locaId : String) : TDataSet;
var
	qryBem : TADOQuery;
begin
	qryBem := TADOQuery.Create(nil);
	with qryBem do
	begin
		try
			Close;
			Connection := dm.ADOConnection;
			SQL.Clear;
			SQL.Add('select * from bem where bemId = :bemId and SublocalId = :localId');
			Parameters.ParamByName('bemId').Value   := bemId;
			Parameters.ParamByName('localId').Value := locaId;
			Open;
			Result := qryBem;
		except
			raise;
		end;
	end;
end;

function GetLastId() : Integer;
begin
	Result := -1;
	with TADOQuery.Create(nil) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('select @@identity as newId');
				Open;
				Result := FieldByName('newId').AsInteger;
				Close;
			except;
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure gravaUsuarioAcao(usuarioId : Integer; acaoId : Integer);
begin
	with TADOCommand.Create(nil) do
	begin
		try
			try
				Connection := dm.ADOConnection;
        CommandText := 'insert into usuarioAcao(usuarioId, acaoId) values(:usuarioId, :acaoId)';
				with Parameters do
				begin
					ParamByName('usuarioId').Value := usuarioId;
					ParamByName('acaoId').Value    := acaoId;
				end;
				Execute;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

procedure removeUsuarioAcao(usuarioId : Integer; acaoId : Integer);
begin
	with TADOCommand.Create(nil) do
	begin
		try
			try
				Connection := dm.ADOConnection;
				CommandText := 'delete usuarioAcao where usuarioId = :usuarioid and acaoId = :acaoId';
				with Parameters do
				begin
					ParamByName('usuarioId').Value := usuarioId;
					ParamByName('acaoId').Value    := acaoId;
				end;
				Execute();
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

function verificaUsuarioAcao(usuarioId : Integer; acao : String) : Boolean;
begin
	Result := False;
	with TADOQuery.Create(nil) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Add('select * from vUsuarioAcao where nomeAcao = :nomeAcao and usuarioId = :usuarioId');
				with Parameters do
				begin
					ParamByName('usuarioId').Value := usuarioId;
					ParamByName('nomeAcao').Value    := acao;
				end;
				Open;
				Result := not IsEmpty;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

function GetFornecedorId(razaoSocial : String) : Integer;
begin
	Result := -1;
	with TADOQuery.Create(nil) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('select fornecedorId from fornecedor where razaoSocial = :razaoSocial');
				Parameters.ParamByName('razaoSocial').Value := razaoSocial;
				Open;
				if not(IsEmpty) then
				begin
					Result := FieldByName('fornecedorId').Value;
				end;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

function getGestaoId(nome : String) : Integer;
begin
	Result := -1;
	with TADOQuery.Create(nil) do
	begin
		try
			try
				Close;
				Connection := dm.ADOConnection;
				SQL.Clear;
				SQL.Add('select * from gestao where gestao =:gestao');
				Parameters.ParamByName('gestao').Value := nome;
				Open;
				if not(IsEmpty) then
				begin
					Result := FieldByName('gestaoId').Value;
				end;
			except
				raise;
			end;
		finally
			Free;
		end;
	end;
end;

end.
