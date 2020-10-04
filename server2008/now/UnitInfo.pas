unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DBTables,
  Dialogs, Grids,ShellAPI, DBGrids, RXDBCtrl, Buttons, StdCtrls, ToolWin, ComCtrls,UnitDM,
  Placemnt, MyDB, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Menus, DateUtil,
  FMTBcd, UnitAddRazdel;

type
  TfrmInfo = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    btADD: TButton;
    btEdit: TButton;
    GridInfo: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N1: TMenuItem;
    BtnView: TButton;
    btnAddRazdel: TButton;
    btnUp: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDelClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GridInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridInfoTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BtnViewClick(Sender: TObject);
    procedure GridInfoDblClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnAddRazdelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;
  EditFlagInfo: boolean;
  MyStack: TMyStack;
  Str_caption: string;

implementation

uses UnitProgress, UnitAddInfo;

{$R *.dfm}

procedure TfrmInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GridInfo.DataSource.DataSet.Close;
  MyStack.Free;
  Action := caFree;
end;

Procedure recursDel(F_id_info: integer);
var
  tmp_arr: array of integer;
  i: integer;
begin
  DM.Query.Close;
  DM.Query.SQL.Text := 'select id_info from info where id_razdel='+IntToStr(F_id_info)+
    ' and flag_razdel=0';
  DM.Query.Open;
  DM.Query.First;
  SetLength(tmp_arr,0);
  while not DM.Query.Eof do
  begin
    SetLength(tmp_arr,length(tmp_arr)+1);
    tmp_arr[high(tmp_arr)]:=dm.Query.Fields[0].AsInteger;
    DM.Query.Next;
  end;
  DM.Query.Close;

  if length(tmp_arr)=0 then
  begin
    DeleteFromTable('files','id_razdel',inttostr(F_id_info),false);
    DeleteFromTable('info','id_razdel',inttostr(F_id_info),false);
    DeleteFromTable('info','id_info',inttostr(F_id_info),false);
  end
  else
  begin
    for i := 0 to High(tmp_arr) do recursDel(tmp_arr[i]);
    DeleteFromTable('files','id_razdel',inttostr(F_id_info),false);
    DeleteFromTable('info','id_razdel',inttostr(F_id_info),false);
    DeleteFromTable('info','id_info',inttostr(F_id_info),false);
  end;
end;

procedure TfrmInfo.BtnDelClick(Sender: TObject);
begin
 if GridInfo.DataSource.DataSet.RecordCount = 0 then exit;
 if MessageDlg('Точно удалить?',mtConfirmation,mbOKCancel,0)=mrCancel then exit;
 if DM.tblinfoflag_razdel.AsInteger = 0 then
 begin
   recursDel(DM.tblInfoid_info.AsInteger);
 end
 else
 begin
  DeleteFromTable('files','id_info',DM.tblInfoid_info.asstring,false);
  DeleteFromTable('info','id_info',DM.tblInfoid_info.asstring,false);
 end;
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
end;

