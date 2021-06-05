unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntClasseExample, System.Rtti, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    BtnFields: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Resultado: TTreeView;
    procedure BtnFieldsClick(Sender: TObject);
  private
    function addNaTreeView(ANodePrincipal: String): TTreeNode ; overload;
    function addNaTreeView(ANodePai: TTreeNode; ANodePrincipal: String; AListaFilhos: TArray<String>): TTreeNode; overload;

    procedure obterFields();
  public
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.TypInfo;

{$R *.dfm}

function TFrmMain.addNaTreeView(ANodePai: TTreeNode; ANodePrincipal: String;
  AListaFilhos: TArray<String>): TTreeNode;
var
  index: Integer;
begin
   If Not Assigned(ANodePai) Then
      Result := Resultado.Items.Add(nil, ANodePrincipal)
   Else
      Result := Resultado.Items.AddChild(ANodePai, ANodePrincipal);

   For index := 0 To Length(AListaFilhos) - 1 Do
      Resultado.Items.AddChild(Result, AListaFilhos[index]) ;
end;

function TFrmMain.addNaTreeView(ANodePrincipal: String): TTreeNode;
begin
   Result := addNaTreeView(nil, ANodePrincipal, []);
end;

procedure TFrmMain.BtnFieldsClick(Sender: TObject);
begin
    resultado.Items.Clear;
    obterFields();
    Resultado.FullExpand;
end;

procedure TFrmMain.obterFields;
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
  node: TTreeNode;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    node := addNaTreeView(Tipo.Name);
    for Field in Tipo.GetFields do
      begin
        addNaTreeView(node, Field.Name, [
          'Tipo: ' + Field.FieldType.ToString,
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Field.Visibility)),
          'Valor: ' + Field.GetValue(Exemplo).ToString
        ]);
      end;
  finally
    Exemplo.Free;
  end;
end;

end.
