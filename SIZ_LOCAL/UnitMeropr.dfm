object frmMeropr: TfrmMeropr
  Left = 149
  Top = 112
  Width = 843
  Height = 480
  Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
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
    object BtnView: TButton
      Left = 0
      Top = 2
      Width = 145
      Height = 24
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
      TabOrder = 0
      OnClick = BtnViewClick
    end
    object btnAkt: TButton
      Left = 145
      Top = 2
      Width = 96
      Height = 24
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1082#1090#1072
      TabOrder = 4
      OnClick = btnAktClick
    end
    object btADD: TButton
      Left = 241
      Top = 2
      Width = 120
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ...'
      TabOrder = 2
      OnClick = btADDClick
    end
    object btEdit: TButton
      Left = 361
      Top = 2
      Width = 102
      Height = 24
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      TabOrder = 3
      OnClick = btEditClick
    end
    object BtnDel: TButton
      Left = 463
      Top = 2
      Width = 75
      Height = 24
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = BtnDelClick
    end
  end
  object GridMeropr: TRxDBGrid
    Left = 0
    Top = 29
    Width = 835
    Height = 424
    Align = alClient
    DataSource = DM.DS_meropr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnCellClick = GridMeroprCellClick
    OnDrawColumnCell = GridMeroprDrawColumnCell
    OnDblClick = GridMeroprDblClick
    ShowGlyphs = False
    TitleButtons = True
    Columns = <
      item
        Expanded = False
        FieldName = 'id_meropr'
        Title.Caption = #8470' '#1087'/'#1087
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_meropr'
        Title.Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uchastok_look'
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'srok_ispoln'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_end'
        Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otm_vipoln'
        Title.Caption = #1054#1090#1084#1077#1090#1082#1072' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vip_vichisl'
        Title.Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086
        Width = 75
        Visible = True
      end>
  end
end
