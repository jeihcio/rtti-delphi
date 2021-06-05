object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Run-time type information'
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
  object Resultado: TTreeView
    Left = 0
    Top = 0
    Width = 450
    Height = 416
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = True
    Indent = 19
    ParentCtl3D = False
    PopupMenu = Menu
    ReadOnly = True
    TabOrder = 0
    ExplicitHeight = 193
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 450
    Height = 95
    Align = alBottom
    TabOrder = 1
    object ExibirRecursosHerdados: TCheckBox
      AlignWithMargins = True
      Left = 6
      Top = 72
      Width = 440
      Height = 17
      Margins.Left = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Exibir recursos herdados'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 114
      ExplicitWidth = 436
    end
    object obterFields: TButton
      Left = 6
      Top = 6
      Width = 91
      Height = 25
      Caption = 'Obter campos'
      TabOrder = 1
      OnClick = obterFieldsClick
    end
    object buscarPorField: TButton
      Left = 6
      Top = 37
      Width = 91
      Height = 25
      Caption = 'Buscar campo'
      TabOrder = 2
      OnClick = obterFieldsClick
    end
    object obterPropertys: TButton
      Left = 103
      Top = 6
      Width = 91
      Height = 25
      Caption = 'Obter propertys'
      TabOrder = 3
      OnClick = obterFieldsClick
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
