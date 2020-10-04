object frmTable: TfrmTable
  Left = 111
  Top = 163
  Width = 937
  Height = 563
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 929
    Height = 500
    ActivePage = tsZazeml
    Align = alClient
    MultiLine = True
    TabIndex = 3
    TabOrder = 0
    object tsElektroinstrument: TTabSheet
      Caption = #1069#1083#1077#1082#1090#1088#1086#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090
      object GridElInstr: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_elinstr
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsTakelag: TTabSheet
      Caption = #1058#1072#1082#1077#1083#1072#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072
      ImageIndex = 1
      object GridTakelag: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_Takel
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1103
            Width = 350
            Visible = True
          end>
      end
    end
    object tsSiz: TTabSheet
      Caption = #1047#1072#1097#1080#1090#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072
      ImageIndex = 2
      object GridSIZ: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_SIZ
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateOsmotrnext'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1086#1089#1084#1086#1090#1088#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsZazeml: TTabSheet
      Caption = #1047#1072#1079#1077#1084#1083#1103#1102#1097#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
      ImageIndex = 3
      object GridZazeml: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 454
        Align = alClient
        DataSource = DM.DS_ZAZEML
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateOsmotrnext'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1086#1089#1084#1086#1090#1088#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsElektrobezopasn: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085#1080#1081': '#1101#1083#1077#1082#1090#1088#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100
      ImageIndex = 4
      object GridElBez: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_ElBez
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tab_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_udost'
            Title.Caption = #8470' '#1091#1076#1086#1089#1090'.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gruppa_el'
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_protokol'
            Title.Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 85
            Visible = True
          end>
      end
    end
    object tsOTiPB: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085#1080#1081': '#1054#1058' '#1080' '#1055#1041
      ImageIndex = 5
      object GridOTiPB: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_OTiPB
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tab_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_udost'
            Title.Caption = #8470' '#1091#1076#1086#1089#1090'.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_protokol'
            Title.Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 85
            Visible = True
          end>
      end
    end
    object tsGPM: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085#1080#1081': '#1043#1055#1052
      ImageIndex = 6
      object GridGPM: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_GPM
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tab_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'professiya'
            Title.Caption = #1042#1090#1086#1088#1072#1103' '#1087#1088#1086#1092#1077#1089#1089#1080#1103
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_udost'
            Title.Caption = #8470' '#1091#1076#1086#1089#1090'.'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_protokol'
            Title.Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 85
            Visible = True
          end>
      end
    end
    object tsMetalStanki: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1085#1080#1081': '#1084#1077#1090#1086#1083#1083#1086#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1102#1097#1080#1077' '#1089#1090#1072#1085#1082#1080
      ImageIndex = 7
      object GridMetalStanki: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_MetStanki
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tab_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_udost'
            Title.Caption = #8470' '#1091#1076#1086#1089#1090'.'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_protokol'
            Title.Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 85
            Visible = True
          end>
      end
    end
    object tsTrenirovki: TTabSheet
      Caption = #1058#1088#1077#1085#1080#1088#1086#1074#1082#1080
      ImageIndex = 8
      object GridTrenirovki: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_trenirovki
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tub_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vid'
            Title.Caption = #1042#1080#1076' '#1080#1085#1089#1090#1088#1091#1082#1090#1072#1078#1072
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tema'
            Title.Caption = #1058#1077#1084#1072
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086
            Width = 170
            Visible = True
          end>
      end
    end
    object tsOgnetusitel: TTabSheet
      Caption = #1057#1088#1077#1076#1089#1090#1074#1072' '#1087#1086#1078#1072#1088#1086#1090#1091#1096#1077#1085#1080#1103
      ImageIndex = 9
      object GridOgnetush: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_Ognetush
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsInstruktagi: TTabSheet
      Caption = #1048#1085#1089#1090#1088#1091#1082#1090#1072#1078#1080
      ImageIndex = 10
      object GridInstruktagi: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_Instruktagi
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tub_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103'/'#1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam_instruktor'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1085#1089#1090#1088#1091#1082#1090#1086#1088#1072
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vid'
            Title.Caption = #1042#1080#1076' '#1080#1085#1089#1090#1088#1091#1082#1090#1072#1078#1072
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tema'
            Title.Caption = #1058#1077#1084#1072
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086
            Width = 170
            Visible = True
          end>
      end
    end
    object tsOthers: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 11
      object GridOthers: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_Others
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 286
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsMetrologiya: TTabSheet
      Caption = #1052#1077#1090#1088#1086#1083#1086#1075#1080#1103
      ImageIndex = 12
      object GridMetrologiya: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_metrologiya
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'inv_number'
            Title.Caption = #1048#1085#1074'. '#8470
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'place_install'
            Title.Caption = #1052#1077#1089#1090#1086#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
            Width = 350
            Visible = True
          end>
      end
    end
    object tsFlurografia: TTabSheet
      Caption = #1060#1083#1102#1088#1086#1075#1088#1072#1092#1080#1103
      ImageIndex = 13
      object GridFlurografia: TRxDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 461
        Align = alClient
        DataSource = DM.DS_flurografia
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
        TitleButtons = True
        OnTitleBtnClick = GridOTiPBTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name_uch'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tab_num'
            Title.Caption = #1058#1072#1073'. '#8470
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fam'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1048#1084#1103
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sec_name'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dolgnost'
            Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_first'
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_next'
            Title.Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1077#1088#1082#1080
            Width = 171
            Visible = True
          end>
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 929
    Height = 29
    ButtonHeight = 23
    ButtonWidth = 89
    Caption = 'ToolBar1'
    TabOrder = 1
    DesignSize = (
      929
      27)
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 25
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btnAdd: TSpeedButton
      Left = 25
      Top = 2
      Width = 90
      Height = 23
      Hint = 'Insert'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (Ins)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton2: TToolButton
      Left = 115
      Top = 2
      Width = 30
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnEdit: TSpeedButton
      Left = 145
      Top = 2
      Width = 116
      Height = 23
      Hint = 'F2'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' (F2)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object ToolButton3: TToolButton
      Left = 261
      Top = 2
      Width = 36
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnDel: TSpeedButton
      Left = 297
      Top = 2
      Width = 90
      Height = 23
      Hint = 'Delete'
      Caption = #1059#1076#1072#1083#1080#1090#1100' (Del)'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDelClick
    end
    object ToolButton4: TToolButton
      Left = 387
      Top = 2
      Width = 38
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnExcel: TButton
      Left = 425
      Top = 2
      Width = 75
      Height = 23
      Hint = 'Ctrl+P'
      Caption = 'EXCEL'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnExcelClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 216
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100'...'
      OnClick = N3Click
    end
  end
end
