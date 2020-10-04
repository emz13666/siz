object frmAuth: TfrmAuth
  Left = 408
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 216
  ClientWidth = 276
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtUser: TLabeledEdit
    Left = 8
    Top = 66
    Width = 257
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    Text = 'admin'
  end
  object edtPassword: TLabeledEdit
    Left = 8
    Top = 122
    Width = 257
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
    Text = 'admin'
  end
  object checkMemory: TCheckBox
    Left = 8
    Top = 159
    Width = 97
    Height = 17
    Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 16
    Top = 186
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 184
    Top = 186
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object checkAutoInput: TCheckBox
    Left = 154
    Top = 159
    Width = 79
    Height = 17
    Caption = #1040#1074#1090#1086#1074#1093#1086#1076
    TabOrder = 5
    OnClick = checkAutoInputClick
  end
  object Host: TLabeledEdit
    Left = 8
    Top = 18
    Width = 257
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1077#1088#1074#1077#1088
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 6
    Text = '127.0.0.1'
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 128
    Top = 186
  end
end
