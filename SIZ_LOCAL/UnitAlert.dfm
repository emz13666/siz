object frmAlert: TfrmAlert
  Left = 210
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1053#1048#1052#1040#1053#1048#1045'!'
  ClientHeight = 366
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 420
    Height = 13
    Caption = #1055#1056#1054#1057#1056#1054#1063#1045#1053#1040' ('#1048#1051#1048' '#1057#1050#1054#1056#1054' '#1041#1059#1044#1045#1058' '#1055#1056#1054#1057#1056#1054#1063#1045#1053#1040') '#1044#1040#1058#1040' '#1055#1056#1054#1042#1045#1056#1050#1048':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object BitBtn1: TBitBtn
    Left = 226
    Top = 330
    Width = 261
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object ListBox1: TListBox
    Left = 0
    Top = 48
    Width = 726
    Height = 265
    TabStop = False
    ItemHeight = 13
    TabOrder = 1
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 504
    Top = 8
  end
end
