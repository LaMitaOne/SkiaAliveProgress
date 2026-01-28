unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uSkiaAliveProgress,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.EditBox,
  FMX.SpinBox;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    start: TButton;
    Button2: TButton;
    SpinBox1: TSpinBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinBox1Change(Sender: TObject);
    procedure startClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FProgress: TSkiaAliveProgress;
  public
    { Public-Deklarationen }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.Button1Click(Sender: TObject);
begin
  FProgress.AnimateOut;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
if FProgress.ProgressMode = pmIndeterminate then begin
  FProgress.ProgressMode := pmDeterminate;
  Button2.Text := 'Progress';
end
  else begin
   FProgress.ProgressMode := pmIndeterminate;
   Button2.Text := 'Loading';
  end;

end;

procedure TForm9.FormShow(Sender: TObject);
begin
  FProgress := TSkiaAliveProgress.Create(Self);
  FProgress.Parent := Panel1;
  FProgress.Align := TAlignLayout.Client;
  FProgress.Visible := True;
  FProgress.Start;
end;

procedure TForm9.SpinBox1Change(Sender: TObject);
begin
  FProgress.Position := SpinBox1.Value;
end;

procedure TForm9.startClick(Sender: TObject);
begin
  FProgress.AnimateIn;
end;

end.
