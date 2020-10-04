{+ADO->dbExpress}
unit UnitTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl, UnitDM, DB,
  DBLocalS,
  DateUtils, Menus, Buttons, ToolWin, Placemnt, UnitAddEdit, UnitAddEdit1, MyDB,
  StdCtrls;

type
  TfrmTable = class(TForm)
    PageControl: TPageControl;
    tsElektroinstrument: TTabSheet;
    tsTakelag: TTabSheet;
    tsSiz: TTabSheet;
    tsZazeml: TTabSheet;
    tsElektrobezopasn: TTabSheet;
    tsOTiPB: TTabSheet;
    tsGPM: TTabSheet;
    tsMetalStanki: TTabSheet;
    GridElBez: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    btnEdit: TSpeedButton;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GridElInstr: TRxDBGrid;
    GridOTiPB: TRxDBGrid;
    GridGPM: TRxDBGrid;
    GridMetalStanki: TRxDBGrid;
    GridZazeml: TRxDBGrid;
    GridSIZ: TRxDBGrid;
    GridTakelag: TRxDBGrid;
    tsTrenirovki: TTabSheet;
    tsOgnetusitel: TTabSheet;
    tsInstruktagi: TTabSheet;
    tsOthers: TTabSheet;
    GridOgnetush: TRxDBGrid;
    GridOthers: TRxDBGrid;
    GridTrenirovki: TRxDBGrid;
    GridInstruktagi: TRxDBGrid;
    tsMetrologiya: TTabSheet;
    GridMetrologiya: TRxDBGrid;
    btnExcel: TButton;
    ToolButton4: TToolButton;
    tsFlurografia: TTabSheet;
    GridFlurografia: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridElBezDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure GridOTiPBTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure GridMetrologiyaDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTable: TfrmTable;

implementation

uses UnitAddEdit2, UnitAddEdit3;

{$R *.dfm}

procedure TfrmTable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  with DM do
  begin
    elektroinstrument.Close;
    siz.close;
    zazeml.close;
    takelag.close;
    znaniya_el_bez.close;
    znaniya_gpm.close;
    znaniya_met_stanki.close;
    znaniya_otipb.close;
    ognetush.Close;
    others.Close;
    trenirovki.Close;
    instruktagi.Close;
    metrologiya.Close;
    flurografia.Close;
    DBConnection.Close;
  end;
end;

