{+ADO->dbExpress}
unit UnitTableTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl, UnitDM, DB,
  DBLocalS, UAddEditTMC, USyncTMC,
  DateUtils, Menus, Buttons, ToolWin, Placemnt, MyDB,
  StdCtrls, TTDBGrid, UnitShowTMC;

type
  TfrmTableTMC = class(TForm)
    ToolBar1: TToolBar;
    btnEdit: TSpeedButton;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btnExcel: TButton;
    ToolButton4: TToolButton;
    GridTMC: TToolTipsDBGrid;
    edtFind: TEdit;
    ToolButton5: TToolButton;
    btnFind: TBitBtn;
    btnFiltr: TButton;
    ToolButton6: TToolButton;
    cbFields: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbFiltr: TComboBox;
    cbUchastok: TComboBox;
    StatusBar1: TStatusBar;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    ToolButton1: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton7: TToolButton;
    Button2: TButton;
    FormStorage1: TFormStorage;
    N4: TMenuItem;
    btnShow: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure GridElBezDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure GridMetrologiyaDblClick(Sender: TObject);
    procedure GridTMCTitleClick(Column: TColumn);
    procedure btnFindClick(Sender: TObject);
    procedure btnFiltrClick(Sender: TObject);
    procedure cbFiltrChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cbUchastokChange(Sender: TObject);
    procedure cbShowMobilaChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTableTMC: TfrmTableTMC;
  Main_filtr: string;
  flAll, flOsnSredstva, flMalocenka, flSotovie, flTelephone, flMebel, flOrgtehnix, flSpisano, flOther : byte;

implementation

uses DBLocal;



{$R *.dfm}

procedure TfrmTableTMC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  GridTMC.DataSource.DataSet.Close;
  DM.DBConnection.Close;
end;

procedure TfrmTableTMC.btnAddClick(Sender: TObject);
var
  flagg_edit:boolean;
 TMP_Data_Set: TDataSet;
begin

  if (Sender as TControl).Name = 'btnAdd' then flagg_edit := false
  else flagg_edit := True;

  //�������� �������� ����
  TMP_Data_Set := gridTMC.Datasource.Dataset;

  //���� ������ ������������� � ������� ��� �� �����
  if (TMP_Data_Set = nil)or((TMP_Data_Set.RecordCount=0)and flagg_edit) then exit;

    frmAddEditTMC := TfrmAddEditTMC.Create(Application);
    flag_copy := false;
      frmAddEditTMC.Caption := '�������� ��������';
    UAddEditTMC.Data_Set2 := TSQLClientDataSet(TMP_Data_Set);

    if flagg_edit then frmAddEditTMC.Caption := frmAddEditTMC.Caption + ' (��������������)'
    else frmAddEditTMC.Caption := frmAddEditTMC.Caption + ' (����������)';
    flag_edit2 := flagg_edit;
    frmAddEditTMC.ShowModal;
end;

procedure TfrmTableTMC.btnDelClick(Sender: TObject);
var AGrid: TToolTipsDBGrid;
begin
  AGrid := GridTMC;
  if AGrid.DataSource.DataSet.RecordCount = 0 then exit;
  if MessageDlg('����� �������?', mtConfirmation, mbOKCancel, 0) = mrOK then
  begin
    DeleteFromTable(AGrid.DataSource.DataSet.Name,'id',AGrid.DataSource.DataSet.fieldbyname('id').asstring,false);
    AGrid.DataSource.DataSet.Close;
    try AGrid.DataSource.DataSet.Open; except end;
  end;
end;

