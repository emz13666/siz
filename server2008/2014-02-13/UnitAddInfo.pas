unit UnitAddInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, RXCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  RXSpin,MyDB;

type
  TfrmAddInfo = class(TForm)
    Timer1: TTimer;
    Name_info: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtShifr: TEdit;
    Label2: TLabel;
    Data_info: TFilenameEdit;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddInfo: TfrmAddInfo;
  OldPodrazd: integer;

implementation

{$R *.dfm}

uses UnitInfo, UnitDM, UnitProgress;

procedure TfrmAddInfo.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagInfo then
  begin
    Caption := 'Редактирование документа';
    Name_info.Text := DM.tblInfoname_info.AsString;
    edtShifr.Text := dm.tblinfoshifr_info.AsString;

    if ifNullFile(DM.tblInfoid_info.AsString,'id_info', 'files') then
      Data_info.Text := 'Нет'
    else
      Data_info.Text := 'Есть';
  end
end;

procedure TfrmAddInfo.btnOKClick(Sender: TObject);
type
  My_buf = array[1..500*1024] of byte;
var
  extension, s, tmp_indx: string;
  i,j, size_file, count_part, tmp_id_info, size_ostatok: LongWord;
  data: TStream;
  buf2: ^My_buf;
begin
  if Name_info.Text = '' then
  begin
    ShowMessage('Поле "Наименование документа" должно быть заполнено!');
    exit;
  end;
  if EditFlagInfo then
  begin
     if (Data_info.Text <> 'Есть')and(Data_info.Text <> 'Нет') then
     begin
       if Data_info.Text <> '' then
       begin
                  extension := ExtractFileExt(Data_info.FileName);
                  data := TFileStream.Create(Data_info.FileName,fmOpenRead);
                  size_file := data.Size;
                  count_part := trunc(size_file/(500*1024))+1;
                  data.Seek(0,soFromBeginning);

                  frmProgress:=TfrmProgress.Create(Application);
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := count_part+1;
                  DeleteFromTable('files','id_info',dm.tblInfoid_info.AsString,false);
                  for j := 1 to count_part-1 do
                  begin
                    s := '0x';
                    GetMem(buf2,500*1024);
                    data.ReadBuffer(buf2^,500*1024);
                    for i := 1 to 500*1024 do
                    begin
                      s := s + inttohex(buf2^[i],2);
                    end;
                    FreeMem(buf2);
                    AddFilesToTable('files',['extension','data','id_info',
                       'num_part','count_part','id_razdel'],
                       [extension,s,dm.tblInfoid_info.AsString,IntToStr(j),IntToStr(count_part),
                       IntToStr(frmInfo.GridInfo.Tag)]);
                      frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                      Application.ProcessMessages;
                  end;
                  s := '0x';
                  size_ostatok :=size_file-(500*1024*(count_part-1));
                  GetMem(buf2,size_ostatok);
                  data.ReadBuffer(buf2^,size_ostatok);
                  for i := 1 to size_ostatok do
                  begin
                      s := s + inttohex(buf2^[i],2);
                  end;
                  FreeMem(buf2);
                  if Length(s) > 2 then
                    AddFilesToTable('files',['extension','data','id_info',
                       'num_part','count_part','id_razdel'],
                       [extension,s,dm.tblInfoid_info.AsString,IntToStr(count_part),IntToStr(count_part),
                       IntToStr(frmInfo.GridInfo.Tag)]);

                      frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                      Application.ProcessMessages;
                    data.Free;
                    frmProgress.Free;
                    Application.ProcessMessages;


       end
       else
       begin
         s:='';
         extension := '';
         DeleteFromTable('files','id_info',dm.tblInfoid_info.AsString,false);
         AddFilesToTable('files',['extension','data','id_info',
                       'count_part','id_razdel'],
                       [extension,s,dm.tblInfoid_info.AsString,'0',
                       IntToStr(frmInfo.GridInfo.Tag)]);
       end;
     end;

     UpdateToTable('Info','id_info',DM.tblInfoid_info.AsString,['name_info','shifr_info'],
      [Name_info.text,edtShifr.text]);
  end
  else
  begin
    AddToTable('info',['name_info','shifr_info','id_razdel'],
      [Name_info.text,edtShifr.text,IntToStr(frmInfo.GridInfo.tag)]);

     DM.tblInfo.Close;
     dm.tblInfo.Open;
     //добавляем файл
     tmp_indx:=DM.tblInfo.IndexFieldNames;
     DM.tblInfo.IndexFieldNames := 'id_info';
     Application.ProcessMessages;
     DM.tblInfo.FindLast;
     tmp_id_info :=DM.tblinfoid_info.AsInteger;
     DM.tblInfo.IndexFieldNames := tmp_indx;
     DM.tblInfo.FindLast;

       if (Data_info.Text <> '') and (Data_info.Text <> 'Есть') then
       begin
                  extension := ExtractFileExt(Data_info.FileName);
                  data := TFileStream.Create(Data_info.FileName,fmOpenRead);
//                  (data as TMemoryStream).LoadFromFile(Data_info.FileName);
                  size_file := data.Size;
                  count_part := trunc(size_file/(500*1024))+1;
                  data.Seek(0,soFromBeginning);

                  frmProgress:=TfrmProgress.Create(Application);
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := count_part+1;
                  DeleteFromTable('files','id_info',dm.tblInfoid_info.AsString,false);
                  for j := 1 to count_part-1 do
                  begin
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                    s := '0x';
                    GetMem(buf2,500*1024);
                    data.ReadBuffer(buf2^,500*1024);
                    for i := 1 to 500*1024 do
                    begin
                      s := s + inttohex(buf2^[i],2);
                    end;
                    FreeMem(buf2);
                    AddFilesToTable('files',['extension','data','id_info',
                       'num_part','count_part','id_razdel'],
                       [extension,s,IntToStr(tmp_id_info),IntToStr(j),IntToStr(count_part),
                       IntToStr(frmInfo.GridInfo.Tag)]);
                  end;
                  s := '0x';
                  size_ostatok :=size_file-(500*1024*(count_part-1));
                  GetMem(buf2,size_ostatok);
                  data.ReadBuffer(buf2^,size_ostatok);
                  for i := 1 to size_ostatok do
                  begin
                      s := s + inttohex(buf2^[i],2);
                  end;
                  FreeMem(buf2);
                  frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                  Application.ProcessMessages;
                  if Length(s) > 2 then
                    AddFilesToTable('files',['extension','data','id_info',
                       'num_part','count_part','id_razdel'],
                       [extension,s,IntToStr(tmp_id_info),IntToStr(count_part),IntToStr(count_part),
                       IntToStr(frmInfo.GridInfo.Tag)]);

                    data.Free;
                    frmProgress.Free;
                    Application.ProcessMessages;

       end
       else
       begin
         if Data_info.Text='' then
         begin
           s:='';
           extension := '';
           AddFilesToTable('files',['id_razdel','id_info','data','extension','count_part'],
             [IntToStr(frmInfo.GridInfo.tag),IntToStr(tmp_id_info),s,extension,'0'])
         end;
       end;
  end;
  Close;
end;

procedure TfrmAddInfo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then btnOKClick(sender);
end;

procedure TfrmAddInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
