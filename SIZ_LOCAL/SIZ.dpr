program SIZ;

uses
  Forms,
  Dialogs,
  registry,
  SysUtils,
  previnst,
  windows,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitMenu in 'UnitMenu.pas' {frmMenu},
  UnitTable in 'UnitTable.pas' {frmTable},
  UnitAbout in 'UnitAbout.pas' {AboutBox},
  UnitAddEdit in 'UnitAddEdit.pas' {frmAdd_Edit},
  UnitAddEdit3 in 'UnitAddEdit3.pas' {frmAdd_Edit3},
  UnitAddEdit2 in 'UnitAddEdit2.pas' {frmAdd_Edit2},
  UnitAddEdit1 in 'UnitAddEdit1.pas' {frmAdd_Edit1},
  UAddEditTMC in 'UAddEditTMC.pas' {frmAddEditTMC},
  UAddEditRooms in 'UAddEditRooms.pas' {frmAddEditRooms},
  UnitAddEditUser in 'UnitAddEditUser.pas' {frmAdd_Edit_user},
  UnitAlert in 'UnitAlert.pas' {frmAlert},
  ThreadBeep in 'ThreadBeep.pas',
  MyTimer in 'MyTimer.pas',
  MyDB in 'MyDB.pas',
  UnitKniga in 'UnitKniga.pas' {frmKniga},
  UnitInfo in 'UnitInfo.pas' {frmInfo},
  UnitProgress in 'UnitProgress.pas' {frmProgress},
  UnitAddInfo in 'UnitAddInfo.pas' {frmAddInfo},
  UnitAddRazdel in 'UnitAddRazdel.pas' {frmAddRazdel},
  UnitSetup in 'UnitSetup.pas' {frmSetup},
  UnitMeropr in 'UnitMeropr.pas' {frmMeropr},
  UnitAddMeropr in 'UnitAddMeropr.pas' {frmAddMeropr},
  ProdolgitelnostStream in 'ProdolgitelnostStream.pas',
  UnitAuth in 'UnitAuth.pas' {frmAuth},
  UnitTableTMC in 'UnitTableTMC.pas' {frmTableTMC},
  USyncTMC in 'USyncTMC.pas' {frmSyncTMC},
  UnitTableRooms in 'UnitTableRooms.pas' {frmTableRooms},
  UnitUsers in 'UnitUsers.pas' {frmUsers};

{$R *.res}


var
  search_res:TSearchRec;findedfile: file of byte;
  p_windir: array[0..MAX_PATH]of char;
  reestr: TRegistry;

begin

  if mmm then halt;
  if FileExists('c:\mysql_siz\start_local.cmd') then
  begin
    WinExec('c:\mysql_siz\start_local.cmd',SW_HIDE);
    sleep(1000);
  end
  else
  begin
    ShowMessage('MySQL не установлен!');
    halt;
  end;

  Application.Initialize;

  Application.CreateForm(TDM, DM);
  log_in := false;




  //удаляем все файлы из директории windows\temp
  GetWindowsDirectory(p_windir,MAX_PATH);
  win_dir := string(p_windir);
  tmpdir := win_dir+'\temp';
  if FindFirst(tmpdir+'\tmp_siz_*.*',faAnyFile,Search_Res)=0 then
  begin
    repeat
      if (Search_Res.Name <>'.')and(Search_Res.Name <>'..') then
      begin
        AssignFile(FindedFile,tmpdir+'\'+Search_Res.Name);
        {$I-}
        Erase(FindedFile);
        {$I+}
      //  DeleteFile(tmpdir+'\'+Search_Res.Name);
      end;
    until FindNext(Search_Res) <> 0;
    sysutils.FindClose(Search_Res);
  end;



 // прописываем настройки напоминалки в реестре по умолчанию, если их нет 
 // а если есть - загружаем из реестра
   reestr := TRegistry.Create;
   reestr.RootKey := HKEY_LOCAL_MACHINE;
   reestr.OpenKey('SOFTWARE\siz_emz',true);
   if reestr.ValueExists('periodichnost') then
     periodichnost := reestr.ReadInteger('periodichnost')
   else
   begin
     reestr.WriteInteger('periodichnost',120);
     periodichnost := 120;
   end;
   if reestr.ValueExists('napominat_za') then
     Days_alert := reestr.ReadInteger('napominat_za')
   else
   begin
     reestr.WriteInteger('napominat_za',2);
     Days_alert := 2;
   end;
   if reestr.ValueExists('prodolgitelnost') then
     prodolgitelnost := reestr.ReadInteger('prodolgitelnost')
   else
   begin
     reestr.WriteInteger('prodolgitelnost',2);
     prodolgitelnost := 2;
   end;
   reestr.CloseKey;
   reestr.Free;





  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
