{+ADO->dbExpress}
unit UnitAddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,DBLocalS, UnitDM, MyDB;

type
  TfrmAdd_Edit = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    cbInvNum: TComboBox;
    Label1: TLabel;
    cbName: TComboBox;
    Label2: TLabel;
    date_first: TDateTimePicker;
    date_next: TDateTimePicker;
    cbPlace: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbUchastok: TComboBox;
    Label6: TLabel;
    DateNextOsmotr: TDateTimePicker;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbInvNumKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure date_firstChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddFromBD(Var F_DB: TSQLClientDataSet; Var FComboBox: TComboBox);
    procedure AddToSlovar(Var F_DB: TSQLClientDataSet; FValue: string);
    function Proverka_null: boolean;
    procedure Update_to_table_only_new;
  end;

var
  frmAdd_Edit: TfrmAdd_Edit;
  flag_edit: boolean;
  Data_Set: TSQLClientDataSet;
    id_uch_old: integer;
    inv_number_old, name_old, place_install_old: string;
    date_first_old, date_next_old, DateNextOsmotrOld: TDateTime;


implementation

uses DB;

{$R *.dfm}


procedure TfrmAdd_Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAdd_Edit.btnOkClick(Sender: TObject);
var
  Bookmark13: TBookmark;
begin
  if Proverka_null then exit;
  with Data_Set do
  begin
    Bookmark13 := GetBookmark;
    if flag_edit then
    begin
      if (CommandText = 'siz')or(CommandText = 'zazeml') then
      begin
        Update_To_Table_only_new;
      end
      else
        UpdateToTable(CommandText,'id',FieldByName('id').AsString,
          ['id_uch','inv_number','name','date_first','date_next','place_install'],
          [IntToStr(cbUchastok.ItemIndex+1),cbInvNum.text,cbName.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date), cbPlace.Text])

    end
    else
    begin
      if (CommandText = 'siz')or(CommandText = 'zazeml') then
          AddToTable(CommandText,
          ['id_uch','inv_number','name','date_first','date_next','place_install','DateOsmotrnext'],
          [IntToStr(cbUchastok.ItemIndex+1),cbInvNum.text,cbName.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date), cbPlace.Text,FormatDateTime('yyyy-MM-dd',DateNextOsmotr.Date)])
      else
          AddToTable(CommandText,
          ['id_uch','inv_number','name','date_first','date_next','place_install'],
          [IntToStr(cbUchastok.ItemIndex+1),cbInvNum.text,cbName.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date), cbPlace.Text])
    end;
  end;
  with DM do
  begin
    AddToSlovar(sl_inv_number,cbInvNum.Text);
    AddToSlovar(sl_name,cbName.Text);
    AddToSlovar(sl_place,cbPlace.Text);
  end;
  Data_Set.Close;
  Data_Set.Open;
  if flag_edit then
  begin
    if Data_Set.BookmarkValid(Bookmark13) then
     Data_Set.GotoBookmark(Bookmark13);
  end
  else
  begin
    Data_Set.FindLast;
  end;
  Data_Set.FreeBookmark(Bookmark13);
  Close;
end;

procedure TfrmAdd_Edit.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  if (Data_Set.CommandText = 'siz')or(Data_Set.CommandText = 'zazeml')then
  begin
    Label7.Visible := true;
    DateNextOsmotr.Visible := true;
  end
  else
  begin
    Label7.Visible := false;
    DateNextOsmotr.Visible := false;
  end;

  if id_uchastka > 0 then
  begin
    cbUchastok.ItemIndex := id_uchastka-1;
    if id_alert_uchastok < 7 then
      cbUchastok.Enabled := false;
    if id_alert_uchastok =12 then   cbUchastok.Enabled := false;
  end
  else
    cbUchastok.ItemIndex := 0;

  AddFromBD(dm.sl_name,cbname);
  AddFromBD(dm.sl_place,cbplace);
  AddFromBD(dm.sl_inv_number, cbInvNum);

  if flag_edit then
  begin
    cbUchastok.ItemIndex := Data_Set.fieldbyname('id_uch').AsInteger - 1;
    id_uch_old := cbUchastok.ItemIndex;

    cbInvNum.Text := Data_Set.fieldbyname('inv_number').AsString;
    inv_number_old := cbInvNum.Text;

    cbName.Text := Data_Set.fieldbyname('name').AsString;
    name_old := cbName.Text;

    cbPlace.Text := Data_Set.fieldbyname('place_install').AsString;
    place_install_old := cbPlace.Text;

    date_first.DateTime := Data_Set.fieldbyname('date_first').AsDateTime;
    date_first_old := date_first.DateTime;

    date_next.DateTime := Data_Set.fieldbyname('date_next').AsDateTime;
    date_next_old := date_next.DateTime;

    if (Data_Set.CommandText = 'siz')or(Data_Set.CommandText = 'zazeml') then
    begin
      DateNextOsmotr.DateTime := Data_Set.fieldByName('DateOsmotrnext').AsDateTime;
      DateNextOsmotrOld := DateNextOsmotr.DateTime;
    end;
  end
  else
  begin
    date_first.Date := Date;
    date_next.Date := Date;
    if Data_Set.CommandText = 'siz' then DateNextOsmotr.Date := Date;
  end;
