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
unit SharedDMfmxU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  Data.DB, FireDAC.Comp.Client;

type
  TSharedDMfmx = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SharedDMfmx: TSharedDMfmx;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses DataPaths;

{$R *.dfm}

procedure TSharedDMfmx.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Params.AddStrings( DataPaths.ConnectionParams );
  try
    FDConnection.Open();
  except
    on Exception do
    begin
      raise Exception.Create('Invalid configuration information. Please update the ' +
                             'DataPaths file with correct database location ' +
                             'information. See the connection information for the ' +
                             'employee.gdb database in the InterBase node of the ' +
                             'data explorer for the database location');
    end;
  end;
end;

end.
