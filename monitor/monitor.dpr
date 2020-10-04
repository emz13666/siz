program monitor;

uses
  Forms, previnst,windows,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  if mmm then halt; //завершить программу не создавая ничего.
  Application.Initialize;
  Application.ShowMainForm := false;
  Application.CreateForm(TForm1, Form1);
  ShowWindow(Application.Handle,SW_HIDE);
  Application.Run;
end.
