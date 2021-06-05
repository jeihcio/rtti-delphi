unit UntClasseExampleHeranca;

interface

type
  TClasseExampleHeranca = class
  private
    FPropriedadeDeHeranca: String;
  public
    FCampoPublicoHeranca: String;
    property propriedadeDeHeranca: String read FPropriedadeDeHeranca write FPropriedadeDeHeranca;
    property campoPublicoHeranca: String read FCampoPublicoHeranca write FCampoPublicoHeranca;

    procedure procedurePublicHeranca(); overload;
    procedure procedurePublicHeranca(ATeste: String); overload;
    function funcaoPublicHeranca(): String;
  protected
    FCampoProtegidoHeranca: String;
    property CampoProtegidoProtegidoHeranca: String read FCampoProtegidoHeranca write FCampoProtegidoHeranca;

    procedure procedureProtegidaHeranca();
    function funcaoProtegidaHeranca(): String;
  published
    property CampoProtegidoHeranca: String read FCampoProtegidoHeranca write FCampoProtegidoHeranca;
    procedure procedurePublicadaHeranca();
    function funcaoPublicadaHeranca(): String;
  end;

implementation

{ TClasseExampleHeranca }

function TClasseExampleHeranca.funcaoProtegidaHeranca: String;
begin

end;

function TClasseExampleHeranca.funcaoPublicadaHeranca: String;
begin

end;

function TClasseExampleHeranca.funcaoPublicHeranca: String;
begin

end;

procedure TClasseExampleHeranca.procedureProtegidaHeranca;
begin

end;

procedure TClasseExampleHeranca.procedurePublicadaHeranca;
begin

end;

procedure TClasseExampleHeranca.procedurePublicHeranca(ATeste: String);
begin

end;

procedure TClasseExampleHeranca.procedurePublicHeranca;
begin

end;

end.