procedure TfrmTableTMC.GridElBezDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if GridTMC.DataSource.DataSet.FieldByName('color').IsNull then
  begin
     if gdSelected in State then
     begin
       (Sender as TDBGrid).Canvas.Brush.Color := clGrayText;
       (Sender as TDBGrid).Canvas.Font.Color :=  clWhite;
     end
     else
     begin
       (Sender as TDBGrid).Canvas.Brush.Color := clWhite;
       (Sender as TDBGrid).Canvas.Font.Color :=  clBlack;
     end;
      //���� ������� ����������� ��
      if GridTMC.DataSource.DataSet.FieldByName('id_uch').AsInteger = 9 then
      begin
         if gdSelected in State then
         begin
           (Sender as TDBGrid).Canvas.Brush.Color := clBlack;
           (Sender as TDBGrid).Canvas.Font.Color :=  clLime;
         end
         else
         begin
           (Sender as TDBGrid).Canvas.Brush.Color := clLime;
           (Sender as TDBGrid).Canvas.Font.Color :=  clBlack;
         end;
      end;
  end
  else
  begin
     if gdSelected in State then
     begin
       (Sender as TDBGrid).Canvas.Brush.Color := clGrayText;
       (Sender as TDBGrid).Canvas.Font.Color :=  clWhite;
     end
     else
     begin
       (Sender as TDBGrid).Canvas.Brush.Color := GridTMC.DataSource.DataSet.FieldByName('color').AsInteger;
       (Sender as TDBGrid).Canvas.Font.Color :=  clBlack;
     end;
  end;

   StatusBar1.Panels[0].Text := '�����: '+IntToStr(GridTMC.DataSource.DataSet.RecordCount);
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmTableTMC.FormCreate(Sender: TObject);
begin

   Main_filtr := DM.tmc.Filter;

   if DM.tmc.Filtered then Main_filtr := '('+Main_filtr+')';

  cbFiltr.ItemIndex := cbFiltr.Items.Count - 1;

  
  flAll:=0; flOsnSredstva:=1; flMalocenka:=1; flSotovie:=0; flSpisano:=0; flTelephone:=1; flMebel:=1; flOrgtehnix :=1; flOther :=1;
  cbShowMobilaChange(sender);

  cbFiltrChange(sender);
  cbUchastokChange(Sender);
  try  GridTMC.DataSource.DataSet.Open; except end;
end;

procedure TfrmTableTMC.FormDestroy(Sender: TObject);
begin
  frmTableTMC := nil;
end;

procedure TfrmTableTMC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then close;
  if key=vk_f2 then btnAddClick(btnEdit);
  if key=vk_f3 then btnFindClick(Sender);
  if key=vk_insert then btnAddClick(btnAdd);
  if (key=ord('P'))and (ssCtrl in Shift) then btnExcelClick(Sender);
end;

procedure TfrmTableTMC.btnExcelClick(Sender: TObject);
begin
  Export_To_Excel(GridTMC);
end;

