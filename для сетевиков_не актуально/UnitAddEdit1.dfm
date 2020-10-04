object frmAdd_Edit1: TfrmAdd_Edit1
  Left = 332
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmAdd_Edit'
  ClientHeight = 318
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TSpeedButton
    Left = 29
    Top = 284
    Width = 80
    Height = 25
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 221
    Top = 284
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object Label1: TLabel
    Left = 53
    Top = 45
    Width = 95
    Height = 13
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
  end
  object Label2: TLabel
    Left = 96
    Top = 69
    Width = 52
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103':'
  end
  object Label3: TLabel
    Left = 70
    Top = 229
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080':'
  end
  object Label4: TLabel
    Left = 11
    Top = 253
    Width = 141
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080':'
  end
  object Label5: TLabel
    Left = 100
    Top = 113
    Width = 50
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
  end
  object Label6: TLabel
    Left = 104
    Top = 9
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object Label7: TLabel
    Left = 123
    Top = 92
    Width = 25
    Height = 13
    Caption = #1048#1084#1103':'
  end
  object Label8: TLabel
    Left = 27
    Top = 159
    Width = 124
    Height = 13
    Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100':'
  end
  object lblGruppa_sec_prof: TLabel
    Left = 6
    Top = 183
    Width = 145
    Height = 13
    Alignment = taRightJustify
    Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086' '#1101#1083'. '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080':'
  end
  object Label10: TLabel
    Left = 57
    Top = 206
    Width = 93
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072':'
  end
  object Label9: TLabel
    Left = 57
    Top = 135
    Width = 93
    Height = 13
    Caption = #8470' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1103':'
  end
  object cbSecondProf: TComboBox
    Left = 157
    Top = 179
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 10
    Visible = False
    OnKeyPress = cbTabNumKeyPress
  end
  object edtGruppa: TSpinEdit
    Left = 157
    Top = 179
    Width = 145
    Height = 22
    MaxValue = 5
    MinValue = 2
    TabOrder = 6
    Value = 2
  end
  object cbTabNum: TComboBox
    Left = 157
    Top = 41
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnKeyPress = cbTabNumKeyPress
  end
  object cbFam: TComboBox
    Left = 157
    Top = 64
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyPress = cbTabNumKeyPress
  end
  object date_first: TDateTimePicker
    Left = 157
    Top = 226
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    OnChange = date_firstChange
  end
  object date_next: TDateTimePicker
    Left = 157
    Top = 249
    Width = 145
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
  object cbOtchestvo: TComboBox
    Left = 157
    Top = 110
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnKeyPress = cbTabNumKeyPress
  end
  object cbUchastok: TComboBox
    Left = 157
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    Items.Strings = (
      #1059#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
      #1059#1056#1057
      #1043#1060#1059' '#1057#1060
      #1043#1060#1059' '#1051#1057#1057
      #1043#1060#1059' '#1057#1050
      #1059#1095#1072#1089#1090#1086#1082' '#1057#1058
      #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080
      #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1089#1074#1103#1079#1080)
  end
  object cb_Name: TComboBox
    Left = 157
    Top = 87
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    OnKeyPress = cbTabNumKeyPress
  end
  object cbDolgnost: TComboBox
    Left = 157
    Top = 156
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    OnKeyPress = cbTabNumKeyPress
  end
  object cbNumProtokol: TComboBox
    Left = 157
    Top = 203
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 7
    OnKeyPress = cbTabNumKeyPress
  end
  object edtNumUdost: TEdit
    Left = 157
    Top = 133
    Width = 144
    Height = 21
    TabOrder = 4
  end
end
