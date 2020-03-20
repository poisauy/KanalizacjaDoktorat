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
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.VCLUI.Wait, Vcl.StdCtrls, FireDAC.Comp.UI,
  {$IF CompilerVersion >= 27.0}
     FireDAC.Stan.StorageXML,
  {$ENDIF}
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Vcl.DBCtrls, IOUtils, Vcl.ComCtrls,
  FireDAC.Stan.StorageBin, FireDAC.Phys.IBDef;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBNavigator1: TDBNavigator;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    OpenCloseQueryBtn: TButton;
    EnableCachedUpdatesBtn: TButton;
    ShowCacheBtn: TButton;
    ApplyUpdatesBtn: TButton;
    CancelUpdatesBtn: TButton;
    RevertRecordBtn: TButton;
    UndoLastChangeBtn: TButton;
    CreateSavePointBtn: TButton;
    RevertToSavePointBtn: TButton;
    SaveToFileBtn: TButton;
    LoadFromFileBtn: TButton;
    CommitUpdatesBtn: TButton;
    FDQuery1UpdateStatus: TStringField;
    FDMemTable1: TFDMemTable;
    StatusBar1: TStatusBar;
    FDQuery1CUST_NO: TIntegerField;
    FDQuery1CUSTOMER: TStringField;
    FDQuery1CONTACT_FIRST: TStringField;
    FDQuery1CONTACT_LAST: TStringField;
    FDQuery1PHONE_NO: TStringField;
    FDQuery1ADDRESS_LINE1: TStringField;
    FDQuery1ADDRESS_LINE2: TStringField;
    FDQuery1CITY: TStringField;
    FDQuery1STATE_PROVINCE: TStringField;
    FDQuery1COUNTRY: TStringField;
    FDQuery1POSTAL_CODE: TStringField;
    FDQuery1ON_HOLD: TStringField;
    FDMemTable1CUST_NO: TIntegerField;
    FDMemTable1CUSTOMER: TStringField;
    FDMemTable1CONTACT_FIRST: TStringField;
    FDMemTable1CONTACT_LAST: TStringField;
    FDMemTable1PHONE_NO: TStringField;
    FDMemTable1ADDRESS_LINE1: TStringField;
    FDMemTable1ADDRESS_LINE2: TStringField;
    FDMemTable1CITY: TStringField;
    FDMemTable1STATE_PROVINCE: TStringField;
    FDMemTable1COUNTRY: TStringField;
    FDMemTable1POSTAL_CODE: TStringField;
    FDMemTable1ON_HOLD: TStringField;
    FDMemTable1UpdateStatus: TStringField;
    procedure OpenCloseQueryBtnClick(Sender: TObject);
    procedure EnableCachedUpdatesBtnClick(Sender: TObject);
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure ShowCacheBtnClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ApplyUpdatesBtnClick(Sender: TObject);
    procedure CancelUpdatesBtnClick(Sender: TObject);
    procedure RevertRecordBtnClick(Sender: TObject);
    procedure SaveToFileBtnClick(Sender: TObject);
    procedure LoadFromFileBtnClick(Sender: TObject);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
    procedure FDQuery1AfterClose(DataSet: TDataSet);
    procedure UndoLastChangeBtnClick(Sender: TObject);
    procedure CreateSavePointBtnClick(Sender: TObject);
    procedure RevertToSavePointBtnClick(Sender: TObject);
    procedure CommitUpdatesBtnClick(Sender: TObject);
    procedure FDQuery1UpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure FDQuery1UpdateError(ASender: TDataSet; AException: EFDException;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure FormCreate(Sender: TObject);
    procedure FDQuery1ReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
    FSavePoint: Integer;
    procedure UpdateButtons(const Value: Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses TypInfo, SharedDMVclU; //For GetEnumName


procedure TForm1.ApplyUpdatesBtnClick(Sender: TObject);
var
  Errors: Integer;
begin
  SharedDMVcl.FDConnection.StartTransaction;
  Errors := FDQuery1.ApplyUpdates( 0 );
  if Errors > 0 then
  begin
    if FDMemTable1.Active then
      FDMemTable1.Close;
    FDMemTable1.Data := FDQuery1.Delta;
    ShowMessage('Error were encountered. See bottom grid for ' +
                'records that produced errors. No changes applied');
    SharedDMVcl.FDConnection.Rollback;
  end
  else
  begin
    SharedDMVcl.FDConnection.Commit;
    //Flush the cache
//    FDQuery1.CommitUpdates;
    //Refresh the data
    FDQuery1.Refresh;
    UpdateButtons(FDQuery1.UpdatesPending);
  end;
end;


procedure TForm1.CancelUpdatesBtnClick(Sender: TObject);
begin
  FDQuery1.CancelUpdates;
end;

procedure TForm1.CommitUpdatesBtnClick(Sender: TObject);
begin
  FDQuery1.CommitUpdates;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  UpdateButtons(FDQuery1.UpdatesPending);
  if (FDQuery1.UpdateStatus = usModified) then
    StatusBar1.SimpleText := 'Old Customer Name: ' +
                             FDQuery1.FieldByName('Customer').OldValue +
                             ', New Customer Name: ' +
                             FDQuery1.FieldByName('Customer').CurValue
  else
    StatusBar1.SimpleText := '';
end;

procedure TForm1.EnableCachedUpdatesBtnClick(Sender: TObject);
begin
  if not FDQuery1.CachedUpdates then
  begin
    EnableCachedUpdatesBtn.Caption := 'Disable Cached Updates';
    FDQuery1.CachedUpdates := True;
  end
  else  //we are already in a cached updates mode
  begin
    if FDQuery1.UpdatesPending then
    begin
      ShowMessage('You must apply, cancel, or commit changes to ' +
                  'the cache before exting the cached update mode');
      exit;
    end;
    FDQuery1.CachedUpdates := False;
    EnableCachedUpdatesBtn.Caption := 'Enable Cached Updates';
  end;
  if FDQuery1.Active then
    FDQuery1.Refresh;
end;

procedure TForm1.FDQuery1AfterClose(DataSet: TDataSet);
begin
  OpenCloseQueryBtn.Caption := 'Open Query';
  SaveToFileBtn.Enabled := False;
end;

procedure TForm1.FDQuery1AfterOpen(DataSet: TDataSet);
begin
  OpenCloseQueryBtn.Caption := 'Close Query';
  if FDQuery1.UpdatesPending then
  begin
    EnableCachedUpdatesBtn.Caption := 'Disable Cached Updates';
    FDQuery1.CachedUpdates := True;
  end;
  UpdateButtons(FDQuery1.UpdatesPending);
  SaveToFileBtn.Enabled := True;
end;

procedure TForm1.FDQuery1CalcFields(DataSet: TDataSet);
begin
  case DataSet.UpdateStatus of
   usUnmodified: DataSet.Fields[0].AsString := 'Unmodified';
     usModified: DataSet.Fields[0].AsString := 'Modified';
     usInserted: DataSet.Fields[0].AsString := 'Inserted';
      usDeleted: DataSet.Fields[0].AsString := 'Deleted';
  end;
end;

procedure TForm1.FDQuery1ReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  ShowMessage('OnReconcile: ' + E.Message);
end;

procedure TForm1.FDQuery1UpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
  ShowMessage('OnError: ' + AException.Message);
end;

procedure TForm1.FDQuery1UpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
var
  i: Integer;
  AOption: TFDUpdateRowOption;
begin
//  ShowMessage('ARequest: ' + GetEnumName(TypeInfo(TFDUpdateRequest),Ord(ARequest)));
//  ShowMessage('AAction: ' + GetEnumName(TypeInfo(TFDErrorAction),Ord(AAction)));
//  for AOption  in AOptions do
//    ShowMessage('UpdateOption: ' + GetEnumName(TypeInfo(TFDUpdateRowOption),Ord(AOption)));
//  ShowMessage('');
//  ShowMessage(GetEnumNames(TypeInfo(TFDUpdateRowOptions),Ord(AOptions)));
AAction := TFDErrorAction.eaDefault;
//  ShowMessage(ASender.FieldByName('Company').AsString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SharedDMVcl.FDConnection.Open();
end;

procedure TForm1.OpenCloseQueryBtnClick(Sender: TObject);
begin
  FDQuery1.Active := not FDQuery1.Active;
  if not FDQuery1.Active then
    if FDMemTable1.Active then
      FDMemTable1.Close;
end;

procedure TForm1.RevertRecordBtnClick(Sender: TObject);
begin
  if FDQuery1.UpdateStatus <> usUnmodified then
    FDQuery1.RevertRecord;
end;

procedure TForm1.CreateSavePointBtnClick(Sender: TObject);
begin
  FSavePoint := FDQuery1.SavePoint;
  RevertToSavePointBtn.Enabled := True;
end;

procedure TForm1.RevertToSavePointBtnClick(Sender: TObject);
begin
  DataSource1.DataSet := nil;
  FDQuery1.SavePoint := FSavePoint;
  DataSource1.DataSet := FDQuery1;
  FSavePoint := 0;
  RevertToSavePointBtn.Enabled := False;
end;

procedure TForm1.SaveToFileBtnClick(Sender: TObject);
begin
  FDQuery1.SaveToFile(ExtractFilePath(ParamStr(0)) + 'file.xml', TFDStorageFormat.sfXML);
end;

procedure TForm1.LoadFromFileBtnClick(Sender: TObject);
begin
  if IOUtils.TFile.Exists(ExtractFilePath(ParamStr(0)) + 'file.xml') then
  begin
    //disconnect the query from the DataSource
    FDQuery1.DisableControls;
    try
      FDQuery1.LoadFromFile(ExtractFilePath(ParamStr(0)) +
        'file.xml', TFDStorageFormat.sfXML);
    finally
      FDQuery1.EnableControls;
    end;
  end;
end;

procedure TForm1.ShowCacheBtnClick(Sender: TObject);
begin
  if FDQuery1.Active then
  begin
    if FDMemTable1.Active then
      FDMemTable1.Close;
    FDMemTable1.CloneCursor(FDQuery1, True);
    FDMemTable1.FilterChanges := [rtModified, rtInserted, rtDeleted];
  end;
end;

procedure TForm1.UndoLastChangeBtnClick(Sender: TObject);
begin
  FDQuery1.UndoLastChange(True);
end;

procedure TForm1.UpdateButtons(const Value: Boolean);
begin
  ApplyUpdatesBtn.Enabled := Value;
  ShowCacheBtn.Enabled := Value;
  CancelUpdatesBtn.Enabled := Value;
  CommitUpdatesBtn.Enabled := Value;
  RevertRecordBtn.Enabled := Value;
  UndoLastChangeBtn.Enabled := Value;
  CreateSavePointBtn.Enabled := Value;
end;

end.
