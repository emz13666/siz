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
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edtSound: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    chkSND_LOOP: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
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
   fileSound := edtSound.Text;
   fSND_LOOP := chkSND_LOOP.Checked;
   restr := TRegistry.Create;
   restr.RootKey := HKEY_CURRENT_USER;
   restr.OpenKey('SOFTWARE\siz_emz',true);
   restr.WriteInteger('periodichnost',periodichnost);
   restr.WriteInteger('napominat_za',Days_alert);
   restr.WriteInteger('prodolgitelnost',prodolgitelnost);
   restr.WriteString('fileSound',fileSound);
   restr.WriteBool('SND_LOOP', fSND_LOOP);
   restr.CloseKey;
   restr.Free;
   close;
end;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  edtNapZa.Value := Days_alert;
  edtNapKagdie.Value := periodichnost;
  edtNapVTechenie.Value := prodolgitelnost;
  edtSound.Text := fileSound;
  chkSND_LOOP.Checked := fSND_LOOP;
  if fileSound <> '' then RadioButton2.Checked := true;
  OpenDialog1.InitialDir :=   ExtractFileDir(Application.ExeName)
end;

procedure TfrmSetup.btnDefaultClick(Sender: TObject);
begin
  edtNapZa.Value := 2;
  edtNapKagdie.Value := 120;
  edtNapVTechenie.Value := 2;
  RadioButton1.Checked := true;
  edtSound.Text := '';
end;

procedure TfrmSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtSound.Text := OpenDialog1.FileName;
    RadioButton2.Checked := true;
  end;
end;

procedure TfrmSetup.RadioButton1Click(Sender: TObject);
begin
  edtSound.Text := '';
end;

end.
