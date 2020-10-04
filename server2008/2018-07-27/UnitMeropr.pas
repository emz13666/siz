unit UnitMeropr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DBTables,
  Dialogs, Grids,ShellAPI, DBGrids, RXDBCtrl, Buttons, StdCtrls, ToolWin, ComCtrls,UnitDM,
  Placemnt, MyDB, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Menus, DateUtil,
  FMTBcd;

type
  TfrmMeropr = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    btADD: TButton;
    btEdit: TButton;
    GridMeropr: TRxDBGrid;
    BtnView: TButton;
    btnAkt: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDelClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GridMeroprDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridMeroprTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BtnViewClick(Sender: TObject);
    procedure GridMeroprDblClick(Sender: TObject);
    procedure GridMeroprCellClick(Column: TColumn);
    procedure btnAktClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMeropr: TfrmMeropr;
  EditFlagMeropr: boolean;
var
  DblClickMeropiyatie, DblClickAkt: boolean;
implementation

uses UnitProgress, UnitAddMeropr;

{$R *.dfm}

procedure TfrmMeropr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GridMeropr.DataSource.DataSet.Close;
  Action := caFree;
end;

procedure TfrmMeropr.BtnDelClick(Sender: TObject);
begin
 if GridMeropr.DataSource.DataSet.RecordCount = 0 then exit;
 if MessageDlg('Точно удалить?',mtConfirmation,mbOKCancel,0)=mrCancel then exit;
 DeleteFromTable('files','id_meropr',DM.meroprid_meropr.asstring,false);
 DeleteFromTable('meropr','id_meropr',DM.meroprid_meropr.asstring,false);
 GridMeropr.DataSource.DataSet.Close;
 GridMeropr.DataSource.DataSet.Open;
end;

