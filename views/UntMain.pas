unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntMainController, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    BtnFields: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Resultado: TTreeView;
    procedure BtnFieldsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController: TMainController;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   FController := TMainController.Create(Resultado);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FController.Free;
end;

procedure TFrmMain.BtnFieldsClick(Sender: TObject);
begin
    resultado.Items.Clear;
    FController.obterFields();
    Resultado.FullExpand;
end;

end.
