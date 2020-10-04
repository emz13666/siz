unit UnitDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd,
  Provider, DBClient, DBLocal, DBLocalS, DateUtils,
   ScktComp, Forms;


type
  TDM = class(TDataModule)
    DS_SIZ: TDataSource;
    DS_ZAZEML: TDataSource;
    DS_elinstr: TDataSource;
    DS_Takel: TDataSource;
    DS_ElBez: TDataSource;
    DS_GPM: TDataSource;
    DS_MetStanki: TDataSource;
    DS_OTiPB: TDataSource;
    DBConnection: TSQLConnection;
    siz: TSQLClientDataSet;
    sizid: TFMTBCDField;
    sizid_uch: TFMTBCDField;
    sizinv_number: TStringField;
    sizname: TStringField;
    sizreserv: TStringField;
    sizdate_first: TDateField;
    sizdate_next: TDateField;
    sizplace_install: TStringField;
    sizprim: TStringField;
    zazeml: TSQLClientDataSet;
    uchastok: TSQLClientDataSet;
    uchastokid: TFMTBCDField;
    uchastokname: TStringField;
    sizname_uch: TStringField;
    zazemlid: TFMTBCDField;
    zazemlid_uch: TFMTBCDField;
    zazemlinv_number: TStringField;
    zazemlname: TStringField;
    zazemlreserv: TStringField;
    zazemldate_first: TDateField;
    zazemldate_next: TDateField;
    zazemlplace_install: TStringField;
    zazemlprim: TStringField;
    zazemlname_uch: TStringField;
    elektroinstrument: TSQLClientDataSet;
    Query: TSQLQuery;
    elektroinstrumentid: TFMTBCDField;
    elektroinstrumentid_uch: TFMTBCDField;
    elektroinstrumentinv_number: TStringField;
    elektroinstrumentname: TStringField;
    elektroinstrumentreserv: TStringField;
    elektroinstrumentdate_first: TDateField;
    elektroinstrumentdate_next: TDateField;
    elektroinstrumentplace_install: TStringField;
    elektroinstrumentprim: TStringField;
    elektroinstrumentname_uch: TStringField;
    takelag: TSQLClientDataSet;
    takelagid: TFMTBCDField;
    takelagid_uch: TFMTBCDField;
    takelaginv_number: TStringField;
    takelagname: TStringField;
    takelagreserv: TStringField;
    takelagdate_first: TDateField;
    takelagdate_next: TDateField;
    takelagplace_install: TStringField;
    takelagprim: TStringField;
    takelagname_uch: TStringField;
    znaniya_el_bez: TSQLClientDataSet;
    znaniya_el_bezid: TFMTBCDField;
    znaniya_el_beztab_num: TFMTBCDField;
    znaniya_el_bezid_uch: TFMTBCDField;
    znaniya_el_bezfam: TStringField;
    znaniya_el_bezname: TStringField;
    znaniya_el_bezsec_name: TStringField;
    znaniya_el_bezdolgnost: TStringField;
    znaniya_el_bezgruppa_el: TSmallintField;
    znaniya_el_bezdate_first: TDateField;
    znaniya_el_bezdate_next: TDateField;
    znaniya_el_beznum_protokol: TStringField;
    znaniya_el_bezprim: TStringField;
    znaniya_el_bezreserv: TSmallintField;
    znaniya_el_bezname_uch: TStringField;
    znaniya_gpm: TSQLClientDataSet;
    znaniya_gpmid: TFMTBCDField;
    znaniya_gpmtab_num: TFMTBCDField;
    znaniya_gpmid_uch: TFMTBCDField;
    znaniya_gpmfam: TStringField;
    znaniya_gpmname: TStringField;
    znaniya_gpmsec_name: TStringField;
    znaniya_gpmdolgnost: TStringField;
    znaniya_gpmprofessiya: TStringField;
    znaniya_gpmdate_first: TDateField;
    znaniya_gpmdate_next: TDateField;
    znaniya_gpmnum_protokol: TStringField;
    znaniya_gpmprim: TStringField;
    znaniya_gpmreserv: TSmallintField;
    znaniya_gpmname_uch: TStringField;
    znaniya_met_stanki: TSQLClientDataSet;
    znaniya_met_stankiid: TFMTBCDField;
    znaniya_met_stankitab_num: TFMTBCDField;
    znaniya_met_stankiid_uch: TFMTBCDField;
    znaniya_met_stankifam: TStringField;
    znaniya_met_stankiname: TStringField;
    znaniya_met_stankisec_name: TStringField;
    znaniya_met_stankidolgnost: TStringField;
    znaniya_met_stankidate_first: TDateField;
    znaniya_met_stankidate_next: TDateField;
    znaniya_met_stankinum_protokol: TStringField;
    znaniya_met_stankiprim: TStringField;
    znaniya_met_stankireserv: TSmallintField;
    znaniya_met_stankiname_uch: TStringField;
    znaniya_otipb: TSQLClientDataSet;
    znaniya_otipbid: TFMTBCDField;
    znaniya_otipbtab_num: TFMTBCDField;
    znaniya_otipbid_uch: TFMTBCDField;
    znaniya_otipbfam: TStringField;
    znaniya_otipbname: TStringField;
    znaniya_otipbsec_name: TStringField;
    znaniya_otipbdolgnost: TStringField;
    znaniya_otipbdate_first: TDateField;
    znaniya_otipbdate_next: TDateField;
    znaniya_otipbnum_protokol: TStringField;
    znaniya_otipbprim: TStringField;
    znaniya_otipbreserv: TSmallintField;
    znaniya_otipbname_uch: TStringField;
    sl_tab_number: TSQLClientDataSet;
    sl_prof_dolgnost: TSQLClientDataSet;
    sl_num_prot: TSQLClientDataSet;
    sl_inv_number: TSQLClientDataSet;
    sl_place: TSQLClientDataSet;
    sl_familiya: TSQLClientDataSet;
    sl_otchestvo: TSQLClientDataSet;
    sl_sec_prof: TSQLClientDataSet;
    sl_name: TSQLClientDataSet;
    sl_imya: TSQLClientDataSet;
    sl_familiyasl: TStringField;
    sl_imyasl: TStringField;
    sl_inv_numbersl: TStringField;
    sl_num_protsl: TStringField;
    sl_otchestvosl: TStringField;
    sl_tab_numbersl: TStringField;
    sl_namesl: TStringField;
    sl_sec_profsl: TStringField;
    sl_prof_dolgnostsl: TStringField;
    sl_placesl: TStringField;
    kniga_otzivov: TSQLClientDataSet;
    DS_kniga: TDataSource;
    kniga_otzivovid: TFMTBCDField;
    kniga_otzivovotziv: TMemoField;
    kniga_otzivovname: TStringField;
    kniga_otzivovdate_time: TSQLTimeStampField;
    kniga_otzivovip_address: TStringField;
    kniga_otzivovmac_address: TStringField;
    znaniya_el_beznum_udost: TStringField;
    znaniya_gpmnum_udost: TStringField;
    znaniya_met_stankinum_udost: TStringField;
    znaniya_otipbnum_udost: TStringField;
    ognetush: TSQLClientDataSet;
    DS_Ognetush: TDataSource;
    ognetushid: TFMTBCDField;
    ognetushid_uch: TFMTBCDField;
    ognetushinv_number: TStringField;
    ognetushname: TStringField;
    ognetushreserv: TStringField;
    ognetushdate_first: TDateField;
    ognetushdate_next: TDateField;
    ognetushplace_install: TStringField;
    ognetushprim: TStringField;
    others: TSQLClientDataSet;
    DS_Others: TDataSource;
    othersid: TFMTBCDField;
    othersid_uch: TFMTBCDField;
    othersname: TStringField;
    othersdate_first: TDateField;
    othersdate_next: TDateField;
    othersplace_install: TStringField;
    othersinv_number: TStringField;
    ognetushname_uch: TStringField;
    othersname_uch: TStringField;
    trenirovki: TSQLClientDataSet;
    DS_trenirovki: TDataSource;
    trenirovkiid: TFMTBCDField;
    trenirovkivid: TStringField;
    trenirovkitub_num: TFMTBCDField;
    trenirovkiid_uch: TFMTBCDField;
    trenirovkifam: TStringField;
    trenirovkiname: TStringField;
    trenirovkisec_name: TStringField;
    trenirovkidolgnost: TStringField;
    trenirovkitema: TStringField;
    trenirovkidate_first: TDateField;
    trenirovkidate_next: TDateField;
    trenirovkifam_instruktor: TStringField;
    trenirovkiname_uch: TStringField;
    sl_vid_trenirovki: TSQLClientDataSet;
    sl_vid_trenirovkisl: TStringField;
    sl_vid_instruktag: TSQLClientDataSet;
    StringField1: TStringField;
    instruktagi: TSQLClientDataSet;
    DS_Instruktagi: TDataSource;
    instruktagiid: TFMTBCDField;
    instruktagivid: TStringField;
    instruktagitub_num: TFMTBCDField;
    instruktagiid_uch: TFMTBCDField;
    instruktagifam: TStringField;
    instruktaginame: TStringField;
    instruktagisec_name: TStringField;
    instruktagidolgnost: TStringField;
    instruktagitema: TStringField;
    instruktagidate_first: TDateField;
    instruktagidate_next: TDateField;
    instruktagifam_instruktor: TStringField;
    instruktaginame_uch: TStringField;
    tblinfo: TSQLClientDataSet;
    DS_tblinfo: TDataSource;
    tblinfoid_info: TFMTBCDField;
    tblinfoname_info: TStringField;
    tblinfoshifr_info: TStringField;
    Query_date: TSQLQuery;
    tblinfoflag_razdel: TIntegerField;
    tblinfoid_razdel: TIntegerField;
    ServerSocket1: TServerSocket;
    meropr: TSQLClientDataSet;
    DS_meropr: TDataSource;
    meroprid_meropr: TFMTBCDField;
    meroprname_meropr: TStringField;
    meroprsrok_ispoln: TDateField;
    meroprOtm_vipoln: TStringField;
    meroprvipolneno: TSmallintField;
    meroprvip_vichisl: TStringField;
    DS_sequrity: TDataSource;
    Sequrity: TSQLClientDataSet;
    Sequrityid: TFMTBCDField;
    Sequritylogin: TStringField;
    Sequritypassword: TStringField;
    Sequrityid_uchastok: TFMTBCDField;
    SequrityUshastok_look: TStringField;
    meroprid_uchastok: TFMTBCDField;
    meroprfam_otvetstv: TStringField;
    meropruchastok_look: TStringField;
    sizDateOsmotrnext: TDateField;
    meroprdate_end: TDateField;
    metrologiya: TSQLClientDataSet;
    DS_metrologiya: TDataSource;
    metrologiyaid: TFMTBCDField;
    metrologiyaid_uch: TFMTBCDField;
    metrologiyainv_number: TStringField;
    metrologiyaname: TStringField;
    metrologiyareserv: TStringField;
    metrologiyadate_first: TDateField;
    metrologiyadate_next: TDateField;
    metrologiyaplace_install: TStringField;
    metrologiyaprim: TStringField;
    metrologiyaname_uch: TStringField;
    flurografia: TSQLClientDataSet;
    DS_flurografia: TDataSource;
    flurografiaid: TFMTBCDField;
    flurografiatab_num: TFMTBCDField;
    flurografiaid_uch: TFMTBCDField;
    flurografiafam: TStringField;
    flurografianame: TStringField;
    flurografiasec_name: TStringField;
    flurografiadolgnost: TStringField;
    flurografiadate_first: TDateField;
    flurografiadate_next: TDateField;
    flurografiaprim: TStringField;
    flurografiareserv: TSmallintField;
    flurografianame_uch: TStringField;
    tmc: TSQLClientDataSet;
    StringField7: TStringField;
    DS_tmc: TDataSource;
    tmcid: TFMTBCDField;
    tmcid_uch: TFMTBCDField;
    tmcname: TStringField;
    tmcfirma: TStringField;
    tmcmodel: TStringField;
    tmcinv_num: TStringField;
    tmcnomenkl_num: TStringField;
    tmcserial_num: TStringField;
    tmckol_vo: TStringField;
    tmced_izm: TStringField;
    tmcdate_input: TDateField;
    tmcplace_install: TStringField;
    tmcstoimost: TStringField;
    tmcprim: TStringField;
    sl_query: TSQLClientDataSet;
    tmcColor: TIntegerField;
    tmcif_mobila: TSmallintField;
    tmcif_malocenka: TSmallintField;
    tmcif_mebel: TSmallintField;
    tmcif_orgtehnics: TSmallintField;
    tmcif_phone: TSmallintField;
    zazemlDateOsmotrnext: TDateField;
    rooms: TSQLClientDataSet;
    DS_rooms: TDataSource;
    roomsid_rooms: TFMTBCDField;
    roomsid_uch: TFMTBCDField;
    roomsname_room: TStringField;
    roomsplace_room: TStringField;
    roomsarea_room: TStringField;
    roomslink_tmc_place: TStringField;
    roomsnumber_room: TStringField;
    roomsnaznachenie: TStringField;
    roomssostoyanie: TStringField;
    roomsprim: TStringField;
    roomsname_uch: TStringField;
    tmcSostoyanie: TStringField;
    tmcmol: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure meroprCalcFields(DataSet: TDataSet);
    procedure DBConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    function ExecuteCMD(ACmd: string): string;
    function TelnetSendText(Socket: TCustomWinSocket; AText: string): boolean;
  public
    { Public declarations }
  end;
