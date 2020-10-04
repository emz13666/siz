{+ADO->dbExpress}
unit UnitAddEdit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBLocalS, UnitDM, Spin, MyDB;

type
  TfrmAdd_Edit1 = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    cbTabNum: TComboBox;
    Label1: TLabel;
    cbFam: TComboBox;
    Label2: TLabel;
    date_first: TDateTimePicker;
    date_next: TDateTimePicker;
    cbOtchestvo: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbUchastok: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    cb_Name: TComboBox;
    cbDolgnost: TComboBox;
    Label8: TLabel;
    edtGruppa: TSpinEdit;
    lblGruppa_sec_prof: TLabel;
    cbNumProtokol: TComboBox;
    Label10: TLabel;
    cbSecondProf: TComboBox;
    edtNumUdost: TEdit;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTabNumKeyPress(Sender: TObject; var Key: Char);
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
  end;

var
  frmAdd_Edit1: TfrmAdd_Edit1;
  flag_edit1: boolean;
  flag_gruppa: byte; {0-ни то ни другое, 1-группа эл без, 2-вторая профессия}
  Data_Set1: TSQLClientDataSet;

implementation

uses DB;

{$R *.dfm}


procedure TfrmAdd_Edit1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmAdd_Edit1.Proverka_null: boolean;
begin
  Result := false;
  if cbTabNum.Text='' then
  begin
    ShowMessage('Поле "Табельный номер" не заполнено!');
    Result := true;
    exit;
  end;
  if cbFam.Text='' then
  begin
    ShowMessage('Поле "Фамилия" не заполнено!');
    Result := true;
    exit;
  end;
  if cb_Name.Text='' then
  begin
    ShowMessage('Поле "Имя" не заполнено!');
    Result := true;
    exit;
  end;
  if cbOtchestvo.Text='' then
  begin
    ShowMessage('Поле "Отчество" не заполнено!');
    Result := true;
    exit;
  end;
  if cbDolgnost.Text='' then
  begin
    ShowMessage('Поле "Профессия/Должность" не заполнено!');
    Result := true;
    exit;
  end;
  if (flag_gruppa=2)and(cbSecondProf.Text='') then
  begin
    ShowMessage('Поле "Вторая профессия" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAdd_Edit1.btnOkClick(Sender: TObject);
var Bookmark13:TBookmark;
begin
  if Proverka_null then exit;
  with Data_Set1 do
  begin
    Bookmark13 := GetBookmark;
    if flag_edit1 then
      case flag_gruppa of
       0: UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),edtNumUdost.text]);
       1: UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','gruppa_el','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),IntToStr(edtGruppa.Value),edtNumUdost.Text]);
       2: UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','professiya','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),cbSecondProf.text,edtNumUdost.text]);
       3: UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','date_first','date_next'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date)]);
      end {case}
    else
      case flag_gruppa of
       0: AddToTable(CommandText,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),edtNumUdost.text]);
       1: AddToTable(CommandText,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','gruppa_el','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),IntToStr(edtGruppa.Value),edtNumUdost.text]);
       2: AddToTable(CommandText,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','num_protokol','date_first','date_next','professiya','num_udost'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,cbNumProtokol.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),cbSecondProf.text,edtNumUdost.text]);
       3: AddToTable(CommandText,
         ['id_uch','tab_num','fam','name','sec_name',
           'dolgnost','date_first','date_next'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date)]);
      end; {case}
  end; {with data_set1}
  with DM do
  begin
    AddToSlovar(sl_tab_number,cbTabNum.Text);
    AddToSlovar(sl_familiya,cbFam.Text);
    AddToSlovar(sl_imya,cb_Name.Text);
    AddToSlovar(sl_otchestvo,cbOtchestvo.Text);
    if flag_gruppa <> 3 then AddToSlovar(sl_prof_dolgnost,cbDolgnost.Text);
    if flag_gruppa=2 then AddToSlovar(sl_sec_prof,cbSecondProf.Text);
    if flag_gruppa <> 3 then AddToSlovar(sl_num_prot,cbNumProtokol.Text);
  end;
  Data_Set1.Close;
  Data_Set1.Open;
  if flag_edit1 then
  begin
    if Data_Set1.BookmarkValid(Bookmark13) then
     Data_Set1.GotoBookmark(Bookmark13);
  end
  else
  begin
    Data_Set1.FindLast;
  end;
  Data_Set1.FreeBookmark(Bookmark13);

  Close;
