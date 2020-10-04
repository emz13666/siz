unit UnitAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, UnitDM;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label2: TLabel;
    Image2: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  myCursorID = 5;

var
  AboutBox: TAboutBox;
  minimized_foto:boolean;
  old_img_left, old_img_top: integer;

implementation

{$R *.dfm}
{$R cursors.res}

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return)or(Key = VK_ESCAPE) then Close;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  minimized_foto := true;
  Screen.Cursors[MyCursorID]:=LoadCursor(HInstance,'ADD');
  Screen.Cursors[MyCursorID+1]:=LoadCursor(HInstance,'DEL');
  Image2.Cursor := myCursorID;
  old_img_left := Image2.Left;
  old_img_top := Image2.Top;
end;

procedure TAboutBox.Image2Click(Sender: TObject);
begin
  if minimized_foto then
  begin
    Image2.Cursor := myCursorID+1;
    Image2.Width := Image2.Width *2;
    Image2.Height := Image2.Height*2;
    Image2.Top := (Panel1.Height  div 2)- (Image2.Height div 2);
    Image2.Left := (Panel1.Width  div 2)-(Image2.Width div 2);
  end
  else
  begin
    Image2.Cursor := myCursorID;
    Image2.Width := Image2.Width div 2;
    Image2.Height := Image2.Height div 2;
    Image2.Top := old_img_top;
    Image2.Left := old_img_left;
  end;
  minimized_foto := not minimized_foto;
end;

end.

