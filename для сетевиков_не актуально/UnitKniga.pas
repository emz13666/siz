unit UnitKniga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, dbcgrids, unitdm, MyDB;

type
  TfrmKniga = class(TForm)
    edtOtziv: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKniga: TfrmKniga;

implementation

{$R *.dfm}

procedure TfrmKniga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.kniga_otzivov.Close;
  Action := caFree;
end;

procedure TfrmKniga.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmKniga.BitBtn1Click(Sender: TObject);
var s:string;
begin
  s := edtName.Text;
  if s='' then s:= 'Неизвестный';
  AddToTable('kniga_otzivov',['otziv','name','date_time','ip_address','mac_address'],
   [edtOtziv.text,s,FormatDateTime('yyyy-mm-dd hh:nn:ss',now),GetLocalIP,GetMACAddress]);
  DM.kniga_otzivov.Close;
  dm.kniga_otzivov.Open;
  DM.kniga_otzivov.FindLast;
  edtOtziv.Text := '';
  edtName.Text := '';
end;

procedure TfrmKniga.FormCreate(Sender: TObject);
begin
  DM.kniga_otzivov.Open;
  DM.kniga_otzivov.FindLast;
end;

end.
