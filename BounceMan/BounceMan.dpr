program BounceMan;

uses
  System.StartUpCopy,
  FMX.Forms,
  From in 'From.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
