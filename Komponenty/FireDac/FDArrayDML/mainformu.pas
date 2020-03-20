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
unit mainformu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.IB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Phys.IBBase;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    UsingArrayDMLButton: TButton;
    DBGrid1: TDBGrid;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    UsingQueriesButton: TButton;
    StatusBar1: TStatusBar;
    btnShowArrayDMLMode: TButton;
    FDMetaInfoQuery1: TFDMetaInfoQuery;
    procedure FormCreate(Sender: TObject);
    procedure UsingArrayDMLButtonClick(Sender: TObject);
    procedure UsingQueriesButtonClick(Sender: TObject);
    procedure FDQuery1ExecuteError(ASender: TObject; ATimes, AOffset: Integer;
      AError: EFDDBEngineException; var AAction: TFDErrorAction);
    procedure btnShowArrayDMLModeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PopulateTableArrayDML(TableName: string);
    procedure PopulateTableUsingQueries(TableName: string);
    procedure CreateTable(TableName: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DateUtils, Diagnostics, SharedDMVclU, TypInfo;

procedure TForm1.FDQuery1ExecuteError(ASender: TObject; ATimes,
  AOffset: Integer; AError: EFDDBEngineException; var AAction: TFDErrorAction);
begin
//  AError.Errors[i].RowIndex
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := DateOf(now);
  DateTimePicker2.Date := DateOf(incyear(now, 10));
end;

procedure TForm1.UsingArrayDMLButtonClick(Sender: TObject);
const
  TableName = 'Dates';
begin
  if DateTimePicker1.Date >= DateTimePicker2.Date then
    raise Exception.Create('Starting date cannot follow ending date');
  CreateTable(TableName);
  PopulateTableArrayDML(TableName);
end;

procedure TForm1.UsingQueriesButtonClick(Sender: TObject);
const
  TableName = 'Dates';
begin
  if DateTimePicker1.Date >= DateTimePicker2.Date then
    raise Exception.Create('Starting date cannot follow ending date');
  CreateTable(TableName);
  PopulateTableUsingQueries(TableName);
end;

procedure TForm1.btnShowArrayDMLModeClick(Sender: TObject);
begin
  ShowMessage(TypInfo.GetEnumName(TypeInfo(TFDPhysArrayExecMode),
    Ord(SharedDMVcl.FDConnection.ConnectionMetaDataIntf.ArrayExecMode)));
end;

procedure TForm1.CreateTable(TableName: string);
begin
  //Dropping the table in a transaction that is committed
  //ensures that the table is gone before proceeding
  SharedDMVcl.FDConnection.StartTransaction;
  try
    // The second parameter of ExecSQL instructs FireDAC to ignore
    // errors raised if the table to be dropped does not exist.
    FDQuery1.Connection.ExecSQL('DROP TABLE ' + TableName, True);
  finally
    SharedDMVcl.FDConnection.Commit;
  end;

  //Creating the table in a transaction that is committed
  //ensures that the table exists before proceeding
  SharedDMVcl.FDConnection.StartTransaction;
  try
  SharedDMVcl.FDConnection.ExecSQL('CREATE TABLE ' + TableName + '( ' +
                       '     DateValue date NOT NULL Primary Key, ' +
                       '     DayName varchar(16) )');
  finally
    SharedDMVcl.FDConnection.Commit;
  end;
end;

procedure TForm1.PopulateTableArrayDML(TableName: string);
var
  CurrentDate: TDateTime;
  TotalDays: Integer;
  i: Integer;
  StopWatch: TStopWatch;
begin
  TotalDays := DateUtils.DaysBetween(DateTimePicker1.Date,
                                     DateTimePicker2.Date);
  CurrentDate := DateTimePicker1.Date;

  //Define the parameterized query
  FDQuery1.SQL.Text := 'INSERT INTO ' + TableName +
                       ' (DateValue, DayName) VALUES( :date, :name )';
  //Configure query params for performance. Optional
  FDQuery1.Params[0].DataType := ftDate;
  FDQuery1.Params[1].DataType := ftString;
  FDQuery1.Params[1].Size := 16;
  //Set the array size
  FDQuery1.Params.ArraySize := TotalDays;
  StopWatch := TStopWatch.StartNew;
  //Insert the parameters
  for i := 0 to TotalDays - 1 do
  begin
    FDQuery1.Params[0].AsDates[i] := DateOf(CurrentDate);
    FDQuery1.Params[1].AsStrings[i] := FormatDateTime('dddd', CurrentDate);
    CurrentDate := IncDay(CurrentDate);
  end;
  SharedDMVcl.FDConnection.StartTransaction;
  try
    //Execute the query
    FDQuery1.Execute(FDQuery1.Params.ArraySize);
    SharedDMVcl.FDConnection.Commit;
  finally
    SharedDMVcl.FDConnection.Rollback;
  end;
  //Stop timer
  StopWatch.Stop;

  //Let's take a look at the data
  FDQuery1.Open('SELECT * FROM ' + TableName);
  DataSource1.DataSet := FDQuery1;
  StatusBar1.SimpleText := 'Array DML Milliseconds : ' +
    IntToStr(StopWatch.ElapsedMilliseconds);
end;

procedure TForm1.PopulateTableUsingQueries(TableName: string);
var
  CurrentDate: TDateTime;
  TotalDays: Integer;
  i: Integer;
  StopWatch: TStopWatch;
begin
  TotalDays := DateUtils.DaysBetween(DateTimePicker1.Date,
                                     DateTimePicker2.Date);
  CurrentDate := DateTimePicker1.Date;

  //Define the parameterized query
  FDQuery1.SQL.Text := 'INSERT INTO ' + TableName +
                       ' (DateValue, DayName) VALUES( :date, :name )';
  FDQuery1.Params[0].DataType := ftDate;
  FDQuery1.Params[1].DataType := ftString;
  FDQuery1.Params[1].Size := 16;
  SharedDMVcl.FDConnection.StartTransaction;
  try
    StopWatch := TStopWatch.StartNew;
    for i := 0 to TotalDays - 1 do
    begin
      FDQuery1.Params[0].AsDate := DateOf(CurrentDate);
      FDQuery1.Params[1].AsString := FormatDateTime('dddd', CurrentDate);
      CurrentDate := IncDay(CurrentDate);
      FDQuery1.ExecSQL;
    end;
    SharedDMVcl.FDConnection.Commit;
  finally
    SharedDMVcl.FDConnection.Rollback;
  end;
  StopWatch.Stop;

  //Let's take a look at the data
  FDQuery1.Open('SELECT * FROM ' + TableName);
  DataSource1.DataSet := FDQuery1;
  StatusBar1.SimpleText := 'Parameterized Queries Milliseconds : ' +
    IntToStr(StopWatch.ElapsedMilliseconds);
end;

end.
