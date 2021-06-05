unit UntProperty;

interface

uses
  UntTreeView, System.Rtti, UntRttiUtil, UntIDadosRtti;

type
  TProperty = class(TInterfacedObject, IDadosRtti)
  private
    FExibirResultado: TExibirResultadoTreeView;
    procedure addNaTreeView(AExibirCamposHerdados: Boolean; Exemplo: TObject; Propriedade: TRttiProperty; Tipo: TRttiType);
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;

    procedure listar(AExibirCamposHerdados: Boolean);
    procedure buscar(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.TypInfo, System.SysUtils;

{ TProperty }

constructor TProperty.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TProperty.addNaTreeView(AExibirCamposHerdados: Boolean;
  Exemplo: TObject; Propriedade: TRttiProperty; Tipo: TRttiType);
var
  PropriedadeIndexada: TRttiInstanceProperty;
begin
  If isPularPropriedadeHerdada(AExibirCamposHerdados, Propriedade, Tipo.Name) Then exit;

  PropriedadeIndexada := TRttiInstanceProperty(Propriedade);
  FExibirResultado.addNaTreeView(Propriedade.Visibility, Propriedade.Name, [
    'Tipo: ' + Propriedade.PropertyType.ToString,
    'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Propriedade.Visibility)),
    'Valor: ' + Propriedade.GetValue(Exemplo).ToString,
    'Índice: ' + IntToStr(PropriedadeIndexada.Index)
  ]);
end;

procedure TProperty.buscar(AExibirCamposHerdados: Boolean; ACampo: String);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);
    FExibirResultado.addNaTreeView(Tipo.Name);

    Propriedade := Tipo.GetProperty(ACampo);
    if Assigned(Propriedade) then
      addNaTreeView(
        AExibirCamposHerdados,
        Exemplo,
        Propriedade,
        Tipo);
  finally
    Exemplo.Free;
  end;
end;

procedure TProperty.listar(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Propriedade in Tipo.GetProperties do
      addNaTreeView(
        AExibirCamposHerdados,
        Exemplo,
        Propriedade,
        Tipo);
  finally
    Exemplo.Free;
  end;
end;

end.
