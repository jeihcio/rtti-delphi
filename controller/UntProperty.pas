unit UntProperty;

interface

uses
  UntTreeView, System.Rtti;

type
  TProperty = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    function isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean; APropriedade: TRttiMember; ANomePai: String): Boolean;
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView); reintroduce;

    procedure obterPropertys(AExibirCamposHerdados: Boolean);
    procedure buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.TypInfo, System.SysUtils;

{ TProperty }

constructor TProperty.Create(AExibirResultado: TExibirResultadoTreeView);
begin
  FExibirResultado := AExibirResultado;
end;

function TProperty.isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean; APropriedade: TRttiMember;
  ANomePai: String): Boolean;
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

procedure TProperty.buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
begin
end;

procedure TProperty.obterPropertys(AExibirCamposHerdados: Boolean);
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  PropriedadeIndexada: TRttiInstanceProperty;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    FExibirResultado.addNaTreeView(Tipo.Name);
    for Propriedade in Tipo.GetProperties do
      begin
        If isPularPropriedadeHerdada(AExibirCamposHerdados, Propriedade, Tipo.Name) Then Continue;

        PropriedadeIndexada := TRttiInstanceProperty(Propriedade);
        FExibirResultado.addNaTreeView(Propriedade.Visibility, Propriedade.Name, [
          'Tipo: ' + Propriedade.PropertyType.ToString,
          'Visibilidade: ' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Propriedade.Visibility)),
          'Valor: ' + Propriedade.GetValue(Exemplo).ToString,
          'Índice: ' + IntToStr(PropriedadeIndexada.Index)
        ]);
      end;
  finally
    Exemplo.Free;
  end;
end;

end.
