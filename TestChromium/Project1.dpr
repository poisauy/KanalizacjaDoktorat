program Project1;

uses
  Vcl.Forms,
  uCEFApplication,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  CreateGlobalCEFApp;
  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TForm1, Form1);
      Application.Run;
    end;


  DestroyGlobalCEFApp;
end.