procedure TfrmMeropr.btADDClick(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  frmAddMeropr := TfrmAddMeropr.Create(Application);
  EditFlagMeropr := false;
  frmAddMeropr.ShowModal;
  GridMeropr.DataSource.DataSet.Close;
  GridMeropr.DataSource.DataSet.Open;
  GridMeropr.DataSource.DataSet.FindLast;
end;

procedure TfrmMeropr.btEditClick(Sender: TObject);
var
 i: LongWord;
 var Layout: array[0.. KL_NAMELENGTH] of char;
begin

  if DM.meropr.RecordCount = 0 then exit;

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  i := DM.meropr.RecNo;
  EditFlagMeropr := true;
  frmAddMeropr := TfrmAddMeropr.Create(Application);
  frmAddMeropr.ShowModal;
  EditFlagMeropr := False;
  GridMeropr.DataSource.DataSet.Close;
  GridMeropr.DataSource.DataSet.Open;
  GridMeropr.DataSource.DataSet.MoveBy(i-1);
end;


procedure TfrmMeropr.FormCreate(Sender: TObject);
begin
 with GridMeropr.DataSource.DataSet do
 begin
   GridMeropr.DataSource.DataSet.Open;
 end;
 if (id_alert_uchastok < 7) then
 begin
   btADD.Enabled := false;
   BtnDel.Enabled :=false;
 end;
end;

procedure TfrmMeropr.N5Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmMeropr.GridMeroprDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   IndexOfDate_next: byte;
   AGrid: TRxDBGrid;
begin
   AGrid := Sender as TRxDBGrid;
   IndexOfDate_next := 0;

   while AGrid.Columns[IndexOfDate_next].FieldName <> 'srok_ispoln' do Inc(IndexOfDate_next);
   if (Days_Between(date,AGrid.Columns[IndexOfDate_next].Field.AsDateTime) <= days_alert)and
    (AGrid.DataSource.DataSet.FieldByName('vipolneno').AsInteger=0) then
   begin
     if gdSelected in State then
     begin
       AGrid.Canvas.Brush.Color := clYellow;
       AGrid.Canvas.Font.Color :=  clBlue;
     end
     else
     begin
       AGrid.Canvas.Brush.Color := clRed;
       AGrid.Canvas.Font.Color :=  clWhite;
     end;
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

   if  AGrid.DataSource.DataSet.FieldByName('vip_vichisl').AsString='Да' then
   begin
       AGrid.Canvas.Brush.Color := clLime;
       AGrid.Canvas.Font.Color :=  clBlue;
   end;

  AGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;



procedure TfrmMeropr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then GridMeroprDblClick(Sender);
end;

procedure TfrmMeropr.GridMeroprTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
    try (GridMeropr.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;
    except
    end;
end;

procedure TfrmMeropr.BtnViewClick(Sender: TObject);
var j, count_part: LongWord;
//  data1: TMemoryStream;
  data: TStream;
  extension: Ansistring;
  tmpfilename: string;
  //Text_file: file;
begin
  if DM.meropr.RecordCount = 0 then exit;


  if ifNullFileMeropr(DM.meroprid_meropr.AsString,'id_meropr','files') then
  begin
    ShowMessage('Нету файла для этой записи.');
    exit;
  end;

  frmProgress:=TfrmProgress.Create(Application);
  frmProgress.Show;
  Application.ProcessMessages;


      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT * FROM files WHERE ' + 'id_meropr='+
          DM.meroprid_meropr.AsString+ ' and num_part=1 and id_razdel=0';
        Open;
        First;
        extension := fieldByName('extension').AsString;
        data :=  CreateBlobStream(FieldByName('data'),bmRead);
        data.Seek(0, soFromBeginning);
        Count_Part := fieldByName('count_part').AsInteger;
      end;

   frmProgress.Indicator.Progress := 0;
   frmProgress.Indicator.MaxValue := count_part;

  randomize;
  tmpfilename := tmpdir+'\tmp_siz_'+ IntToHex(random(15000000),6)+extension;
  with TFileStream.Create(tmpfilename,fmCreate) do
  try
    CopyFrom(data, data.Size);
  finally
    free;
  end;
  data.Free;
  dm.Query.Close;

   for j := 1 to count_part do
   begin
     frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
     Application.ProcessMessages;

     if j<count_part then
     begin
      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT data FROM files WHERE ' + 'id_meropr='+DM.meroprid_meropr.AsString+
          ' and num_part='+IntToStr(j+1)+' and id_razdel=0';
        Open;
        First;
        data :=  CreateBlobStream(FieldByName('data'),bmRead);
        data.Seek(0, soFromBeginning);
      end;
      with TFileStream.Create(tmpfilename,fmOpenWrite) do
      try
        Seek(0,soFromEnd);
        CopyFrom(data, data.Size);
      finally
        free;
      end;
      data.Free;
      dm.Query.Close;
     end;
   end;

  ShellExecute(Handle,nil,pchar(tmpfilename),nil,nil,SW_SHOW);
  frmProgress.free;
  Application.ProcessMessages;
end;

procedure TfrmMeropr.GridMeroprDblClick(Sender: TObject);
begin
  if DblClickMeropiyatie then BtnViewClick(sender);;
  if DblClickAkt then btnAktClick(Sender);
end;

procedure TfrmMeropr.GridMeroprCellClick(Column: TColumn);
begin
  DblClickAkt := (Column.FieldName = 'Otm_vipoln');
  DblClickMeropiyatie := (Column.FieldName = 'name_meropr')
end;

procedure TfrmMeropr.btnAktClick(Sender: TObject);
var j, count_part: LongWord;
//  data1: TMemoryStream;
  data: TStream;
  extension: Ansistring;
  tmpfilename: string;
  //Text_file: file;
begin
  if DM.meropr.RecordCount = 0 then exit;


  if ifNullFileAkt(DM.meroprid_meropr.AsString,'id_meropr','files') then
  begin
    ShowMessage('Нету файла для этой записи.');
    exit;
  end;

  frmProgress:=TfrmProgress.Create(Application);
  frmProgress.Show;

   Application.ProcessMessages;

      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT * FROM files WHERE ' + 'id_meropr='+DM.meroprid_meropr.AsString+
          ' and num_part=1 and id_razdel=1';
        Open;
        First;
        extension := fieldByName('extension').AsString;
        data :=  CreateBlobStream(FieldByName('data'),bmRead);
        data.Seek(0, soFromBeginning);
        Count_Part := fieldByName('count_part').AsInteger;
      end;

   frmProgress.Indicator.Progress := 0;
   frmProgress.Indicator.MaxValue := count_part;

  randomize;
  tmpfilename := tmpdir+'\tmp_siz_'+ IntToHex(random(15000000),6)+extension;
  with TFileStream.Create(tmpfilename,fmCreate) do
  try
    CopyFrom(data, data.Size);
  finally
    free;
  end;
  data.Free;
  dm.Query.Close;

   for j := 1 to count_part do
   begin
     frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
     Application.ProcessMessages;

     if j<count_part then
     begin
      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT data FROM files WHERE ' + 'id_meropr='+DM.meroprid_meropr.AsString+
          ' and num_part='+IntToStr(j+1) + ' and id_razdel=1';
        Open;
        First;
        data :=  CreateBlobStream(FieldByName('data'),bmRead);
        data.Seek(0, soFromBeginning);
      end;
      with TFileStream.Create(tmpfilename,fmOpenWrite) do
      try
        Seek(0,soFromEnd);
        CopyFrom(data, data.Size);
      finally
        free;
      end;
      data.Free;
      dm.Query.Close;
     end;
   end;

  ShellExecute(Handle,nil,pchar(tmpfilename),nil,nil,SW_SHOW);
  frmProgress.free;
  Application.ProcessMessages;
end;

end.
