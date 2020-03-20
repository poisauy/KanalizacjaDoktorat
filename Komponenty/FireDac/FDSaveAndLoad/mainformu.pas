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
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, Data.DB, FireDAC.Stan.Consts,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.VCLUI.Wait, Vcl.StdCtrls, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Vcl.DBCtrls, IOUtils, Vcl.ComCtrls,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageXML;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBNavigator1: TDBNavigator;
    btnEnableCachedUpdates: TButton;
    btnApplyUpdates: TButton;
    btnCancelUpdates: TButton;
    btnSaveToFile: TButton;
    btnLoadFromFile: TButton;
    FDQuery1UpdateStatus: TStringField;
    StatusBar1: TStatusBar;
    cbxPrettyPrint: TCheckBox;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    btnRunQuery: TButton;
    GroupBox1: TGroupBox;
    cbxData: TCheckBox;
    cbxDelta: TCheckBox;
    cbxMetadata: TCheckBox;
    btnClearQuery: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbxStoreMergeData: TComboBox;
    cbxStoreMergeMeta: TComboBox;
    btnSaveToStream: TButton;
    btnLoadFromStream: TButton;
    OpenDialog1: TOpenDialog;
    cbxVisible: TCheckBox;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure btnEnableCachedUpdatesClick(Sender: TObject);
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure CommitUpdatesBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxPrettyPrintClick(Sender: TObject);
    procedure btnRunQueryClick(Sender: TObject);
    procedure cbxDataClick(Sender: TObject);
    procedure cbxDeltaClick(Sender: TObject);
    procedure cbxMetadataClick(Sender: TObject);
    procedure btnClearQueryClick(Sender: TObject);
    procedure cbxStoreMergeDataChange(Sender: TObject);
    procedure cbxStoreMergeMetaChange(Sender: TObject);
    procedure btnSaveToStreamClick(Sender: TObject);
    procedure btnLoadFromStreamClick(Sender: TObject);
    procedure cbxVisibleClick(Sender: TObject);
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

uses TypInfo, SharedDMVclU, ChooseDataSetFormu; //For GetEnumName

const
  DataStoreTab = 'STOREDDATASETS';

procedure TForm1.btnApplyUpdatesClick(Sender: TObject);
var
  Errors: Integer;
begin
  SharedDMVcl.FDConnection.StartTransaction;
  try
    Errors := FDQuery1.ApplyUpdates( -1 );
    SharedDMVcl.FDConnection.Commit;
  except

    SharedDMVcl.FDConnection.Rollback
  end;
  FDQuery1.Refresh;
  UpdateButtons( FDQuery1.Active ); FDQuery1.LoadFromFileAtOpen;
end;


procedure TForm1.btnRunQueryClick(Sender: TObject);
begin
  if FDQuery1.UpdatesPending then
    raise Exception.Create('Cannot update FDQuery with updates pending');
  FDQuery1.Close;
  FDQuery1.SQL.Text := Memo1.Lines.Text;
  try
    FDQuery1.Open;
  finally
    UpdateButtons( FDQuery1.Active );
  end;
end;

procedure TForm1.btnCancelUpdatesClick(Sender: TObject);
begin
  FDQuery1.CancelUpdates;
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.btnClearQueryClick(Sender: TObject);
begin
  FDQuery1.Close;
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.cbxDataClick(Sender: TObject);
begin
  if cbxData.Checked then
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems + [siData]
  else
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems - [siData];
end;

procedure TForm1.cbxDeltaClick(Sender: TObject);
begin
  if cbxDelta.Checked then
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems + [siDelta]
  else
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems - [siDelta];
end;

procedure TForm1.cbxMetadataClick(Sender: TObject);
begin
  if cbxMetaData.Checked then
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems + [siMeta]
  else
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems - [siMeta];
end;

procedure TForm1.cbxPrettyPrintClick(Sender: TObject);
begin
  FDQuery1.ResourceOptions.StorePrettyPrint :=   cbxPrettyPrint.Checked;
end;

