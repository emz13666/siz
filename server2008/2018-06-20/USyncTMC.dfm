object frmSyncTMC: TfrmSyncTMC
  Left = 325
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' c Excel'
  ClientHeight = 176
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TSpeedButton
    Left = 29
    Top = 142
    Width = 80
    Height = 25
    Caption = #1054#1050
    OnClick = btnOkClick
  end
  object btnCancel: TSpeedButton
    Left = 221
    Top = 142
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    OnClick = btnCancelClick
  end
  object RxLabel1: TRxLabel
    Left = 8
    Top = 13
    Width = 84
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083':'
  end
  object FilenameEdit1: TFilenameEdit
    Left = 96
    Top = 9
    Width = 217
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 120
    Width = 321
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 40
    Width = 305
    Height = 73
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
