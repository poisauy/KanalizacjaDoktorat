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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Stan.ExprFuncs;  // This unit is critical if you want to use FireDAC functions

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    btnShowProcessor: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Label3: TLabel;
    FDQuery1: TFDQuery;
    procedure btnShowProcessorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses SharedDMVclU, TypInfo;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add( FDQuery1.SQL.Text );
  FDQuery1.Prepare;
end;

procedure TForm1.btnShowProcessorClick(Sender: TObject);
var
  i: Integer;
  Macro: TFDMacro;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo1.Lines.Add( FDQuery1.SQL.Text );
  FDQuery1.Prepare;
  ListBox1.Clear;
  for i := 0 to FDQuery1.MacroCount-1 do
  begin
    Macro := FDQuery1.Macros[i];
    ListBox1.Items.Add( 'Name: ' + Macro.Name + ', Type : ' +
      GetEnumName(TypeInfo(TFDMacroDataType),Ord(Macro.DataType)) +
      ', Value: ' + Macro.Value );
  end;
  Memo2.Lines.Text := FDQuery1.Text;
end;

end.
