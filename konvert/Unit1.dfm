object Form1: TForm1
  Left = 192
  Top = 107
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolTipsDBGrid1: TToolTipsDBGrid
    Left = 48
    Top = 16
    Width = 793
    Height = 305
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 560
    Top = 504
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 168
    Top = 328
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = #39#1054#1089#1085#1086#1074#1085#1099#1077' '#1092#1086#1085#1076#1099'$'#39
    CommandType = cmdTable
    Parameters = <>
    Left = 216
    Top = 336
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DBQ=D:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\projects\'#1087#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085#1080#1081' '#1080' '#1089#1080#1079'\konvert\' +
      #1062#1077#1093' '#1089#1074#1103#1079#1080'.xls;DefaultDir=D:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\projects\'#1087#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085 +
      #1080#1081' '#1080' '#1089#1080#1079'\konvert;Driver={Microsoft Excel Driver (*.xls)};DriverI' +
      'd=790;FIL=excel 8.0;FILEDSN=C:\Program Files\Common Files\ODBC\D' +
      'ata Sources\458.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout' +
      '=5;ReadOnly=1;SafeTransactions=0;Threads=3;UID=admin;UserCommitS' +
      'ync=Yes;"'
    LoginPrompt = False
    Left = 120
    Top = 336
  end
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'MSConnection'
    DriverName = 'MYSQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbexpmysql.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'Database=siz'
      'DriverName=MYSQL'
      'ErrorResourceFile='
      'HostName=10.1.0.11'
      'LocaleCode=0000'
      'Password=siz'
      'User_Name=siz')
    VendorLib = 'LIBMYSQL.dll'
    Left = 264
    Top = 496
  end
  object SQLQuery1: TSQLQuery
    SQLConnection = SQLConnection1
    Params = <>
    Left = 320
    Top = 496
  end
end
