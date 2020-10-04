object frmAddEditRooms: TfrmAddEditRooms
  Left = 390
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmAdd_Edit'
  ClientHeight = 458
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
    Left = 45
    Top = 410
    Width = 80
    Height = 25
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 205
    Top = 410
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object Label6: TLabel
    Left = 104
    Top = 9
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object Label7: TLabel
    Left = 82
    Top = 88
    Width = 67
    Height = 13
    Caption = #1055#1083#1086#1097#1072#1076#1100', '#1084'2'
  end
  object Label9: TLabel
    Left = 9
    Top = 38
    Width = 141
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1103':'
  end
  object Label4: TLabel
    Left = 10
    Top = 61
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1103':'
  end
  object Label12: TLabel
    Left = 68
    Top = 333
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object Label1: TLabel
    Left = 8
    Top = 121
    Width = 145
    Height = 65
    Caption = 
      #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072'" ('#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1087#1072#1089 +
      #1087#1086#1088#1090#1072' '#1087#1086#1084#1077#1097#1077#1085#1080#1103')'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 53
    Top = 187
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1084#1077#1097#1077#1085#1080#1103':'
  end
  object Label3: TLabel
    Left = 26
    Top = 221
    Width = 126
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1103':'
  end
  object Label5: TLabel
    Left = 34
    Top = 253
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086#1084#1077#1097#1077#1085#1080#1103':'
  end
  object cbUchastok: TComboBox
    Left = 157
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
    TabStop = False
    Items.Strings = (
      #1059#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
      #1059#1056#1057
      #1043#1060#1059' '#1057#1060
      #1043#1060#1059' '#1051#1057#1057
      #1043#1060#1059' '#1057#1050
      #1043#1088#1091#1087#1087#1072' '#1084#1077#1093#1072#1085#1080#1079#1072#1094#1080#1080
      #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080)
  end
  object edtName: TEdit
    Left = 157
    Top = 36
    Width = 144
    Height = 21
    TabOrder = 0
  end
  object edtRaspolog: TEdit
    Left = 157
    Top = 59
    Width = 144
    Height = 21
    TabOrder = 1
  end
  object edtPrim: TMemo
    Left = 157
    Top = 295
    Width = 145
    Height = 90
    TabOrder = 7
  end
  object edtArea: TEdit
    Left = 157
    Top = 85
    Width = 76
    Height = 21
    TabOrder = 2
  end
  object edt_link_name_tmc: TEdit
    Left = 160
    Top = 136
    Width = 143
    Height = 21
    TabOrder = 3
  end
  object edt_number: TEdit
    Left = 159
    Top = 185
    Width = 144
    Height = 21
    TabOrder = 4
  end
  object edt_naznach: TEdit
    Left = 159
    Top = 219
    Width = 144
    Height = 21
    TabOrder = 5
  end
  object edt_sostoyanie: TEdit
    Left = 160
    Top = 251
    Width = 144
    Height = 21
    TabOrder = 6
    Text = #1091#1076#1086#1074#1083#1077#1090#1074#1086#1088#1080#1090#1077#1083#1100#1085#1086#1077
  end
end