procedure TfrmTableTMC.GridMetrologiyaDblClick(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTableTMC.GridTMCTitleClick(Column: TColumn);
begin
  if Column.Field.FieldName = 'name_uch' then
    (GridTMC.DataSource.DataSet as TSQLclientdataset).indexFieldNames := 'id_uch'
  else
    (GridTMC.DataSource.DataSet as TSQLclientdataset).indexFieldNames := Column.FieldName;
end;

procedure TfrmTableTMC.btnFindClick(Sender: TObject);
begin
(* cbFields:
������������
�����-�������������
������
�������� �
������. �
�������. �
���� ����� � �����.
����� ���������
���������
����������*)
  case cbFields.ItemIndex of
    0: GridTMC.DataSource.DataSet.Locate('name',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    1: GridTMC.DataSource.DataSet.Locate('firma',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    2: GridTMC.DataSource.DataSet.Locate('model',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    3: GridTMC.DataSource.DataSet.Locate('serial_num',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    4: GridTMC.DataSource.DataSet.Locate('inv_num',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    5: GridTMC.DataSource.DataSet.Locate('nomenkl_num',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    6: GridTMC.DataSource.DataSet.Locate('date_input',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    7: GridTMC.DataSource.DataSet.Locate('place_install',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    8: GridTMC.DataSource.DataSet.Locate('stoimost',edtFind.Text,[loCaseInsensitive, loPartialKey]);
    9: GridTMC.DataSource.DataSet.Locate('prim',edtFind.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmTableTMC.btnFiltrClick(Sender: TObject);
var
  detail_filtr: string;
begin

  //������ �������������� ��� ����� ��������
  if (cbFiltr.ItemIndex=10)and(cbUchastok.ItemIndex <> id_alert_uchastok - 1)and(id_alert_uchastok<7)and(cbUchastok.ItemIndex <> 8) then
  begin
    btnAdd.Enabled := false;
    btnDel.Enabled := false;
    btnEdit.Enabled := false;
    Button1.Enabled := false;
    GridTMC.OnDblClick := nil;
    GridTMC.PopupMenu := nil;
  end
  else
  begin
    btnAdd.Enabled := true;
    btnDel.Enabled := true;
    btnEdit.Enabled := true;
    Button1.Enabled := true;
    GridTMC.OnDblClick := GridMetrologiyaDblClick;
    GridTMC.PopupMenu := PopupMenu1;
  end;

(* cbFiltr:
������������
�����-�������������
������
�������� �
������. �
�������. �
���� ����� � �����.
����� ���������
���������
����������
--�������*)

  if (cbUchastok.Style=csSimple) and (cbUchastok.Text = '') then
  begin
    cbUchastok.Items.Clear;
    cbUchastok.Style := csDropDownList;
    cbUchastok.Items.Add('������� ��� � ��');
    cbUchastok.Items.Add('���');
    cbUchastok.Items.Add('��� ��');
    cbUchastok.Items.Add('��� ���');
    cbUchastok.Items.Add('��� ��');
    cbUchastok.Items.Add('������� ��');
    cbUchastok.Items.Add('��� �������');
    cbUchastok.Items.Add('��������� ������ �����');
    cbUchastok.Items.Add('������������');
    cbUchastok.Items.Add('����� ������� ������������');
    cbUchastok.Items.Add('����� �����');
    cbUchastok.Items.Add('�������');
    cbUchastok.Items.Add('������� ������');
    cbUchastok.Items.Add('������� �����������');
    cbUchastok.ItemIndex := id_alert_uchastok-1;
    if id_alert_uchastok = 11 then cbUchastok.ItemIndex := 12;
    if id_alert_uchastok = 12 then cbUchastok.ItemIndex := 13;    
    cbFiltr.ItemIndex := 10;
    cbUchastok.OnChange := cbUchastokChange;

    GridTMC.DataSource.DataSet.Filter := Main_filtr;
    if Main_filtr='' then GridTMC.DataSource.DataSet.Filtered := false
    else GridTMC.DataSource.DataSet.Filtered := true;
  end
  else
  begin

        case cbFiltr.ItemIndex of
          0: detail_filtr := 'name='+QuotedStr(cbUchastok.Text+'*');
          1: detail_filtr := 'firma='+QuotedStr(cbUchastok.Text+'*');
          2: detail_filtr := 'model='+QuotedStr(cbUchastok.Text+'*');
          3: detail_filtr := 'serial_num='+QuotedStr(cbUchastok.Text+'*');
          4: detail_filtr := 'inv_num='+QuotedStr(cbUchastok.Text+'*');
          5: detail_filtr := 'nomenkl_num='+QuotedStr(cbUchastok.Text+'*');
          6: detail_filtr := 'date_input='+QuotedStr(cbUchastok.Text+'*');
          7: detail_filtr := 'place_install='+QuotedStr(cbUchastok.Text+'*');
          8: detail_filtr := 'stoimost='+QuotedStr(cbUchastok.Text+'*');
          9: detail_filtr := 'prim='+QuotedStr(cbUchastok.Text+'*');
          10:
            begin
              //���� ��� �������, �� - ��� ������� :-)
              if (cbUchastok.ItemIndex + 1) = 7 then
                detail_filtr := 'id_uch<12'
              else
              begin
                detail_filtr := 'id_uch='+IntToStr(cbUchastok.ItemIndex+1);
                if cbUchastok.ItemIndex=12 then detail_filtr := 'id_uch=11';
                if cbUchastok.ItemIndex=13 then detail_filtr := 'id_uch=12'
              end;
              //����� �����
              if (cbUchastok.ItemIndex + 1) = 11 then
                detail_filtr := 'id_uch<>1 and id_uch<>6 and id_uch<>9 and id_uch<>11';
              //����� ������� ������������
              if (cbUchastok.ItemIndex + 1) = 10 then
                detail_filtr := 'id_uch=1 or id_uch=6 or id_uch=11';
              //�������
              if (cbUchastok.ItemIndex + 1) = 12 then
                detail_filtr := 'id_uch=10';

            end;
          11: detail_filtr := 'mol='+QuotedStr(cbUchastok.Text+'*');
        end;

        if Main_filtr='' then  GridTMC.DataSource.DataSet.Filter := detail_filtr
        else GridTMC.DataSource.DataSet.Filter := Main_filtr + ' and (' + detail_filtr + ')';

        if (cbFiltr.ItemIndex = 10)and(cbUchastok.ItemIndex+1<>id_alert_uchastok) then GridTMC.DataSource.DataSet.Filter := '('+ detail_filtr + ')';
        if (cbFiltr.ItemIndex = 10)and(cbUchastok.ItemIndex+1=13)and(id_alert_uchastok<>11) then GridTMC.DataSource.DataSet.Filter := '('+ detail_filtr + ')';
        GridTMC.DataSource.DataSet.Filtered := true;
  end;
end;

procedure TfrmTableTMC.cbFiltrChange(Sender: TObject);
begin
  if cbFiltr.ItemIndex = 10 then
  begin
    cbUchastok.Items.Clear;
    cbUchastok.Style := csDropDownList;
    cbUchastok.Items.Add('������� ��� � ��');
    cbUchastok.Items.Add('���');
    cbUchastok.Items.Add('��� ��');
    cbUchastok.Items.Add('��� ���');
    cbUchastok.Items.Add('��� ��');
    cbUchastok.Items.Add('������� ��');
    cbUchastok.Items.Add('��� �������');
    cbUchastok.Items.Add('��������� ������ �����');
    cbUchastok.Items.Add('������������');
    cbUchastok.Items.Add('����� ������� ������������');
    cbUchastok.Items.Add('����� �����');
    cbUchastok.Items.Add('�������');
    cbUchastok.Items.Add('������� ������');
    cbUchastok.Items.Add('������� �����������');
    cbUchastok.ItemIndex := id_alert_uchastok-1;
    if id_alert_uchastok=11 then cbUchastok.ItemIndex := 12;
    if id_alert_uchastok=12 then cbUchastok.ItemIndex := 13;
    cbUchastok.OnChange := cbUchastokChange;
{    cbUchastok.Left := cbFiltr.Left+cbFiltr.Width;
    btnFiltr.Left := cbUchastok.Left+cbUchastok.Width;}
  end
  else
  begin
    cbUchastok.Items.Clear;
    cbUchastok.Style := csSimple;
    cbUchastok.OnChange := nil;
{    edtFiltr.Left := cbFiltr.Left+ cbFiltr.Width;
    btnFiltr.Left := edtFiltr.Left + edtFiltr.Width;}
  end;
end;

procedure TfrmTableTMC.Button1Click(Sender: TObject);
var
  bkmkr: pointer;
begin
  if ColorDialog1.Execute then
  begin
    UpdateToTable('tmc','id',dm.tmcid.AsString,['color'],[IntToStr(ColorDialog1.Color)]);
    bkmkr := GridTMC.DataSource.DataSet.GetBookmark;
    GridTMC.DataSource.DataSet.Close;
    try   GridTMC.DataSource.DataSet.Open; except end;
    GridTMC.DataSource.DataSet.GotoBookmark(bkmkr);
    GridTMC.DataSource.DataSet.FreeBookmark(bkmkr);
  end;
end;

procedure TfrmTableTMC.N1Click(Sender: TObject);
begin
  btnAddClick(btnAdd);
end;

procedure TfrmTableTMC.N2Click(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTableTMC.N3Click(Sender: TObject);
begin
  btnDelClick(btnDel);
end;

procedure TfrmTableTMC.cbUchastokChange(Sender: TObject);
begin
  btnFiltrClick(Sender);
end;

procedure TfrmTableTMC.cbShowMobilaChange(Sender: TObject);
begin
    if id_alert_uchastok=7 then Main_filtr := '(id_uch<13)'
      else
        Main_filtr := '(id_uch='+IntToStr(id_alert_uchastok)+')';


    if flAll=1 then
    else
    begin
      if ((flOsnSredstva=1)and(flMalocenka=1))or((flOsnSredstva=0)and(flMalocenka=0)) then //Main_filtr := '('+Main_filtr+ ')'
        else
            if flMalocenka=0 then Main_filtr := '('+Main_filtr+ ' and if_malocenka=0)'
              else Main_filtr := '('+Main_filtr+ ' and if_malocenka=1)';


          if flSotovie=0 then Main_filtr := '('+Main_filtr+ ' and if_mobila=0)';
          if flMebel=0 then Main_filtr := '('+Main_filtr+ ' and if_mebel=0)';
          if flTelephone=0 then Main_filtr := '('+Main_filtr+ ' and if_phone=0)';
          if flOrgtehnix=0 then Main_filtr := '('+Main_filtr+ ' and if_orgtehnics=0)';

         if (flSotovie or flMebel or flTelephone or flOrgtehnix <> 0) then
         begin
          Main_filtr := Main_filtr + ' and (';
          if flSotovie=1 then Main_filtr := Main_filtr+ 'if_mobila=1 or ';
          if flMebel=1 then Main_filtr := Main_filtr+ 'if_mebel=1 or ';
          if flTelephone=1 then Main_filtr := Main_filtr+ 'if_phone=1 or ';
          if flOrgtehnix=1 then Main_filtr := Main_filtr+ 'if_orgtehnics=1 or ';
          Delete(Main_filtr,Length(Main_filtr)-3,4);
          Main_filtr := Main_filtr + ')';
         end;
      //��� ��������� ��������� - ���� �� ����� ������� �� �����
      if flOther=1 then
          if id_alert_uchastok=7 then   Main_filtr := Main_filtr + ' or (id_uch<13 and if_mobila=0 and if_mebel=0 and if_phone=0 and if_orgtehnics=0)'
            else  Main_filtr := Main_filtr + ' or (id_uch='+IntToStr(id_alert_uchastok)+' and if_mobila=0 and if_mebel=0 and if_phone=0 and if_orgtehnics=0)';
      if flSpisano=1 then Main_filtr := '('+Main_filtr+ ') and Sostoyanie=''�������'''
        else Main_filtr := '('+Main_filtr+ ') and Sostoyanie<>''�������''';
    end;


  GridTMC.DataSource.DataSet.Filtered := false;
  GridTMC.DataSource.DataSet.Filter := Main_filtr;
  GridTMC.DataSource.DataSet.Filtered := true;
  cbFiltr.ItemIndex := 10;
  cbUchastok.Style := csDropDownList;
  cbUchastok.ItemIndex := id_alert_uchastok-1;
  if id_alert_uchastok=11 then cbUchastok.ItemIndex :=12;
  if id_alert_uchastok=12 then cbUchastok.ItemIndex :=13;
end;

procedure TfrmTableTMC.Button2Click(Sender: TObject);
begin
  frmSyncTMC := TfrmSyncTMC.Create(Application);
  frmSyncTMC.ShowModal;
end;

procedure TfrmTableTMC.N4Click(Sender: TObject);
var
  TMP_Data_Set: TDataSet;
begin
  //�������� �������� ����
  TMP_Data_Set := gridTMC.Datasource.Dataset;
  //���� ������ ���������� � ������� ��� �� �����
  if (TMP_Data_Set = nil)or(TMP_Data_Set.RecordCount=0) then exit;
  frmAddEditTMC := TfrmAddEditTMC.Create(Application);
  frmAddEditTMC.Caption := '�������� ��������';
  UAddEditTMC.Data_Set2 := TSQLClientDataSet(TMP_Data_Set);
  flag_copy := true;
  frmAddEditTMC.Caption := frmAddEditTMC.Caption + ' (����������)';
  flag_edit2 := true;
  frmAddEditTMC.ShowModal;
end;

procedure TfrmTableTMC.btnShowClick(Sender: TObject);
begin
  frmShowTMC := TfrmShowTMC.Create(Application);
  with frmShowTMC do
  begin
    Sotoviy.Checked := flSotovie=1;
    Malocenka.Checked := flMalocenka=1;
    Osnovnoe.Checked := flOsnSredstva=1;
    Orgtehnix.Checked := flOrgtehnix=1;
    Spisano.Checked := flSpisano=1;
    Telephone.Checked := flTelephone=1;
    Mebel.Checked := flMebel=1;
    Others.Checked := flOther=1;
    CheckBox1.Checked := flAll=1;
    ShowModal;
  end;
end;

end.
