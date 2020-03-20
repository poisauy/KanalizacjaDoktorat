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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Layouts,
  FMX.ListBox, FMX.Grid, Fmx.Bind.Grid, Data.Bind.Grid, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    Label1: TLabel;
    Label2: TLabel;
    ListBox2: TListBox;
    Button1: TButton;
    BindSourceDB2: TBindSourceDB;
    Grid1: TGrid;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    procedure ListBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses datamodu;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ListBox2.Selected = nil then raise exception.Create('Nothing selected');
  LoadData;

end;

procedure TForm1.ListBox1Change(Sender: TObject);
var
  i: Integer;
begin
  DataModule2.FieldsQry.Close;
  DataModule2.FieldsQry.Macros[0].AsRaw := ListBox1.Selected.Text;
  DataModule2.FieldsQry.Open;
  ListBox2.Clear;
  for i := 0 to DataModule2.FieldsQry.FieldCount - 1 do
    ListBox2.Items.Add(DataModule2.FieldsQry.Fields[i].FieldName);
end;

procedure TForm1.LoadData;
var
  i: Integer;
  FieldList: string;
  ListBoxItem: TListBoxItem;

  procedure BuildList(Value: string);
  begin
    if FieldList = '' then
      FieldList := Value
    else
      FieldList := FieldList + ', ' + Value;
  end;

begin
  DataModule2.SelectQry.Close;
  for i := 0 to ListBox2.Items.Count - 1 do
    if ListBox2.ListItems[i].IsSelected then
      BuildList(ListBox2.ListItems[i].Text);
  DataModule2.SelectQry.Macros[0].AsRaw := FieldList;
  DataModule2.SelectQry.Macros[1].AsRaw := ListBox1.Selected.Text;
  DataModule2.SelectQry.Open;
end;

end.
