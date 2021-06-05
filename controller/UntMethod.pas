unit UntMethod;

interface

uses
  UntTreeView, UntIDadosRtti, System.Rtti;

type
  TMethod = class(TInterfacedObject, IDadosRtti)
  private
    FExibirResultado: TExibirResultadoTreeView;
    procedure addNaTreeView(AExibirCamposHerdados: Boolean; Exemplo: TObject; Metodo: TRttiMethod; Tipo: TRttiType);
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;
    procedure listar(AExibirCamposHerdados: Boolean);
  end;

implementation

uses
  UntClasseExample, UntRttiUtil, System.TypInfo, System.Classes;

{ TMethods }

constructor TMethod.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TMethod.addNaTreeView(AExibirCamposHerdados: Boolean;
  Exemplo: TObject; Metodo: TRttiMethod; Tipo: TRttiType);
var
  Parametros: TArray<TRttiParameter>;
  Parametro: TRttiParameter;
  listaParametros: TStringList;
begin
  listaParametros := TStringList.Create;
  Try
    If isPularPropriedadeHerdada(AExibirCamposHerdados, Metodo, Tipo.Name) Then Exit;

    Parametros := Metodo.GetParameters;
    for Parametro in Parametros do
      listaParametros.Add(Parametro.ToString);

    if Length(Metodo.GetParameters) <= 0 then
      Begin
        FExibirResultado.addNaTreeView(Metodo.Visibility, Metodo.Name, [
          'Tipo: ' + GetEnumName(TypeInfo(TMethodKind), Integer(Metodo.MethodKind)),
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Metodo.Visibility)),
          'Parametros: Nenhum'
        ]);
      End
    Else
      Begin
        FExibirResultado.addNaMethodsTreeView(Metodo.Visibility, Metodo.Name, [
          'Tipo: ' + GetEnumName(TypeInfo(TMethodKind), Integer(Metodo.MethodKind)),
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Metodo.Visibility)),
          'Parametros'
        ], listaParametros.ToStringArray);

        listaParametros.Clear;
      End;
  Finally
    listaParametros.Free;
  End;
end;

procedure TMethod.listar(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Metodo: TRttiMethod;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Metodo in Tipo.GetMethods do
      addNaTreeView(
        AExibirCamposHerdados,
        Exemplo,
        Metodo,
        Tipo);
  finally
    Exemplo.Free;
  end;
end;

end.
