unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Registry,ActiveX,ComObj, ShellAPI, ShlObj;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type
  ShortcutType = (_DESKTOP, _QUICKLAUNCH, _SENDTO, _STARTMENU, _OTHERFOLDER);


var
  Form1: TForm1;

implementation

{$R *.dfm}
{$R res_compiled.res}

function Win_dir: string;
var
  Windir: string;
  WindirP: PChar;
  Res: Cardinal;

begin
  WinDirP := StrAlloc(MAX_PATH);
  Res := GetWindowsDirectory(WinDirP, MAX_PATH);
  if Res > 0 then
    WinDir := StrPas(WinDirP);
  Result := WinDir;
end;

function CreateShortcut(SourceFileName: string; // the file the shortcut points to
                        Location: ShortcutType; // shortcut location
                        SubFolder,  // subfolder of location
                        WorkingDir, // working directory property of the shortcut
                        Parameters,
                        Description: string): //  description property of the shortcut
                        string;
const
  SHELL_FOLDERS_ROOT = 'Software\MicroSoft\Windows\CurrentVersion\Explorer';
  QUICK_LAUNCH_ROOT = 'Software\MicroSoft\Windows\CurrentVersion\GrpConv';
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  Directory, LinkName: string;
  WFileName: WideString;
  Reg: TRegIniFile;
begin

  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;

  MySLink.SetPath(PChar(SourceFileName));
  MySLink.SetArguments(PChar(Parameters));
  MySLink.SetDescription(PChar(Description));

  LinkName := ChangeFileExt(SourceFileName, '.lnk');
  LinkName := ExtractFileName(LinkName);

  // Quicklauch
  if Location = _QUICKLAUNCH then
  begin
    Reg := TRegIniFile.Create(QUICK_LAUNCH_ROOT);
    try
      Directory := Reg.ReadString('MapGroups', 'Quick Launch', '');
    finally
      Reg.Free;
    end;
  end
  else
  // Other locations
  begin
    Reg := TRegIniFile.Create(SHELL_FOLDERS_ROOT);
    try
    case Location of
      _OTHERFOLDER : Directory := SubFolder;
      _DESKTOP     : Directory := Reg.ReadString('Shell Folders', 'Desktop', '');
      _STARTMENU   : Directory := Reg.ReadString('Shell Folders', 'Start Menu', '');
      _SENDTO      : Directory := Reg.ReadString('Shell Folders', 'SendTo', '');
    end;
    finally
      Reg.Free;
    end;
  end;

  if Directory <> '' then
  begin
    if (SubFolder <> '') and (Location <> _OTHERFOLDER) then
      WFileName := Directory + '\' + SubFolder + '\' + LinkName
    else
      WFileName := Directory + '\' + LinkName;


    if WorkingDir = '' then
      MySLink.SetWorkingDirectory(PChar(ExtractFilePath(SourceFileName)))
    else
      MySLink.SetWorkingDirectory(PChar(WorkingDir));

    MyPFile.Save(PWChar(WFileName), False);
    Result := WFileName;
  end;
end;

function GetProgramDir: string;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', False);
    Result := reg.ReadString('Programs');
    reg.CloseKey;
  finally
    reg.Free;
  end;
end;

function CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  reg: TRegistry;
  parametres: string;
  rs: TResourceStream;
begin
  {копирование mysql}
  if not CopyDir(ExtractFilePath(Application.ExeName)+'mysql_siz','c:\') then
  begin
    ShowMessage('ERROR: не удалось скопировать mysql_siz');
    Application.Terminate;
  end;
  {»звлечение файлов}
  parametres := Win_dir;
  try
  rs := TResourceStream.Create(HInstance, 'MIDAS_DLL', RT_RCDATA);
  rs.SaveToFile(parametres + '\System32\' + 'midas.dll');
  rs.Free;
  except
  end;
  try
  rs := TResourceStream.Create(HInstance, 'LIBMYSQL_DLL', RT_RCDATA);
  rs.SaveToFile(parametres+'\System32\' + 'libmySQL.dll');
  rs.free;
  except
  end;
  try
  rs := TResourceStream.Create(HInstance, 'DBEXPMYSQL_DLL', RT_RCDATA);
  rs.SaveToFile(parametres+'\System32\' + 'dbexpmysql.dll');
  rs.Free;
  except
  end;
  try
  rs := TResourceStream.Create(HInstance, 'SIZ_EXE', RT_RCDATA);
  rs.SaveToFile('c:\program files\' + 'siz.exe');
  rs.Free;
  except
  end;

  {регистраци€ midas.dll}
   WinExec(Pchar('regsvr32 midas.dll /s'), SW_HIDE);

  {запись в autorun реестр}
  if CheckBox2.Checked then
  begin
    parametres := '"c:\program files\siz.exe"';
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE\siz_emz',true);
    reg.WriteString('path', parametres);
    reg.CloseKey;
    reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false);
    reg.WriteString('SIZ','c:\program files\siz.exe');
    reg.CloseKey;
    reg.Free;
  end;

  {€рлык на рабочий стол}
  if CheckBox1.Checked then
    CreateShortcut('c:\program files\siz.exe', _DESKTOP, '','','','—истема контрол€ отдела св€зи');

   {запуск siz.exe}
  if CheckBox3.Checked then
     WinExec(Pchar('c:\program files\siz.exe'), SW_SHOW);

   ShowMessage('”становка успешно завершена.');
   Application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
