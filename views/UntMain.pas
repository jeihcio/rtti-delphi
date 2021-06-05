unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntMainController, Vcl.ComCtrls, Vcl.Menus;

type
  TEvento = (obterFields, buscarPorField);
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    obterFields: TButton;
    buscarPorField: TButton;
    Button3: TButton;
    Button4: TButton;
    Resultado: TTreeView;
    Menu: TPopupMenu;
    Abrirtudo: TMenuItem;
    Fechartudo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure obterFieldsClick(Sender: TObject);
    procedure AbrirtudoClick(Sender: TObject);
    procedure FechartudoClick(Sender: TObject);
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
      TEvento.obterFields: FController.obterFields();

      TEvento.buscarPorField:
        Begin
           entradaDado := Dialogs.InputBox('Buscar', 'Campo', String.Empty);
           FController.buscarPorField(entradaDado);
        End;
   End;

   Resultado.FullExpand;
end;

end.
