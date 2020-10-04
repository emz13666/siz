{+ADO->dbExpress}
unit UAddEditTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBLocalS, UnitDM, Spin, MyDB;

type
  TfrmAddEditTMC = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    cbNameTMC: TComboBox;
    Label1: TLabel;
    cbFirma: TComboBox;
    Label2: TLabel;
    date_input: TDateTimePicker;
    cbInvNum: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    cbUchastok: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    cbModel: TComboBox;
    cbNomenklNum: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    cbSerial: TComboBox;
    lblGruppa_sec_prof: TLabel;
    edtKolvo: TEdit;
    Label10: TLabel;
    cbEdIzm: TComboBox;
    edtStoim: TEdit;
    Label4: TLabel;
    cbPlaceInstall: TComboBox;
    Label11: TLabel;
    edtPrim: TMemo;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    checkOrgteh: TCheckBox;
    CheckPhone: TCheckBox;
    edtSostoyanie: TEdit;
    Label13: TLabel;
    cbMOL: TComboBox;
    Label14: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbNameTMCKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrimKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddFromBD(F_DB: string; Var FComboBox: TComboBox);
    procedure AddToSlovar(F_DB, FValue: string);
    function Proverka_null: boolean;
  end;

var
  frmAddEditTMC: TfrmAddEditTMC;
  flag_copy, flag_edit2: boolean;
  Data_Set2: TSQLClientDataSet;

implementation

uses DB;

{$R *.dfm}


