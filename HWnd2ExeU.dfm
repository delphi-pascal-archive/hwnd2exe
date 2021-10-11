object Form1: TForm1
  Left = 273
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'HWnd2EXE'
  ClientHeight = 70
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object lblExe: TLabel
    Left = 8
    Top = 48
    Width = 29
    Height = 16
    Caption = 'EXE:'
  end
  object edtHWnd: TEdit
    Left = 8
    Top = 8
    Width = 225
    Height = 25
    TabOrder = 0
    Text = '$0'
  end
  object btnIdentify: TButton
    Left = 240
    Top = 8
    Width = 105
    Height = 25
    Caption = '&Identify EXE'
    TabOrder = 1
    OnClick = btnIdentifyClick
  end
end
