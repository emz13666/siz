unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, MyTimer, Registry;

type
  TForm1 = class(TForm)
    IdIcmpClient1: TIdIcmpClient;
    procedure FormCreate(Sender: TObject);
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  My_Timer: TMyTimerThread;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  My_Timer := TMyTimerThread.Create(false);
end;

function ExecProgram: boolean;
var reg: TRegistry;
    parameters: string;
begin
  Result := false;
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if reg.OpenKeyReadOnly('SOFTWARE\siz_emz') then
  begin
    if reg.ValueExists('path') then
    begin
      parameters := reg.ReadString('path');
      if parameters <> '' then
      begin
        if WinExec(pchar(parameters),SW_SHOW)>31 then Result := true;
      end;
    end;
    reg.CloseKey;
  end;
  reg.Free;
end;

procedure TForm1.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
  if AReplyStatus.ReplyStatusType = rsEcho then
  begin

   if ExecProgram then
   Application.Terminate;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if assigned(My_Timer) then My_Timer.Terminate;
end;

end.
