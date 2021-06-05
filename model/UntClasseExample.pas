unit UntClasseExample;

interface

type
  TPessoa = class
  private
    Fnome: String;
    FIdade: Integer;
    FPrivado: String;
    FIsHomem: Boolean;
    property privado: String read FPrivado write FPrivado;
  public
    property nome: String read FNome write FNome;
    property idade: Integer read FIdade write FIdade;
    property isHomem: Boolean read FIsHomem write FIsHomem;
  end;

implementation

end.
