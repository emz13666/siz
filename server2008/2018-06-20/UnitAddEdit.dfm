object frmAdd_Edit: TfrmAdd_Edit
  Left = 332
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmAdd_Edit'
  ClientHeight = 280
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
    Top = 250
    Width = 80
    Height = 23
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 221
    Top = 250
    Width = 80
    Height = 23
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object Label1: TLabel
    Left = 45
    Top = 51
    Width = 107
    Height = 13
    Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
  end
  object Label2: TLabel
    Left = 71
    Top = 84
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 70
    Top = 113
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080':'
  end
  object Label4: TLabel
    Left = 11
    Top = 147
    Width = 141
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080':'
  end
  object Label5: TLabel
    Left = 43
    Top = 211
    Width = 109
    Height = 13
    Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
  end
  object Label6: TLabel
    Left = 104
    Top = 17
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object Label7: TLabel
    Left = 11
    Top = 179
    Width = 141
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1086#1089#1084#1086#1090#1088#1072':'
    ParentBiDiMode = False
  end
  object cbInvNum: TComboBox
    Left = 157
    Top = 47
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnKeyPress = cbInvNumKeyPress
  end
  object cbName: TComboBox
    Left = 157
    Top = 79
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyPress = cbInvNumKeyPress
  end
  object date_first: TDateTimePicker
    Left = 157
    Top = 111
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    OnChange = date_firstChange
  end
  object date_next: TDateTimePicker
    Left = 157
    Top = 143
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object cbPlace: TComboBox
    Left = 157
    Top = 208
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    OnKeyPress = cbInvNumKeyPress
  end
  object cbUchastok: TComboBox
    Left = 156
    Top = 14
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      #1059#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
      #1059#1056#1057
      #1043#1060#1059' '#1057#1060
      #1043#1060#1059' '#1051#1057#1057
      #1043#1060#1059' '#1057#1050
      #1059#1095#1072#1089#1090#1086#1082' '#1057#1058
      #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080
      #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1089#1074#1103#1079#1080
      #1053#1045#1054#1055#1056#1045#1044#1045#1051#1045#1053#1054
      #1058#1077#1093#1073#1102#1088#1086
      #1059#1095#1072#1089#1090#1086#1082' '#1040#1057#1059#1043#1058#1050
      #1059#1095#1072#1089#1090#1086#1082' '#1084#1077#1093#1072#1085#1080#1079#1072#1094#1080#1080
      #1059#1055#1055#1080#1056)
  end
  object DateNextOsmotr: TDateTimePicker
    Left = 157
    Top = 175
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39362.0028090625
    Time = 39362.0028090625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
  end
end
