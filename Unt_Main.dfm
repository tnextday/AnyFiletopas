object Form_Main: TForm_Main
  Left = 200
  Top = 182
  Width = 483
  Height = 151
  Caption = 'Form_Main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 67
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Button1: TButton
    Left = 384
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 48
    Top = 64
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 96
    Width = 449
    Height = 16
    TabOrder = 3
  end
  object Button2: TButton
    Left = 312
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 383
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 39
    Width = 361
    Height = 21
    TabOrder = 6
  end
  object dlgOpen1: TOpenDialog
    Left = 264
  end
  object dlgSave1: TSaveDialog
    Filter = 'Pas(*.pas)|*.pas'
    Left = 304
    Top = 40
  end
end
