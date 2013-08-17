unit Unt_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm_Main = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    dlgOpen1: TOpenDialog;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    dlgSave1: TSaveDialog;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Name:string;
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

procedure TForm_Main.Button3Click(Sender: TObject);
var
  s:string;
begin
  if dlgSave1.Execute then
    s:=dlgSave1.FileName;
  if LowerCase(ExtractFileExt(s)) <> '.pas' then
    s := s+ '.pas';
  Edit3.Text := s;
end;

procedure TForm_Main.Button1Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
    Edit1.Text := dlgOpen1.FileName;
  Name := ExtractFileName(Edit1.Text);
  if ExtractFileExt(Name ) <> '' then
    Name:= StringReplace(Name,ExtractFileExt(Name ),'',[]);
  Edit2.Text := Name;
  Edit3.Text := ExtractFilePath(Edit1.Text)+'Unt_'+Name+'Dat.pas';
end;

procedure TForm_Main.Button2Click(Sender: TObject);
var
  sl:TStrings;
  fstrm:TFileStream ;
  i,j,ssize:Integer;
  b:Byte;
  s:string;
  brk:Boolean;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '')then Exit;
  if not FileExists(Edit1.Text) then Exit;
  fstrm := TFileStream.Create(Edit1.Text,fmOpenRead );
  ProgressBar1.Max := fstrm.Size;
  ssize := fstrm.Size;
  ProgressBar1.Position := 0;
  sl := TStringList.Create;
  Name := Edit2.Text ;
  sl.Add('unit Unt_'+Name+'Dat;');
  sl.Add('');
  sl.Add('interface') ;
  sl.Add('');
  sl.Add('const');
  sl.Add('  '+name+'Size = '+inttostr(ssize)+';');
  sl.Add('');
  sl.Add('  '+name+' : array [0..'+inttostr(ssize-1)+'] of Byte =');
  sl.Add('  (');
  j := 0;
  fstrm.Position :=0;
  brk:= True ;
  while brk do
  begin
    s:='    ';
    for i := 1 to 16 do
    begin
      fstrm.Read(b,1);
      s:= s + '$'+inttohex(b,2)+',';
      ProgressBar1.Position := j;
      Inc(j);
      if j >= ssize then
      begin
        Delete(s,Length(s),1);
        brk := False;
        Break ;
      end;
    end;
    sl.Add(s);
  end;
  sl.Add('  );');
  sl.Add('');
  sl.Add('implementation');
  sl.Add('end.');
  sl.Add('');
  sl.SaveToFile(Edit3.Text );
  fstrm.Free;
  sl.Free;
  ShowMessage('Finished');
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
end;

end.
