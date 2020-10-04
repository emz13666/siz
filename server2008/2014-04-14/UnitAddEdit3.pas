{+ADO->dbExpress}
unit UnitAddEdit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBLocalS, UnitDM, Spin, MyDB;

type
  TfrmAdd_Edit3 = class(TForm)
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
    Label9: TLabel;
    edtTema: TEdit;
    cbVid: TComboBox;
    lblGruppa_sec_prof: TLabel;
    cb_fam_Instruktor: TComboBox;
    Label10: TLabel;
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
  frmAdd_Edit3: TfrmAdd_Edit3;
  flag_edit3: boolean;
  Data_Set3: TSQLClientDataSet;

implementation

uses DB;

{$R *.dfm}


procedure TfrmAdd_Edit3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmAdd_Edit3.Proverka_null: boolean;
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
  if (cbVid.Text='') then
  begin
    ShowMessage('Поле "Вид инструктажа" не заполнено!');
    Result := true;
    exit;
  end;
  if (edtTema.Text='') then
  begin
    ShowMessage('Поле "Тема инструктажа" не заполнено!');
    Result := true;
    exit;
  end;
  if (cb_fam_Instruktor.Text='') then
  begin
    ShowMessage('Поле "Фамилия инструктора" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAdd_Edit3.btnOkClick(Sender: TObject);
var bookmark13: tbookmark;
begin
  if Proverka_null then exit;
  with Data_Set3 do
  begin
    bookmark13 := GetBookmark;
    if flag_edit3 then
       UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','tub_num','fam','name','sec_name',
           'dolgnost','tema','date_first','date_next','vid','fam_instruktor'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,edtTema.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),cbVid.Text,cb_fam_Instruktor.text])

    else
      AddToTable(CommandText,
         ['id_uch','tub_num','fam','name','sec_name',
           'dolgnost','tema','date_first','date_next','vid','fam_instruktor'],
          [IntToStr(cbUchastok.ItemIndex+1),cbTabNum.text,cbFam.Text,
          cb_Name.text,cbOtchestvo.text,cbDolgnost.text,edtTema.Text,
          FormatDateTime('yyyy-MM-dd',date_first.Date),
          FormatDateTime('yyyy-MM-dd',date_next.Date),cbVid.Text,cb_fam_Instruktor.text]);
  end; {with Data_Set3}
  with DM do
  begin
    AddToSlovar(sl_tab_number,cbTabNum.Text);
    AddToSlovar(sl_familiya,cbFam.Text);
    AddToSlovar(sl_imya,cb_Name.Text);
    AddToSlovar(sl_otchestvo,cbOtchestvo.Text);
    AddToSlovar(sl_prof_dolgnost,cbDolgnost.Text);
    AddToSlovar(sl_vid_instruktag,cbvid.Text);
    AddToSlovar(sl_familiya,cb_fam_Instruktor.Text);
  end;
  Data_Set3.Close;
  Data_Set3.Open;
  if flag_edit3 then
  begin
    if Data_Set3.BookmarkValid(Bookmark13) then
     Data_Set3.GotoBookmark(Bookmark13);
  end
  else
  begin
    Data_Set3.FindLast;
  end;
  Data_Set3.FreeBookmark(Bookmark13);

  Close;
end;

procedure TfrmAdd_Edit3.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  if id_uchastka > 0 then
  begin
    cbUchastok.ItemIndex := id_uchastka-1;
    cbUchastok.Enabled := false;
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
    AddFromBD(sl_vid_instruktag,cbVid);
    AddFromBD(sl_familiya,cb_fam_Instruktor);
  end;
  if flag_edit3 then
  begin
    cbUchastok.ItemIndex := Data_Set3.fieldbyname('id_uch').AsInteger - 1;
    cbTabNum.Text := Data_Set3.fieldbyname('tub_num').AsString;
    cbFam.Text := Data_Set3.fieldbyname('fam').AsString;
    cb_Name.Text := Data_Set3.fieldbyname('name').AsString;
    cbOtchestvo.Text := Data_Set3.FieldByName('sec_name').AsString;
    cbDolgnost.Text := Data_Set3.FieldByName('dolgnost').AsString;
    edtTema.Text := Data_Set3.FieldByName('tema').AsString;
    cbVid.Text := Data_Set3.FieldByName('vid').AsString;
    date_first.DateTime := Data_Set3.fieldbyname('date_first').AsDateTime;
    date_next.DateTime := Data_Set3.fieldbyname('date_next').AsDateTime;
    cb_fam_Instruktor.Text := Data_Set3.fieldbyname('fam_instruktor').AsString;
  end
  else
  begin
    date_first.Date := Date;
    date_next.Date := Date;
  end;
end;

procedure TfrmAdd_Edit3.AddFromBD(var F_DB: TSQLClientDataSet;
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

procedure TfrmAdd_Edit3.cbTabNumKeyPress(Sender: TObject; var Key: Char);
begin
  Key := MyUpperCase(key);
end;

procedure TfrmAdd_Edit3.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdd_Edit3.AddToSlovar(var F_DB: TSQLClientDataSet; FValue: string);
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

procedure TfrmAdd_Edit3.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

procedure TfrmAdd_Edit3.date_firstChange(Sender: TObject);
begin
  date_next.Date := StrToDate(FormatDateTime('dd.mm.',date_first.Date)+
   IntToStr(StrToInt(FormatDateTime('yyyy',date_first.Date))+1));
end;

end.
