unit UntFields;

interface

uses
  UntTreeView;

type
  TField = class
  private
    FExibirResultado: TExibirResultadoTreeView;
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;

    procedure obterFields();
    procedure buscarPorField(ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.Rtti, System.TypInfo;

{ TFields }

constructor TField.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TField.obterFields;
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Exemplo.nome := 'Jeihcio Francis';
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Field in Tipo.GetFields do
      begin
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

procedure TField.buscarPorField(ACampo: String);
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
