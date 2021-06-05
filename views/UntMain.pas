unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntMainController, Vcl.ComCtrls, Vcl.Menus, Vcl.CategoryButtons,
  Vcl.ButtonGroup;

type
  TEvento = (
   obterFields,
   buscarPorField,
   obterPropertys,
   buscarPorPropertys);

  TFrmMain = class(TForm)
    Resultado: TTreeView;
    Menu: TPopupMenu;
    Abrirtudo: TMenuItem;
    Fechartudo: TMenuItem;
    Limpartudo: TMenuItem;
    Panel1: TPanel;
    ExibirRecursosHerdados: TCheckBox;
    obterFields: TButton;
    buscarPorField: TButton;
    obterPropertys: TButton;
    buscarPorPropertys: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure obterFieldsClick(Sender: TObject);
    procedure AbrirtudoClick(Sender: TObject);
    procedure FechartudoClick(Sender: TObject);
    procedure LimpartudoClick(Sender: TObject);
  private
    FController: TMainController;
    procedure acionarEvento(AEvento: TEvento); overload;
    procedure acionarEvento(Sender: TObject); overload;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.TypInfo, Dialogs;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   FController := TMainController.Create(Resultado);
end;

procedure TFrmMain.LimpartudoClick(Sender: TObject);
begin
   Resultado.Items.Clear;
end;

procedure TFrmMain.obterFieldsClick(Sender: TObject);
begin
   acionarEvento(Sender);
end;

procedure TFrmMain.acionarEvento(Sender: TObject);
var
  nomeEvento: String;
  evento: TEvento;
begin
   nomeEvento := TButton(Sender).Name;
   evento := TEvento(GetEnumValue(TypeInfo(TEvento), nomeEvento));

   acionarEvento(evento);
end;

procedure TFrmMain.FechartudoClick(Sender: TObject);
begin
   Resultado.FullCollapse;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FController.Free;
end;

procedure TFrmMain.AbrirtudoClick(Sender: TObject);
begin
  Resultado.FullExpand;
end;

procedure TFrmMain.acionarEvento(AEvento: TEvento);
var
  entradaDado: String;
begin
   Resultado.Items.Clear;

   Case AEvento Of
      TEvento.obterFields: FController.obterFields(ExibirRecursosHerdados.Checked);
      TEvento.obterPropertys: FController.obterPropertys(ExibirRecursosHerdados.Checked);

      TEvento.buscarPorField,
      TEvento.buscarPorPropertys:
        Begin
           entradaDado := Dialogs.InputBox('Buscar', 'Campo', String.Empty);

           Case AEvento Of
             TEvento.buscarPorField: FController.buscarPorField(ExibirRecursosHerdados.Checked, entradaDado);
             TEvento.buscarPorPropertys: FController.buscarPorPropertys(ExibirRecursosHerdados.Checked, entradaDado);
           End;
        End;
   End;

   Resultado.FullExpand;
end;

end.
