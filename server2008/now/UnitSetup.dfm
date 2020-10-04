object frmSetup: TfrmSetup
  Left = 350
  Top = 229
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1081
  ClientHeight = 333
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 87
    Top = 40
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1090#1100' '#1079#1072
  end
  object Label2: TLabel
    Left = 50
    Top = 88
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077' '#1082#1072#1078#1076#1099#1077
  end
  object Label3: TLabel
    Left = 48
    Top = 135
    Width = 115
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1090#1100' '#1074' '#1090#1077#1095#1077#1085#1080#1080
  end
  object Label4: TLabel
    Left = 232
    Top = 40
    Width = 18
    Height = 13
    Caption = #1076#1085#1103
  end
  object Label5: TLabel
    Left = 232
    Top = 88
    Width = 30
    Height = 13
    Caption = #1084#1080#1085#1091#1090
  end
  object Label6: TLabel
    Left = 232
    Top = 136
    Width = 35
    Height = 13
    Caption = #1089#1077#1082#1091#1085#1076
  end
  object edtNapZa: TSpinEdit
    Left = 177
    Top = 38
    Width = 48
    Height = 22
    MaxValue = 365
    MinValue = 0
    TabOrder = 0
    Value = 2
  end
  object edtNapKagdie: TSpinEdit
    Left = 177
    Top = 86
    Width = 48
    Height = 22
    MaxValue = 1440
    MinValue = 1
    TabOrder = 1
    Value = 120
  end
  object edtNapVTechenie: TSpinEdit
    Left = 177
    Top = 130
    Width = 48
    Height = 22
    MaxValue = 200000
    MinValue = 1
    TabOrder = 2
    Value = 0
  end
  object btnOK: TBitBtn
    Left = 17
    Top = 291
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 252
    Top = 291
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnDefault: TBitBtn
    Left = 117
    Top = 291
    Width = 113
    Height = 25
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 5
    OnClick = btnDefaultClick
    Kind = bkAll
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 176
    Width = 313
    Height = 97
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1074#1091#1082#1072
    TabOrder = 6
    object RadioButton1: TRadioButton
      Left = 16
      Top = 16
      Width = 137
      Height = 17
      Caption = #1047#1074#1091#1082' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = #1047#1074#1091#1082#1086#1074#1086#1081' '#1092#1072#1081#1083
      TabOrder = 1
    end
    object edtSound: TEdit
      Left = 16
      Top = 64
      Width = 153
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object Button1: TButton
      Left = 168
      Top = 64
      Width = 75
      Height = 25
      Caption = #1054#1073#1079#1086#1088
      TabOrder = 3
      OnClick = Button1Click
    end
    object chkSND_LOOP: TCheckBox
      Left = 136
      Top = 40
      Width = 73
      Height = 17
      Caption = #1055#1086#1074#1090#1086#1088
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'WAVE file|*.wav'
    Left = 296
    Top = 120
  end
end
