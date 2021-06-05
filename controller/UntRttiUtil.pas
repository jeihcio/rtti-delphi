unit UntRttiUtil;

interface

uses
  System.Rtti;

function isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean; APropriedade: TRttiMember; ANomePai: String): Boolean;

implementation

function isPularPropriedadeHerdada(AExibirCamposHerdados: Boolean; APropriedade: TRttiMember; ANomePai: String): Boolean;
var
  cNomeClassePai: String;
begin
   Result := False;
   If Not AExibirCamposHerdados Then
      Begin
         cNomeClassePai := TRttiInstanceType(APropriedade.Parent).MetaclassType.ClassName;
         Result := (cNomeClassePai <> ANomePai);
      End;
end;

end.
