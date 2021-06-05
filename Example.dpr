program Example;

uses
  Vcl.Forms,
  UntMain in 'views\UntMain.pas' {FrmMain},
  UntClasseExample in 'model\UntClasseExample.pas',
  UntMainController in 'controller\UntMainController.pas',
  UntTreeView in 'controller\UntTreeView.pas',
  UntFields in 'controller\UntFields.pas',
  UntProperty in 'controller\UntProperty.pas',
  UntClasseExampleHeranca in 'model\UntClasseExampleHeranca.pas',
  UntRttiUtil in 'controller\UntRttiUtil.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
