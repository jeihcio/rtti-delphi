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

    procedure obterFields();
    procedure buscarPorField(ACampo: String);

    procedure obterPropertys();
    procedure buscarPorPropertys(ACampo: String);
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

procedure TMainController.obterFields;
begin
  FField.obterFields;
end;

procedure TMainController.buscarPorField(ACampo: String);
begin
  FField.buscarPorField(ACampo);
end;

procedure TMainController.obterPropertys;
begin
  FProperty.obterPropertys;
end;

procedure TMainController.buscarPorPropertys(ACampo: String);
begin
  FProperty.buscarPorPropertys(ACampo);
end;

end.
