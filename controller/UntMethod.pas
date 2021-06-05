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
  UntClasseExample, System.Rtti, UntRttiUtil, System.TypInfo;

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
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Metodo in Tipo.GetMethods do
      begin
        If isPularPropriedadeHerdada(AExibirCamposHerdados, Metodo, Tipo.Name) Then Continue;

        FExibirResultado.addNaTreeView(Metodo.Visibility, Metodo.Name, [
          'Tipo: ' + GetEnumName(TypeInfo(TMethodKind), Integer(Metodo.MethodKind)),
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Metodo.Visibility))
        ]);
      end;
  finally
    Exemplo.Free;
  end;
end;

end.