type
  T_Beep = record freq, dur, sleep: integer end;  //для beep

var
  BeepArray: array of T_Beep;  //для beep
  counter: integer;            //для beep

  connected: boolean;
  TelnetS: string;

  DM: TDM;
  id_uchastka: byte;{какой пункт меню (участок) выбран пользователем}
  {   1 участок АТС и ЦК
      2 УРС
      3 ГФУ СФ
      4 ГФУ ЛСС
      5 ГФУ СК
      6 Участок СТ
      7 все участки
      8 мероприятия
      11 Участок АСУГТК
      12 Участок механизации
      13 УППиР}


  id_alert_uchastok: integer; //какой участок проверять на просроченные проверки
{  1 участок АТС и ЦК
   2 УРС
   3 ГФУ СФ
   4 ГФУ ЛСС
   5 ГФУ СК
   6 участок СТ
   7 Все участки
   8 Начальник отдела связи
   9 НЕОПРЕДЕЛЕНО
   10 Техбюро
   11 Участок АСУГТК
   12 Участок механизации
   13 УППиР}

   on_line: boolean; {true - сеть подключена}
   ICMP_done: boolean; {запрос эха отработан}
   log_in: boolean;
   pishit: boolean;
   user_name: string;

var win_dir,tmpdir:string;

    periodichnost: integer; //периодичность пищалки - 120 минут по умолчанию
                            //напоминать каждые 120 минут
    Days_alert: integer; {за сколько дней оповещать что просрочено - 2 дня по умолчанию}
    prodolgitelnost: integer; // напоминать в течении - 2 мин по умолчанию
    meropr_timer: boolean; //чтобы оповещения о мероприятиях было только при запуске
    fileSound: string = ''; //имя файла для воспроизведения звука. Если пустой - то по умолчанию.

