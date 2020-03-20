(* Copyright (c) 2017. Cary Jensen, Jensen Data Systems, Inc.
   This code sample is intended for the readers of
   "Delphi in Depth: FireDAC"
     by Cary Jensen

   ISBN-13: 978-1546391272 
   ISBN-10: 1546391274

   No guarantees or warranties are expressed or implied concerning
   the applicability of techniques or code included in this example
   or in the accompanying book. If you wish to use techniques or
   code included in this example or described in the book, it is
   your responsibility to test and certify any code, techniques,
   or design you adopt.

   For information on consulting or training services, please visit:
   http://www.JensenDataSystems.com

   For more information about "Delphi in Depth: FireDAC"
   by Cary Jensen, including links to order the book, please visit:
   http://www.JensenDataSystems.com/FireDACBook
*)
program FDBasicCachedUpdates;

uses
  Vcl.Forms,
  mainformu in 'mainformu.pas' {Form1},
  DataPaths in '..\Shared Files\DataPaths.pas',
  SharedDMVclU in '..\Shared Files\SharedDMVclU.pas' {SharedDMVcl: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSharedDMVcl, SharedDMVcl);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
