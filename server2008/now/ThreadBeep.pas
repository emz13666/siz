unit ThreadBeep;

interface

uses
  Classes, SysUtils, Windows, UnitDM, mmsystem;

type
  TThreadBeep = class(TThread)
  private
    { Private declarations }
    fileSound: string;
    fsndloop: boolean;
  protected

    procedure Execute; override;
  public
    constructor Create(fileNameSound: string; ASND_LOOP: boolean); reintroduce;
    destructor Destroy; reintroduce;
    procedure stop_play;
  end;

implementation


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

constructor TThreadBeep.Create;
begin
  inherited Create(false);
  fileSound := fileNameSound;
  playedSound := false;
  fsndloop := ASND_LOOP;
end;

destructor TThreadBeep.Destroy;
begin
  stop_play;
  inherited;
end;

procedure TThreadBeep.Execute;
var PCh: PChar;
begin
  { Place thread code here }
  FreeOnTerminate := True;
  repeat

    if (fileSound = '')or(not FileExists(fileSound)) then
    begin
      Sound(500,500);
    end
    else
    begin
      if (not playedSound)and(not terminated) then begin
        GetMem(PCh,Length(fileSound)+1);
        StrPCopy(PCh,fileSound);
        if fsndloop then PlaySound(PCh, 0, SND_ASYNC or SND_LOOP)
        else PlaySound(PCh, 0, SND_ASYNC);
        FreeMem(PCh);
        playedSound := true;
      end;
    end;
    sleep(500);
  until Terminated;
end;

procedure TThreadBeep.stop_play;
begin
  PlaySound(0, 0, SND_PURGE);
  playedSound := false;
end;

end.
