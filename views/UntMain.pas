unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntMainController, Vcl.ComCtrls;

type
  TEvento = (obterFields);
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    BtnFields: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Resultado: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFieldsClick(Sender: TObject);
  private
    FController: TMainController;
    procedure acionarEvento(AEvento: TEvento);
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   FController := TMainController.Create(Resultado);
end;

procedure TFrmMain.BtnFieldsClick(Sender: TObject);
begin
   acionarEvento(obterFields);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FController.Free;
end;

procedure TFrmMain.acionarEvento(AEvento: TEvento);
begin
   resultado.Items.Clear;

   Case AEvento Of
      obterFields: FController.obterFields();
   End;

   Resultado.FullExpand;
end;

end.
