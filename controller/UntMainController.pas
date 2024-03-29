unit UntMainController;

interface

uses
  System.Rtti, Vcl.ComCtrls, System.TypInfo, UntTreeView, UntFields,
  UntProperty, UntMethod;

type
  TMainController = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    FField: TField;
    FProperty: TProperty;
    FMethod: TMethod;
  public
    Constructor Create(ATreeView: TTreeView); reintroduce;
    destructor Destroy(); override;

    procedure listarFields(AExibirCamposHerdados: Boolean);
    procedure listarMethods(AExibirCamposHerdados: Boolean);
    procedure listarPropertys(AExibirCamposHerdados: Boolean);

    procedure buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);
    procedure buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
    procedure buscarMethods(AExibirCamposHerdados: Boolean; ACampo: String);

    procedure invocarMethods(AExibirCamposHerdados: Boolean; ACampo: String);
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
  FMethod := TMethod.Create(FExibirResultado);
end;

destructor TMainController.Destroy;
begin
  FExibirResultado.Free;
  FField.Free;
  FProperty.Free;
  FMethod.Free;
  inherited;
end;

procedure TMainController.listarFields(AExibirCamposHerdados: Boolean);
begin
  FField.listar(AExibirCamposHerdados);
end;

procedure TMainController.listarMethods(AExibirCamposHerdados: Boolean);
begin
  FMethod.listar(AExibirCamposHerdados);
end;

procedure TMainController.listarPropertys(AExibirCamposHerdados: Boolean);
begin
  FProperty.listar(AExibirCamposHerdados);
end;

procedure TMainController.buscarPorField(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FField.buscar(AExibirCamposHerdados, ACampo);
end;

procedure TMainController.buscarMethods(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FMethod.buscar(AExibirCamposHerdados, ACampo);
end;

procedure TMainController.buscarPorPropertys(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FProperty.buscar(AExibirCamposHerdados, ACampo);
end;

procedure TMainController.invocarMethods(AExibirCamposHerdados: Boolean; ACampo: String);
begin
  FMethod.invocarMethods(AExibirCamposHerdados, ACampo);
end;

end.
