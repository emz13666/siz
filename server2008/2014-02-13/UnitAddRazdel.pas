unit UnitAddRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, RXCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  RXSpin,MyDB;

type
  TfrmAddRazdel = class(TForm)
    Timer1: TTimer;
    Name_info: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Name_infoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddRazdel: TfrmAddRazdel;
  OldPodrazd: integer;

implementation

{$R *.dfm}

uses UnitInfo, UnitDM, UnitProgress;

procedure TfrmAddRazdel.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagInfo then
  begin
    Caption := 'Редактирование раздела';
    Name_info.Text := DM.tblInfoname_info.AsString;
  end
end;

procedure TfrmAddRazdel.btnOKClick(Sender: TObject);
begin
  if Name_info.Text = '' then
  begin
    ShowMessage('Поле "Наименование раздела" должно быть заполнено!');
    exit;
  end;
  if EditFlagInfo then
  begin
     UpdateToTable('Info','id_info',DM.tblInfoid_info.AsString,
     ['name_info','shifr_info'], [Name_info.text,'(РАЗДЕЛ)']);
  end
  else
  begin
    AddToTable('info',['shifr_info','name_info','id_razdel','flag_razdel'],
      ['(РАЗДЕЛ)',Name_info.text,IntToStr(frmInfo.GridInfo.tag),'0']);
  end;
  Close;
end;

procedure TfrmAddRazdel.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddRazdel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then btnOKClick(sender);
end;

procedure TfrmAddRazdel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddRazdel.Name_infoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := MyUpperCase(Key);
end;

end.
