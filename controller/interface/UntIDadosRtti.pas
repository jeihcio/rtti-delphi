unit UntIDadosRtti;

interface

type
  IDadosRtti = interface
    ['{8E50402E-6212-412D-AEFE-688926593DAA}']
    procedure listar(AExibirCamposHerdados: Boolean);
    procedure buscar(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

end.