procedure TfrmTable.btnAddClick(Sender: TObject);
var
  flagg_edit:boolean;
  i: byte;
  TMP_Data_Set: TSQLClientDataSet;
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
  TMP_Data_Set := nil;
  for i:=0 to ComponentCount - 1 do
    if (Components[i] is TRxDBGrid) then
      if (Components[i] as TRxDBGrid).Parent.Name = PageControl.ActivePage.Name then
        TMP_Data_Set := ((Components[i] as TRxDBGrid).DataSource.DataSet as TSQLClientDataSet);

  //если нажали редактировать а записей нет то выход
  if (TMP_Data_Set = nil)or((TMP_Data_Set.RecordCount=0)and flagg_edit) then exit;

  if (PageControl.ActivePage.Name = 'tsElektroinstrument') or
     (PageControl.ActivePage.Name = 'tsTakelag') or
     (PageControl.ActivePage.Name = 'tsSiz') or
     (PageControl.ActivePage.Name = 'tsZazeml')or
     (PageControl.ActivePage.Name = 'tsOgnetusitel') or
     (PageControl.ActivePage.Name = 'tsOthers') or
     (PageControl.ActivePage.Name = 'tsMetrologiya') then
  begin
    frmAdd_Edit := TfrmAdd_Edit.Create(Application);
    if PageControl.ActivePage.Name = 'tsElektroinstrument' then
    begin
      frmAdd_Edit.Caption := 'Электроинструмент';
    end;
    if PageControl.ActivePage.Name = 'tsMetrologiya' then
    begin
      frmAdd_Edit.Caption := 'Метрология';
    end;

    if PageControl.ActivePage.Name = 'tsTakelag' then
    begin
      frmAdd_Edit.Caption := 'Такелажное средство';
    end;
    if PageControl.ActivePage.Name = 'tsSiz' then
    begin
      frmAdd_Edit.Caption := 'Средство защиты';
    end;
    if PageControl.ActivePage.Name = 'tsZazeml' then
    begin
      frmAdd_Edit.Caption := 'Заземляющее устройство';
    end;
    if PageControl.ActivePage.Name = 'tsOgnetusitel' then
    begin
      frmAdd_Edit.Caption := 'Средство пожаротушения';
    end;
    if PageControl.ActivePage.Name = 'tsOthers' then
    begin
      frmAdd_Edit.Caption := 'Разное';
    end;
    Data_Set := TMP_Data_Set;
    if flagg_edit then frmAdd_Edit.Caption := frmAdd_Edit.Caption + ' (редактирование)'
    else frmAdd_Edit.Caption := frmAdd_Edit.Caption + ' (добавление)';
    flag_edit := flagg_edit;
    frmAdd_Edit.ShowModal;
  end
  else
      if (PageControl.ActivePage.Name = 'tsElektrobezopasn') or
         (PageControl.ActivePage.Name = 'tsOTiPB') or
         (PageControl.ActivePage.Name = 'tsMetalStanki') or
         (PageControl.ActivePage.Name = 'tsFlurografia') or
         (PageControl.ActivePage.Name = 'tsGPM') then
      begin
        frmAdd_Edit1 := TfrmAdd_Edit1.Create(Application);
        if PageControl.ActivePage.Name = 'tsFlurografia' then
        begin
          frmAdd_Edit1.Caption := 'Флюрография';
          flag_gruppa := 3;
        end;
        if PageControl.ActivePage.Name = 'tsElektrobezopasn' then
        begin
          frmAdd_Edit1.Caption := 'Проверка знаний эл.безопасности';
          flag_gruppa := 1;
        end;
        if PageControl.ActivePage.Name = 'tsOTiPB' then
        begin
          frmAdd_Edit1.Caption := 'Проверка знаний ОТ и ПБ';
          flag_gruppa := 0;
        end;
        if PageControl.ActivePage.Name = 'tsGPM' then
        begin
          frmAdd_Edit1.Caption := 'Проверка знаний ГПМ';
          flag_gruppa := 2;
        end;
        if PageControl.ActivePage.Name = 'tsMetalStanki' then
        begin
          frmAdd_Edit1.Caption := 'Проверка знаний: металлообраб.станки';
          flag_gruppa := 0;
        end;
        Data_Set1 := TMP_Data_Set;
        if flagg_edit then frmAdd_Edit1.Caption := frmAdd_Edit1.Caption + ' (редактирование)'
        else frmAdd_Edit1.Caption := frmAdd_Edit1.Caption + ' (добавление)';
        flag_edit1 := flagg_edit;
        frmAdd_Edit1.ShowModal;
      end
      else
        if (PageControl.ActivePage.Name = 'tsTrenirovki') then
        begin
          frmAdd_Edit2 := TfrmAdd_Edit2.Create(Application);
          frmAdd_Edit2.Caption := 'Тренировки';
          Data_Set2 := TMP_Data_Set;
          if flagg_edit then frmAdd_Edit2.Caption := frmAdd_Edit2.Caption + ' (редактирование)'
          else frmAdd_Edit2.Caption := frmAdd_Edit2.Caption + ' (добавление)';
          flag_edit2 := flagg_edit;
          frmAdd_Edit2.ShowModal;
        end
        else
            if (PageControl.ActivePage.Name = 'tsInstruktagi') then
            begin
              frmAdd_Edit3 := TfrmAdd_Edit3.Create(Application);
              frmAdd_Edit3.Caption := 'Инструктажи';
              Data_Set3 := TMP_Data_Set;
              if flagg_edit then frmAdd_Edit3.Caption := frmAdd_Edit3.Caption + ' (редактирование)'
              else frmAdd_Edit3.Caption := frmAdd_Edit3.Caption + ' (добавление)';
              flag_edit3 := flagg_edit;
              frmAdd_Edit3.ShowModal;
            end;
end;

procedure TfrmTable.btnDelClick(Sender: TObject);
var AGrid: TRxDBGrid;
    i: byte;
begin
  AGrid := nil;
  //запоминаем активный grid
  for i:=0 to ComponentCount - 1 do
    if (Components[i] is TRxDBGrid) then
      if (Components[i] as TRxDBGrid).Parent.Name = PageControl.ActivePage.Name then
        AGrid := (Components[i] as TRxDBGrid);
  if AGrid = nil then exit;
  if AGrid.DataSource.DataSet.RecordCount = 0 then exit;
  if MessageDlg('Точно удалить?', mtConfirmation, mbOKCancel, 0) = mrOK then
  begin
    DeleteFromTable(AGrid.DataSource.DataSet.Name,'id',AGrid.DataSource.DataSet.fieldbyname('id').asstring,false);
    AGrid.DataSource.DataSet.Close;
    try  AGrid.DataSource.DataSet.Open; except end;
  end;
end;

