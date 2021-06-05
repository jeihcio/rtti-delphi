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
    function fazOutroAlgo2(ATeste: String): String;
    function fazOutroAlgo3(ATeste, ATeste2: String; AInteiro: Integer): String;
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

uses
  Dialogs;

{ TPessoa }

procedure TClasseExemplo.fazAlgo;
begin
  privado := 'privado';
  Privada();
end;

function TClasseExemplo.fazOutroAlgo: String;
begin
  Result := 'Teste';
end;

function TClasseExemplo.fazOutroAlgo2(ATeste: String): String;
begin
  ShowMessage('Método da classe principal: ' + ATeste);
  Result := 'Resultado do método da classe principal';
end;

function TClasseExemplo.fazOutroAlgo3(ATeste, ATeste2: String;
  AInteiro: Integer): String;
begin

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
