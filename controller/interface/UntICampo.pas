unit UntICampo;

interface

type
  ICampo = interface
    ['{FCA07CB4-ABD0-4166-B94C-1A76324EC7C6}']
    procedure obter(AExibirCamposHerdados: Boolean);
    procedure buscar(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

end.
