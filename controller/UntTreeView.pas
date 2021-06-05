unit UntTreeView;

interface

uses
  Vcl.ComCtrls, System.TypInfo;

type
  TExibirResultadoTreeView = class
  private
    FTreeView: TTreeView;
    FNodePrincipal,
    FNodePrivate,
    FNodeProtected,
    FNodePublic,
    FNodePublicada: TTreeNode;
  public
    Constructor Create(ATreeView: TTreeView); reintroduce;

    function  addNodePorVisibilidade(ANomeNode: String; AVisibilidade: TMemberVisibility): TTreeNode;
    procedure addNaTreeView(ANodePrincipal: String); overload;
    procedure addNaTreeView(AVisibilidade: TMemberVisibility; ANodeSecundario: String; AListaFilhos: TArray<String>); overload;
  end;

implementation

{ TExibirResultadoTreeView }

constructor TExibirResultadoTreeView.Create(ATreeView: TTreeView);
begin
  FTreeView := ATreeView;
end;

procedure TExibirResultadoTreeView.addNaTreeView(AVisibilidade: TMemberVisibility;
  ANodeSecundario: String; AListaFilhos: TArray<String>);
var
  index: Integer;
  node: TTreeNode;
begin
   node := addNodePorVisibilidade(ANodeSecundario, AVisibilidade);
   For index := 0 To Length(AListaFilhos) - 1 Do
     FTreeView.Items.AddChild(node, AListaFilhos[index]) ;
end;

function TExibirResultadoTreeView.addNodePorVisibilidade(ANomeNode: String;
  AVisibilidade: TMemberVisibility): TTreeNode;
begin
   Case AVisibilidade Of
     mvPrivate:   Result := FTreeView.Items.AddChild(FNodePrivate, ANomeNode) ;
     mvProtected: Result := FTreeView.Items.AddChild(FNodeProtected, ANomeNode) ;
     mvPublic:    Result := FTreeView.Items.AddChild(FNodePublic, ANomeNode) ;
     mvPublished: Result := FTreeView.Items.AddChild(FNodePublicada, ANomeNode) ;

     Else
       Result := FTreeView.Items.AddChild(FNodePrincipal, ANomeNode) ;
   End;
end;

procedure TExibirResultadoTreeView.addNaTreeView(ANodePrincipal: String);
begin
   FNodePrincipal := FTreeView.Items.Add(nil, ANodePrincipal);
   FNodePrivate   := FTreeView.Items.AddChild(FNodePrincipal, 'Private');
   FNodePublic    := FTreeView.Items.AddChild(FNodePrincipal, 'Public');
   FNodeProtected := FTreeView.Items.AddChild(FNodePrincipal, 'Protected');
   FNodePublicada := FTreeView.Items.AddChild(FNodePrincipal, 'Published');
end;

end.
