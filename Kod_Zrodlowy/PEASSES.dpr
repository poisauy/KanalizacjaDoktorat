program PEASSES;

uses
  Vcl.Forms,
  UEASES in 'UEASES.pas' {Form1},
  U_S_Grawitacyjna in 'U_S_Grawitacyjna.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
