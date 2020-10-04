object frmUsers: TfrmUsers
  Left = 248
  Top = 180
  Width = 549
  Height = 347
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridUsers: TRxDBGrid
    Left = 0
    Top = 29
    Width = 541
    Height = 291
    Align = alClient
    DataSource = DM.DS_sequrity
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    ShowGlyphs = False
    TitleButtons = True
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #8470' '#1087'/'#1087
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'login'
        Title.Caption = #1051#1086#1075#1080#1085
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'password'
        Title.Caption = #1055#1072#1088#1086#1083#1100
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ushastok_look'
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Width = 188
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 541
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    TabOrder = 1
    object btADD: TButton
      Left = 0
      Top = 2
      Width = 89
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ...'
      TabOrder = 1
      OnClick = btADDClick
    end
    object btEdit: TButton
      Left = 89
      Top = 2
      Width = 102
      Height = 24
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      TabOrder = 2
      OnClick = btEditClick
    end
    object BtnDel: TButton
      Left = 191
      Top = 2
      Width = 75
      Height = 24
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = BtnDelClick
    end
  end
end
