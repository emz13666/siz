unit UnitShowTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmShowTMC = class(TForm)
    Sotoviy: TCheckBox;
    Malocenka: TCheckBox;
    Mebel: TCheckBox;
    Orgtehnix: TCheckBox;
    Telephone: TCheckBox;
    Spisano: TCheckBox;
    Button1: TButton;
    Osnovnoe: TCheckBox;
    Others: TCheckBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowTMC: TfrmShowTMC;

implementation
uses UnitTableTMC;
{$R *.dfm}

procedure TfrmShowTMC.Button1Click(Sender: TObject);
begin
  flOrgtehnix := 0;
  flOsnSredstva := 0;
  flMalocenka :=0;
  flMebel := 0;
  flSotovie := 0;
  flSpisano := 0;
  flTelephone := 0;
  flOther := 0;
  flAll := 0;
  if Orgtehnix.Checked then flOrgtehnix :=1;
  if Osnovnoe.Checked then flOsnSredstva :=1;
  if Malocenka.Checked then flMalocenka :=1;
  if Mebel.Checked then flMebel:=1;
  if Sotoviy.Checked then flSotovie := 1;
  if Spisano.Checked then flSpisano:=1;
  if Telephone.Checked then flTelephone :=1;
  if Others.Checked then flOther :=1;
  if CheckBox1.Checked then flAll :=1;
  frmTableTMC.cbShowMobilaChange(Self);
  Close;
end;

procedure TfrmShowTMC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmShowTMC.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then
 begin
   Orgtehnix.Checked := False;
   Osnovnoe.Checked := False;
   Others.Checked := False;
   Malocenka.Checked := False;
   Mebel.Checked := False;
   Telephone.Checked := False;
   Sotoviy.Checked := False;
   Spisano.Checked := False;
 end;
end;

end.
