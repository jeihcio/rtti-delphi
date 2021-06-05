unit UntFields;

interface

uses
  UntTreeView, System.Rtti;

type
  TField = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    function isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean;
      APropriedade: TRttiMember; ANomePai: String): Boolean;
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;

    procedure obterFields(AExibirCamposHerdados: Boolean);
    procedure buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.TypInfo;

{ TFields }

constructor TField.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

function TField.isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean;
  APropriedade: TRttiMember; ANomePai: String): Boolean;
var
  cNomeClassePai: String;
begin
   Result := False;
   If Not AExibirCamposHerdados Then
      Begin
         cNomeClassePai := TRttiInstanceType(APropriedade.Parent).MetaclassType.ClassName;
         Result := (cNomeClassePai <> ANomePai);
      End;
end;

procedure TField.obterFields(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Exemplo.nome := 'Jeihcio Francis';
    Exemplo.propriedadeDeHeranca := 'Teste de heran�a';

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

procedure TField.buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);
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
