unit UnitMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, RxGrdCpt, ExtCtrls, UnitTable, UnitDM, UnitTableTMC;

type
  TfrmMenu = class(TForm)
    btnATS: TSpeedButton;
    btnURS: TSpeedButton;
    btnGFUSF: TSpeedButton;
    btnGFULSS: TSpeedButton;
    btnGFUSK: TSpeedButton;
    btnALL: TSpeedButton;
    btnGruppaMeh: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnMeropriyatiya: TSpeedButton;
    btnTMC: TSpeedButton;
    btnPomesheniya: TSpeedButton;
    btnUASUGTK: TSpeedButton;
    btUMeh: TSpeedButton;
    btnUPPiR: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  old_width,old_height: integer;

implementation

{$R *.dfm}

uses UnitMain, UnitInfo, UnitMeropr, UnitTableRooms;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caNone;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  old_width := Width;
  old_height := Height;
  //if (id_alert_uchastok=-1)or(id_alert_uchastok = 7) then old_height := 436;
  //if id_alert_uchastok >= 7 then old_height := 151;
end;



procedure TfrmMenu.FormResize(Sender: TObject);
begin
  Width := old_width;
  Height := old_height;
end;

procedure unsetFiltr;
begin
  with DM do
  begin
    elektroinstrument.Filtered := false;
    elektroinstrument.Filter := '';
    siz.Filtered := False;
    siz.Filter := '';
    takelag.Filtered := false;
    takelag.Filter := '';
    zazeml.Filtered := false;
    zazeml.Filter := '';
    znaniya_el_bez.Filtered := false;
    znaniya_el_bez.Filter := '';
    znaniya_gpm.Filtered := false;
    znaniya_gpm.Filter := '';
    znaniya_met_stanki.Filtered := false;
    znaniya_met_stanki.Filter := '';
    znaniya_otipb.Filtered := false;
    znaniya_otipb.Filter := '';
    ognetush.Filtered := false;
    ognetush.Filter := '';
    others.Filtered := false;
    others.Filter := '';
    trenirovki.Filtered := false;
    trenirovki.Filter := '';
    instruktagi.Filtered := false;
    instruktagi.Filter := '';
    metrologiya.Filtered := false;;
    metrologiya.Filter := '';
  end;
end;

procedure Set_filtr(StrFiltr: string);
begin
  with DM do
  begin
    elektroinstrument.Filter := StrFiltr;
    elektroinstrument.Filtered := true;
    siz.Filter := StrFiltr;
    siz.Filtered := true;
    takelag.Filter := StrFiltr;
    takelag.Filtered := true;
    zazeml.Filter := StrFiltr;
    zazeml.Filtered := true;
    znaniya_el_bez.Filter := StrFiltr;
    znaniya_el_bez.Filtered := true;
    znaniya_gpm.Filter := StrFiltr;
    znaniya_gpm.Filtered := true;
    znaniya_met_stanki.Filter := StrFiltr;
    znaniya_met_stanki.Filtered := true;
    znaniya_otipb.Filter := StrFiltr;
    znaniya_otipb.Filtered := true;
    ognetush.Filter := StrFiltr;
    ognetush.Filtered := true;
    others.Filter := StrFiltr;
    others.Filtered := true;
    trenirovki.Filter := StrFiltr;
    trenirovki.Filtered := true;
    instruktagi.Filter := StrFiltr;
    instruktagi.Filtered := true;
    metrologiya.Filter := StrFiltr;
    metrologiya.Filtered := true;
  end;
end;

