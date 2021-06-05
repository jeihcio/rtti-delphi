unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntMainController, Vcl.ComCtrls;

type
  TEvento = (obterFields, buscarPorField);
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    obterFields: TButton;
    buscarPorField: TButton;
    Button3: TButton;
    Button4: TButton;
    Resultado: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure obterFieldsClick(Sender: TObject);
  private
    FController: TMainController;
    procedure acionarEvento(AEvento: TEvento); overload;
    procedure acionarEvento(Sender: TObject); overload;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.TypInfo;

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

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FController.Free;
end;

procedure TFrmMain.acionarEvento(AEvento: TEvento);
begin
   Resultado.Items.Clear;

   Case AEvento Of
      TEvento.obterFields: FController.obterFields();
   End;

   Resultado.FullExpand;
end;

end.