function Days_Between(const ANow, AThen: TDateTime): Integer;

implementation
{$R *.dfm}
uses UnitMain;

function Days_Between(const ANow, AThen: TDateTime): Integer;
begin
 if AThen = StrToDate('30.12.1899') then begin Result := 1000; exit end;
 if AThen>=ANow then Result :=  DaysBetween(ANow,AThen)
 else Result :=  DaysBetween(ANow,AThen)*(-1);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
    ServerSocket1.Active := true;
  except

  end;
end;

function TDM.ExecuteCMD(ACmd: string): string;
var
  UCmd, Params: string;
const CRLF = #13#10;
begin
  Result := '';
  if not(connected) then
  begin
    if UpperCase(ACmd) = '1981' then  //это пароль
    begin
      Connected := true;
      Result := 'Pol''zovatel'' identifitsirovan!';
    end;
    exit;
  end;

  // Выделение команды
  UCmd := ACmd;
  Params := '';
  if pos(' ', UCmd) > 0 then
  begin
    Params := Copy(UCmd, pos(' ', UCmd)+1, Length(UCmd));
    UCmd := Copy(UCmd, 1, pos(' ', UCmd)-1);
  end;
  UCmd := Trim(UpperCase(UCMD));

  // ? или HLP или HELP - вывод справки
  if (UCmd = '?') or (UCmd = 'HLP') or (UCmd = 'HELP') then
  begin
    Result :=
    'Kratkaya spravka po komandam Telnet interfeisa'+CRLF+
    ' ?, HLP, HELP - vyzov spravki'+CRLF+
    ' EXIT_SIZ - zavershenie raboty SIZ'+CRLF+
    ' STATUS - status programmi (in tray, pishit, ne pishit i ne in tray)' + CRLF;
    exit;
  end;

  if (UCmd = 'EXIT_SIZ') then
  begin
    Result := 'EXIT_SIZ';
    exit;
  end;

  if (UCmd = 'STATUS') then
  begin
    Result := 'STATUS';
    exit;
  end;

  Result := 'Neizvestnaya komanda - ' + ACmd;
