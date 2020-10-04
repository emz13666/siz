object frmInfo: TfrmInfo
  Left = 149
  Top = 112
  Width = 843
  Height = 480
  Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 835
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    TabOrder = 1
    object btnUp: TButton
      Left = 0
      Top = 2
      Width = 75
      Height = 24
      Caption = #1042#1074#1077#1088#1093
      TabOrder = 5
      OnClick = btnUpClick
    end
    object BtnView: TButton
      Left = 75
      Top = 2
      Width = 82
      Height = 24
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 0
      OnClick = BtnViewClick
    end
    object btADD: TButton
      Left = 157
      Top = 2
      Width = 127
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090'...'
      TabOrder = 2
      OnClick = btADDClick
    end
    object btnAddRazdel: TButton
      Left = 284
      Top = 2
      Width = 120
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083'...'
      TabOrder = 4
      OnClick = btnAddRazdelClick
    end
    object btEdit: TButton
      Left = 404
      Top = 2
      Width = 102
      Height = 24
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      TabOrder = 3
      OnClick = btEditClick
    end
    object BtnDel: TButton
      Left = 506
      Top = 2
      Width = 75
      Height = 24
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = BtnDelClick
    end
  end
  object GridInfo: TRxDBGrid
    Left = 0
    Top = 29
    Width = 835
    Height = 424
    Align = alClient
    DataSource = DM.DS_tblinfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = GridInfoDrawColumnCell
    OnDblClick = GridInfoDblClick
    ShowGlyphs = False
    TitleButtons = True
    OnTitleBtnClick = GridInfoTitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'shifr_info'
        Title.Caption = #1064#1080#1092#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_info'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 685
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 152
    object N1: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N5Click
    end
  end
end
