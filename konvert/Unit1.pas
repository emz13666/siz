unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, TTDBGrid, DBXpress, FMTBcd, SqlExpr,
  StdCtrls;

type
  TForm1 = class(TForm)
    ToolTipsDBGrid1: TToolTipsDBGrid;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADOConnection1: TADOConnection;
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//
  ADODataSet1.First;
  while not ADODataSet1.Eof do
  begin
    SQLQuery1.Close;
    SQLQuery1.sql.Text := 'Insert into tmc(id_uch, name, inv_num, serial_num, date_input, place_install,ed_izm,kol_vo) values('+
       '3,'+QuotedStr(ADODataSet1.Fields[3].AsString)+','+QuotedStr(ADODataSet1.Fields[1].AsString) + ','+
       QuotedStr(ADODataSet1.Fields[2].AsString)+','+QuotedStr('2008-01-01')+','+QuotedStr(ADODataSet1.Fields[4].AsString)+',''רע'',''1'')';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    ADODataSet1.Next;
  end;

end;

end.
