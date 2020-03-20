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
unit DataPaths;

interface

uses System.SysUtils, System.Classes;

type
  EFireDACBookException = class( Exception );

var
  ConnectionParams: TStrings;

//  If you are not using Delphi 10.1 Berlin, update these paths
//  to reflect the location of the databases on your version.
//  For the InterBase database location, you can discover that by
//  looking at the EMPLOYEE configuration available under the
//  InterBase node of Delphi's Data Explorer.
const
  {$IF CompilerVersion > 31.0} //Delphi 10.2 Tokyo and above
  IBEmpPath = 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\' +
                 'Samples\Data\employee.gdb';

  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Data';
  {$ELSE}
  IBEmpPath = 'C:\ProgramData\Embarcadero\InterBase\gds_db\' +
                 'examples\database\employee.gdb';
  {$ENDIF}
  {$IF CompilerVersion = 31.0} //Delphi 10.1 Berlin
  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\18.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\18.0\Samples\Data';
  {$ENDIF}
  {$IF CompilerVersion = 30.0} //Delphi 10 Seattle
  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\17.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\17.0\Samples\Data';
  {$ENDIF}
  {$IF CompilerVersion = 29.0} //Delphi XE8
  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\16.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\16.0\Samples\Data';
  {$ENDIF}
  {$IF CompilerVersion = 28.0} //Delphi XE7
  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\Data';
  {$ENDIF}
  {$IF CompilerVersion = 27.0} //Delphi XE6
  IBDemoPath = 'C:\Users\Public\Documents\Embarcadero\Studio\14.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\Embarcadero\Studio\14.0\Samples\Data';
  {$ENDIF}
  {$IF CompilerVersion = 26} //Delphi XE5
  IBDemoPath = 'C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data\dbdemos.gdb';
  SamplePath = 'C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data';
  {$ENDIF}

var
  BigMemTablePath: string;

procedure ValidatePath( Path: string );

implementation

uses System.IOUtils;


procedure ValidatePath( Path: string );
var
  Found: Boolean;
  Msg: string;
begin
  if Path.EndsWith('.gdb') then
    Found := TFile.Exists( Path )
  else
    Found := TDirectory.Exists( Path );

  if not Found then
  begin
    Msg := Format('Invalid Path: ' +
                  '%s was not found. Please read Appendix  A ' +
                  'in the book "Delphi in Depth: FireDAC" for information on '  +
                  'locating the sample data directories, and then update ' +
                  'the constants declared in the DataPaths unit, which is ' +
                  'located in the SharedFiles directory of the code download',
                  [ Path ] );
    raise EFireDACBookException.Create( Msg );
  end;
end;

initialization
  ConnectionParams := TStringList.Create;
  DataPaths.ValidatePath( IBEmpPath );
  ConnectionParams.Add('Database=localhost:' +  DataPaths.IBEmpPath);
  ConnectionParams.Add('User_Name=sysdba');
  ConnectionParams.Add('Password=masterkey');
  ConnectionParams.Add('Protocol=TCPIP');
  ConnectionParams.Add('DriverID=IB');
  BigMemTablePath := ExtractFilePath( ParamStr( 0 ) );
  BigMemTablePath := BigMemTablePath + '..\BigMemTable\BigMemTable.Xml';

finalization
  if Assigned( ConnectionParams ) then
    ConnectionParams.Free;

end.
