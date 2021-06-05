unit UntFields;

interface

uses
  UntTreeView, System.Rtti, UntRttiUtil, UntIDadosRtti;

type
  TField = class(TInterfacedObject, IDadosRtti)
  private
    FExibirResultado: TExibirResultadoTreeView;
    procedure addNaTreeView(AExibirCamposHerdados: Boolean; Exemplo: TObject; Field: TRttiField; Tipo: TRttiType);
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;

    procedure listar(AExibirCamposHerdados: Boolean);
    procedure buscar(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.TypInfo;

{ TFields }

constructor TField.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TField.addNaTreeView(AExibirCamposHerdados: Boolean; Exemplo: TObject;
  Field: TRttiField; Tipo: TRttiType);
begin
  If isPularPropriedadeHerdada(AExibirCamposHerdados, Field, Tipo.Name) Then Exit;
  FExibirResultado.addNaTreeView(Field.Visibility, Field.Name, [
    'Tipo: ' + Field.FieldType.ToString,
    'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Field.Visibility)),
    'Valor: ' + Field.GetValue(Exemplo).ToString
  ]);
end;

procedure TField.listar(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Exemplo.nome := 'Jeihcio Francis';
    Exemplo.propriedadeDeHeranca := 'Teste de herança';

    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Field in Tipo.GetFields do
      addNaTreeView(
        AExibirCamposHerdados,
        Exemplo,
        Field,
        Tipo);
  finally
    Exemplo.Free;
  end;
end;

procedure TField.buscar(AExibirCamposHerdados: Boolean; ACampo: String);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);
    FExibirResultado.addNaTreeView(Tipo.Name);

    Field := Tipo.GetField(ACampo);
    if Assigned(Field) then
      addNaTreeView(
        AExibirCamposHerdados,
        Exemplo,
        Field,
        Tipo);
  finally
    Exemplo.Free;
  end;
end;

end.
