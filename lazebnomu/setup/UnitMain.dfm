object Form1: TForm1
  Left = 315
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1090#1077#1093'.'#1089#1088#1077#1076#1089#1090#1074' '#1080' '#1079#1085#1072#1085#1080#1081' '#1087#1077#1088#1089#1086#1085#1072 +
    #1083#1072' '#1062#1057
  ClientHeight = 182
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 182
    Align = alLeft
    Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' C'#1059#1041#1044' MySQL'
    TabOrder = 0
    object Button2: TButton
      Left = 40
      Top = 32
      Width = 75
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button2Click
    end
    object CheckBox4: TCheckBox
      Left = 32
      Top = 104
      Width = 153
      Height = 17
      Caption = #1071#1088#1083#1099#1082#1080' '#1085#1072' '#1088#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox5: TCheckBox
      Left = 33
      Top = 80
      Width = 203
      Height = 17
      Caption = #1040#1074#1090#1086#1079#1072#1087#1091#1089#1082' '#1057#1059#1041#1044' MySQL'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox6: TCheckBox
      Left = 32
      Top = 128
      Width = 217
      Height = 17
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1057#1059#1041#1044' '#1087#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 305
    Top = 0
    Width = 309
    Height = 182
    Align = alClient
    Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1086#1081' '#1086#1073#1086#1083#1086#1095#1082#1080
    TabOrder = 1
    object CheckBox2: TCheckBox
      Left = 33
      Top = 80
      Width = 203
      Height = 17
      Caption = #1040#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 32
      Top = 104
      Width = 153
      Height = 17
      Caption = #1071#1088#1083#1099#1082' '#1085#1072' '#1088#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 32
      Top = 128
      Width = 236
      Height = 17
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1087#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object Button1: TButton
      Left = 48
      Top = 32
      Width = 81
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
