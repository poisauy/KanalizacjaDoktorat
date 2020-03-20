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
unit datamodu;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    TablesQry: TFDQuery;
    FieldsQry: TFDQuery;
    SelectQry: TFDQuery;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses mainformu, FMX.Dialogs;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  DataDir: string;
begin
  DataDir := GetEnvironmentVariable('DEMOSDIR');
  if DataDir.IsEmpty then
  begin
    ShowMessage('DEMOSDIR environment variable is not set. ' +
                'Cannot continue');
    exit;
  end;
  FDConnection1.LoginPrompt := False;
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('MonitorBy=Remote');
  FDConnection1.Params.Add('DriverID=IB');
  FDConnection1.Params.Add('Database=' + DataDir + '/data/dbdemos.gdb');
  FDConnection1.Params.Add('User_Name=sysdba');
  FDConnection1.Params.Add('Password=masterkey');
  FDConnection1.Connected := True;
  FDConnection1.ConnectionIntf.Tracing := True;
  TablesQry.Open;
  Form1.ListBox1.ItemIndex := 0;
end;

end.
