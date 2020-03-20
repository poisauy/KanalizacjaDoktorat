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
unit ChooseDataSetFormu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TChooseDataSetForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DataSource1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChooseDataSetForm: TChooseDataSetForm;

implementation

{$R *.dfm}

procedure TChooseDataSetForm.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