procedure TfrmTable.FormShow(Sender: TObject);
begin
  if id_uchastka <> 7 then exit;
  GridElBez.Columns[0].Visible := true;
  GridOTiPB.Columns[0].Visible := true;
  GridGPM.Columns[0].Visible := true;
  GridMetalStanki.Columns[0].Visible := true;
  GridZazeml.Columns[1].Visible := true;
  GridSIZ.Columns[1].Visible := true;
  GridTakelag.Columns[1].Visible := true;
  GridElInstr.Columns[1].Visible := true;
  GridMetrologiya.Columns[1].Visible := true;
  GridOgnetush.Columns[1].Visible := true;
  GridOthers.Columns[1].Visible := true;
  GridTrenirovki.Columns[0].Visible := true;
  GridInstruktagi.Columns[0].Visible := true;
  GridFlurografia.Columns[0].Visible := true;
end;

procedure TfrmTable.GridElBezDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var
   IndexOfDate_next, IndexOfDateOsmotrNext: byte;
   AGrid: TRxDBGrid;
begin
   AGrid := Sender as TRxDBGrid;
   IndexOfDate_next := 0;
   IndexOfDateOsmotrNext := 0;

   while AGrid.Columns[IndexOfDate_next].FieldName <> 'date_next' do Inc(IndexOfDate_next);
   if AGrid.DataSource.DataSet.Name = 'siz' then
     while AGrid.Columns[IndexOfDateOsmotrNext].FieldName <> 'DateOsmotrnext' do Inc(IndexOfDateOsmotrNext);

   if AGrid.DataSource.DataSet.Name = 'siz' then
   begin
     if (Days_Between(date,AGrid.Columns[IndexOfDateOsmotrNext].Field.AsDateTime) <= days_alert) or
        (Days_Between(date,AGrid.Columns[IndexOfDate_next].Field.AsDateTime)      <= days_alert)then
     begin
         AGrid.Canvas.Brush.Color := clRed;
         AGrid.Canvas.Font.Color :=  clWhite;
     end
     else
     begin
       if gdSelected in State then
       begin
         AGrid.Canvas.Brush.Color := clGrayText;
         AGrid.Canvas.Font.Color :=  clWhite;
       end
       else
       begin
         AGrid.Canvas.Brush.Color := clWhite;
         AGrid.Canvas.Font.Color :=  clBlack;
       end;
     end;
   end
   else
       if (Days_Between(date,AGrid.Columns[IndexOfDate_next].Field.AsDateTime) <= days_alert) then
       begin
           AGrid.Canvas.Brush.Color := clRed;
           AGrid.Canvas.Font.Color :=  clWhite;
       end
       else
       begin
         if gdSelected in State then
         begin
           AGrid.Canvas.Brush.Color := clGrayText;
           AGrid.Canvas.Font.Color :=  clWhite;
         end
         else
         begin
           AGrid.Canvas.Brush.Color := clWhite;
           AGrid.Canvas.Font.Color :=  clBlack;
         end;
       end;


  AGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmTable.FormCreate(Sender: TObject);
begin
  with DM do
  try
    elektroinstrument.Open;
    siz.Open;
    zazeml.Open;
    takelag.Open;
    znaniya_el_bez.Open;
    znaniya_gpm.Open;
    znaniya_met_stanki.Open;
    znaniya_otipb.Open;
    ognetush.Open;
    others.Open;
    trenirovki.Open;
    instruktagi.Open;
    metrologiya.Open;
    flurografia.Open;
  except
  end;
end;

procedure TfrmTable.GridOTiPBTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  if Field.FieldName = 'name_uch' then
    ((Sender as TRxDBGrid).DataSource.DataSet as TSQLclientdataset).indexFieldNames := 'id_uch'
  else
    ((Sender as TRxDBGrid).DataSource.DataSet as TSQLclientdataset).indexFieldNames := Field.FieldName;
end;

procedure TfrmTable.FormDestroy(Sender: TObject);
begin
  frmTable := nil;
end;

procedure TfrmTable.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then close;
  if Key=VK_DELETE then btnDelClick(sender);
  if key=vk_f2 then btnAddClick(btnEdit);
  if key=vk_insert then btnAddClick(btnAdd);
  if (key=ord('P'))and (ssCtrl in Shift) then btnExcelClick(Sender);
end;

procedure TfrmTable.btnExcelClick(Sender: TObject);
var AGrid: TRxDBGrid;
    i: byte;
begin
  AGrid := nil;
  //запоминаем активный grid
  for i:=0 to ComponentCount - 1 do
    if (Components[i] is TRxDBGrid) then
      if (Components[i] as TRxDBGrid).Parent.Name = PageControl.ActivePage.Name then
        AGrid := (Components[i] as TRxDBGrid);
  if AGrid = nil then exit;
  ExportToExcel(AGrid);
end;

procedure TfrmTable.GridMetrologiyaDblClick(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTable.N1Click(Sender: TObject);
begin
  btnAddClick(btnEdit);
end;

procedure TfrmTable.N2Click(Sender: TObject);
begin
  btnAddClick(btnAdd);
end;

procedure TfrmTable.N3Click(Sender: TObject);
begin
  btnDelClick(btnDel);
end;

end.