end;


// Поддержка связи по TCP/IP для удаленного конфигурирования - действия при получении данных
procedure TDM.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s, st: string;
begin
  s := Socket.ReceiveText;

  // Это код перевода строки ? Если да, то выполняем команду и передаем ее ответ клиенту
  if ord(s[1]) = $0D then
  begin
    st := ExecuteCMD(TelnetS);
    if (st = 'EXIT_SIZ')or(st='STATUS') then s:=st;
    if st <> '' then
      st := #$0D + #$0A + st;
    st := st + #$0D + #$0A + '>';
    TelnetSendText(Socket, st);
    TelnetS := '';
    if s='EXIT_SIZ' then Application.Terminate;
    if s='STATUS' then
    begin
      if frmMain.RxTrayIcon1.Active then
        TelnetSendText(Socket, #$0D + #$0A + 'in tray' + #$0D + #$0A+'>');
      if pishit then
        TelnetSendText(Socket, #$0D + #$0A + 'pishit'+#$0D + #$0A+'>');
      if (not pishit)and(not frmMain.RxTrayIcon1.Active)then
        TelnetSendText(Socket, #$0D + #$0A + 'ne pishit i ne in tray'+#$0D + #$0A+'>');

    end;
    exit;
  end;

  // Это код клавиши BackSpace? Если да, то передадим его клиенту
  // и удалим последний символ из буфера
  if ord(s[1]) = $08 then
  begin
    Delete(TelnetS, length(TelnetS), 1);
    TelnetSendText(Socket, s);
    exit;
  end;

  // Добавим очередной символ к буферу
  TelnetS := TelnetS + s;

  // Передадим его клиенту для организации эха
  if connected and  (s=#$08) then
    //TelnetSendText(Socket, s);
    TelnetSendText(Socket, #$08); //передаём символ backspace

end;

procedure TDM.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.SendText('SIZ Connected.');
  Socket.SendText('Enter password:');
  connected := false;
end;

procedure TDM.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Connected := false;
end;

procedure TDM.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  // Обработка события "разрыв соединения"
  if ErrorCode = 10054 then
  begin
    Socket.Close;
    ErrorCode := 0;
  end;
end;

function TDM.TelnetSendText(Socket: TCustomWinSocket;
  AText: string): boolean;
var
  i: integer;
  St: string;
begin
  Result := false;
  if not(connected) then
    {exit;} AText := #$08+' ';
  St := '';
  for i := 1 to length(AText) do
    if AText[i] <> #$FF then
      st := st + AText[i]
    else
      st := st + #$FF + #$FF;
  Socket.SendText(st);
end;

procedure TDM.meroprCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('vipolneno').AsInteger = 0 then
    DataSet.FieldByName('vip_vichisl').AsString := 'Нет'
  else
    DataSet.FieldByName('vip_vichisl').AsString := 'Да'
end;

procedure TDM.DBConnectionBeforeConnect(Sender: TObject);
begin
  DBConnection.LibraryName := 'dbexpmysql.dll';
end;

end.
