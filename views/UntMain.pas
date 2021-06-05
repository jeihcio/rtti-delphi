unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntClasseExample, System.Rtti, Vcl.ComCtrls, System.TypInfo;

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
    FNodePrincipal,
    FNodePrivate,
    FNodeProtected,
    FNodePublic,
    FNodePublicada: TTreeNode;
  private
    function  addNodePorVisibilidade(ANomeNode: String; AVisibilidade: TMemberVisibility): TTreeNode;
    procedure addNaTreeView(ANodePrincipal: String); overload;
    procedure addNaTreeView(AVisibilidade: TMemberVisibility; ANodeSecundario: String; AListaFilhos: TArray<String>); overload;

    procedure obterFields();
  public
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.addNaTreeView(AVisibilidade: TMemberVisibility;
  ANodeSecundario: String; AListaFilhos: TArray<String>);
var
  index: Integer;
  node: TTreeNode;
begin
   node := addNodePorVisibilidade(ANodeSecundario, AVisibilidade);
   For index := 0 To Length(AListaFilhos) - 1 Do
     Resultado.Items.AddChild(node, AListaFilhos[index]) ;
end;

function TFrmMain.addNodePorVisibilidade(ANomeNode: String;
  AVisibilidade: TMemberVisibility): TTreeNode;
begin
   Case AVisibilidade Of
     mvPrivate:
       Result := Resultado.Items.AddChild(FNodePrivate, ANomeNode) ;

     mvProtected:
       Result := Resultado.Items.AddChild(FNodeProtected, ANomeNode) ;

     mvPublic:
       Result := Resultado.Items.AddChild(FNodePublic, ANomeNode) ;

     mvPublished:
       Result := Resultado.Items.AddChild(FNodePublicada, ANomeNode) ;

     Else
       Result := Resultado.Items.AddChild(FNodePrincipal, ANomeNode) ;
   End;
end;

procedure TFrmMain.addNaTreeView(ANodePrincipal: String);
begin
   FNodePrincipal := Resultado.Items.Add(nil, ANodePrincipal);
   FNodePrivate   := Resultado.Items.AddChild(FNodePrincipal, 'Private');
   FNodeProtected := Resultado.Items.AddChild(FNodePrincipal, 'Protected');
   FNodePublic    := Resultado.Items.AddChild(FNodePrincipal, 'Public');
   FNodePublicada := Resultado.Items.AddChild(FNodePrincipal, 'Published');
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
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    addNaTreeView(Tipo.Name);
    for Field in Tipo.GetFields do
      begin
        addNaTreeView(Field.Visibility, Field.Name, [
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
