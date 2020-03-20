unit UEASES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait, Data.DB, Vcl.DBGrids,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button9: TButton;
    Button8: TButton;
    Button7: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    TreeView1: TTreeView;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DBGrid1: TDBGrid;
    FDPhysODBCDriverLink1: TFDPhysODBCDriverLink;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  // procedure StringGridRotateTextOut(Grid: TStringGrid; ARow, ACol: Integer; Rect: TRect;
           //   Schriftart: string; Size: Integer; Color: TColor; Alignment: TAlignment);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button11Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
TreeView1.LoadFromFile('E:\Doktorat\KanalizacjaDoktorat\Baza_Danych\Model_7_7.txt');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DBGrid1.Width:=393;
 DBGrid1.Columns[0].Width:=50;
 DBGrid1.Columns[1].Width:=50;
 DBGrid1.Columns[2].Width:=50;
 DBGrid1.Columns[3].Width:=50;
 DBGrid1.Columns[4].Width:=50;
 DBGrid1.Columns[5].Width:=50;
 DBGrid1.Columns[6].Width:=50;





 {with StringGrid1 do
  begin
   ColCount:=8;
   RowCount:=8;
   ColWidths[0]:=180;
   ColWidths[1]:=50;
   ColWidths[2]:=50;
   ColWidths[3]:=50;
   ColWidths[4]:=50;
   ColWidths[5]:=50;
   ColWidths[6]:=50;
   ColWidths[7]:=50;

   Cells[0,1]:='Sieæ Grawitacyjna';
   Cells[0,2]:='Sieæ Ma³oœrednicowa';
   Cells[0,3]:='Sieæ Podciœnieniowa';
   Cells[0,4]:='Sieæ Niskociœnieniowa';
   Cells[0,5]:='Sieæ Wysokociœnieniowa';
   Cells[0,6]:='Sieæ Mieszana';
   Cells[0,7]:='Oczyszczalnia Przydomowa';
   {
   Cells[1,0]:='K. nr 1';
   Cells[2,0]:='K. nr 2';
   Cells[3,0]:='K. nr 3';
   Cells[4,0]:='K. nr 4';
   Cells[5,0]:='K. nr 5';
   Cells[6,0]:='K. nr 6';
   Cells[7,0]:='K. nr 7';


   Cells[1,1]:='0.3333';
   Cells[1,2]:='0.1468';
   Cells[1,3]:='0.2568';
   Cells[1,4]:='0.3658';
   Cells[1,5]:='0.5489';
   Cells[1,6]:='0.1245';
   Cells[1,7]:='0.2356';}

  TreeView1.LoadFromFile('E:\Doktorat\KanalizacjaDoktorat\Baza_Danych\Model_7_7.txt');
  end;

  {
procedure TForm1.StringGridRotateTextOut(Grid: TStringGrid; ARow, ACol: Integer;
  Rect: TRect; Schriftart: string; Size: Integer; Color: TColor; Alignment: TAlignment);

var NewFont, OldFont : Integer; FontStyle, FontItalic, FontUnderline, FontStrikeout: Integer;

begin     // if the font is to big, resize it
If (Size > Grid.ColWidths[ACol] DIV 2) Then Size := Grid.ColWidths[ACol] DIV 2;
 with Grid.Canvas do
 begin     // Set font
 If (fsBold IN Font.Style) Then FontStyle := FW_BOLD
 else FontStyle := FW_NORMAL;
 If (fsItalic IN Font.Style) Then FontItalic := 1
 else FontItalic := 0;

 If (fsUnderline IN Font.Style) Then FontUnderline := 1
 else FontUnderline := 0;
 If (fsStrikeOut IN Font.Style) Then FontStrikeout:=1
 else FontStrikeout:=0;
 Font.Color := Color;

 NewFont := CreateFont(Size, 0, 900, 0, FontStyle, FontItalic,
 FontUnderline, FontStrikeout, DEFAULT_CHARSET,
 OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
 DEFAULT_PITCH, PChar(Schriftart));

 OldFont:= SelectObject(Handle, NewFont);     // fill the rectangle
 FillRect(Rect);  // Write text depending on the alignment

 If Alignment = taLeftJustify Then TextRect(Rect,Rect.Left+2,Rect.Bottom-2,Grid.Cells[ACol,ARow]);
 If Alignment = taCenter Then TextRect(Rect,Rect.Left+Grid.ColWidths[ACol] DIV 2 - Size + Size DIV 3, Rect.Bottom-2,Grid.Cells[ACol,ARow]);
 if Alignment = taRightJustify then TextRect(Rect, Rect.Right - Size - Size div 2 - 2, Rect.Bottom - 2, Grid.Cells[ACol, ARow]); // Recreate reference to the old font

 SelectObject(Handle, OldFont); // Recreate reference to the new font
 DeleteObject(NewFont);
 end;
 end;



 // wariant 1
{var lf: TLogFont; tf: TFont;
begin     // jak s¹ fonty za du¿e to autodopasowanie
if (Size > Grid.ColWidths[ACol] div 2) then
   Size := Grid.ColWidths[ACol] div 2;

  with Grid.Canvas do
   begin     // to wymieni fonty
    Font.Name := Schriftart;     Font.Size := Size; Font.Color := Color; tf := TFont.Create;
    try tf.Assign(Font);
    GetObject(tf.Handle, SizeOf(lf), @lf);
    lf.lfEscapement := 900;
    lf.lfOrientation := 0;
    tf.Handle := CreateFontIndirect(lf);
    Font.Assign(tf);
    finally  tf.Free;
    end; // wype³ni prostok¹t
   FillRect(Rect); // tekstem

   if Alignment = taLeftJustify then
   TextRect(Rect, Rect.Left + 2, Rect.Bottom - 2, Grid.Cells[ACol, ARow]);

   if Alignment = taCenter then
    TextRect(Rect, Rect.Left + Grid.ColWidths[ACol] div 2 - Size + Size div 3, Rect.Bottom - 2, Grid.Cells[ACol, ARow]);

   if Alignment = taRightJustify then
   TextRect(Rect, Rect.Right - Size - Size div 2 - 2, Rect.Bottom - 2, Grid.Cells[ACol, ARow]);
   end;
end;}

end.
