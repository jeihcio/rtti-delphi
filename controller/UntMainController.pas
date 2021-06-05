unit UntMainController;

interface

uses
  System.Rtti, Vcl.ComCtrls, System.TypInfo, UntTreeView, UntFields;

type
  TMainController = class
  private
    FExibirResultado: TExibirResultadoTreeView;
    FFields: TFields;
  public
    Constructor Create(ATreeView: TTreeView); reintroduce;
    destructor Destroy(); override;

    procedure obterFields();
    procedure buscarPorField(ACampo: String);
  end;

implementation

uses
  UntClasseExample;

{ TMainController }

constructor TMainController.Create(ATreeView: TTreeView);
begin
  FExibirResultado := TExibirResultadoTreeView.Create(ATreeView);
  FFields := TFields.Create(FExibirResultado);
end;

destructor TMainController.Destroy;
begin
  FExibirResultado.Free;
  FFields.Free;
  inherited;
end;

procedure TMainController.obterFields;
begin
  FFields.obterFields;
end;

procedure TMainController.buscarPorField(ACampo: String);
begin
  FFields.buscarPorField(ACampo);
end;

end.
