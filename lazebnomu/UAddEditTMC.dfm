object frmAddEditTMC: TfrmAddEditTMC
  Left = 390
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmAdd_Edit'
  ClientHeight = 507
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
  DesignSize = (
    323
    507)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TSpeedButton
    Left = 29
    Top = 478
    Width = 80
    Height = 25
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 221
    Top = 478
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object Label1: TLabel
    Left = 70
    Top = 130
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 3
    Top = 108
    Width = 145
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1072#1083#1100#1076#1086#1074#1082#1077':'
  end
  object Label3: TLabel
    Left = 27
    Top = 289
    Width = 123
    Height = 13
    Alignment = taRightJustify
    Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090'.:'
  end
  object Label5: TLabel
    Left = 64
    Top = 62
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#8470':'
  end
  object Label6: TLabel
    Left = 104
    Top = 9
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object Label7: TLabel
    Left = 107
    Top = 268
    Width = 42
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100':'
  end
  object Label8: TLabel
    Left = 46
    Top = 84
    Width = 105
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1099#1081' '#8470':'
  end
  object Label9: TLabel
    Left = 113
    Top = 219
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = #1050#1086#1083'-'#1074#1086':'
  end
  object lblGruppa_sec_prof: TLabel
    Left = 83
    Top = 175
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#8470':'
  end
  object Label10: TLabel
    Left = 112
    Top = 198
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #1045#1076'.'#1080#1079#1084':'
  end
  object Label4: TLabel
    Left = 92
    Top = 242
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
  end
  object Label11: TLabel
    Left = 61
    Top = 152
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080':'
  end
  object Label12: TLabel
    Left = 84
    Top = 337
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object Label13: TLabel
    Left = 94
    Top = 311
    Width = 57
    Height = 13
    Anchors = [akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077':'
    ParentBiDiMode = False
  end
  object Label14: TLabel
    Left = 25
    Top = 36
    Width = 127
    Height = 13
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074'-'#1077' '#1083#1080#1094#1086':'
  end
  object cbNameTMC: TComboBox
    Left = 157
    Top = 126
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnKeyPress = cbNameTMCKeyPress
  end
  object cbFirma: TComboBox
    Left = 157
    Top = 104
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    OnKeyPress = cbNameTMCKeyPress
  end
  object date_input: TDateTimePicker
    Left = 157
    Top = 286
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
  end
  object cbInvNum: TComboBox
    Left = 157
    Top = 58
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnKeyPress = cbNameTMCKeyPress
  end
  object cbUchastok: TComboBox
    Left = 157
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    TabStop = False
    Items.Strings = (
      #1059#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
      #1059#1056#1057
      #1043#1060#1059' '#1057#1060
      #1043#1060#1059' '#1051#1057#1057
      #1043#1060#1059' '#1057#1050
      #1059#1095#1072#1089#1090#1086#1082' '#1057#1058
      #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080
      #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1089#1074#1103#1079#1080
      #1053#1045#1054#1055#1056#1045#1044#1045#1051#1045#1053#1054)
  end
  object cbModel: TComboBox
    Left = 157
    Top = 263
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 9
    OnKeyPress = cbNameTMCKeyPress
  end
  object cbNomenklNum: TComboBox
    Left = 157
    Top = 81
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyPress = cbNameTMCKeyPress
  end
  object cbSerial: TComboBox
    Left = 157
    Top = 171
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    OnKeyPress = cbNameTMCKeyPress
  end
  object edtKolvo: TEdit
    Left = 157
    Top = 217
    Width = 144
    Height = 21
    TabOrder = 7
    Text = '1'
    OnKeyPress = edtPrimKeyPress
  end
  object cbEdIzm: TComboBox
    Left = 157
    Top = 194
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      #1096#1090
      #1084#1075
      #1075
      #1082#1075
      #1084
      #1082#1084
      #1082#1091#1073'.'#1084#1077#1090#1088
      #1083#1080#1090#1088)
  end
  object edtStoim: TEdit
    Left = 157
    Top = 240
    Width = 144
    Height = 21
    TabOrder = 8
    OnKeyPress = edtPrimKeyPress
  end
  object cbPlaceInstall: TComboBox
    Left = 157
    Top = 148
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    OnKeyPress = cbNameTMCKeyPress
  end
  object edtPrim: TMemo
    Left = 157
    Top = 339
    Width = 145
    Height = 124
    TabOrder = 12
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 369
    Width = 137
    Height = 17
    Caption = #1057#1086#1090#1086#1074#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 14
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 406
    Width = 137
    Height = 17
    Caption = #1052#1077#1073#1077#1083#1100' '#1080' '#1080#1085#1074#1077#1085#1090#1072#1088#1100
    TabOrder = 15
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 387
    Width = 137
    Height = 17
    Caption = #1052#1072#1083#1086#1094#1077#1085#1082#1072
    TabOrder = 16
  end
  object checkOrgteh: TCheckBox
    Left = 8
    Top = 424
    Width = 97
    Height = 17
    Caption = #1054#1088#1075#1090#1077#1093#1085#1080#1082#1072
    TabOrder = 17
  end
  object CheckPhone: TCheckBox
    Left = 8
    Top = 444
    Width = 137
    Height = 17
    Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1072#1087#1087#1072#1088#1072#1090
    TabOrder = 18
  end
  object edtSostoyanie: TEdit
    Left = 157
    Top = 309
    Width = 143
    Height = 21
    TabOrder = 11
  end
  object cbMOL: TComboBox
    Left = 157
    Top = 32
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 19
    TabStop = False
    Items.Strings = (
      #1057#1090#1086#1083#1073#1095#1077#1085#1082#1086' '#1040'.'#1070'.'
      #1063#1077#1090#1074#1077#1088#1090#1082#1080#1085' '#1055'.'#1040'.')
  end
end
