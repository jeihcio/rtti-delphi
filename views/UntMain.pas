unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UntClasseExample, System.Rtti;

type
  TFrmMain = class(TForm)
    GridPanel1: TGridPanel;
    MmResultado: TMemo;
    BtnFields: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure BtnFieldsClick(Sender: TObject);
  private
    procedure obterFields();
  public
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.TypInfo;

{$R *.dfm}

procedure TFrmMain.BtnFieldsClick(Sender: TObject);
begin
    MmResultado.Clear;
    obterFields();
end;

procedure TFrmMain.obterFields;
var
  Exemplo: TClasseExemplo;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
begin
  Exemplo := TClasseExemplo.Create;
  try
    Tipo := Contexto.GetType(Exemplo.ClassInfo);

    MmResultado.Lines.Add('Campos da classe ' + Tipo.Name);
    MmResultado.Lines.Add('');

    for Field in Tipo.GetFields do
       begin
          MmResultado.Lines.Add('Encontrado campo: ' + Field.Name + #13#10 +
                                ' Seu tipo é: ' + Field.FieldType.ToString + #13#10 +
                                ' Sua visibilidade é :' + GetEnumName(TypeInfo(TMemberVisibility), Integer(Field.Visibility)) + #13#10 +
                                ' Seu valor é : ' + Field.GetValue(Exemplo).ToString
                               );

          MmResultado.Lines.Add('');
       end;
  finally
    Exemplo.Free;
  end;
end;

end.
