{+ADO->dbExpress}
unit USyncTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBLocalS, UnitDM, Spin, MyDB,
  RXCtrls, Mask, ToolEdit, ComObj;

type
  TfrmSyncTMC = class(TForm)
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    FilenameEdit1: TFilenameEdit;
    RxLabel1: TRxLabel;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSyncTMC: TfrmSyncTMC;

implementation

uses UnitTableTMC;

{$R *.dfm}

procedure TfrmSyncTMC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSyncTMC.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSyncTMC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCape then btnCancelClick(Sender);
  if key=VK_RETURN then btnOkClick(Sender);
end;

procedure TfrmSyncTMC.FormCreate(Sender: TObject);
begin
//  FilenameEdit1.FileName := ExtractFilePath(Application.ExeName) + 'ОС УКиСС 19-10-2010.xls';
  ProgressBar1.Position := 0;
end;

procedure TfrmSyncTMC.btnOkClick(Sender: TObject);
var
  ExcelApp, WorkBook, c: Variant;
  countRows,counter, i, prov: Integer;
  sline, str, str1, inv_num, name_saldovka, m_o_l,
  date_vvoda, stoim_buh, kol_vo, serial_num, harakteristika: string;
label exit13;
begin
   counter := 0;
  //установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Errrrrorrrrrr!!!. Excel не установлен.');
    exit;
  end;
  // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.DisplayAlerts := false;
  WorkBook := ExcelApp.Workbooks.Open(FilenameEdit1.FileName);
  Screen.Cursor := crHourglass;
//подсчет строк в файле с данными для фиксированного цикла
  sline := WorkBook.Worksheets[1].Cells.SpecialCells(11).Row;
//  sline := copy(sline,4,length(sline)-3);
  countRows := StrToInt(sline);
  Memo1.Lines.Add('Кол-во строк в екселе: '+sline);
  ProgressBar1.Max := countRows-2;
//поиск необходимых колонок в ехселе
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Инв.№');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  inv_num := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Наименование / ОКОФ');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  name_saldovka := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('МОЛ / доп.к месту уст.');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  m_o_l := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Ввод бух / нал');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  date_vvoda := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Стоимость  бух /нал');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  stoim_buh := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Количество');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  kol_vo := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Заводской №');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  serial_num := Copy(c.Address,2,1);
  c := Workbook.Worksheets[1].Range['a2','z2'].Find('Характеристика');
  If VarIsNull(c)  Then
  begin
    ShowMessage('Неверный формат данных в файле *.xls');
    goto exit13;
  end;
  harakteristika := Copy(c.Address,2,1);

 DM.tmc.DisableControls;
 //Цикл по кол-ву строк:
 for i := 3 to countRows do
 begin
   //ищем в таблице tmc запись с таким же инвентарником, и если нету - то добавляем
   //а если есть - то обновляем при необходимости дату ввода и мол
   ProgressBar1.Position := ProgressBar1.Position + 1;
   DM.tmc.First;
   str := Workbook.WorkSheets[1].Range[inv_num+IntToStr(i),EmptyParam].Value;
   if str='' then continue;
   Memo1.Lines.Add(str);
   dm.Query.Close;
   dm.Query.SQL.Text := 'select count(id) from tmc where inv_num='+QuotedStr(str);
   DM.Query.Open;
   prov := dm.Query.Fields[0].AsInteger;
   DM.Query.Close;
   if prov>0 then
   begin
{     if CheckBox1.Checked then
     begin
       str := Workbook.WorkSheets[1].Range[m_o_l+IntToStr(i),EmptyParam].Value;
       if str='СТОЛБЧЕНКО АЛЕКСАНДР ЮРЬЕВИЧ' then
        sline := 'Столбченко А.Ю.'
       else
       begin
         if str='ЧЕТВЕРТКИН ПАВЕЛ АЛЕКСАНДРОВИЧ' then
          sline := 'Четверткин П.А.'
          else
            sline := str;
       end;
       UpdateToTable('tmc','inv_num',Workbook.WorkSheets[1].Range[inv_num+IntToStr(i),EmptyParam].Value,['mol'],[sline]);
       dm.tmc.Close;
       DM.tmc.Open;
     end;
     if CheckBox2.Checked then
     begin
       try
         sline := FormatDateTime('YYYY-MM-DD',StrToDate(Workbook.WorkSheets[1].Range[date_vvoda+IntToStr(i),EmptyParam].Value));
       except
         sline := '1900-01-01';
       end;
       UpdateToTable('tmc','inv_num',Workbook.WorkSheets[1].Range[inv_num+IntToStr(i),EmptyParam].Value,['date_input'],[sline]);
       dm.tmc.Close;
       DM.tmc.Open;
     end;          }
   end
   else
   begin
     str := Workbook.WorkSheets[1].Range[m_o_l+IntToStr(i),EmptyParam].Value;
     if str='Столбченко Александр Юрьевич' then
      sline := 'Столбченко А.Ю.'
     else
     begin
       if str='Четверткин Павел Александрович' then
        sline := 'Четверткин П.А.'
        else
          sline := str;
     end;
     try
     str := FormatDateTime('YYYY-MM-DD',StrToDate(Workbook.WorkSheets[1].Range[date_vvoda+IntToStr(i),EmptyParam].Value));
     except
     str := '1900-01-01';
     end;
     try
     str1 := IntToStr(StrToInt(Workbook.WorkSheets[1].Range[kol_vo+IntToStr(i),EmptyParam].Value));
     except
     str1 := '1';
     end;
     AddToTable('tmc',['id_uch','name','firma','inv_num','serial_num','kol_vo','date_input','stoimost','mol','prim'],
       ['9',Workbook.WorkSheets[1].Range[name_saldovka+IntToStr(i),EmptyParam].Value,
         Workbook.WorkSheets[1].Range[name_saldovka+IntToStr(i),EmptyParam].Value,
         Workbook.WorkSheets[1].Range[inv_num+IntToStr(i),EmptyParam].Value,
         Workbook.WorkSheets[1].Range[serial_num+IntToStr(i),EmptyParam].Value,
         str1,
         str,
         Workbook.WorkSheets[1].Range[stoim_buh+IntToStr(i),EmptyParam].Value,
         sline,
         Workbook.WorkSheets[1].Range[harakteristika+IntToStr(i),EmptyParam].Value]);
      inc(counter);
      dm.tmc.Close;
      DM.tmc.Open;
      Application.ProcessMessages;
   end;
 end;

exit13:
  ExcelApp.Quit;
  Screen.Cursor := crDefault;
  DM.tmc.Close;
  DM.tmc.Open;
  DM.tmc.EnableControls;
  ShowMessage('Добавлено '+IntToStr(counter)+' записей.');
  Close;
end;

end.
