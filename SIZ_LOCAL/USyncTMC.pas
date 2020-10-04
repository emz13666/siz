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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
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
  FilenameEdit1.FileName := ExtractFilePath(Application.ExeName) + 'ОС УКиСС 19-10-2010.xls';
end;

procedure TfrmSyncTMC.btnOkClick(Sender: TObject);
//
var
  ExcelApp, WorkBook: Variant;
  col, row: Integer;
  sline: string;
  mem: TMemo;
  Layout: array[0.. KL_NAMELENGTH] of char;
begin
  //установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Errrrror!!!. Excel не установлен.');
    exit;
  end;
  // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.DisplayAlerts := false;
  WorkBook := ExcelApp.Workbooks.Open(FilenameEdit1.FileName);
  Screen.Cursor := crHourglass;
//  ExcelApp.visible := true;
  sline := WorkBook.Worksheets[1].Cells.SpecialCells(11).Address;
  sline := copy(sline,4,length(sline)-3);
  Memo1.Lines.Add(sline);
  ExcelApp.Quit;
  Screen.Cursor := crDefault;
        (*
  // Сперва отправляем данные в memo
  // работает быстрее, чем отправлять их напрямую в Excel
  mem := TMemo.Create(frmTable);
  mem.Parent := frmTable;
  mem.Visible := false;
  mem.Clear;
  sline := '';

  // добавляем информацию для имён колонок
  for col := 0 to Grid.Columns.Count-1 do
    sline := sline + Grid.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  // получаем данные из DBGrid
  for row := 0 to Grid.DataSource.DataSet.RecordCount-1 do
  begin
    sline := '';
    for col := 0 to Grid.Columns.Count-1 do
      if Grid.Columns[col].Field.AsString='30.12.1899' then
        sline := sline + #9
      else
        sline := sline + Grid.Columns[col].Field.AsString + #9;
    mem.Lines.Add(sline);
    Grid.DataSource.DataSet.Next;
  end;

  // копируем данные в clipboard
  mem.SelectAll;
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  mem.CopyToClipboard;
  mem.Free;


  // отправляем их в Excel

  Workbook.WorkSheets[1].Paste;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Size := 11;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Bold := true;
  Workbook.WorkSheets[1].Columns.AutoFit;
  Workbook.WorkSheets[1].Range['A1',EmptyParam].Select;


  Grid.DataSource.DataSet.GotoBookmark(bm);
  Grid.DataSource.DataSet.FreeBookmark(bm);
  Grid.DataSource.DataSet.EnableControls;

*)
end;

end.
