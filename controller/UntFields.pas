unit UntFields;

interface

uses
  UntTreeView, System.Rtti, UntRttiUtil, UntICampo, UntIDadosRtti;

type
  TField = class(TInterfacedObject, IDadosRtti, ICampo)
  private
    FExibirResultado: TExibirResultadoTreeView;
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
      begin
        If isPularPropriedadeHerdada(AExibirCamposHerdados, Field, Tipo.Name) Then Continue;
        FExibirResultado.addNaTreeView(Field.Visibility, Field.Name, [
          'Tipo: ' + Field.FieldType.ToString,
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Field.Visibility)),
          'Valor: ' + Field.GetValue(Exemplo).ToString
        ]);
      end;
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
      begin
        If isPularPropriedadeHerdada(AExibirCamposHerdados, Field, Tipo.Name) Then exit;
        FExibirResultado.addNaTreeView(Field.Visibility, Field.Name, [
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
