program prjLogica;

uses
  Forms,
  uMain in 'uMain.pas' {frmLogica};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogica, frmLogica);
  Application.Run;
end.
