unit Previnst;

interface

uses Windows;

var
  mmm: boolean; //��� ���������� ���� true �� ��������� ��� ��������

implementation

var
  hMutex: integer;
begin
  mmm := false;
  hMutex := CreateMutex(nil, TRUE, 'Abra_Shvabra_EMZ_SIZ1'); // ������� �������
  if GetLastError <> 0 then
    mmm := true; // ������ ������� ��� ������
  ReleaseMutex(hMutex);
end.


