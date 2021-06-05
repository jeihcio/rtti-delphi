unit UntClasseExample;

interface

uses
  UntClasseExampleHeranca;

type
  TClasseExemplo = class(TClasseExampleHeranca)
  private
    Fnome: String;
    FIdade: Integer;
    FCampoPrivado: String;
    FIsHomem: Boolean;
    FCampoPublicado: String;
    property privado: String read FCampoPrivado write FCampoPrivado;
    procedure Privada();
  public
    FCampoPublico: String;
    property nome: String read FNome write FNome;
    property idade: Integer read FIdade write FIdade;
    property isHomem: Boolean read FIsHomem write FIsHomem;

    procedure fazAlgo();
    function fazOutroAlgo(): String;
  protected
    FCampoProtegido: String;
    property CampoProtegido: String read FCampoProtegido write FCampoProtegido;
    procedure procedureProtegida();
    function funcaoProtegida(): String;
  published
    property CampoPublicado: String read FCampoPublicado write FCampoPublicado;
    procedure procedurePublicada();
    function funcaoPublicada(): String;
  end;

implementation

{ TPessoa }

procedure TClasseExemplo.fazAlgo;
begin

end;

function TClasseExemplo.fazOutroAlgo: String;
begin
  Result := 'Teste';
end;

function TClasseExemplo.funcaoProtegida: String;
begin
   Result := 'protegida';
end;

function TClasseExemplo.funcaoPublicada: String;
begin
   Result := 'publicada'
end;

procedure TClasseExemplo.Privada;
begin
end;

procedure TClasseExemplo.procedureProtegida;
begin

end;

procedure TClasseExemplo.procedurePublicada;
begin

end;

end.
