{+ADO->dbExpress}
unit UnitTableRooms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl, UnitDM, DB,
  DBLocalS, UAddEditRooms, ComObj, ActiveX,
  DateUtils, Menus, Buttons, ToolWin, Placemnt, MyDB,
  StdCtrls, TTDBGrid;

type
  TfrmTableRooms = class(TForm)
    ToolBar1: TToolBar;
    btnEdit: TSpeedButton;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btnExcel: TButton;
    ToolButton4: TToolButton;
    GridRooms: TToolTipsDBGrid;
    StatusBar1: TStatusBar;
    ColorDialog1: TColorDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cbUchastok: TComboBox;
    btn_passport: TButton;
    ToolButton1: TToolButton;
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
    procedure GridRoomsTitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cbUchastokChange(Sender: TObject);
    procedure btn_passportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTableRooms: TfrmTableRooms;

implementation

uses DBLocal, UnitMain;



{$R *.dfm}

procedure TfrmTableRooms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  GridRooms.DataSource.DataSet.Close;
end;

procedure TfrmTableRooms.btnAddClick(Sender: TObject);
var
 Flagg_edit: Boolean;
 TMP_Data_Set: TDataSet;
begin
//  DM.IcmpClient.Ping;
//  if not on_line then
//  begin
//    ShowMessage('Нет доступа к БД. Возможно, компьютер не подключен к сети.');
//    exit;
//  end;

  if (Sender as TControl).Name = 'btnAdd' then flagg_edit := false
  else flagg_edit := True;

  //выбираем активную базу
  TMP_Data_Set := GridRooms.Datasource.Dataset;

  //если нажали редактировать а записей нет то выход
  if (TMP_Data_Set = nil)or((TMP_Data_Set.RecordCount=0)and flagg_edit) then exit;

    frmAddEditRooms := TfrmAddEditRooms.Create(Application);
      frmAddEditRooms.Caption := 'Помещения';
    UAddEditRooms.Data_Set2 := TSQLClientDataSet(TMP_Data_Set);

    if flagg_edit then frmAddEditRooms.Caption := frmAddEditRooms.Caption + ' (редактирование)'
    else frmAddEditRooms.Caption := frmAddEditRooms.Caption + ' (добавление)';
    flag_edit2 := flagg_edit;
    frmAddEditRooms.ShowModal;
end;

procedure TfrmTableRooms.btnDelClick(Sender: TObject);
var AGrid: TToolTipsDBGrid;
begin
  AGrid := GridRooms;
  if AGrid.DataSource.DataSet.RecordCount = 0 then exit;
  if MessageDlg('Точно удалить?', mtConfirmation, mbOKCancel, 0) = mrOK then
  begin
    DeleteFromTable(AGrid.DataSource.DataSet.Name,'id_rooms',AGrid.DataSource.DataSet.fieldbyname('id_rooms').asstring,false);
    AGrid.DataSource.DataSet.Close;
    try AGrid.DataSource.DataSet.Open; except end;
  end;
end;

procedure TfrmTableRooms.GridElBezDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

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
   StatusBar1.Panels[0].Text := 'Строк: '+IntToStr(GridRooms.DataSource.DataSet.RecordCount);
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmTableRooms.FormCreate(Sender: TObject);
begin
  cbUchastok.ItemIndex := id_alert_uchastok-1;
  cbUchastokChange(Sender);
  try GridRooms.DataSource.DataSet.Open; except end;
end;

procedure TfrmTableRooms.FormDestroy(Sender: TObject);
begin
  frmTableRooms := nil;
end;

procedure TfrmTableRooms.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then close;
  if key=vk_f2 then btnAddClick(btnEdit);
  if key=vk_insert then btnAddClick(btnAdd);
  if (key=ord('P'))and (ssCtrl in Shift) then btnExcelClick(Sender);
end;

procedure TfrmTableRooms.btnExcelClick(Sender: TObject);
begin
  Export_To_Excel(GridRooms);
end;

