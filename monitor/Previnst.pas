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
  hMutex := CreateMutex(nil, TRUE, 'Abra_Shvabra_567_SIZ_MONITOR'); // ������� �������
  if GetLastError <> 0 then
    mmm := true; // ������ ������� ��� ������
  ReleaseMutex(hMutex);
end.