end;

procedure TfrmAdd_Edit.AddFromBD(var F_DB: TSQLClientDataSet;
  var FComboBox: TComboBox);
begin
  F_DB.Open;
  F_DB.First;
  FComboBox.Items.Clear;
  while not F_DB.Eof do
  begin
    FComboBox.Items.Add(F_DB.Fields[0].AsString);
    F_DB.Next;
  end;
  F_DB.Close;
end;

procedure TfrmAdd_Edit.cbInvNumKeyPress(Sender: TObject; var Key: Char);
begin
  Key := MyUpperCase(key);
end;

procedure TfrmAdd_Edit.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdd_Edit.AddToSlovar(var F_DB: TSQLClientDataSet; FValue: string);
begin
  if FValue='' then exit;
  F_DB.Open;
  F_DB.First;
  if (F_DB.RecordCount = 0) then
  begin
    AddToTable(F_DB.CommandText,['sl'],[FValue]);
  end
  else
    if ((FValue<>'') and (not F_DB.Locate('sl', FValue, []))) then
    begin
      AddToTable(F_DB.CommandText,['sl'],[FValue]);
    end;
  F_DB.Close;
end;

procedure TfrmAdd_Edit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

function TfrmAdd_Edit.Proverka_null: boolean;
begin
  Result := false;
  if cbName.Text='' then
  begin
    ShowMessage('Поле "Наименование" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAdd_Edit.date_firstChange(Sender: TObject);
var next_m: byte; next_m_s, next_y, next_date_s: string;
begin
  date_next.Date := StrToDate(FormatDateTime('dd.mm.',date_first.Date)+
   IntToStr(StrToInt(FormatDateTime('yyyy',date_first.Date))+1));

  if Copy(Self.Caption,1,17) = 'Электроинструмент' then
  begin
    next_m := StrToInt(FormatDateTime('m',date_first.Date))+6;
    next_y := FormatDateTime('yyyy',date_first.Date);
    if next_m > 12 then begin next_m := next_m - 12; next_y:=IntToStr(StrToInt(next_y)+1); end;
    if next_m < 10 then  next_m_s := '0'+IntTostr(next_m)
      else next_m_s := IntTostr(next_m);
    next_date_s := FormatDateTime('dd',date_first.Date)+'.'+next_m_s+'.'+next_y;
    if isdate(next_date_s) then date_next.Date := StrToDate(next_date_s)
      else date_next.Date := date_first.date + 182;
  end;
end;

procedure TfrmAdd_Edit.Update_to_table_only_new;
begin
  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old <> date_first.Date) and
     (date_next_old <> date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld <> DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['date_first','date_next','DateOsmotrnext'],
          [FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),FormatDateTime('yyyy-MM-dd',DateNextOsmotr.Date)]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old <> date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['date_next'],
          [FormatDateTime('yyyy-MM-dd',date_next.Date)]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld <> DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['DateOsmotrnext'],
          [FormatDateTime('yyyy-MM-dd',DateNextOsmotr.Date)]);
    exit;
  end;

  if (id_uch_old <> cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,['id_uch'],[IntToStr(cbUchastok.ItemIndex+1)]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old <> cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['inv_number'], [cbInvNum.text]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old <> cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['name'], [cbName.Text]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old <> date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old = cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['date_first'],
          [FormatDateTime('yyyy-MM-dd',date_first.Date)]);
    exit;
  end;

  if (id_uch_old = cbUchastok.ItemIndex+1) and
     (inv_number_old = cbInvNum.Text) and
     (name_old = cbName.Text) and
     (date_first_old = date_first.Date) and
     (date_next_old = date_next.Date) and
     (place_install_old <> cbPlace.Text) and
     (DateNextOsmotrOld = DateNextOsmotr.Date) then
  begin
    UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['place_install'],[cbPlace.Text]);
    exit;
  end;

  UpdateToTable(Data_Set.CommandText,'id',Data_Set.FieldByName('id').AsString,
          ['id_uch','inv_number','name','date_first','date_next','place_install','DateOsmotrnext'],
          [IntToStr(cbUchastok.ItemIndex+1),cbInvNum.text,cbName.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date), cbPlace.Text,FormatDateTime('yyyy-MM-dd',DateNextOsmotr.Date)]);

end;

end.
