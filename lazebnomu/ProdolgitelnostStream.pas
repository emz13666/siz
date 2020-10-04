unit ProdolgitelnostStream;

interface

uses
  Classes, windows, unitdm, UnitAlert;

type
  TProdolgitelnostStream = class(TThread)
  private
    { Private declarations }
  protected
    procedure do_work;
    procedure Execute; override;
  end;

implementation

uses UnitMain;

{ TProdolgitelnostStream }

procedure TProdolgitelnostStream.do_work;
begin
{// остановка пищалки и сворачивание формы - если  конечно пищит ещё :-)}
  if pishit then
  begin
    frmAlert.Close;
    frmMain.Hide_application(Self);
  end;
end;

procedure TProdolgitelnostStream.Execute;
begin
  { Place thread code here }
  FreeOnTerminate := True;
//  sleep (1000);
  repeat
   sleep(prodolgitelnost*60*1000);
   Synchronize(Do_Work);
   Suspend;
  until Terminated;
end;

end.