procedure TfrmMenu.btnClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Tag=-158 then
  begin
      dm.rooms.Filter := 'id_uch='+IntToStr(id_alert_uchastok);
      if id_alert_uchastok=7 then dm.rooms.Filter := 'id_uch<10';
      DM.rooms.Filtered := true;
      frmTableRooms := TfrmTableRooms.Create(Application);
      exit;
  end;

  if (Sender as TSpeedButton).tag=-151 then
  begin
      dm.tmc.Filter := 'id_uch='+IntToStr(id_alert_uchastok)+ ' or id_uch=9';
      if id_alert_uchastok=7 then dm.tmc.Filter := 'id_uch<12';
      DM.tmc.Filtered := true;
      frmTableTMC := TfrmTableTMC.Create(Application);
      exit;
  end;


  if (Sender as TSpeedButton).tag=-15 then
  begin
    frminfo := tfrminfo.create(application);
  end
  else
    if (Sender as TSpeedButton).tag=8 then
    begin
      if (id_alert_uchastok <> 7)and(id_alert_uchastok <> 8) then
      begin
        dm.meropr.Filter := 'id_uchastok='+IntToStr(id_alert_uchastok);
        DM.meropr.Filtered := true;
      end;
      frmMeropr := TfrmMeropr.Create(Application);
    end
    else
    begin
      id_uchastka := (Sender as TSpeedButton).tag;
      if id_uchastka=7 then unsetFiltr else Set_filtr('id_uch='+IntToStr(id_uchastka));
      frmTable := TfrmTable.Create(Application);
      frmTable.Caption := (Sender as TSpeedButton).Caption;
    end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
{  if id_alert_uchastok=8 then
  begin
    btnATS.Visible := false;
    btnURS.Visible := false;
    btnGFUSF.Visible := false;
    btnGFULSS.Visible := false;
    btnGFUSK.Visible := false;
    btnALL.Visible := false;
    btnGruppaMeh.Visible := false;
    btnMeropriyatiya.Visible := true;
    btnMeropriyatiya.Top := 84;
  end;
 }
  btnMeropriyatiya.Visible := true;
  btnUPPiR.Enabled := false;

  if (id_alert_uchastok=4) then
  begin
    btnATS.Enabled := False;
    btnURS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnGFUSK.Enabled := False;
    btnALL.Enabled := False;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=1) then
  begin
    btnGFULSS.Enabled := False;
    btnURS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnGFUSK.Enabled := False;
    btnALL.Enabled := False;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=2) then
  begin
    btnGFULSS.Enabled := False;
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnGFUSK.Enabled := False;
    btnALL.Enabled := False;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=3) then
  begin
    btnGFULSS.Enabled := False;
    btnATS.Enabled := False;
    btnURS.Enabled := False;
    btnGFUSK.Enabled := False;
    btnALL.Enabled := False;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=5) then
  begin
    btnGFULSS.Enabled := False;
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnURS.Enabled := False;
    btnALL.Enabled := False;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=6) then
  begin
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnURS.Enabled := False;
    btnALL.Enabled := False;
    btnGFUSK.Enabled := false;
    btnGFULSS.Enabled := false;
    btnUASUGTK.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=11) then
  begin
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnURS.Enabled := False;
    btnALL.Enabled := False;
    btnGFUSK.Enabled := false;
    btnGFULSS.Enabled := false;
    btnGruppaMeh.Enabled := false;
    btUMeh.Enabled := false;
  end;
  if (id_alert_uchastok=12) then
  begin
    btnPomesheniya.Enabled := false;
    btnTMC.Enabled := false;
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnURS.Enabled := False;
    btnALL.Enabled := False;
    btnGFUSK.Enabled := false;
    btnGFULSS.Enabled := false;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btnMeropriyatiya.Enabled := false;
  end;

  if (id_alert_uchastok=13) then
  begin
    btnPomesheniya.Enabled := false;
    btnTMC.Enabled := false;
    btnATS.Enabled := False;
    btnGFUSF.Enabled := False;
    btnURS.Enabled := False;
    btnALL.Enabled := False;
    btnGFUSK.Enabled := false;
    btnGFULSS.Enabled := false;
    btnGruppaMeh.Enabled := false;
    btnUASUGTK.Enabled := false;
    btnMeropriyatiya.Enabled := false;
    btUMeh.Enabled := false;
    btnUPPiR.Enabled := true;
  end;

  FormResize(Sender);
end;

end.
