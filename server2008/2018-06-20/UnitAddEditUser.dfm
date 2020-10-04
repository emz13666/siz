object frmAdd_Edit_user: TfrmAdd_Edit_user
  Left = 332
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmAdd_Edit'
  ClientHeight = 205
  ClientWidth = 197
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
    Left = 13
    Top = 170
    Width = 80
    Height = 23
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 109
    Top = 170
    Width = 80
    Height = 23
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object Label6: TLabel
    Left = 12
    Top = 113
    Width = 45
    Height = 13
    Caption = #1059#1095#1072#1089#1090#1086#1082':'
  end
  object cbUchastok: TComboBox
    Left = 10
    Top = 129
    Width = 175
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
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
      #1059#1095#1072#1089#1090#1086#1082' '#1084#1077#1093#1072#1085#1080#1079#1072#1094#1080#1080)
  end
  object edtPassword: TLabeledEdit
    Left = 8
    Top = 72
    Width = 177
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = edtPasswordKeyDown
  end
  object edtLogin: TLabeledEdit
    Left = 8
    Top = 16
    Width = 177
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
end
