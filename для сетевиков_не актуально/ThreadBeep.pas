unit ThreadBeep;

interface

uses
  Classes, SysUtils, Windows;

type
  TThreadBeep = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TThreadBeep.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TThreadBeep }
procedure Sound(Frequency, Duration: Integer);
asm
   push edx
   push eax
   mov eax, Win32Platform
   cmp eax, VER_PLATFORM_WIN32_NT
   jne @@9X
   call Windows.Beep
   ret
@@9X:
   pop eax
   pop edx
   push ebx
   push edx
   mov bx, ax
   mov ax, 34DDh
   mov dx, 0012h
   cmp dx, bx
   jnc @@2
   div bx
   mov bx, ax
   in al, 61h
   test al, 3
   jnz @@1
   or al, 3
   out 61h, al
   mov al, 0B6h
   out 43h, al
@@1:
   mov al, bl
   out 42h, al
   mov al, bh
   out 42h, al
   call Windows.Sleep
   in al, 61h
   and al, 0FCh
   out 61h, al
   jmp @@3
@@2:
   pop edx
@@3:
   pop ebx
end;

procedure TThreadBeep.Execute;
begin
  { Place thread code here }
  FreeOnTerminate := True;
  repeat
     Sound(500,500);
     sleep(500);
  until Terminated;
end;

end.
