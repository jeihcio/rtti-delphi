object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RTTI'
  ClientHeight = 511
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 406
    Width = 450
    Height = 105
    Align = alBottom
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = obterFields
        Row = 0
      end
      item
        Column = 1
        Control = buscarPorField
        Row = 0
      end
      item
        Column = 0
        Control = Button3
        Row = 1
      end
      item
        Column = 1
        Control = Button4
        Row = 1
      end>
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    ExplicitTop = 0
    ExplicitWidth = 457
    object obterFields: TButton
      Left = 10
      Top = 10
      Width = 210
      Height = 37
      Align = alClient
      Caption = 'Listar Campos'
      TabOrder = 0
      OnClick = obterFieldsClick
      ExplicitWidth = 208
      ExplicitHeight = 15
    end
    object buscarPorField: TButton
      Left = 230
      Top = 10
      Width = 210
      Height = 37
      Align = alClient
      Caption = 'Buscar Campo '
      TabOrder = 1
      OnClick = obterFieldsClick
      ExplicitLeft = 302
      ExplicitTop = 16
      ExplicitWidth = 208
      ExplicitHeight = 15
    end
    object Button3: TButton
      Left = 10
      Top = 57
      Width = 210
      Height = 38
      Align = alClient
      Caption = 'Button1'
      TabOrder = 2
      OnClick = obterFieldsClick
      ExplicitLeft = 79
      ExplicitTop = 63
      ExplicitWidth = 208
      ExplicitHeight = 15
    end
    object Button4: TButton
      Left = 230
      Top = 57
      Width = 210
      Height = 38
      Align = alClient
      Caption = 'Button1'
      TabOrder = 3
      OnClick = obterFieldsClick
      ExplicitLeft = 302
      ExplicitTop = 63
      ExplicitWidth = 208
      ExplicitHeight = 15
    end
  end
  object Resultado: TTreeView
    Left = 0
    Top = 0
    Width = 450
    Height = 406
    Align = alClient
    Indent = 19
    TabOrder = 1
    ExplicitLeft = 168
    ExplicitTop = 240
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
end
