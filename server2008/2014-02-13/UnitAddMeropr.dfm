object frmAddMeropr: TfrmAddMeropr
  Left = 387
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 321
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
    Left = 4
    Top = 45
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object Label2: TLabel
    Left = 5
    Top = 2
    Width = 71
    Height = 13
    Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077':'
  end
  object Label3: TLabel
    Left = 6
    Top = 169
    Width = 89
    Height = 13
    Caption = #1060#1072#1081#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
  end
  object Label4: TLabel
    Left = 4
    Top = 98
    Width = 67
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
  end
  object Label5: TLabel
    Left = 6
    Top = 125
    Width = 121
    Height = 13
    Caption = #1054#1090#1084#1077#1090#1082#1072' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080':'
  end
  object Label6: TLabel
    Left = 61
    Top = 260
    Width = 60
    Height = 13
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086':'
  end
  object Label7: TLabel
    Left = 10
    Top = 210
    Width = 125
    Height = 13
    Caption = #1040#1082#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090':'
  end
  object Label8: TLabel
    Left = 187
    Top = 99
    Width = 85
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 288
    Width = 75
    Height = 24
    Caption = 'OK'
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 240
    Top = 289
    Width = 75
    Height = 24
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object edtMeropr: TEdit
    Left = 3
    Top = 20
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object Data_info: TFilenameEdit
    Left = 5
    Top = 187
    Width = 358
    Height = 21
    Filter = 
      #1044#1086#1082#1091#1084#1077#1085#1090#1099' (*.doc;*.rtf;*.txt;*.xls;*.pdf)|*.doc;*.rtf;*.txt;*.xl' +
      's;*.pdf|'#1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103'|*.bmp;*.jpg;*.png;*.tif;*.tiff;*.gif;*.jpeg;' +
      '*.wmf|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    NumGlyphs = 1
    TabOrder = 3
  end
  object Srok_ispoln: TDateTimePicker
    Left = 79
    Top = 95
    Width = 90
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object EdtOtmIspoln: TEdit
    Left = 3
    Top = 143
    Width = 361
    Height = 21
    TabOrder = 2
  end
  object Vipolneno: TComboBox
    Left = 133
    Top = 257
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      #1053#1077#1090
      #1044#1072)
  end
  object edtAkt: TFilenameEdit
    Left = 5
    Top = 228
    Width = 358
    Height = 21
    Filter = 
      #1044#1086#1082#1091#1084#1077#1085#1090#1099' (*.doc;*.rtf;*.txt;*.xls;*.pdf)|*.doc;*.rtf;*.txt;*.xl' +
      's;*.pdf|'#1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103'|*.bmp;*.jpg;*.png;*.tif;*.tiff;*.gif;*.jpeg;' +
      '*.wmf|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    NumGlyphs = 1
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 3
    Top = 60
    Width = 361
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object Date_end: TDateTimePicker
    Left = 275
    Top = 96
    Width = 90
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 9
    Top = 271
  end
end