procedure TfrmTableRooms.GridMetrologiyaDblClick(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTableRooms.GridRoomsTitleClick(Column: TColumn);
begin
 if Column.Field.FieldName = 'name_uch' then
    (GridRooms.DataSource.DataSet as TSQLclientdataset).indexFieldNames := 'id_uch'
 else
    (GridRooms.DataSource.DataSet as TSQLclientdataset).indexFieldNames := Column.FieldName;
end;

procedure TfrmTableRooms.N1Click(Sender: TObject);
begin
  btnAddClick(btnAdd);
end;

procedure TfrmTableRooms.N2Click(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTableRooms.N3Click(Sender: TObject);
begin
  btnDelClick(btnDel);
end;

procedure TfrmTableRooms.cbUchastokChange(Sender: TObject);
var
  detail_filtr: string;
begin

  //Запрет редактирования ТМЦ чужих участков
  if (cbUchastok.ItemIndex <> id_alert_uchastok - 1)and(id_alert_uchastok<7) then
  begin
    btnAdd.Enabled := false;
    btnDel.Enabled := false;
    btnEdit.Enabled := false;
    btnExcel.Enabled := false;
    btn_passport.Enabled := false;
    GridRooms.OnDblClick := nil;
    GridRooms.PopupMenu := nil;
  end
  else
  begin
    btnAdd.Enabled := true;
    btnDel.Enabled := true;
    btnEdit.Enabled := true;
    btnExcel.Enabled := true;
    btn_passport.Enabled := true;
    GridRooms.OnDblClick := GridMetrologiyaDblClick;
    GridRooms.PopupMenu := PopupMenu1;
  end;
  if (cbUchastok.ItemIndex + 1) = 7 then
    detail_filtr := 'id_uch<9'
  else
    detail_filtr := 'id_uch='+IntToStr(cbUchastok.ItemIndex+1);
  GridRooms.DataSource.DataSet.Filter := detail_filtr;
  GridRooms.DataSource.DataSet.Filtered := true;
end;


procedure TfrmTableRooms.btn_passportClick(Sender: TObject);
var
  ExcelApp, WorkBook: Variant;
var
  row: Integer;
  sline: string;
  mem: TMemo;
  Layout: array[0.. KL_NAMELENGTH] of char;
  kol1, kol2, kol3, kol4: integer;
begin
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;
// Создание Excel
      ExcelApp := CreateOleObject('Excel.Application');
  WorkBook := ExcelApp.WorkBooks.Add;
  Screen.Cursor := crHourglass;

  // Сперва отправляем данные в memo
  // работает быстрее, чем отправлять их напрямую в Excel
  mem := TMemo.Create(frmMain);
  mem.Parent := frmMain;
  mem.Visible := false;
  mem.Clear;

  mem.Lines.Add('Управление'#9#9'Управление коммуникаций и средств связи');
  mem.Lines.Add('');
  try
  if dm.roomsid_uch.AsInteger = 1 then
    mem.Lines.Add('Отдел'#9#9'Отдел сетевых коммуникаций')
  else
    mem.Lines.Add('Отдел'#9#9'Отдел связи');

  mem.Lines.Add('');
  mem.Lines.Add('Участок'#9#9+dm.roomsname_uch.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('Назначение помещения'#9#9+DM.roomsnaznachenie.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('№ помещения'#9#9+DM.roomsnumber_room.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('Расположение помещения'#9#9+dm.roomsplace_room.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('Площадь помещения (м2)'#9#9+dm.roomsarea_room.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('Состояние помещения'#9#9+dm.roomssostoyanie.AsString);
  mem.Lines.Add('');
  mem.Lines.Add('В помещении располагаются работники:');
  mem.Lines.Add('');
  mem.Lines.Add('№ п/п'#9'Ф.И.О.'#9'Должность'#9'Вмененные обязанности');
  mem.Lines.Add('');
  mem.Lines.Add('');
  mem.Lines.Add('');
  mem.Lines.Add('');
  mem.Lines.Add('Установлено оборудование');
  mem.Lines.Add('');
  mem.Lines.Add('№ п/п'#9'Наименование'#9'Кол-во'#9'Состояние'#9'Дата ввода'#9'Инв./инд. №');
  //запрашиваем данные по основным ср-вам не малоценка и не мебель
  DM.Query.Close;
  DM.Query.SQL.Text := 'select * from tmc where id_uch='+DM.roomsid_uch.AsString+
    ' and place_install='+QuotedStr(DM.roomslink_tmc_place.AsString)+
    ' and if_malocenka=0 and if_mebel=0 order by inv_num';
  DM.Query.Open;
  //получаем данные из Query в Memo
  DM.Query.First;
  kol1 := DM.Query.RecordCount;
  for row := 1 to kol1 do
  begin
    if FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) <> '30.12.1899' then
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9 +
        FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) + #9 + DM.Query.fieldByName('inv_num').AsString
    else
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9#9 + DM.Query.fieldByName('inv_num').AsString;
    mem.Lines.Add(sline);
    DM.Query.Next;
  end;
  DM.Query.Close;
  mem.Lines.Add('');
  mem.Lines.Add('Мебель и инвентарь');
  mem.Lines.Add('');
  mem.Lines.Add('№ п/п'#9'Наименование'#9'Кол-во'#9'Состояние'#9'Дата ввода'#9'Инв./инд. №');
  //запрашиваем данные по основным ср-вам не малоценка мебель
  DM.Query.Close;
  DM.Query.SQL.Text := 'select * from tmc where id_uch='+DM.roomsid_uch.AsString+
    ' and place_install='+QuotedStr(DM.roomslink_tmc_place.AsString)+
    ' and if_malocenka=0 and if_mebel=1 order by inv_num';
  DM.Query.Open;
  //получаем данные из Query в Memo
  DM.Query.First;
  kol2:=DM.Query.RecordCount;
  for row := 1 to kol2 do
  begin
    if FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) <> '30.12.1899' then
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9 +
        FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) + #9 + DM.Query.fieldByName('inv_num').AsString
    else
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9#9 + DM.Query.fieldByName('inv_num').AsString;
    mem.Lines.Add(sline);
    DM.Query.Next;
  end;
  DM.Query.Close;
  mem.Lines.Add('');
  mem.Lines.Add('Малоценка');
  mem.Lines.Add('');
  mem.Lines.Add('Установлено оборудование');
  mem.Lines.Add('');
  mem.Lines.Add('№ п/п'#9'Наименование'#9'Кол-во'#9'Состояние'#9'Дата ввода'#9'Инв./инд. №');
  //запрашиваем данные по основным ср-вам  малоценка  не мебель
  DM.Query.Close;
  DM.Query.SQL.Text := 'select * from tmc where id_uch='+DM.roomsid_uch.AsString+
    ' and place_install='+QuotedStr(DM.roomslink_tmc_place.AsString)+
    ' and if_malocenka=1 and if_mebel=0 order by inv_num';
  DM.Query.Open;
  //получаем данные из Query в Memo
  DM.Query.First;
  kol3 := DM.Query.RecordCount;
  for row := 1 to kol3 do
  begin
    if FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) <> '30.12.1899' then
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9 +
        FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) + #9 + DM.Query.fieldByName('inv_num').AsString
    else
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9#9 + DM.Query.fieldByName('inv_num').AsString;
    mem.Lines.Add(sline);
    DM.Query.Next;
  end;
  DM.Query.Close;
  mem.Lines.Add('');
  mem.Lines.Add('Мебель и инвентарь');
  mem.Lines.Add('');
  mem.Lines.Add('№ п/п'#9'Наименование'#9'Кол-во'#9'Состояние'#9'Дата ввода'#9'Инв./инд. №');
  //запрашиваем данные по основным ср-вам  малоценка мебель
  DM.Query.Close;
  DM.Query.SQL.Text := 'select * from tmc where id_uch='+DM.roomsid_uch.AsString+
    ' and place_install='+QuotedStr(DM.roomslink_tmc_place.AsString)+
    ' and if_malocenka=1 and if_mebel=1 order by inv_num';
  DM.Query.Open;
  //получаем данные из Query в Memo
  DM.Query.First;
  kol4 := DM.Query.RecordCount;
  for row := 1 to kol4 do
  begin
    if FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) <> '30.12.1899' then
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9 +
        FormatDateTime('dd.mm.yyyy',DM.Query.fieldByName('date_input').AsDateTime) + #9 + DM.Query.fieldByName('inv_num').AsString
    else
      sline := IntToStr(row)+#9+DM.Query.fieldByName('name').AsString + #9 + DM.Query.fieldByName('kol_vo').AsString +
        #9 + DM.Query.fieldByName('Sostoyanie').AsString + #9#9 + DM.Query.fieldByName('inv_num').AsString;
    mem.Lines.Add(sline);
    DM.Query.Next;
  end;
  DM.Query.Close;
  except end;
  // копируем данные в clipboard
  mem.SelectAll;
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  mem.CopyToClipboard;
  mem.Free;
  // отправляем их в Excel
  Workbook.WorkSheets[1].Paste;
//  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Size := 11;
//  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Bold := true;
//  Workbook.WorkSheets[1].Columns.AutoFit;
  Workbook.WorkSheets[1].Range['A1',EmptyParam].Select;
  Workbook.WorkSheets[1].Columns['A:A'].ColumnWidth := 8.29;
  Workbook.WorkSheets[1].Columns['B:B'].ColumnWidth := 58;
  Workbook.WorkSheets[1].Columns['C:C'].ColumnWidth := 19.43;
  Workbook.WorkSheets[1].Columns['D:D'].ColumnWidth := 19.29;
  Workbook.WorkSheets[1].Columns['E:E'].ColumnWidth := 10.29;
  Workbook.WorkSheets[1].Columns['F:F'].ColumnWidth := 10.71;
  Workbook.WorkSheets[1].Range['A19','F22'].Borders.Weight := 2;
  Workbook.WorkSheets[1].Range['A26','F'+IntToStr(26+kol1)].Borders.Weight := 2;
  Workbook.WorkSheets[1].Range['A'+IntToStr(26+kol1+4),'F'+IntToStr(26+kol1+4+kol2)].Borders.Weight := 2;
  Workbook.WorkSheets[1].Range['A'+IntToStr(26+kol1+4+kol2+6),'F'+IntToStr(26+kol1+4+kol2+6+kol3)].Borders.Weight := 2;
  Workbook.WorkSheets[1].Range['A'+IntToStr(26+kol1+4+kol2+6+kol3+4),'F'+IntToStr(26+kol1+4+kol2+6+kol3+4+kol4)].Borders.Weight := 2;
  Screen.Cursor := crDefault;
  Workbook.WorkSheets[1].PageSetup.Orientation := 2;
  Workbook.WorkSheets[1].Range['C1','C15'].HorizontalAlignment := 2;
  ExcelApp.Visible := true;

end;

end.
