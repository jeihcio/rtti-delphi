object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Run-time type information'
  ClientHeight = 430
  ClientWidth = 340
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
  object Resultado: TTreeView
    Left = 0
    Top = 0
    Width = 340
    Height = 335
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = True
    Indent = 19
    ParentCtl3D = False
    PopupMenu = Menu
    ReadOnly = True
    TabOrder = 0
    ExplicitWidth = 450
    ExplicitHeight = 416
  end
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 340
    Height = 95
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 416
    ExplicitWidth = 450
    object ExibirRecursosHerdados: TCheckBox
      AlignWithMargins = True
      Left = 6
      Top = 72
      Width = 330
      Height = 17
      Margins.Left = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Exibir recursos herdados'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ExplicitWidth = 440
    end
    object listarFields: TButton
      Left = 6
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Listar campos'
      TabOrder = 1
      OnClick = listarFieldsClick
    end
    object buscarPorField: TButton
      Left = 6
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Buscar campo'
      TabOrder = 2
      OnClick = listarFieldsClick
    end
    object listarPropertys: TButton
      Left = 117
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Listar propertys'
      TabOrder = 3
      OnClick = listarFieldsClick
    end
    object buscarPorPropertys: TButton
      Left = 117
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Buscar propertys'
      TabOrder = 4
      OnClick = listarFieldsClick
    end
    object listarMethods: TButton
      Left = 228
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Listar m'#233'todos'
      TabOrder = 5
      OnClick = listarFieldsClick
    end
    object buscarMethods: TButton
      Left = 228
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Buscar m'#233'todo'
      TabOrder = 6
      OnClick = listarFieldsClick
    end
  end
  object Menu: TPopupMenu
    Left = 384
    Top = 16
    object Abrirtudo: TMenuItem
      Caption = 'Abrir tudo'
      OnClick = AbrirtudoClick
    end
    object Fechartudo: TMenuItem
      Caption = 'Fechar tudo'
      OnClick = FechartudoClick
    end
    object Limpartudo: TMenuItem
      Caption = 'Limpar tudo'
      OnClick = LimpartudoClick
    end
  end
end
