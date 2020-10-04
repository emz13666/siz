unit UnitAddMeropr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, RXCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  RXSpin,MyDB, ComCtrls,DBLocalS;

type
  TfrmAddMeropr = class(TForm)
    Timer1: TTimer;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtMeropr: TEdit;
    Label2: TLabel;
    Data_info: TFilenameEdit;
    Label3: TLabel;
    Srok_ispoln: TDateTimePicker;
    Label4: TLabel;
    EdtOtmIspoln: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Vipolneno: TComboBox;
    edtAkt: TFilenameEdit;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Date_end: TDateTimePicker;
    Label8: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AddFileMeroprToDatabase(F_ID_MEROPR: Longword);
    procedure AddFileAktToDatabase(F_ID_MEROPR: Longword);
    procedure AddFromBD(Var F_DB: TSQLClientDataSet; Var FComboBox: TComboBox);
  public
    { Public declarations }
  end;

var
  frmAddMeropr: TfrmAddMeropr;
  OldPodrazd: integer;

implementation

{$R *.dfm}

uses UnitMeropr, UnitDM, UnitProgress, DB;

procedure TfrmAddMeropr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  AddFromBD(dm.uchastok,combobox1);
  if EditFlagMeropr then
  begin
    Caption := 'Редактирование мероприятия';
    edtMeropr.Text := DM.meroprname_meropr.AsString;
    if dm.meropr.FieldByName('id_uchastok').AsInteger > 0 then
      ComboBox1.ItemIndex := dm.meropr.FieldByName('id_uchastok').AsInteger - 1;
    Srok_ispoln.Date := DM.meroprsrok_ispoln.AsDateTime;
    Date_end.Date := DM.meroprdate_end.AsDateTime;
    EdtOtmIspoln.Text := dm.meroprOtm_vipoln.AsString;
    Vipolneno.ItemIndex := DM.meroprvipolneno.AsInteger;

    if ifNullFileMeropr(DM.meroprid_meropr.AsString,'id_meropr', 'files') then
      Data_info.Text := 'Нет'
    else
      Data_info.Text := 'Есть';

    if ifNullFileAkt(DM.meroprid_meropr.AsString,'id_meropr', 'files') then
      edtAkt.Text := 'Нет'
    else
      edtAkt.Text := 'Есть';
  end
  else
  begin
   Srok_ispoln.Date := Date;
   Date_end.Date := date;
   ComboBox1.ItemIndex := 6;
   Vipolneno.ItemIndex :=0;
  end;
end;

procedure TfrmAddMeropr.btnOKClick(Sender: TObject);
var
  extension, s, tmp_indx: string;
  tmp_id_info: LongWord;
begin
  if edtMeropr.Text = '' then
  begin
    ShowMessage('Поле "Мероприятие" должно быть заполнено!');
    exit;
  end;
  if EditFlagMeropr then
  begin
     if (Data_info.Text <> 'Есть')and(Data_info.Text <> 'Нет') then
     begin
       if Data_info.Text <> '' then
       begin
         AddFileMeroprToDatabase(dm.meroprid_meropr.AsInteger);
       end
       else
       begin
         s:='';
         extension := '';
         DeleteFromTable('files','id_meropr',dm.meroprid_meropr.AsString,false);
         AddFilesToTable('files',['extension','data','id_meropr','count_part'],
                       [extension,s,dm.meroprid_meropr.AsString,'0']);
       end;
     end;

     if (edtAkt.Text <> 'Есть')and(edtAkt.Text <> 'Нет') then
     begin
       if edtAkt.Text <> '' then
       begin
         AddFileAktToDatabase(dm.meroprid_meropr.AsInteger);
       end
       else
       begin
         s:='';
         extension := '';
         DeleteFromTableWhere('files','id_meropr='+dm.meroprid_meropr.AsString+' and id_razdel=1');
         AddFilesToTable('files',['extension','data','id_meropr','count_part','id_razdel'],
                       [extension,s,dm.meroprid_meropr.AsString,'0','1']);
       end;
     end;

     UpdateToTable('meropr','id_meropr',DM.meroprid_meropr.AsString,['name_meropr','id_uchastok',
          'srok_ispoln','Otm_vipoln','vipolneno','date_end'],[edtMeropr.text,IntToStr(ComboBox1.ItemIndex+1),
          FormatDateTime('yyyy-mm-dd',Srok_ispoln.Date),EdtOtmIspoln.Text,
          IntToStr(Vipolneno.ItemIndex),FormatDateTime('yyyy-mm-dd',Date_end.Date)]);
  end
  else
  begin
    AddToTable('meropr',['name_meropr','id_uchastok','srok_ispoln','Otm_vipoln','vipolneno','date_end'],
      [edtMeropr.text,IntToStr(ComboBox1.ItemIndex+1),FormatDateTime('yyyy-mm-dd',Srok_ispoln.Date),
      EdtOtmIspoln.Text,IntToStr(Vipolneno.ItemIndex),FormatDateTime('yyyy-mm-dd',Date_end.Date)]);

     DM.meropr.Close;
     dm.meropr.Open;

     {Определяем id_meropr}
     tmp_indx:=DM.meropr.IndexFieldNames;
     DM.meropr.IndexFieldNames := 'id_meropr';
     Application.ProcessMessages;
     DM.meropr.FindLast;
     tmp_id_info :=DM.meroprid_meropr.AsInteger;
     DM.meropr.IndexFieldNames := tmp_indx;
     DM.meropr.FindLast;

     //добавляем файл мероприятия
       if (Data_info.Text <> '') and (Data_info.Text <> 'Есть') then
       begin
         AddFileMeroprToDatabase(tmp_id_info);
       end
       else
       begin
         if Data_info.Text='' then
         begin
           s:='';
           extension := '';
           AddFilesToTable('files',['id_meropr','data','extension','count_part'],
             [IntToStr(tmp_id_info),s,extension,'0'])
         end;
       end;
     //добавляем файл акта
       if (edtAkt.Text <> '') and (edtAkt.Text <> 'Есть') then
       begin
         AddFileAktToDatabase(tmp_id_info);
       end
       else
       begin
         if edtAkt.Text='' then
         begin
           s:='';
           extension := '';
           AddFilesToTable('files',['id_meropr','data','extension','count_part','id_razdel'],
             [IntToStr(tmp_id_info),s,extension,'0','1']);
         end;
       end;
  end;
  Close;
