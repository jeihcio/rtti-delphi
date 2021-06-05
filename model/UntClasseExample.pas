unit UntClasseExample;

interface

type
  TClasseExemplo = class
  private
    Fnome: String;
    FIdade: Integer;
    FPrivado: String;
    FIsHomem: Boolean;
    property privado: String read FPrivado write FPrivado;
    procedure Privada();
  public
    FCampoPublico: String;
    property nome: String read FNome write FNome;
    property idade: Integer read FIdade write FIdade;
    property isHomem: Boolean read FIsHomem write FIsHomem;

    procedure fazAlgo();
    function fazOutroAlgo(): String;
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

procedure TClasseExemplo.Privada;
begin
end;

end.
