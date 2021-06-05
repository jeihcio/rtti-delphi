program Example;

uses
  Vcl.Forms,
  UntMain in 'views\UntMain.pas' {FrmMain},
  UntClasseExample in 'model\UntClasseExample.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