procedure TForm1.cbxStoreMergeDataChange(Sender: TObject);
begin
  {$IF CompilerVersion > 28.0} // Delphi 8 and later
  FDQuery1.ResourceOptions.StoreMergeData :=
    TFDMergeDataMode( cbxStoreMergeData.ItemIndex );
  {$ENDIF}
end;

procedure TForm1.cbxStoreMergeMetaChange(Sender: TObject);
begin
  {$IF CompilerVersion > 28.0} // Delphi 8 and later
  FDQuery1.ResourceOptions.StoreMergeMeta :=
    TFDMergeMetaMode( cbxStoreMergeMeta.ItemIndex );
  {$ENDIF}
end;

procedure TForm1.cbxVisibleClick(Sender: TObject);
begin
  if cbxVisible.Checked then
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems + [siVisible]
  else
    FDQuery1.ResourceOptions.StoreItems :=
      FDQuery1.ResourceOptions.StoreItems - [siVisible];
end;

procedure TForm1.CommitUpdatesBtnClick(Sender: TObject);
begin
  FDQuery1.CommitUpdates;
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.btnEnableCachedUpdatesClick(Sender: TObject);
begin
  if not FDQuery1.CachedUpdates then
  begin
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
  end;
  UpdateButtons( FDQuery1.Active );
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

procedure TForm1.FormCreate(Sender: TObject);
var
  FDQuery: TFDQuery;
const
  TabName = 'STOREDDATASETS';
