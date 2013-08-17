program AnyFiletopas;

uses
  Forms,
  Unt_Main in 'Unt_Main.pas' {Form_Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
