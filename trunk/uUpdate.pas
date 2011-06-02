unit uUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ComCtrls, TLHelp32, PsAPI, Math, IdIOHandlerStack, IdSSL;

type
  TfrmUpdate = class(TForm)
    pnTopo: TPanel;
    pnAcoes: TPanel;
    btnAtualizar: TBitBtn;
    btnFechar: TBitBtn;
    ProgressBar: TProgressBar;
    labDirTrabalho: TLabel;
    labVersaoLocal: TLabel;
    Label1: TLabel;
    labVersaoBanco: TLabel;
    Label2: TLabel;
    img: TImage;
    IdHTTP: TIdHTTP;
    procedure btnAtualizarClick(Sender: TObject);
    procedure IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure btnFecharClick(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    _dirTrabalho : String;
    _url         : WideString;
    _versaoDB    : Integer;
    _execName    : String;
    _versaoExe   : String;
    _preUrl      : String;
    function download(_url,_destino : String; _HTTP : TIdHTTP) : Boolean;
    function TerminarProcesso(sFile: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses uFuncoes;

{$R *.dfm}

function TfrmUpdate.TerminarProcesso(sFile: String): Boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap,hdlProcess: THandle;
  bPath,bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: Array [0..1023] of DWORD;
  iC: DWord;
  k,iCount: Integer;
  arrModul: Array [0..299] of Char;
  hdlModul: HMODULE;
begin
  Result := False;
  if ExtractFileName(sFile)=sFile then
    bPath:=false
  else
    bPath:=true;
  verSystem.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId=VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize:=Sizeof(peEntry);
    bLoop:=Process32First(hdlSnap,peEntry);
    while integer(bLoop)<>0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile,sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID), 0);
          Result := True;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile),sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID), 0);
          Result := True;
        end;
      end;
      bLoop := Process32Next(hdlSnap,peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else
    if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then
    begin
      EnumProcesses(@arrPid,SizeOf(arrPid),iC);
      iCount := iC div SizeOf(DWORD);
      for k := 0 to Pred(iCount) do
      begin
        hdlProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
        if (hdlProcess<>0) then
        begin
          EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
          GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
          if bPath then
          begin
            if CompareText(arrModul,sFile) = 0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end
          else
          begin
            if CompareText(ExtractFileName(arrModul),sFile) = 0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end;
          CloseHandle(hdlProcess);
        end;
      end;
    end;
end;

function TfrmUpdate.download(_url,_destino : String; _HTTP : TIdHTTP) : Boolean;
var
  _fStream   : TFileStream;
  _nomeArquivo : string;
begin
  _nomeArquivo := ExtractFileName(_destino);
  _fStream := TFileStream.Create(_destino,fmCreate);
  with _HTTP do
  begin
    try
      //IOHandler := _ISSLOHandler;
      //_ISSLOHandler.SSLOptions.Method := sslvSSLv3;
      with Request do
      begin
        //Username := 'autoUpdate';
        //Password := 'upd@t3098063';
        //BasicAuthentication := True;
      end;
      try
        Get(_url,_fStream);
        Result := True;
      except
        Result := False;
        raise;
      end;
    finally
      FreeAndNil(_fStream);
    end;
  end;
end;

procedure TfrmUpdate.FormShow(Sender: TObject);
begin
  _versaoDB    := 0;
  _versaoExe   := GetLocalVersion;
  _dirTrabalho := ExtractFilePath(Application.ExeName);
  _execName    := ExtractFileName(Application.ExeName);
  _preUrl      := 'http://sistema-patrimonio.googlecode.com/svn/trunk/Release/Win32/patrimonio.exe';
end;

procedure TfrmUpdate.btnAtualizarClick(Sender: TObject);
var
  oNome : String;
  tNome : String;
  msgText : PWideChar;
begin
  try
    msgText := Concat('Sistema atualizado com sucesso,',
                      ' deseja reiniciar o sistema agora?');
    Screen.Cursor := crHourGlass;
    oNome := Concat(_dirTrabalho, _execName);
    tNome := Concat(_dirTrabalho, _execName, '.', _versaoExe);
    if download(_url,Concat(oNome,'_') ,IdHTTP) then
    begin
      try
        Sleep(100);
        RenameFile(oNome, tNome);
        Sleep(100);
        RenameFile(Concat(oNome,'_'),oNome);
        Sleep(100);
        ForceDirectories(Concat(ExtractFilePath(tNome),'Backup\'));
        Sleep(100);
        MoveFile(PWideChar(tNome),PWideChar(Concat(ExtractFilePath(tNome),'Backup\',ExtractFileName(tNome))));
        Sleep(100);
        if Application.MessageBox(msgText, PChar(Application.Title),MB_ICONASTERISK or MB_YESNO) = IDYES then
        begin
          if TerminarProcesso(_execName) then
          begin
            WinExec(PAnsiChar(oNome), SW_SHOWNORMAL);
            Application.Terminate;
          end;
        end;
      except
        raise;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUpdate.IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  with ProgressBar do
  begin
    Position := AWorkCount;
  end;
end;

procedure TfrmUpdate.IdHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  with ProgressBar do
  begin
    Visible  := True;
    Position := 0;
    Max      := AWorkCountMax;
  end;
end;

procedure TfrmUpdate.IdHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  with ProgressBar do
  begin
    Position  := Position;
    Visible := False;
  end;
end;

procedure TfrmUpdate.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUpdate.Label1DblClick(Sender: TObject);
begin
  ShowMessage(_url);
end;

end.
