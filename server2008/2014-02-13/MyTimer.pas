unit MyTimer;

interface

uses
  Classes, forms, DateUtils;

type
  TMyTimerThread = class(TThread)
  private
    { Private declarations }
  protected
    Procedure DoWork;
    procedure Execute; override;
  end;

implementation

uses SysUtils, UnitDM, UnitMain, UnitMenu, UnitAlert, windows, DB, SqlExpr, MyDB;

{ TMyTimerThread }
function IdUchToNameUch(F_IDUCH: Integer): string;
begin
  case F_IDUCH of
  1: Result := 'Участок АТС и ЦК ';
  2: Result := 'УРС ';
  3: Result := 'ГФУ СФ ';
  4: Result := 'ГФУ ЛСС ';
  5: Result := 'ГФУ СК ';
  6: Result := 'Участок СТ ';
  7: Result := 'Все участки ';
  8: Result := 'Начальник отдела связи';
  11: Result := 'Участок АСУГТК';
  12: Result := 'Участок механизации';
  end
end;

procedure TMyTimerThread.DoWork;
var
  ok: boolean;
  date_sserver: TDateTime;
label proverka_ok;
begin
 date_sserver := date_server;
 ok := true;
 if frmAlert <> nil then exit;
 (*ICMP_done := false;
 DM.IcmpClient.Ping;
 while not ICMP_done do
 begin
   Application.ProcessMessages;
 end;
 if not on_line then exit;*)
 frmAlert := TfrmAlert.Create(Application);
 frmAlert.Hide;
 with DM do
 begin
    DBConnection.Open;

    if ((id_alert_uchastok=8)or(id_alert_uchastok=7))and meropr_timer then
    begin
        Query.Close;
        Query.SQL.Text := 'Select * from meropr where vipolneno=0';
        Query.Open;
        Query.First;
        while not Query.Eof do
        begin
          if (Days_Between(date_sserver,Query.FieldByName('srok_ispoln').AsDateTime) <= Days_alert) then
          begin
            frmAlert.ListBox1.Items.Add('Мероприятие: '+
              Query.fieldByName('name_meropr').AsString + ' (срок исполнения ' +
              FormatDateTime('dd.mm.yyyy',Query.FieldByName('srok_ispoln').AsDateTime)+
              ', участок ' +IdUchToNameUch(Query.FieldByName('id_uchastok').AsInteger) + ')');
            ok := false;
          end;
          Query.Next;
        end;
      meropr_timer := false;
    end
    else
    if not((id_alert_uchastok=8)or(id_alert_uchastok=7)) then
    begin
        Query.Close;
        Query.SQL.Text := 'Select * from meropr where vipolneno=0 and id_uchastok='+IntToStr(id_alert_uchastok);
        Query.Open;
        Query.First;
        while not Query.Eof do
        begin
          if (Days_Between(date_sserver,Query.FieldByName('srok_ispoln').AsDateTime) <= Days_alert) then
          begin
            frmAlert.ListBox1.Items.Add('Мероприятие: '+
              Query.fieldByName('name_meropr').AsString + ' (срок исполнения ' +
              FormatDateTime('dd.mm.yyyy',Query.FieldByName('srok_ispoln').AsDateTime)+
                ', участок ' +IdUchToNameUch(Query.FieldByName('id_uchastok').AsInteger) + ')');
            ok := false;
          end;
          Query.Next;
        end;
      meropr_timer := false;
    end;

    if id_alert_uchastok=8 then goto proverka_ok;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from ognetush'
    else
      Query.SQL.Text := 'Select * from ognetush where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Средство пожаротушения: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from others'
    else
      Query.SQL.Text := 'Select * from others where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Разное: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from siz'
    else
      Query.SQL.Text := 'Select * from siz where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Средство защиты: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      if (Days_Between(date_sserver,Query.FieldByName('DateOsmotrnext').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Средство защиты: '+
          Query.fieldByName('name').AsString + ' (дата следующего осмотра ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('DateOsmotrnext').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from elektroinstrument'
    else
      Query.SQL.Text := 'Select * from elektroinstrument where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Электроинструмент: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from metrologiya'
    else
        Query.SQL.Text := 'Select * from metrologiya where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Метрология: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки(измерений) ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from takelag'
    else
        Query.SQL.Text := 'Select * from takelag where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Такелажное средство: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from zazeml'
    else
        Query.SQL.Text := 'Select * from zazeml where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Заземляющее устройство: '+
          Query.fieldByName('name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      if (Days_Between(date_sserver,Query.FieldByName('DateOsmotrnext').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Заземляющее устройство: '+
          Query.fieldByName('name').AsString + ' (дата следующего осмотра ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('DateOsmotrnext').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from znaniya_el_bez'
    else
        Query.SQL.Text := 'Select * from znaniya_el_bez where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Знания электробезопасности: '+
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from trenirovki'
    else
        Query.SQL.Text := 'Select * from trenirovki where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Тренировка: '+
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующей тренировки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from instruktagi'
    else
        Query.SQL.Text := 'Select * from instruktagi where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Инструктаж: ' +
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующего инструктажа ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from znaniya_gpm'
    else
        Query.SQL.Text := 'Select * from znaniya_gpm where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Знания по грузоподъёмным механизмам: '+
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from znaniya_met_stanki'
    else
        Query.SQL.Text := 'Select * from znaniya_met_stanki where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Знания по металлообраб. станкам: '+
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    if id_alert_uchastok=7 then
      Query.SQL.Text := 'Select * from znaniya_otipb'
    else
        Query.SQL.Text := 'Select * from znaniya_otipb where id_uch='+IntToStr(id_alert_uchastok);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if (Days_Between(date_sserver,Query.FieldByName('date_next').AsDateTime) <= Days_alert) then
      begin
        frmAlert.ListBox1.Items.Add(IdUchToNameUch(Query.FieldByName('id_uch').AsInteger) + 'Знания по ОТ и ПБ: '+
          Query.fieldByName('fam').AsString + ' ' + Query.fieldByName('name').AsString + ' ' +
          Query.fieldByName('sec_name').AsString + ' (дата следующей проверки ' +
          FormatDateTime('dd.mm.yyyy',Query.FieldByName('date_next').AsDateTime)+')');
        ok := false;
      end;
      Query.Next;
    end;

    Query.Close;
    DBConnection.Close;

proverka_ok:
    if not ok then
    begin
      ShowWindow(Application.Handle,SW_SHOW);
      ShowWindow(frmMain.Handle,SW_SHOW);
      if frmMenu=nil then
      begin
        frmMenu := TfrmMenu.Create(Application);
      end;
      Application.Restore;
      Application.BringToFront;
      frmAlert.Show;
      frmAlert.Timer1.Enabled := true;
      pishit := true;
    end
    else frmAlert.Free;
 end;
end;

procedure TMyTimerThread.Execute;
begin
  { Place thread code here }
  FreeOnTerminate := True;
  pishit := false;
  //sleep (1000);
  meropr_timer := true;
  repeat
   Synchronize(DoWork);
   if Stop_beep_thread.Suspended then Stop_beep_thread.Resume;
   sleep(periodichnost*1000*60); //2 часа по умолчанию
  until Terminated;
end;

end.
