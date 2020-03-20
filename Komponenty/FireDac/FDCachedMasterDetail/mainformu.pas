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
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.StdCtrls, FireDAC.Stan.StorageXML;

type
  TMainForm = class(TForm)
    CustomerQueryRB: TFDQuery;
    SalesQueryRB: TFDQuery;
    CustomerSourceRB: TDataSource;
    dscCustomerRB: TDataSource;
    dscSalesRB: TDataSource;
    FDSchemaAdapter1: TFDSchemaAdapter;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    CustomerQueryRBCUST_NO: TIntegerField;
    CustomerQueryRBCUSTOMER: TStringField;
    CustomerQueryRBCONTACT_FIRST: TStringField;
    CustomerQueryRBCONTACT_LAST: TStringField;
    CustomerQueryRBPHONE_NO: TStringField;
    CustomerQueryRBADDRESS_LINE1: TStringField;
    CustomerQueryRBADDRESS_LINE2: TStringField;
    CustomerQueryRBCITY: TStringField;
    CustomerQueryRBSTATE_PROVINCE: TStringField;
    CustomerQueryRBCOUNTRY: TStringField;
    CustomerQueryRBPOSTAL_CODE: TStringField;
    CustomerQueryRBON_HOLD: TStringField;
    SalesQueryRBPO_NUMBER: TStringField;
    SalesQueryRBCUST_NO: TIntegerField;
    SalesQueryRBSALES_REP: TSmallintField;
    SalesQueryRBORDER_STATUS: TStringField;
    SalesQueryRBORDER_DATE: TSQLTimeStampField;
    SalesQueryRBSHIP_DATE: TSQLTimeStampField;
    SalesQueryRBDATE_NEEDED: TSQLTimeStampField;
    SalesQueryRBPAID: TStringField;
    SalesQueryRBQTY_ORDERED: TIntegerField;
    SalesQueryRBTOTAL_VALUE: TCurrencyField;
    SalesQueryRBDISCOUNT: TSingleField;
    SalesQueryRBITEM_TYPE: TStringField;
    SalesQueryRBAGED: TFMTBCDField;
    SalesQueryRBSalesRecordStatus: TStringField;
    CustomerQueryRBCustomerRecordStatus: TStringField;
    btnApplyUpdates: TButton;
    StatusBar1: TStatusBar;
    btnUndoLastChange: TButton;
    btnCancelUpdates: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StatusCalcFields(DataSet: TDataSet);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure OnDataChange(Sender: TObject; Field: TField);
    procedure btnUndoLastChangeClick(Sender: TObject);
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure CustomerQueryRBUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure SalesQueryRBUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
  private
    { Private declarations }
    procedure ToggleButtons( Enable: Boolean );
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses SharedDMVclU;

procedure TMainForm.SalesQueryRBUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  AAction := eaDefault;
end;

procedure TMainForm.StatusCalcFields(DataSet: TDataSet);
begin
  case DataSet.UpdateStatus of
   usUnmodified: DataSet.Fields[0].AsString := 'Unmodified';
     usModified: DataSet.Fields[0].AsString := 'Modified';
     usInserted: DataSet.Fields[0].AsString := 'Inserted';
      usDeleted: DataSet.Fields[0].AsString := 'Deleted';
  end;
end;

procedure TMainForm.btnApplyUpdatesClick(Sender: TObject);
var
  NumErrors: Integer;
  NumChanges: Integer;
begin
  // Ensure that all edits have been posted
  if CustomerQueryRB.State in dsEditModes then CustomerQueryRB.Post;
  if SalesQueryRB.State in dsEditModes then SalesQueryRB.Post;
  SharedDMVcl.FDConnection.StartTransaction;
  try
    {$IF CompilerVersion >= 29.0}
    NumChanges := FDSchemaAdapter1.ChangeCount;
    {$ELSE}
    NumChanges := -1;
    {$ENDIF}
    NumErrors := FDSchemaAdapter1.ApplyUpdates( -1 );
    SharedDMVcl.FDConnection.Commit;
    if NumErrors > 0 then
      StatusBar1.SimpleText := 'Not all changes could be posted'
    else
      StatusBar1.SimpleText := NumChanges.ToString + ' were posted';
  except
    SharedDMVcl.FDConnection.Rollback;
  end;
  OnDataChange( nil, nil );
end;

procedure TMainForm.btnUndoLastChangeClick(Sender: TObject);
begin
  {$IF CompilerVersion >= 29.0}
  FDSchemaAdapter1.UndoLastChange;
  {$ENDIF}
  OnDataChange( nil, nil );
end;

procedure TMainForm.CustomerQueryRBUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  AAction := eaDefault;
end;

procedure TMainForm.btnCancelUpdatesClick(Sender: TObject);
begin
  {$IF CompilerVersion >= 29.0}
  FDSchemaAdapter1.CancelUpdates;
  {$ENDIF}
  OnDataChange( nil, nil );
end;

procedure TMainForm.OnDataChange(Sender: TObject; Field: TField);
begin
  {$IF CompilerVersion >= 29.0}
  ToggleButtons( FDSchemaAdapter1.UpdatesPending );
  if FDSchemaAdapter1.UpdatesPending then
    StatusBar1.SimpleText := 'There are a total of ' +
                             FDSchemaAdapter1.ChangeCount.ToString +
                             ' updates in cache. The Customer table has ' +
                             CustomerQueryRB.ChangeCount.ToString +
                             ' changes, and the Sales table has ' +
                             SalesQueryRB.ChangeCount.ToString + '.'
  else
  {$ENDIF}
    StatusBar1.SimpleText := 'There are no changes in cache';
end;

procedure TMainForm.ToggleButtons(Enable: Boolean);
begin
  btnApplyUpdates.Enabled := Enable;
  btnUndoLastChange.Enabled := Enable;
  btnCancelUpdates.Enabled := Enable;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  {$IF CompilerVersion >= 30.0}
  FDSchemaAdapter1.UpdateOptions.AutoCommitUpdates := True;
  {$ENDIF}
  CustomerQueryRB.CachedUpdates := True;
  SalesQueryRB.CachedUpdates := True;
  CustomerQueryRB.Open();
  SalesQueryRB.Open();
end;

end.
