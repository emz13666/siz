unit UnitAuth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UnitDM, Registry, mydb;

type
  TfrmAuth = class(TForm)
    edtUser: TLabeledEdit;
    edtPassword: TLabeledEdit;
    checkMemory: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    checkAutoInput: TCheckBox;
    Timer1: TTimer;
    Host: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure checkAutoInputClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuth: TfrmAuth;

implementation

uses DB, SqlExpr;

{$R *.dfm}

procedure TfrmAuth.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not log_in then Application.Terminate;
  Action := caFree;
end;

procedure TfrmAuth.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAuth.btnOKClick(Sender: TObject);
var i,j:byte;
    reestr: TRegistry;
begin
  if edtUser.Text = '' then
  begin
    ShowMessage('Введите имя пользователя.');
    Exit;
  end;
  if edtPassword.Text ='' then
  begin
    ShowMessage('Введите пароль.');
    Exit;
  end;

  try
    DM.DBConnection.LoadParamsOnConnect := false;
    DM.DBConnection.Params.Values['HostName'] := Host.Text;
    DM.DBConnection.Open;
    DM.DBConnection.Close;
  except
    MessageDlg('Нет доступа к серверу.',mtError,[mbOK],0);
    ModalResult := mrNone;
    exit;
  end;

  with DM.Query do
  begin
    Close;
    SQL.Text := 'select * from sequrity where login='''+edtUser.Text+
     ''' and password=password('''+edtPassword.Text+''')';
    open;
    FindFirst;
    i := RecordCount;
    if i=0 then
    begin
      ShowMessage('Неправильное имя пользователя или пароль! В доступе отказано.');
      Application.Terminate;
    end
    else
    begin
      j:= FieldByName('id_uchastok').AsInteger;
      {запись в реестр}
      user_name := edtUser.Text;
      reestr := TRegistry.Create;
      reestr.RootKey := HKEY_LOCAL_MACHINE;
      reestr.OpenKey('SOFTWARE\siz_emz',true);
      reestr.WriteString('login',Crpt(edtUser.Text));
      reestr.WriteString('host',Crpt(Host.Text));
      if checkMemory.Checked then
        reestr.WriteString('password',crpt(edtPassword.Text))
      else
        reestr.DeleteValue('password');

      if checkAutoInput.Checked then
        reestr.WriteString('autoinput','')
      else
        if reestr.ValueExists('autoinput') then
          reestr.DeleteValue('autoinput');

      reestr.CloseKey;
      reestr.Free;
      id_alert_uchastok :=j;
      log_in := true;
      close;
      SQL.Text := 'Update sequrity set passwd='+QuotedStr(edtPassword.Text)+' where login='''+edtUser.Text+
         ''' and password=password('''+edtPassword.Text+''')';
      ExecSQL;
    end;
  end;
  Close;
end;


procedure TfrmAuth.FormShow(Sender: TObject);
var reestr:TRegistry;
begin
  reestr := TRegistry.Create;
  reestr.RootKey := HKEY_LOCAL_MACHINE;
  reestr.OpenKey('SOFTWARE\siz_emz',true);
  if reestr.ValueExists('host') then
    host.Text := crpt(reestr.ReadString('host'));
  if reestr.ValueExists('login') then
    edtUser.Text := crpt(reestr.ReadString('login'));
  if reestr.ValueExists('password') then
  begin
    edtPassword.Text := crpt(reestr.ReadString('password'));
    checkMemory.Checked := true;
  end;

  if reestr.ValueExists('autoinput') then
  begin
    checkAutoInput.Checked := true;
  end;

  reestr.CloseKey;
  reestr.Free;

end;


procedure TfrmAuth.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_REturn then btnOKClick(Sender);
 if key = vk_escape then btnCancelClick(Sender);
end;

procedure TfrmAuth.Timer1Timer(Sender: TObject);
begin
  if checkAutoInput.Checked then
    btnOKClick(Sender);
end;

procedure TfrmAuth.checkAutoInputClick(Sender: TObject);
begin
  Timer1.Enabled := checkAutoInput.Checked
end;

end.
