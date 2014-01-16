unit FrmPrincipal;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, ExtCtrls, pngimage, StdCtrls, untWaterEffect, StrUtils, IniFiles, ADODB, 
	ShellAPI, TlHelp32, Psapi, DB;

type
  TFormPrinicipal = class(TForm)
    btnCancelar: TButton;
    pnTopo: TPanel;
    imgCental: TImage;
    Timer: TTimer;
    Button1: TButton;
    chkBanco: TCheckBox;
    Label1: TLabel;
    edtEndServidor: TEdit;
    chkSistema: TCheckBox;
    Label2: TLabel;
    edtPassword: TEdit;
    Label3: TLabel;
    edtLocalInstalacao: TEdit;
    edtInstalador: TEdit;
    Label4: TLabel;
    chkCriarBanco: TCheckBox;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkCriarBancoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
		{ Private declarations }
		Water : TWaterEffect;
		bmp : TBitmap;
		xImage : Integer;
	public
		{ Public declarations }
	end;

var
	FormPrinicipal: TFormPrinicipal;

implementation

uses uFuncoes;

{$R *.dfm}

function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;


function TerminarProcesso(sFile: String): Boolean;
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

procedure CriarBanco(local, destination, password : String);
var
	params : String;
	cmd : String;
	config : String;
	databaseScript : String;
	log : WideString;
begin
	cmd := Concat('C:\Program Files\Microsoft SQL Server\100\Tools\Binn\osql.exe -S '
									,'localhost\sqlexpress'
									,' -E ' // Connecta localmente sem informar password.
									,' -n ' // Remove numeração
									,' -i ' // Informa arquivo com script
									,databaseScript);
	log := GetDosOutput(cmd);
	TerminarProcesso('osql');
	TerminarProcesso('cmd');
end;

procedure InstallMssql(local, destination, password, instalador : String);
var
	params : String;
	cmd : String;
	config : String;
	databaseScript : String;
	log : WideString;
begin
	databaseScript := (local + 'database.sql');
	config := local + 'ConfigurationFile.INI';
	params := Concat(	' /ACTION=Install ',
										'UIMODE=Normal',
										' /IACCEPTSQLSERVERLICENSETERMS ',
										' /SAPWD=',password,' ',
										' /INSTANCEID=',('SQLExpress'),' ',
										' /FEATURES=',('SQLENGINE'),' ',
										' /HELP=',('False'),' ',
										' /INDICATEPROGRESS=',('False'),' ',
										' /QUIETSIMPLE=',('False'),' ',
										' /INSTANCENAME=',('SQLEXPRESS'),' ',
										' /ADDCURRENTUSERASSQLADMIN=',('True'),' ',
										' /TCPENABLED=',('1'),' ',
										' /NPENABLED=',('1'),' ',
										' /SQLSVCACCOUNT=',('NT AUTHORITY\LOCAL SERVICE'),' ',
										' /SECURITYMODE=',('SQL'),' ',
										' /SQLSVCSTARTUPTYPE=',('Automatic'),' ',
										' /AGTSVCACCOUNT=',QuotedStr('NT AUTHORITY\NETWORK SERVICE'),' '{,
										'/ConfigurationFile=',config, ' '}
										);
	cmd := local + instalador;
	ShellExecute(Application.Handle,nil,PWideChar(cmd),PWideChar(params),nil, SW_SHOWNORMAL);
	//ShellExecute(0,'open','osql',PWideChar('-S localhost\sqlexpress -E -i ' + databaseScript),nil, SW_SHOWNORMAL);
end;

procedure CreateDbFileIni(destination, password, host : String);
	var
		connStr : String;
	const
		dbfileName : String = 'dbxcon.udl';
begin
	connStr := Concat('Password=',Password,';',
										'Persist Security Info=True;',
										'User ID=sa;',
										'Initial Catalog=patrimonio;',
										'Data Source=', host);
	if FileExists(destination + dbfileName) then
		DeleteFile(destination + dbfileName);
	CreateUDLFile(destination + dbfileName,'SQLNCLI10.1', connStr);
end;

procedure CopyFiles(local, destination : String);
var
		i : Integer;
begin
	with TStringList.Create do
	begin
		LoadFromFile(local + 'InstallOpt.txt');
		if (Count > 0) then
		begin
			begin
				if ForceDirectories(destination) then
					begin
						if ForceDirectories(destination + '\reports') then
						begin
							for i := 0 to Count -1 do
							begin
								if not FileExists(PWideChar(destination + Strings[i])) then
									CopyFile(PWideChar(local + Strings[i]),PWideChar(destination + Strings[i]),false);
							end;
						end;
					end;
			end;
		end;
	end;
end;

procedure TFormPrinicipal.btnCancelarClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TFormPrinicipal.Button1Click(Sender: TObject);
var
	local,
	destination, password, host : String;
begin
	password := edtPassword.Text;
	host := edtEndServidor.Text;
	local := ExtractFilePath(Application.ExeName);
	destination := edtLocalInstalacao.Text;
	if RightStr(destination,1) <> '\' then 
		destination := destination + '\';
	if(chkSistema.Checked) then
		CopyFiles(local, destination);
	CreateDbFileIni(destination, password, host);
	if(chkBanco.Checked) then
	begin
		InstallMssql(local, destination,password, edtInstalador.Text);
	end;
	if(chkCriarBanco.Checked) then
	begin
    CriarBanco(local, destination,password);
  end;
end;


procedure TFormPrinicipal.FormCreate(Sender: TObject);
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

procedure TFormPrinicipal.TimerTimer(Sender: TObject);
begin
	if Random(8) = 1 then
		Water.Blob(-1,-1, Random(1) + 1, Random(500) + 50);
	Water.Render(bmp, imgCental.Picture.Bitmap);
	with imgCental.Canvas do
	begin
		Brush.Style := bsClear;
		TextOut(35, 17, Concat('Versão: ', GetLocalVersion));
	end;
end;


function TestarMssql(password, host : String) : Boolean;
	var
		connStr : String;
begin
	connStr := Concat('Provider=SQLNCLI10.1;'
										,'Password=',Password,';',
										'Persist Security Info=True;',
										'User ID=sa;',
										'Initial Catalog=master;',
										'Data Source=', host);
	with TADOConnection.Create(nil) do
	begin
		try
			try
				ConnectionString := connStr;
				Connected := True;
				Result := (Connected and (FileExists('C:\Program Files\Microsoft SQL Server\100\Tools\Binn\osql.exe') OR FileExists('C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\osql.exe')));
			except
				Result := False;
			end;
		finally
			Free;
		end;
  end;
end;

procedure TFormPrinicipal.chkCriarBancoClick(Sender: TObject);
var
	password, host : String;
begin
	password := edtPassword.Text;
	host := edtEndServidor.Text;
	if not TestarMssql(password, host) then
	begin
		Application.MessageBox('Não foi possível determinar se o banco de dados foi instalado!', 'Banco de dados', MB_ICONERROR);
		chkCriarBanco.Checked := False;
	end;
end;

end.
