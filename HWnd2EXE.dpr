program HWnd2EXE;

uses
  Forms,
  HWnd2ExeU in 'HWnd2ExeU.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
