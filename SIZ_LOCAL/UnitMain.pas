unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UnitAbout, RXShell, UnitDM, unitmenu, MyTimer, UnitKniga, MyDB,
  ProdolgitelnostStream, unitAuth, UnitUsers, UnitTable, ExtCtrls;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N4: TMenuItem;
    RxTrayIcon1: TRxTrayIcon;
    N5: TMenuItem;
    q: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    AltCtrlShiftEsc1: TMenuItem;
    Timer1: TTimer;
    procedure N4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RxTrayIcon1Click(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N5Click(Sender: TObject);
    procedure qClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure AltCtrlShiftEsc1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure wm__close(var msg: TMessage); message wm_close;
    procedure wm__hotkey(var msg: TMessage); message wm_hotkey;
    procedure WMQueryEndSession(var Msg: TWMQueryEndSession);  message WM_QUERYENDSESSION;
  public
    { Public declarations }
    procedure Hide_application(Sender: TObject);
  end;


var
  frmMain: TfrmMain;
  My_Timer: TMyTimerThread;
  Stop_beep_thread: TProdolgitelnostStream;
  id:word;

implementation

uses UnitSetup;

{$R *.dfm}

procedure UpdateStatsEnd;
begin
 UpdateToTable('stats','mac_address',GetMACAddress,['end'],
  [FormatDateTime('yyyy-mm-dd hh:nn:ss',now)]);
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Application);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if assigned(My_Timer) then My_Timer.Terminate;
  if assigned(stop_beep_thread) then Stop_beep_thread.Terminate;
  if log_in then UpdateStatsEnd;
  RxTrayIcon1.Active := False;
  UnregisterHotKey(Handle,id);
  GlobalDeleteAtom(id);
  WinExec('C:\mysql_siz\stop_sql.cmd',sw_hide);
end;

procedure TfrmMain.wm__close(var msg: TMessage);
begin
  Hide_application(frmMain);
end;

procedure TfrmMain.RxTrayIcon1Click(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button<>mbLeft then exit;
 ShowWindow(Application.Handle,SW_SHOW);
 ShowWindow(Handle,SW_SHOW);
 Application.Restore;
 Application.BringToFront;
 RxTrayIcon1.Active := false;
 if frmMenu=nil then
 begin
   frmMenu := TfrmMenu.Create(Application);
 end;
end;


procedure UpdateStatsBegin;
begin
  with DM do
  begin
    if CountRecordInMySQLTable(Query,'mac_address',GetMACAddress,'stats')=0 then
      AddToTable('stats',['ip_address','mac_address','begin','end','login'],
       [GetLocalIP,GetMACAddress,FormatDateTime('yyyy-mm-dd hh:nn:ss',now),FormatDateTime('yyyy-mm-dd hh:nn:ss',now),user_name])
    else
      UpdateToTable('stats','mac_address',GetMACAddress,['begin','end','login'],[FormatDateTime('yyyy-mm-dd hh:nn:ss',now),FormatDateTime('yyyy-mm-dd hh:nn:ss',now),user_name]);
  end;
end;

procedure TfrmMain.wm__hotkey(var msg: TMessage);
begin
  
  Application.Terminate;
end;

(*procedure LoadParamStr;
var
  i: byte;
begin
  id_alert_uchastok := -2; // т.е. ещё не инициализировано
  min_to_tray := false;
  allow_delete := false;
  if ParamCount=0 then
  begin
    id_alert_uchastok := -1;
    allow_delete := false;
  end;
  for i := 1 to ParamCount do
  begin
    if ParamStr(i)='/adm' then allow_delete := true;
    if Copy(ParamStr(i),1,7)='/alert=' then
      id_alert_uchastok := StrToInt(Copy(ParamStr(i),8,Length(ParamStr(i))-7));
    if ParamStr(i)='/tray' then min_to_tray := true;
  end;
  if id_alert_uchastok = -2 then id_alert_uchastok := -1;
 //{debug} id_alert_uchastok := 0;
//  {debug} min_to_tray := true;
end;
       *)
procedure TfrmMain.FormShow(Sender: TObject);
var  str:array [0..255]of char;
begin

  id:=GlobalAddAtom(StrPCopy(str,'EMZ_SIZ1'));
  RegisterHotKey(Handle,id,MOD_ALT or MOD_CONTROL or MOD_SHIFT,VK_ESCAPE);

  frmAuth := TfrmAuth.Create(Application);
  frmAuth.ShowModal;

  if id_alert_uchastok<7 then
  begin
    N1.Visible := false;
  end;
  if log_in then  UpdateStatsBegin;
  My_Timer := TMyTimerThread.Create(false);
  Stop_beep_thread := TProdolgitelnostStream.Create(true);
  Application.OnMinimize := Hide_application;
 if frmMenu=nil then
 begin
   frmMenu := TfrmMenu.Create(Application);
 end;
end;

procedure TfrmMain.Hide_application(Sender: TObject);
begin
  if assigned(frmTable) then
    frmTable.Close;
  RxTrayIcon1.Active := true;
  Application.Minimize;
  ShowWindow(Application.Handle,SW_HIDE);
  with DM do
  begin
    elektroinstrument.Close;
    siz.close;
    zazeml.close;
    takelag.close;
    znaniya_el_bez.close;
    znaniya_gpm.close;
    znaniya_met_stanki.close;
    znaniya_otipb.close;
    trenirovki.Close;
    ognetush.Close;
    others.Close;
    instruktagi.Close;
    DBConnection.Close;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  Hide_application(Sender);
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  frmKniga := TfrmKniga.Create(Application);
end;

procedure TfrmMain.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  Msg.Result := 1;
  Application.Terminate;
end;

procedure TfrmMain.qClick(Sender: TObject);
begin
  frmSetup := TfrmSetup.Create(Application)
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  frmUsers := TfrmUsers.Create(Application);
end;

procedure TfrmMain.AltCtrlShiftEsc1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  if (CountRecordInMySQLTable(dm.Query,'Bool','1','terminate')>0) then
    Application.Terminate;
end;

end.
