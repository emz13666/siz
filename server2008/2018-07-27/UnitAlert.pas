unit UnitAlert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,ThreadBeep;

type
  TfrmAlert = class(TForm)
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    ListBox1: TListBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlert: TfrmAlert;
  MyThreadBeep: TThreadBeep;

implementation

uses UnitDM, UnitMenu;

{$R *.dfm}

procedure TfrmAlert.BitBtn1Click(Sender: TObject);
begin
    MyThreadBeep.stop_play;
    MyThreadBeep.Suspend;
  Close;
end;

procedure TfrmAlert.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then BitBtn1Click(Sender);
end;



(*procedure InitBeepArray;
begin
 with DM do
 begin
    Beep.Open;
    beep.First;
    SetLength(BeepArray,0);
    while not beep.Eof do
    begin
      SetLength(BeepArray,Length(BeepArray)+1);
      BeepArray[High(beeparray)].freq := beepfreq.AsInteger;
      BeepArray[High(beeparray)].dur := beepduration.AsInteger;
      BeepArray[High(beeparray)].sleep := beepsleep.AsInteger;
      beep.Next;
    end;
    beep.Close;
 end;
 counter := 0;
end;
  *)
procedure TfrmAlert.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  MyThreadBeep := TThreadBeep.Create(fileSound,fSND_LOOP);
end;

procedure TfrmAlert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAlert.FormDestroy(Sender: TObject);
begin
  pishit := false;
  if assigned(myThreadBeep) then begin
    MyThreadBeep.Terminate;
  end;
  frmAlert := nil;
end;

procedure TfrmAlert.SpeedButton1Click(Sender: TObject);
begin
  if (Sender as TSpeedButton).Down then
      if playedSound then begin
       MyThreadBeep.stop_play;
       MyThreadBeep.Suspend;
      end
  else
     MyThreadBeep.Resume;
end;

end.
