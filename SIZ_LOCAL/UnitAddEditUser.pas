{+ADO->dbExpress}
unit UnitAddEditUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,DBLocalS, UnitDM, MyDB, ExtCtrls,
  RxLookup;

type
  TfrmAdd_Edit_user = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    cbUchastok: TComboBox;
    Label6: TLabel;
    edtPassword: TLabeledEdit;
    edtLogin: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddFromBD(Var F_DB: TSQLClientDataSet; Var FComboBox: TComboBox);
    function Proverka_null: boolean;
  end;

var
  frmAdd_Edit_user: TfrmAdd_Edit_user;
  flag_edit_user: boolean;
  editpassword: boolean;
implementation

uses DB, SqlExpr;

{$R *.dfm}


procedure TfrmAdd_Edit_user.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAdd_Edit_user.btnOkClick(Sender: TObject);
begin
  if Proverka_null then exit;

  if flag_edit_user then
  begin
    with DM.Query do
    begin
      Close;
      if editpassword then
        SQL.Text := 'Update sequrity set login=''' + edtLogin.Text +
          ''', password=PASSWORD(''' +  edtPassword.Text + '''), id_uchastok='+
          IntToStr(cbUchastok.itemindex+1) + ' where id=' +
          DM.Sequrityid.AsString
      else
        SQL.Text := 'Update sequrity set login=''' + edtLogin.Text +
          ''', id_uchastok='+IntToStr(cbUchastok.itemindex+1) + ' where id=' +
          DM.Sequrityid.AsString;
      ExecSQL;
      Close;
    end;
  end
  else
  begin
      dm.Query.Close;
        dm.Query.SQL.Text := 'Insert into sequrity(login,password,id_uchastok) values (''' + edtLogin.Text +
          ''', PASSWORD(''' +  edtPassword.Text + '''),''' +IntToStr(cbUchastok.itemindex+1) + ''')';

      dm.Query.ExecSQL;
      dm.Query.Close;
  end;
  DM.Sequrity.Close;
  DM.Sequrity.Open;
  Close;
end;

procedure TfrmAdd_Edit_user.FormShow(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  AddFromBD(dm.uchastok,cbUchastok);
  editpassword := false;
  if flag_edit_user then
  begin
    Caption := 'Редактирование пользователя';
    edtLogin.Text := DM.Sequritylogin.AsString;
    edtPassword.Text := DM.Sequritypassword.AsString;
    cbUchastok.ItemIndex := DM.Sequrityid_uchastok.AsInteger - 1;
  end
  else
  begin
    Caption := 'Добавление пользователя';
    cbUchastok.ItemIndex :=0;
  end;
end;

procedure TfrmAdd_Edit_user.AddFromBD(var F_DB: TSQLClientDataSet;
  var FComboBox: TComboBox);
begin
  F_DB.Open;
  F_DB.First;
  FComboBox.Items.Clear;
  while not F_DB.Eof do
  begin
    FComboBox.Items.Add(F_DB.Fields[1].AsString);
    F_DB.Next;
  end;
  F_DB.Close;
end;

procedure TfrmAdd_Edit_user.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmAdd_Edit_user.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

function TfrmAdd_Edit_user.Proverka_null: boolean;
begin
  Result := false;
  if edtLogin.Text='' then
  begin
    ShowMessage('Поле "Логин" не заполнено!');
    Result := true;
    exit;
  end;
  if edtPassword.Text='' then
  begin
    ShowMessage('Поле "Пароль" не заполнено!');
    Result := true;
    exit;
  end;
end;

procedure TfrmAdd_Edit_user.edtPasswordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  editpassword := true;
end;

end.
