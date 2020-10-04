unit UnitSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, Registry, UnitDM;

type
  TfrmSetup = class(TForm)
    edtNapZa: TSpinEdit;
    edtNapKagdie: TSpinEdit;
    edtNapVTechenie: TSpinEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnDefault: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

{$R *.dfm}

procedure TfrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSetup.btnOKClick(Sender: TObject);
var
  restr: TRegistry;
begin
   periodichnost := edtNapKagdie.Value;
   prodolgitelnost := edtNapVTechenie.Value;
   Days_alert := edtNapZa.Value;
   restr := TRegistry.Create;
   restr.RootKey := HKEY_LOCAL_MACHINE;
   restr.OpenKey('SOFTWARE\siz_emz',true);
   restr.WriteInteger('periodichnost',periodichnost);
   restr.WriteInteger('napominat_za',Days_alert);
   restr.WriteInteger('prodolgitelnost',prodolgitelnost);
   restr.CloseKey;
   restr.Free;
   close;
end;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  edtNapZa.Value := Days_alert;
  edtNapKagdie.Value := periodichnost;
  edtNapVTechenie.Value := prodolgitelnost;
end;

procedure TfrmSetup.btnDefaultClick(Sender: TObject);
begin
  edtNapZa.Value := 2;
  edtNapKagdie.Value := 120;
  edtNapVTechenie.Value := 2;
end;

procedure TfrmSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
