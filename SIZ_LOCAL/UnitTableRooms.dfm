object frmTableRooms: TfrmTableRooms
  Left = 152
  Top = 100
  Width = 1063
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
    Width = 1055
    Height = 33
    ButtonHeight = 25
    ButtonWidth = 89
    Caption = 'ToolBar1'
    TabOrder = 1
    DesignSize = (
      1055
      31)
    object cbUchastok: TComboBox
      Left = 0
      Top = 4
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbUchastokChange
      Items.Strings = (
        #1091#1095#1072#1089#1090#1086#1082' '#1040#1058#1057' '#1080' '#1062#1050
        #1059#1056#1057
        #1043#1060#1059' '#1057#1060
        #1043#1060#1059' '#1051#1057#1057
        #1043#1060#1059' '#1057#1050
        #1043#1088#1091#1087#1087#1072' '#1084#1077#1093#1072#1085#1080#1079#1072#1094#1080#1080
        #1042#1089#1077' '#1091#1095#1072#1089#1090#1082#1080)
    end
    object btnAdd: TSpeedButton
      Left = 113
      Top = 2
      Width = 88
      Height = 25
      Hint = 'Insert'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (Ins)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton2: TToolButton
      Left = 201
      Top = 2
      Width = 3
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnEdit: TSpeedButton
      Left = 204
      Top = 2
      Width = 114
      Height = 25
      Hint = 'F2'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' (F2)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton3: TToolButton
      Left = 318
      Top = 2
      Width = 3
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnDel: TSpeedButton
      Left = 321
      Top = 2
      Width = 60
      Height = 25
      Hint = 'Delete'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDelClick
    end
    object ToolButton4: TToolButton
      Left = 381
      Top = 2
      Width = 3
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnExcel: TButton
      Left = 384
      Top = 2
      Width = 46
      Height = 25
      Hint = 'Ctrl+P'
      Caption = 'EXCEL'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnExcelClick
    end
    object ToolButton1: TToolButton
      Left = 430
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btn_passport: TButton
      Left = 438
      Top = 2
      Width = 123
      Height = 25
      Caption = #1055#1072#1089#1087#1086#1088#1090' '#1087#1086#1084#1077#1097#1077#1085#1080#1103
      TabOrder = 2
      OnClick = btn_passportClick
    end
  end
  object GridRooms: TToolTipsDBGrid
    Left = 0
    Top = 33
    Width = 1055
    Height = 481
    Align = alClient
    DataSource = DM.DS_rooms
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
    OnTitleClick = GridRoomsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name_uch'
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_room'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'place_room'
        Title.Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'area_room'
        Title.Caption = #1055#1083#1086#1097#1072#1076#1100
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'link_tmc_place'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number_room'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'naznachenie'
        Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sostoyanie'
        Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prim'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 514
    Width = 1055
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
end
