unit UntProperty;

interface

uses
  UntTreeView;

type
  TProperty = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    FExibirCamposHerdados: Boolean;
  public
    constructor Create(AExibirResultado: TExibirResultadoTreeView;
      AExibirCamposHerdados: Boolean); reintroduce;

    procedure obterPropertys();
    procedure buscarPorPropertys(ACampo: String);
  end;

implementation

uses
  UntClasseExample, System.Rtti, System.TypInfo, System.SysUtils;

{ TProperty }

constructor TProperty.Create(AExibirResultado: TExibirResultadoTreeView;
  AExibirCamposHerdados: Boolean);
begin
  FExibirResultado := AExibirResultado;
end;

procedure TProperty.buscarPorPropertys(ACampo: String);
begin
end;

procedure TProperty.obterPropertys;
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