procedure TfrmAddEditTMC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmAddEditTMC.Proverka_null: boolean;
begin
  Result := false;
  if cbNameTMC.Text='' then
  begin
    ShowMessage('Поле "Наименование" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAddEditTMC.btnOkClick(Sender: TObject);
var
  Bookmark13: TBookmark;
  if_mobila_lok, if_mebel_loc,
  if_malocenka_lok, if_orgtehnics_lok, if_phone_lok : integer;
begin
  if Proverka_null then exit;
  Bookmark13 := Data_Set2.GetBookmark;
  if CheckBox1.Checked then if_mobila_lok := 1   else if_mobila_lok := 0;
  if CheckBox3.Checked then if_malocenka_lok := 1   else if_malocenka_lok := 0;
  if CheckBox2.Checked then if_mebel_loc := 1   else if_mebel_loc := 0;
  if checkOrgteh.Checked then if_orgtehnics_lok := 1   else if_orgtehnics_lok := 0;
  if CheckPhone.Checked then if_phone_lok := 1   else if_phone_lok := 0;
  if (id_alert_uchastok < 7)and(id_alert_uchastok <> cbUchastok.ItemIndex+1)and(cbUchastok.ItemIndex+1<>9) then
  begin
    ShowMessage('Вы не имеете прав на редактирование чужого участка.');
    exit;
  end;
  if flag_copy then flag_edit2 := false;
  with Data_Set2 do
  begin
    if flag_edit2 then
    begin
       UpdateToTable(CommandText,'id',FieldByName('id').AsString,
         ['id_uch','name','firma','model','inv_num',
           'nomenkl_num','serial_num','kol_vo','ed_izm','date_input',
           'place_install', 'stoimost', 'prim', 'if_mobila','if_malocenka','if_mebel','if_orgtehnics','if_phone','Sostoyanie','mol'],
          [IntToStr(cbUchastok.ItemIndex+1),cbNameTMC.text,cbFirma.Text,
          cbModel.text,cbInvNum.text,cbNomenklNum.text,cbSerial.Text,
          edtKolvo.text, cbEdIzm.text,
          FormatDateTime('yyyy-MM-dd',date_input.Date),
          cbPlaceInstall.Text, edtStoim.Text, edtPrim.Text, IntToStr(if_mobila_lok),IntToStr(if_malocenka_lok),
          IntToStr(if_mebel_loc),IntToStr(if_orgtehnics_lok),IntToStr(if_phone_lok),edtSostoyanie.Text,cbMOL.Text])
    end
    else
    begin
      AddToTable(CommandText,
         ['id_uch','name','firma','model','inv_num',
           'nomenkl_num','serial_num','kol_vo','ed_izm','date_input',
           'place_install', 'stoimost', 'prim','if_mobila','if_malocenka','if_mebel','if_orgtehnics','if_phone', 'Sostoyanie', 'mol'],
          [IntToStr(cbUchastok.ItemIndex+1),cbNameTMC.text,cbFirma.Text,
          cbModel.text,cbInvNum.text,cbNomenklNum.text,cbSerial.Text,
          edtKolvo.text, cbEdIzm.text,
          FormatDateTime('yyyy-MM-dd',date_input.Date),
          cbPlaceInstall.Text, edtStoim.Text, edtPrim.Text, IntToStr(if_mobila_lok),IntToStr(if_malocenka_lok),
          IntToStr(if_mebel_loc),IntToStr(if_orgtehnics_lok),IntToStr(if_phone_lok),edtSostoyanie.Text, cbMOL.Text]);
      end;
  end; {with Data_Set2}
  with DM do
  begin
    AddToSlovar('sl_name_tmc',cbNameTMC.Text);
    AddToSlovar('sl_firma_tmc',cbFirma.Text);
    AddToSlovar('sl_model_tmc',cbModel.Text);
    AddToSlovar('sl_inv_number',cbInvNum.Text);
    AddToSlovar('sl_inv_number',cbNomenklNum.Text);
    AddToSlovar('sl_serial_num_tmc',cbSerial.Text);
    AddToSlovar('sl_place',cbPlaceInstall.Text);
  end;
  Data_Set2.Close;
  Data_Set2.Open;
  if flag_edit2 then
  begin
    if Data_Set2.BookmarkValid(Bookmark13) then
     Data_Set2.GotoBookmark(Bookmark13);
  end
  else
  begin
    Data_Set2.Locate('id',IntToStr(MaxValue('tmc','id')),[])
  end;
  Data_Set2.FreeBookmark(Bookmark13);
  Close;
end;

procedure TfrmAddEditTMC.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
    edizm: string;
begin

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  if id_alert_uchastok < 8 then
  begin
    cbUchastok.ItemIndex := id_alert_uchastok-1;
  end
  else
    cbUchastok.ItemIndex := 6;

  if (id_alert_uchastok <> 2)and(id_alert_uchastok <> 7) then CheckBox1.Visible := false;

  with dm do
  begin
    AddFromBD('sl_name_tmc',cbNameTMC);
    AddFromBD('sl_firma_tmc',cbFirma);
    AddFromBD('sl_model_tmc',cbModel);
    AddFromBD('sl_inv_number',cbInvNum);
    AddFromBD('sl_inv_number',cbNomenklNum);
    AddFromBD('sl_serial_num_tmc',cbSerial);
    AddFromBD('sl_place',cbPlaceInstall);
  end;

  cbEdIzm.ItemIndex := 0;

  if flag_edit2 then
  begin
    cbUchastok.ItemIndex := Data_Set2.fieldbyname('id_uch').AsInteger - 1;
    cbMOL.Text := Data_Set2.fieldbyname('mol').AsString;
    cbNameTMC.Text := Data_Set2.fieldbyname('name').AsString;
    cbFirma.Text := Data_Set2.fieldbyname('firma').AsString;
    cbModel.Text := Data_Set2.fieldbyname('model').AsString;
    cbInvNum.Text := Data_Set2.FieldByName('inv_num').AsString;
    cbNomenklNum.Text := Data_Set2.FieldByName('nomenkl_num').AsString;
    cbSerial.Text := Data_Set2.FieldByName('serial_num').AsString;
    edtKolvo.Text := Data_Set2.FieldByName('kol_vo').AsString;
    edtSostoyanie.Text := Data_Set2.FieldByName('Sostoyanie').AsString;
    date_input.DateTime := Data_Set2.FieldByName('date_input').AsDateTime;
    cbPlaceInstall.Text := Data_Set2.FieldByName('place_install').AsString;
    edtStoim.Text := Data_Set2.FieldByName('stoimost').AsString;
    edtPrim.Text := Data_Set2.FieldByName('prim').AsString;
    cbMOL.Text := Data_Set2.FieldByName('mol').AsString;
      {шт
      мг
      г
      кг
      м
      км
      куб.метр
      литр}
    edizm := Data_Set2.FieldByName('ed_izm').AsString;
    if edizm='шт' then cbEdIzm.ItemIndex := 0;
    if edizm='мг' then cbEdIzm.ItemIndex := 1;
    if edizm='г' then cbEdIzm.ItemIndex := 2;
    if edizm='кг' then cbEdIzm.ItemIndex := 3;
    if edizm='м' then cbEdIzm.ItemIndex := 4;
    if edizm='км' then cbEdIzm.ItemIndex := 5;
    if edizm='куб.метр' then cbEdIzm.ItemIndex := 6;
    if edizm='литр' then cbEdIzm.ItemIndex := 7;

    if Data_Set2.FieldByName('if_mobila').AsInteger=1 then CheckBox1.Checked := true;
    if Data_Set2.FieldByName('if_mebel').AsInteger=1 then CheckBox2.Checked := true;
    if Data_Set2.FieldByName('if_malocenka').AsInteger=1 then CheckBox3.Checked := true;
    if Data_Set2.FieldByName('if_orgtehnics').AsInteger=1 then checkOrgteh.Checked := true;
    if Data_Set2.FieldByName('if_phone').AsInteger=1 then CheckPhone.Checked := true;
  end
  else
  begin
    date_input.Date := Date;
  end;
end;

procedure TfrmAddEditTMC.AddFromBD(F_DB: string;
  var FComboBox: TComboBox);
begin
  dm.sl_query.CommandText := F_DB;
  dm.sl_query.Open;
  DM.sl_query.First;
  FComboBox.Items.Clear;
  while not DM.sl_query.Eof do
  begin
    FComboBox.Items.Add(DM.sl_query.Fields[0].AsString);
    DM.sl_query.Next;
  end;
  DM.sl_query.Close;
end;

procedure TfrmAddEditTMC.cbNameTMCKeyPress(Sender: TObject; var Key: Char);
begin
//  Key := MyUpperCase(key);
end;

procedure TfrmAddEditTMC.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddEditTMC.AddToSlovar(F_DB, FValue: string);
begin
  if FValue='' then exit;
  DM.sl_query.CommandText := F_DB;
  DM.sl_query.Open;
  DM.sl_query.First;
  if (DM.sl_query.RecordCount = 0) then
  begin
    AddToTable(DM.sl_query.CommandText,['sl'],[FValue]);
  end
  else
    if ((FValue<>'') and (not DM.sl_query.Locate('sl', FValue, []))) then
    begin
      AddToTable(DM.sl_query.CommandText,['sl'],[FValue]);
    end;
  DM.sl_query.Close;
end;

procedure TfrmAddEditTMC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

procedure TfrmAddEditTMC.edtPrimKeyPress(Sender: TObject; var Key: Char);
begin
  if key='.' then key := ',';
  if (KEY='0') or
     (KEY='1') or
     (KEY='2') or
     (KEY='3') or
     (KEY='4') or
     (KEY='5') or
     (KEY='6') or
     (KEY='7') or
     (KEY='8') or
     (KEY='9') or
     (key=#8) or
     (KEY=',') then else key := #0;

end;

end.
