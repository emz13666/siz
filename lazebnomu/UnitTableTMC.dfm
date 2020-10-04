object frmTableTMC: TfrmTableTMC
  Left = 127
  Top = 99
  Width = 1004
  Height = 560
  Caption = #1059#1095#1077#1090' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 996
    Height = 61
    ButtonHeight = 21
    ButtonWidth = 89
    Caption = 'ToolBar1'
    TabOrder = 1
    DesignSize = (
      996
      59)
    object btnAdd: TSpeedButton
      Left = 0
      Top = 2
      Width = 88
      Height = 21
      Hint = 'Insert'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (Ins)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton2: TToolButton
      Left = 88
      Top = 2
      Width = 3
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnEdit: TSpeedButton
      Left = 91
      Top = 2
      Width = 114
      Height = 21
      Hint = 'F2'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' (F2)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton3: TToolButton
      Left = 205
      Top = 2
      Width = 3
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnDel: TSpeedButton
      Left = 208
      Top = 2
      Width = 60
      Height = 21
      Hint = 'Delete'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDelClick
    end
    object ToolButton4: TToolButton
      Left = 268
      Top = 2
      Width = 3
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnExcel: TButton
      Left = 271
      Top = 2
      Width = 46
      Height = 21
      Hint = 'Ctrl+P'
      Caption = 'EXCEL'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object ToolButton5: TToolButton
      Left = 317
      Top = 2
      Width = 12
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 329
      Top = 2
      Width = 58
      Height = 21
      AutoSize = False
      Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086':'
      Layout = tlCenter
    end
    object cbFields: TComboBox
      Left = 387
      Top = 2
      Width = 122
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        #1053#1072#1080#1084#1077#1085'. '#1074' '#1089#1072#1083#1100#1076#1086#1074#1082#1077
        #1052#1086#1076#1077#1083#1100
        #1057#1077#1088#1080#1081#1085#1099#1081' '#8470
        #1048#1085#1074#1077#1085#1090'. '#8470
        #1053#1086#1084#1077#1085#1082#1083'. '#8470
        #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'. '
        #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        #1057#1090#1086#1080#1084#1086#1089#1090#1100
        #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077)
    end
    object edtFind: TEdit
      Left = 509
      Top = 2
      Width = 95
      Height = 21
      TabOrder = 0
    end
    object btnFind: TBitBtn
      Left = 604
      Top = 2
      Width = 69
      Height = 21
      Caption = #1053#1072#1081#1090#1080' (F3)'
      TabOrder = 1
      OnClick = btnFindClick
    end
    object ToolButton6: TToolButton
      Left = 0
      Top = 2
      Width = 12
      Caption = 'ToolButton6'
      ImageIndex = 4
      Wrap = True
      Style = tbsSeparator
    end
    object Label2: TLabel
      Left = 0
      Top = 31
      Width = 58
      Height = 21
      AutoSize = False
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086':'
      Layout = tlCenter
    end
    object cbFiltr: TComboBox
      Left = 58
      Top = 31
      Width = 122
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbFiltrChange
      Items.Strings = (
        #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        #1053#1072#1080#1084#1077#1085'. '#1074' '#1089#1072#1083#1100#1076#1086#1074#1082#1077
        #1052#1086#1076#1077#1083#1100
        #1057#1077#1088#1080#1081#1085#1099#1081' '#8470
        #1048#1085#1074#1077#1085#1090'. '#8470
        #1053#1086#1084#1077#1085#1082#1083'. '#8470
        #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'. '
        #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        #1057#1090#1086#1080#1084#1086#1089#1090#1100
        #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        #1059#1095#1072#1089#1090#1086#1082
        #1052'.'#1054'.'#1051'.')
    end
    object cbUchastok: TComboBox
      Left = 180
      Top = 31
      Width = 149
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = cbUchastokChange
      Items.Strings = (
        #1091#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
        #1059#1056#1057
        #1043#1060#1059' '#1057#1060
        #1043#1060#1059' '#1051#1057#1057
        #1043#1060#1059' '#1057#1050
        #1059#1095#1072#1089#1090#1086#1082' '#1057#1058
        #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080
        #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1089#1074#1103#1079#1080
        #1053#1045#1054#1055#1056#1045#1044#1045#1051#1045#1053#1054
        #1054#1090#1076#1077#1083' '#1089#1077#1090#1077#1074#1099#1093' '#1082#1086#1084#1084#1091#1085#1080#1082#1072#1094#1080#1081
        #1054#1090#1076#1077#1083' '#1089#1074#1103#1079#1080)
    end
    object btnFiltr: TButton
      Left = 329
      Top = 31
      Width = 80
      Height = 21
      Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = btnFiltrClick
    end
    object ToolButton1: TToolButton
      Left = 409
      Top = 31
      Width = 37
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object Button1: TButton
      Left = 446
      Top = 31
      Width = 88
      Height = 21
      Caption = #1062#1074#1077#1090' '#1089#1090#1088#1086#1082#1080'...'
      TabOrder = 7
      OnClick = Button1Click
    end
    object cbShowMobila: TComboBox
      Left = 534
      Top = 31
      Width = 255
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = cbShowMobilaChange
      Items.Strings = (
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1086#1090#1086#1074#1099#1077' '#1090#1077#1083#1077#1092#1086#1085#1099
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1058#1052#1062' '#1082#1088#1086#1084#1077' '#1089#1086#1090#1086#1074#1099#1093
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1058#1052#1062
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1084#1077#1073#1077#1083#1100' '#1080' '#1080#1085#1074#1077#1085#1090#1072#1088#1100)
    end
    object ToolButton7: TToolButton
      Left = 789
      Top = 31
      Width = 68
      Caption = 'ToolButton7'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object Button2: TButton
      Left = 857
      Top = 31
      Width = 64
      Height = 21
      Caption = #1057#1080#1085#1093#1088'-'#1094#1080#1103
      TabOrder = 9
      OnClick = Button2Click
    end
  end
  object GridTMC: TToolTipsDBGrid
    Left = 0
    Top = 61
    Width = 996
    Height = 453
    Align = alClient
    DataSource = DM.DS_tmc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = GridElBezDrawColumnCell
    OnDblClick = GridMetrologiyaDblClick
    OnTitleClick = GridTMCTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name_uch'
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mol'
        Title.Caption = #1052'.'#1054'.'#1051'.'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_num'
        Title.Caption = #1048#1085#1074#1077#1085#1090'. '#8470
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomenkl_num'
        Title.Caption = #1053#1086#1084#1077#1085#1082#1083'. '#8470
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firma'
        Title.Caption = #1053#1072#1080#1084#1077#1085'. '#1074' '#1089#1072#1083#1100#1076#1086#1074#1082#1077
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'place_install'
        Title.Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serial_num'
        Title.Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#8470
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ed_izm'
        Title.Caption = #1045#1076'. '#1080#1079#1084'.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol_vo'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stoimost'
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'model'
        Title.Caption = #1052#1086#1076#1077#1083#1100
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_input'
        Title.Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'.'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sostoyanie'
        Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prim'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 298
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 514
    Width = 996
    Height = 19
    Panels = <
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 496
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 168
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N3Click
    end
  end
  object FormStorage1: TFormStorage
    Options = []
    UseRegistry = True
    StoredProps.Strings = (
      'GridTMC.Columns')
    StoredValues = <>
    Left = 288
    Top = 192
  end
end
