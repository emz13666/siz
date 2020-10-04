unit MyTimer;

interface

uses
  Classes, forms;

type
  TMyTimerThread = class(TThread)
  private
    { Private declarations }
  protected
    Procedure DoWork;
    procedure Execute; override;
  end;

implementation

uses SysUtils, Unit1, windows, DB, SqlExpr;

{ TMyTimerThread }


procedure TMyTimerThread.DoWork;
begin
 with Form1 do
 begin
   IdIcmpClient1.Ping;
 end;

end;

procedure TMyTimerThread.Execute;
begin
  { Place thread code here }
  FreeOnTerminate := True;
  sleep(300);
  Synchronize(DoWork);
  repeat
    Sleep(10000);
    Synchronize(DoWork);
  until Terminated;
end;

end.
