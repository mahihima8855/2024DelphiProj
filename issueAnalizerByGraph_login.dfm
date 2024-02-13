object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 199
  ClientWidth = 329
  Caption = #12525#12464#12452#12531#12375#12390#12367#12384#12373#12356#12290
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 8
    Top = 32
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'userID'
    TabOrder = 0
  end
  object UniEdit1: TUniEdit
    Left = 83
    Top = 32
    Width = 170
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object UniEdit2: TUniEdit
    Left = 83
    Top = 72
    Width = 170
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
    ClearButton = True
  end
  object UniLabel2: TUniLabel
    Left = 16
    Top = 80
    Width = 50
    Height = 13
    Hint = ''
    Caption = 'password'
    TabOrder = 3
  end
  object UniButton1: TUniButton
    Left = 83
    Top = 112
    Width = 170
    Height = 25
    Hint = ''
    Caption = 'Login'
    TabOrder = 4
    OnClick = UniButton1Click
  end
  object UniLabel3: TUniLabel
    Left = 16
    Top = 156
    Width = 51
    Height = 13
    Hint = ''
    Visible = False
    Caption = 'UniLabel3'
    TabOrder = 5
  end
end
