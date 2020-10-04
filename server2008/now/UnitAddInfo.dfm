object frmAddInfo: TfrmAddInfo
  Left = 387
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 229
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 82
    Width = 136
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
  end
  object Label2: TLabel
    Left = 5
    Top = 22
    Width = 89
    Height = 13
    Caption = #1064#1080#1092#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
  end
  object Label3: TLabel
    Left = 9
    Top = 134
    Width = 89
    Height = 13
    Caption = #1060#1072#1081#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
  end
  object Name_info: TEdit
    Left = 3
    Top = 100
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 194
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 240
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object edtShifr: TEdit
    Left = 3
    Top = 40
    Width = 190
    Height = 21
    TabOrder = 0
  end
  object Data_info: TFilenameEdit
    Left = 8
    Top = 152
    Width = 353
    Height = 21
    Filter = 
      #1044#1086#1082#1091#1084#1077#1085#1090#1099' (*.doc;*.rtf;*.txt;*.xls;*.pdf)|*.doc;*.rtf;*.txt;*.xl' +
      's;*.pdf|'#1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103'|*.bmp;*.jpg;*.png;*.tif;*.tiff;*.gif;*.jpeg;' +
      '*.wmf|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    NumGlyphs = 1
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 281
    Top = 31
  end
end
