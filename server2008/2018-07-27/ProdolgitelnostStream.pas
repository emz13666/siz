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
    frmAlert.BitBtn1Click(frmAlert);
    frmMain.Hide_application(Self);
  end;
end;

procedure TProdolgitelnostStream.Execute;
var i: integer;
begin
  { Place thread code here }
  FreeOnTerminate := True;
//  sleep (1000);
  repeat
   i := 1;
   while (i < prodolgitelnost)and (not Terminated) do
   begin
     sleep(1000);
     inc(i);
   end;
   Synchronize(Do_Work);
   Suspend;
  until Terminated;
end;

end.
