unit UntMethod;

interface

uses
  UntTreeView, UntIDadosRtti;

type
  TMethod = class(TInterfacedObject, IDadosRtti)
  private
    FExibirResultado: TExibirResultadoTreeView;
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;
    procedure listar(AExibirCamposHerdados: Boolean);
  end;

implementation

uses
  UntClasseExample, System.Rtti, UntRttiUtil, System.TypInfo, System.Classes;

{ TMethods }

constructor TMethod.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TMethod.listar(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Metodo: TRttiMethod;
  Parametro: TRttiParameter;
  Parametros: TArray<TRttiParameter>;
  listaParametros: TStringList;
begin
  Exemplo := TClasseExemplo.Create;
  listaParametros := TStringList.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Metodo in Tipo.GetMethods do
      begin
        If isPularPropriedadeHerdada(AExibirCamposHerdados, Metodo, Tipo.Name) Then Continue;

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
      end;
  finally
    Exemplo.Free;
    listaParametros.Free;
  end;
end;

end.
