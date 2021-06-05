unit UntMainController;

interface

uses
  System.Rtti, Vcl.ComCtrls, System.TypInfo, UntTreeView, UntFields, UntProperty;

type
  TMainController = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    FField: TField;
    FProperty: TProperty;
  public
    Constructor Create(ATreeView: TTreeView); reintroduce;
    destructor Destroy(); override;

    procedure obterFields(AExibirCamposHerdados: Boolean);
    procedure buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);

    procedure obterPropertys(AExibirCamposHerdados: Boolean);
    procedure buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
  end;

implementation

uses
  UntClasseExample;

{ TMainController }

constructor TMainController.Create(ATreeView: TTreeView);
begin
  FExibirResultado := TExibirResultadoTreeView.Create(ATreeView);

  FField := TField.Create(FExibirResultado);
  FProperty := TProperty.Create(FExibirResultado);
end;

destructor TMainController.Destroy;
begin
  FExibirResultado.Free;
  FField.Free;
  FProperty.Free;
  inherited;
end;

procedure TMainController.obterFields(AExibirCamposHerdados: Boolean);
begin
  FField.obter(AExibirCamposHerdados);
end;

procedure TMainController.buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FField.buscar(AExibirCamposHerdados, ACampo);
end;

procedure TMainController.obterPropertys(AExibirCamposHerdados: Boolean);
begin
  FProperty.obter(AExibirCamposHerdados);
end;

procedure TMainController.buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FProperty.buscar(AExibirCamposHerdados, ACampo);
end;

end.