procedure TfrmInfo.btADDClick(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  frmAddInfo := TfrmAddInfo.Create(Application);
  EditFlagInfo := false;
  frmAddInfo.ShowModal;
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
  GridInfo.DataSource.DataSet.FindLast;
end;

procedure TfrmInfo.btEditClick(Sender: TObject);
var
 i: LongWord;
 var Layout: array[0.. KL_NAMELENGTH] of char;
begin

  if DM.TblInfo.RecordCount = 0 then exit;

  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  i := DM.tblInfo.RecNo;
  EditFlagInfo := true;
  if DM.tblinfoflag_razdel.AsInteger = 0 then
  begin
    frmAddRazdel := TfrmAddRazdel.Create(Application);
    frmAddRazdel.ShowModal;
  end
  else
  begin
    frmAddInfo := TfrmAddInfo.Create(Application);
    frmAddInfo.ShowModal;
  end;
  EditFlagInfo := False;
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
  GridInfo.DataSource.DataSet.MoveBy(i-1);
end;


procedure TfrmInfo.FormCreate(Sender: TObject);
begin
 MyStack := TMyStack.create;
 Str_caption := Caption;
 with GridInfo.DataSource.DataSet do
 begin
   Filter := 'id_razdel=0';
   GridInfo.Tag := 0;
   Filtered := true;
   GridInfo.DataSource.DataSet.Open;
 end;
 if (id_alert_uchastok<>7) then
 begin
   BtnDel.Enabled := false;
   btnAddRazdel.Enabled := False;
   btADD.Enabled := false;
   btEdit.Enabled := false;
 end;

end;

procedure TfrmInfo.N5Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmInfo.GridInfoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  AGrid: TRxDBGrid;
begin
  AGrid := Sender as TRxDBGrid;

{  StatusBar1.SimpleText := 'Количество документов: ' +
    IntToStr(GridInfo.DataSource.DataSet.RecordCount);
 }
  if gdSelected in State then
  begin
    if DM.tblinfoflag_razdel.AsInteger = 0 then
    begin
      AGrid.Canvas.Brush.Color := clLime;
      AGrid.Canvas.Font.Color :=  clBlue;
    end
    else
    begin
      AGrid.Canvas.Brush.Color := clGrayText;
      AGrid.Canvas.Font.Color :=  clWhite;
    end
  end
  else
  begin
    if DM.tblinfoflag_razdel.AsInteger = 0 then
    begin
      AGrid.Canvas.Brush.Color := clYellow;
      AGrid.Canvas.Font.Color :=  clBlack;
    end
    else
    begin
      AGrid.Canvas.Brush.Color := clWhite;
      AGrid.Canvas.Font.Color :=  clBlack;
    end;
  end;
  GridInfo.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;



procedure TfrmInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then GridInfoDblClick(Sender);
end;

procedure TfrmInfo.GridInfoTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
    try (GridInfo.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;
    except
    end;
end;

procedure TfrmInfo.BtnViewClick(Sender: TObject);
var j, count_part: LongWord;
//  data1: TMemoryStream;
  data: TStream;
  //s,
  extension: Ansistring;
  tmpfilename: string;
//  Text_file: file;
begin
  if DM.tblInfo.RecordCount = 0 then exit;

  //если просмотр раздела:
  if DM.tblinfoflag_razdel.AsInteger = 0 then
  begin
    MyStack.push_stack(GridInfo.Tag,Str_caption);
    GridInfo.Tag := dm.tblinfoid_info.AsInteger;
    Str_caption := dm.tblinfoname_info.AsString;
    Caption := 'Нормативные документы - '+Str_caption;
    DM.tblinfo.Filter := 'id_razdel='+DM.tblinfoid_info.AsString;
    exit;
  end;


  if ifNullFile(DM.tblInfoid_info.AsString,'id_info','files') then
  begin
    ShowMessage('Нету файла для этой записи.');
    exit;
  end;

  frmProgress:=TfrmProgress.Create(Application);
  frmProgress.Show;
  Application.ProcessMessages;

   Application.ProcessMessages;


//  GetFileFromTableFiles('files','id_info='+DM.tblInfoid_info.AsString+ ' and num_part=1',extension,data,count_part);
      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT * FROM files WHERE ' + 'id_info='+DM.tblInfoid_info.AsString+ ' and num_part=1';
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
     //GetFileFromTableFiles('files','id_info='+DM.tblInfoid_info.AsString+ ' and num_part='+ IntToStr(j+1),extension,data,count_part);
      with DM.Query do
      begin
        Close;
        SQL.Text := 'SELECT data FROM files WHERE ' + 'id_info='+DM.tblInfoid_info.AsString+ ' and num_part='+IntToStr(j+1);
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

procedure TfrmInfo.GridInfoDblClick(Sender: TObject);
begin
  BtnViewClick(sender);
end;

procedure TfrmInfo.btnUpClick(Sender: TObject);
var
 tmp_i: integer;
 tmp_s: string;
begin
  MyStack.pop_stack(tmp_i,tmp_s);
  GridInfo.Tag := tmp_i;
  Str_caption := tmp_s;
  if GridInfo.Tag = -1 then
  begin
    GridInfo.Tag := 0;
    Caption := 'Нормативные документы';
  end
  else
  begin
    DM.tblinfo.Filter := 'id_razdel='+IntToStr(GridInfo.Tag);
    if tmp_i = 0 then caption := 'Нормативные документы'
    else  Caption := 'Нормативные документы - ' + tmp_s;
  end;
end;

procedure TfrmInfo.btnAddRazdelClick(Sender: TObject);
var Layout: array[0.. KL_NAMELENGTH] of char;
begin
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);

  frmAddRazdel := TfrmAddRazdel.Create(Application);
  EditFlagInfo := false;
  frmAddRazdel.ShowModal;
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
  GridInfo.DataSource.DataSet.FindLast;
end;

end.
