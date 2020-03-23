unit U_S_Grawitacyjna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  AdvPageControl;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    AdvPageControl1: TAdvPageControl;
    Button1: TButton;
    PageControl1: TPageControl;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses UEASES;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form2.Close;
//Form1.Show;
end;

end.
