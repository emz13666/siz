{+ADO->dbExpress}
unit UAddEditRooms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBLocalS, UnitDM, Spin, MyDB;

type
  TfrmAddEditRooms = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    cbUchastok: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edtName: TEdit;
    edtRaspolog: TEdit;
    Label4: TLabel;
    edtPrim: TMemo;
    Label12: TLabel;
    edtArea: TEdit;
    Label1: TLabel;
    edt_link_name_tmc: TEdit;
    edt_number: TEdit;
    Label2: TLabel;
    edt_naznach: TEdit;
    Label3: TLabel;
    edt_sostoyanie: TEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Proverka_null: boolean;
  end;

var
  frmAddEditRooms: TfrmAddEditRooms;
  flag_edit2: boolean;
  Data_Set2: TSQLClientDataSet;

implementation

uses DB;

{$R *.dfm}


procedure TfrmAddEditRooms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmAddEditRooms.Proverka_null: boolean;
begin
  Result := false;
  if (edtName.Text='') then
  begin
    ShowMessage('Поле "Наименование помещения" не заполнено!');
    Result := true;
    exit;
  end;
  if (edtRaspolog.Text='') then
  begin
    ShowMessage('Поле "Расположение помещения" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAddEditRooms.btnOkClick(Sender: TObject);
var
  Bookmark13: TBookmark;
begin
  if Proverka_null then exit;
  Bookmark13 := Data_Set2.GetBookmark;

  with Data_Set2 do
  begin
    if flag_edit2 then
    begin
       UpdateToTable(CommandText,'id_rooms',FieldByName('id_rooms').AsString,
         ['id_uch','name_room','place_room','area_room','link_tmc_place',
           'number_room','naznachenie','sostoyanie','prim'],
          [IntToStr(cbUchastok.ItemIndex+1),edtName.text,edtRaspolog.Text,
          edtArea.text,edt_link_name_tmc.text,edt_number.text,edt_naznach.Text,
          edt_sostoyanie.text, edtPrim.text])
    end
    else
    begin
       AddToTable(CommandText,
         ['id_uch','name_room','place_room','area_room','link_tmc_place',
           'number_room','naznachenie','sostoyanie','prim'],
          [IntToStr(cbUchastok.ItemIndex+1),edtName.text,edtRaspolog.Text,
          edtArea.text,edt_link_name_tmc.text,edt_number.text,edt_naznach.Text,
          edt_sostoyanie.text, edtPrim.text])
      end;
  end; {with Data_Set2}

  Data_Set2.Close;
  Data_Set2.Open;
  if flag_edit2 then
  begin
    if Data_Set2.BookmarkValid(Bookmark13) then
     Data_Set2.GotoBookmark(Bookmark13);
  end
  else
  begin
    Data_Set2.Locate('id_rooms',IntToStr(MaxValue('rooms','id_rooms')),[])
  end;
  Data_Set2.FreeBookmark(Bookmark13);
  Close;
end;

procedure TfrmAddEditRooms.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  if id_alert_uchastok < 8 then
  begin
    cbUchastok.ItemIndex := id_alert_uchastok-1;
  end
  else
    cbUchastok.ItemIndex := 6;



  if flag_edit2 then
  begin
    edtName.Text := Data_Set2.fieldbyname('name_room').AsString;
    edtRaspolog.Text := Data_Set2.FieldByName('place_room').asString;
    edtArea.Text := Data_Set2.FieldByName('area_room').asString;
    edt_link_name_tmc.Text := Data_Set2.FieldByName('link_tmc_place').asString;
    edt_number.Text := Data_Set2.FieldByName('number_room').asString;
    edt_naznach.Text :=Data_Set2.FieldByName('naznachenie').asString;
    edt_sostoyanie.Text := Data_Set2.FieldByName('sostoyanie').asString;
    edtPrim.Text := Data_Set2.FieldByName('prim').AsString;
  end
end;

procedure TfrmAddEditRooms.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmAddEditRooms.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

end.