begin
  SharedDMVcl.FDConnection.Open();
  FDQuery := TFDQuery.Create( nil );
  try
    FDQuery.Connection := SharedDMVcl.FDConnection;
    FDQuery.Open( 'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS ' +
                  '  WHERE RDB$RELATION_NAME = ''' + DataStoreTab + '''');
    FDQuery.Open();

    //Create the table if necessary
    if FDQuery.IsEmpty then
    begin
      SharedDMVcl.FDConnection.StartTransaction;
      try
        FDQuery1.Connection.ExecSQL('CREATE TABLE "' + DataStoreTab + '" ( ' +
                         '     DataSetName VarChar( 30 ) NOT NULL Primary Key, ' +
                         '     DataSet BLOB NOT NULL )');
      finally
        SharedDMVcl.FDConnection.Commit;
      end;
    end;
  finally
    FDQuery.Close;
  end;
  // Update UI based on persistence mode options
  cbxPrettyPrint.Checked := FDQuery1.ResourceOptions.StorePrettyPrint;
  cbxData.Checked := siData in FDQuery1.ResourceOptions.StoreItems;
  cbxDelta.Checked := siDelta in FDQuery1.ResourceOptions.StoreItems;
  cbxMetaData.Checked := siMeta in FDQuery1.ResourceOptions.StoreItems;
  cbxVisible.Checked := siVisible in FDQuery1.ResourceOptions.StoreItems;
  {$IF CompilerVersion > 28.0} // Delphi 8 and later
  cbxStoreMergeData.ItemIndex := Ord( FDQuery1.ResourceOptions.StoreMergeData );
  cbxStoreMergeMeta.ItemIndex := Ord( FDQuery1.ResourceOptions.StoreMergeMeta );
  {$ENDIF}
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.btnSaveToFileClick(Sender: TObject);
var
  FileExt: string;
begin
  if SaveDialog1.Execute then
  begin
    FileExt := ExtractFileExt(SaveDialog1.FileName).ToUpper;
    if FileExt = 'XML' then
      FDQuery1.SaveToFile( SaveDialog1.FileName, TFDStorageFormat.sfXML )
    else
    if FileExt = 'JSON' then
      FDQuery1.SaveToFile( SaveDialog1.FileName, TFDStorageFormat.sfJSON )
    else
    if FileExt = 'BIN' then
      FDQuery1.SaveToFile( SaveDialog1.FileName, TFDStorageFormat.sfBinary )
    else  //everything else
      FDQuery1.SaveToFile( SaveDialog1.FileName, TFDStorageFormat.sfAuto )
  end;
end;

procedure TForm1.btnSaveToStreamClick(Sender: TObject);
var
  DataSetName: string;
  ms: TMemoryStream;
  FDQuery: TFDQuery;
begin
  if InputQuery( 'Save to Stream', 'DataSet Name', DataSetName ) then
  begin
    ms := TMemoryStream.Create;
    try
      FDQuery1.SaveToStream( ms, sfXML );
      ms.Position := 0;
      FDQuery := TFDQuery.Create( nil );
      try
        FDQuery.Connection := SharedDMVcl.FDConnection;
        FDQuery.Open('SELECT DataSetName, DataSet FROM ' +  DataStoreTab +
                     '  WHERE DataSetName = ''' + DataSetName.ToUpper + '''');
        if FDQuery.IsEmpty then
          FDQuery.Append
        else
          FDQuery.Edit;
        FDQuery.Fields[0].AsString := DataSetName;
        TBlobField(FDQuery.Fields[1]).LoadFromStream( ms );
        FDQuery.Post;
      finally
        FDQuery.Free;
      end;
    finally
      ms.Free;
    end;
  end;
end;

procedure TForm1.btnLoadFromFileClick(Sender: TObject);
var
  FileExt: string;
  i: Integer;
begin
  if OpenDialog1.Execute then
  begin
    FileExt := ExtractFileExt(OpenDialog1.FileName).ToUpper;
    if FileExt = 'XML' then
      FDQuery1.LoadFromFile( OpenDialog1.FileName, TFDStorageFormat.sfXML )
    else
    if FileExt = 'JSON' then
      FDQuery1.LoadFromFile( OpenDialog1.FileName, TFDStorageFormat.sfJSON )
    else
    if FileExt = 'BIN' then
      FDQuery1.LoadFromFile( OpenDialog1.FileName, TFDStorageFormat.sfBinary )
    else  //everything else
      FDQuery1.LoadFromFile( OpenDialog1.FileName, TFDStorageFormat.sfAuto )
  end;
  if not FDQuery1.CachedUpdates and FDQuery1.UpdatesPending then
    FDQuery1.CachedUpdates := True;
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.btnLoadFromStreamClick(Sender: TObject);
var
  FDQuery: TFDQuery;
  ChooseDataSetForm: TChooseDataSetForm;
  ms: TMemoryStream;
begin
  FDQuery := TFDQuery.Create( nil );
  try
    FDQuery.Connection := SharedDMVcl.FDConnection;
    FDQuery.Open('SELECT * FROM ' + DataStoreTab );
    if FDQuery.IsEmpty then
      raise Exception.Create( 'There are not stored datasets to load' );
    ChooseDataSetForm := TChooseDataSetForm.Create( nil );
    try
    ChooseDataSetForm.Caption := DataStoreTab;
    ChooseDataSetForm.DataSource1.DataSet := FDQuery;
    if ChooseDataSetForm.ShowModal = mrOK then
    begin
      ms := TMemoryStream.Create;
      try
        TBlobField(FDQuery.Fields[1]).SaveToStream( ms );
        ms.Position := 0;
        FDQuery1.LoadFromStream( ms );
      finally
        ms.Free;
      end;
    end;
    finally
      ChooseDataSetForm.Free;
    end;
  finally
    FDQuery.Free;
  end;
  if not FDQuery1.CachedUpdates and FDQuery1.UpdatesPending then
    FDQuery1.CachedUpdates := True;
  UpdateButtons( FDQuery1.Active );
end;

procedure TForm1.UpdateButtons(const Value: Boolean);
begin
  btnSaveToFile.Enabled := Value;
  btnSaveToStream.Enabled := Value;
  btnLoadFromFile.Enabled := True;
  btnLoadFromStream.Enabled := True;
  btnApplyUpdates.Enabled := FDQuery1.UpdatesPending;
  btnCancelUpdates.Enabled := FDQuery1.UpdatesPending;
  if FDQuery1.UpdatesPending then
    btnEnableCachedUpdates.Caption := 'Disable Cached Updates'
  else
    btnEnableCachedUpdates.Caption := 'Enable Cached Updates';
end;

end.