end;

procedure TfrmAddMeropr.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddMeropr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then btnOKClick(sender);
end;

procedure TfrmAddMeropr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddMeropr.AddFileMeroprToDatabase(F_ID_MEROPR: LongWord);
type
  My_buf = array[1..500*1024] of byte;
var
  extension, s: string;
  i,j, size_file, count_part,  size_ostatok: LongWord;
  data: TStream;
  buf2: ^My_buf;
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
  DeleteFromTable('files','id_meropr',IntToStr(f_id_meropr),false);
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
    AddFilesToTable('files',['extension','data','id_meropr',
       'num_part','count_part'],
       [extension,s,IntToStr(f_id_meropr),IntToStr(j),IntToStr(count_part)]);
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
    AddFilesToTable('files',['extension','data','id_meropr',
       'num_part','count_part'],
       [extension,s,IntToStr(f_id_meropr),IntToStr(count_part),
       IntToStr(count_part)]);

      frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
      Application.ProcessMessages;
  data.Free;
  frmProgress.Free;
  Application.ProcessMessages;
end;

procedure TfrmAddMeropr.AddFileAktToDatabase(F_ID_MEROPR: Longword);
type
  My_buf = array[1..500*1024] of byte;
var
  extension, s: string;
  i,j, size_file, count_part,  size_ostatok: LongWord;
  data: TStream;
  buf2: ^My_buf;
begin
  extension := ExtractFileExt(edtAkt.FileName);
  data := TFileStream.Create(edtAkt.FileName,fmOpenRead);
  size_file := data.Size;
  count_part := trunc(size_file/(500*1024))+1;
  data.Seek(0,soFromBeginning);

  frmProgress:=TfrmProgress.Create(Application);
  frmProgress.Show;
  frmProgress.Indicator.Progress := 0;
  frmProgress.Indicator.MaxValue := count_part+1;
  DeleteFromTableWhere('files','id_meropr='+IntToStr(f_id_meropr)+' and id_razdel=1');
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
    AddFilesToTable('files',['extension','data','id_meropr',
       'num_part','count_part','id_razdel'],
       [extension,s,IntToStr(f_id_meropr),IntToStr(j),IntToStr(count_part),'1']);
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
    AddFilesToTable('files',['extension','data','id_meropr',
       'num_part','count_part','id_razdel'],
       [extension,s,IntToStr(f_id_meropr),IntToStr(count_part),
       IntToStr(count_part),'1']);

      frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
      Application.ProcessMessages;
  data.Free;
  frmProgress.Free;
  Application.ProcessMessages;
end;

procedure TfrmAddMeropr.AddFromBD(var F_DB: TSQLClientDataSet;
  var FComboBox: TComboBox);
begin
  F_DB.Open;
  F_DB.First;
  FComboBox.Items.Clear;
  while not F_DB.Eof do
  begin
    FComboBox.Items.Add(F_DB.Fields[1].AsString);
    F_DB.Next;
  end;
  F_DB.Close;
end;

end.
