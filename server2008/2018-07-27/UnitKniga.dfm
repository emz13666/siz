object frmKniga: TfrmKniga
  Left = 257
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1085#1080#1075#1072' '#1086#1090#1079#1099#1074#1086#1074' '#1080' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1081
  ClientHeight = 449
  ClientWidth = 550
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
    Left = 8
    Top = 52
    Width = 334
    Height = 13
    Caption = #1053#1072#1087#1080#1096#1080#1090#1077' '#1079#1076#1077#1089#1100' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103', '#1087#1086#1078#1077#1083#1072#1085#1080#1103', '#1086#1090#1079#1099#1074#1099' '#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 97
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096#1077' '#1080#1084#1103':'
  end
  object Label3: TLabel
    Left = 8
    Top = 176
    Width = 101
    Height = 13
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1086#1090#1079#1099#1074#1099':'
  end
  object edtOtziv: TMemo
    Left = 8
    Top = 76
    Width = 345
    Height = 89
    TabOrder = 0
  end
  object edtName: TEdit
    Left = 112
    Top = 13
    Width = 241
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 400
    Top = 13
    Width = 121
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1079#1099#1074
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0000FF
      FFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FF
      FFFFFFFFFF0000FFFFFF00000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FF
      FFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFF}
    Margin = 7
    Spacing = 6
  end
  object BitBtn2: TBitBtn
    Left = 402
    Top = 77
    Width = 119
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
    Margin = 6
    Spacing = 20
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 192
    Width = 550
    Height = 257
    AllowDelete = False
    AllowInsert = False
    ColCount = 1
    DataSource = DM.DS_kniga
    PanelHeight = 85
    PanelWidth = 534
    TabOrder = 4
    RowCount = 3
    SelectedColor = clBackground
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label5: TLabel
      Left = 8
      Top = 32
      Width = 25
      Height = 13
      Caption = #1048#1084#1103':'
    end
    object DBText1: TDBText
      Left = 42
      Top = 8
      Width = 121
      Height = 17
      DataField = 'date_time'
      DataSource = DM.DS_kniga
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 42
      Top = 33
      Width = 106
      Height = 17
      DataField = 'name'
      DataSource = DM.DS_kniga
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DBMemo1: TDBMemo
      Left = 176
      Top = 2
      Width = 355
      Height = 81
      TabStop = False
      Color = clMoneyGreen
      DataField = 'otziv'
      DataSource = DM.DS_kniga
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
