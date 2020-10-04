unit UnitUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl,UnitDM,
  UnitAddEditUser, MyDB;

type
  TfrmUsers = class(TForm)
    GridUsers: TRxDBGrid;
    ToolBar1: TToolBar;
    btADD: TButton;
    btEdit: TButton;
    BtnDel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btADDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

{$R *.dfm}

procedure TfrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridUsers.DataSource.DataSet.Close;
  Action := caFree
end;

procedure TfrmUsers.btADDClick(Sender: TObject);
begin
  frmAdd_Edit_user := tfrmAdd_Edit_user.Create(Application);
  flag_edit_user := false;
  frmAdd_Edit_user.ShowModal;
end;

procedure TfrmUsers.FormShow(Sender: TObject);
begin
  GridUsers.DataSource.DataSet.Open;
  if (id_alert_uchastok <> 11)and(id_alert_uchastok<>7) then
  begin
    BtnDel.Enabled := false;
    btADD.Enabled := false;
    btEdit.Enabled := False;
  end;
end;

procedure TfrmUsers.btEditClick(Sender: TObject);
begin
  frmAdd_Edit_user := tfrmAdd_Edit_user.Create(Application);
  flag_edit_user := True;
  frmAdd_Edit_user.ShowModal;
end;

procedure TfrmUsers.BtnDelClick(Sender: TObject);
begin
  DeleteFromTable('Sequrity','id',DM.Sequrityid.AsString,true);
  DM.Sequrity.Close;
  DM.Sequrity.Open;
end;

end.