end;

procedure TfrmAdd_Edit1.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  if id_uchastka > 0 then
  begin
    cbUchastok.ItemIndex := id_uchastka-1;
    if id_alert_uchastok < 7 then
      cbUchastok.Enabled := false;
    if id_alert_uchastok =12 then   cbUchastok.Enabled := false;      
  end
  else
    cbUchastok.ItemIndex := 0;

  with dm do
  begin
    AddFromBD(sl_tab_number,cbtabnum);
    AddFromBD(sl_familiya,cbfam);
    AddFromBD(sl_imya, cb_name);
    AddFromBD(sl_otchestvo,cbOtchestvo);
    AddFromBD(sl_prof_dolgnost,cbDolgnost);
    if flag_gruppa = 2 then AddFromBD(sl_sec_prof,cbSecondProf);
    if flag_gruppa <> 3 then AddFromBD(sl_num_prot,cbNumProtokol);
  end;
  case flag_gruppa of
    0:
    begin
      lblGruppa_sec_prof.Visible := false;
      cbSecondProf.Visible := false;
      edtGruppa.Visible := false;
    end;
    1:
    begin
      lblGruppa_sec_prof.Visible := true;
      cbSecondProf.Visible := false;
      edtGruppa.Visible := True;
    end;
    2:
    begin
      lblGruppa_sec_prof.Visible := true;
      lblGruppa_sec_prof.Caption := 'Вторая профессия:';
      cbSecondProf.Visible := True;
      edtGruppa.Visible := false;
    end;
    3:
    begin
      lblGruppa_sec_prof.Visible := false;
      cbSecondProf.Visible := false;
      edtGruppa.Visible := false;
      Label9.Visible := false;
      edtNumUdost.Visible := false;
      Label10.Visible := false;
      cbNumProtokol.Visible := false;
    end;
  end;
  if flag_edit1 then
  begin
    cbUchastok.ItemIndex := Data_Set1.fieldbyname('id_uch').AsInteger - 1;
    cbTabNum.Text := Data_Set1.fieldbyname('tab_num').AsString;
    cbFam.Text := Data_Set1.fieldbyname('fam').AsString;
    cb_Name.Text := Data_Set1.fieldbyname('name').AsString;
    cbOtchestvo.Text := Data_Set1.FieldByName('sec_name').AsString;
    cbDolgnost.Text := Data_Set1.FieldByName('dolgnost').AsString;
    if flag_gruppa = 1 then edtGruppa.Value := Data_Set1.FieldByName('gruppa_el').AsInteger;
    if flag_gruppa = 2 then cbSecondProf.Text := Data_Set1.FieldByName('professiya').AsString;
    if flag_gruppa <> 3 then cbNumProtokol.Text := Data_Set1.FieldByName('num_protokol').AsString;
    date_first.DateTime := Data_Set1.fieldbyname('date_first').AsDateTime;
    date_next.DateTime := Data_Set1.fieldbyname('date_next').AsDateTime;
    if flag_gruppa <> 3 then edtNumUdost.Text := Data_Set1.FieldByName('num_udost').AsString;
  end
  else
  begin
    date_first.Date := date;
    date_next.Date := Date;
  end;
end;

procedure TfrmAdd_Edit1.AddFromBD(var F_DB: TSQLClientDataSet;
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

procedure TfrmAdd_Edit1.cbTabNumKeyPress(Sender: TObject; var Key: Char);
begin
  Key := MyUpperCase(key);
end;

procedure TfrmAdd_Edit1.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdd_Edit1.AddToSlovar(var F_DB: TSQLClientDataSet; FValue: string);
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

procedure TfrmAdd_Edit1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

procedure TfrmAdd_Edit1.date_firstChange(Sender: TObject);
begin
  date_next.Date := StrToDate(FormatDateTime('dd.mm.',date_first.Date)+
   IntToStr(StrToInt(FormatDateTime('yyyy',date_first.Date))+1));
end;

end.
