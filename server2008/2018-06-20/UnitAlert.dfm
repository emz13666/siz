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
  object SpeedButton1: TSpeedButton
    Left = 511
    Top = 331
    Width = 23
    Height = 22
    AllowAllUp = True
    GroupIndex = 1
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D8000000C30E0000C30E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888880000008888888788711788880000008888887871999918880000008888
      878F998FF99988000000888878F898FF79998800000087778FF89FF799F97800
      000087F7FFF89F899FF97800000087F7FFF89999FF898800000087F7FFFF9998
      F8998800000087F7FFFF799999988800000087F7FFFF788198888800000087F7
      FFFF788888888800000087778FFF7888888888000000888878FF788888888800
      00008888878F7888888888000000888888787888888888000000888888878888
      888888000000888888888888888888000000}
    OnClick = SpeedButton1Click
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
