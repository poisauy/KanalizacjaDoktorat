unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, uCEFChromiumCore,
  uCEFChromium, Vcl.ExtCtrls, uCEFWinControl, uCEFChromiumWindow;

const wykresFile = 'wykres.html';

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    qMacierz: TFDQuery;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Panel2: TPanel;
    sgMacierz: TStringGrid;
    Panel3: TPanel;
    qWarianty: TFDQuery;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Button2: TButton;
    Button3: TButton;
    ChromiumWindow1: TChromiumWindow;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure sgMacierzDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgMacierzGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ChromiumWindow1BeforeClose(Sender: TObject);
    procedure ChromiumWindow1Close(Sender: TObject);
    procedure ChromiumWindow1AfterCreated(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
procedure CreateGlobalCEFApp;

implementation

{$R *.dfm}
uses
  uCEFApplication;

// This is a demo with custom JS dialogs

// Destruction steps
// =================
// 1. The FormCloseQuery event sets CanClose to False and calls TChromiumWindow.CloseBrowser, which triggers the TChromiumWindow.OnClose event.
// 2. The TChromiumWindow.OnClose event calls TChromiumWindow.DestroyChildWindow which triggers the TChromiumWindow.OnBeforeClose event.
// 3. TChromiumWindow.OnBeforeClose sets FCanClose := True and sends WM_CLOSE to the form.

procedure CreateGlobalCEFApp;
begin
  GlobalCEFApp                  := TCefApplication.Create;
  //GlobalCEFApp.LogFile          := 'cef.log';
  //GlobalCEFApp.LogSeverity      := LOGSEVERITY_VERBOSE;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  header, first_row_width: Integer;
  text_width : Integer;
  row, col: Integer;
begin
 FDConnection1.Connected := True;
 qMacierz.Open;
 // Wype³niamy macierz nag³ówkami
 sgMacierz.ColCount := 1;
 sgMacierz.RowCount:= 1;
 qWarianty.Open;
 while not qWarianty.Eof do
  Begin
    sgMacierz.ColCount := sgMacierz.ColCount + 1;
    sgMacierz.RowCount := sgMacierz.RowCount + 1;
    sgMacierz.Cells[0, sgMacierz.RowCount-1 ] := qWarianty['nazwa'];
    sgMacierz.Cells[sgMacierz.ColCount-1, 0] := qWarianty['nazwa'];
    qWarianty.Next;
  End;

  // Kalkulacja wysokoœci nag³ówka
  header := 10;
  for i := 0 to sgMacierz.ColCount -1  do
   Begin
     text_width:= sgMacierz.Canvas.TextWidth( sgMacierz.Cells[ 0, i ] );
     if header < text_width then header := text_width;
   End;
  sgMacierz.RowHeights[0] := header + 30;

  // Kalkulacja szerokoœci wiersza
  first_row_width := 10;
  for i := 0 to sgMacierz.RowCount -1 do
    Begin
     text_width:= sgMacierz.Canvas.TextWidth( sgMacierz.Cells[ i, 0 ] );
     if first_row_width < text_width then first_row_width := text_width;
    End;
  sgMacierz.ColWidths[0] := first_row_width;


  // Wype³nienie danymi
  qMacierz.First;
  for row := 1 to sgMacierz.RowCount -1 do
    Begin
     for col := 1 to sgMacierz.ColCount - 1 do
      Begin
        if qMacierz.Locate('row_nazwa;col_nazwa',
            VarArrayOf([
                sgMacierz.Cells[0, row ],
                sgMacierz.Cells[col, 0 ]
            ]), [] ) then
             Begin
               sgMacierz.Cells[ col, row ] := qMacierz['value'];
             End;
      End;
    End;




end;

// Display text vertically in StringGrid cells
// Vertikale Textausgabe in den Zellen eines StringGrid
procedure StringGridRotateTextOut(Grid: TStringGrid; ARow, ACol: Integer; Rect: TRect;
  Schriftart: string; Size: Integer; Color: TColor; Alignment: TAlignment);
var
  lf: TLogFont;
  tf: TFont;
begin
  // if the font is to big, resize it
  // wenn Schrift zu groß dann anpassen
  if (Size > Grid.ColWidths[ACol] div 2) then
    Size := Grid.ColWidths[ACol] div 2;

  with Grid.Canvas do
  begin
    // Replace the font
    // Font setzen
    Font.Name := Schriftart;
    Font.Size := Size;
    Font.Color := Color;
    tf := TFont.Create;
    try
      tf.Assign(Font);
      GetObject(tf.Handle, SizeOf(lf), @lf);
      lf.lfEscapement  := 900;
      lf.lfOrientation := 0;
      tf.Handle := CreateFontIndirect(lf);
      Font.Assign(tf);
    finally
      tf.Free;
    end;
    // fill the rectangle
    // Rechteck füllen

    FillRect(Rect);
    // Align text and write it
    // Text nach Ausrichtung ausgeben
    if Alignment = taLeftJustify then
      TextRect(Rect, Rect.Left + 2,Rect.Bottom - 2,Grid.Cells[ACol, ARow]);
    if Alignment = taCenter then
      TextRect(Rect, Rect.Left + Grid.ColWidths[ACol] div 2 - Size +
        Size div 3,Rect.Bottom - 2,Grid.Cells[ACol, ARow]);
    if Alignment = taRightJustify then
      TextRect(Rect, Rect.Right - Size - Size div 2 - 2,Rect.Bottom -
        2,Grid.Cells[ACol, ARow]);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  if not FileExists(wykresFile) then
    Begin
      ShowMessage('Brak pliku '+wykresFile );
      Exit;
    End;


  // GlobalCEFApp.GlobalContextInitialized has to be TRUE before creating any browser
  // If it's not initialized yet, we use a simple timer to create the browser later.
  if not(ChromiumWindow1.CreateBrowser) then Timer1.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage('Not implemented yet');
end;

procedure TForm1.ChromiumWindow1AfterCreated(Sender: TObject);
begin
  ShowMessage('Chromium created ');
  ChromiumWindow1.LoadURL('file:///'+wykresFile);
end;

procedure TForm1.ChromiumWindow1BeforeClose(Sender: TObject);
begin
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TForm1.ChromiumWindow1Close(Sender: TObject);
begin
  // DestroyChildWindow will destroy the child window created by CEF at the top of the Z order.
  if not(ChromiumWindow1.DestroyChildWindow) then
    begin
      PostMessage(Handle, WM_CLOSE, 0, 0);
    end;
end;

procedure TForm1.sgMacierzDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var
  LogFont: TLogFont;
  TextPosition: TPoint;
  NewFontHandle: HFONT;
  OldFontHandle: HFONT;
  size : Integer;
begin
  // Rotacja nag³ówka
  if aRow = 0 then
    StringGridRotateTextOut(sgMacierz, ARow, ACol, Rect, 'ARIAL',
      10, clRed, taLeftJustify);
  if (aRow = aCol) and (aCol <> 0) then
   with sgMacierz.Canvas do Begin
     Brush.Color := clSilver;
     FillRect( Rect );
     TextOut(Rect.Left+2,Rect.Top+2,sgMacierz.Cells[ACol, ARow]);
   End;

end;

procedure TForm1.sgMacierzGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: string);
begin
  if (ACol <> aRow) and ( aCol <> 0 ) and ( aRow <> 0 ) then
    Value := '###.###';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not(ChromiumWindow1.CreateBrowser) and not(ChromiumWindow1.Initialized) then
    Timer1.Enabled := True;
end;

end.
