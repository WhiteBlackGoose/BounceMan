unit From;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani, System.Sensors,
  System.Sensors.Components, inifiles;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    FisJ: TTimer;
    Label1: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    field: TTimer;
    Image10: TImage;
    Image9: TImage;
    Image11: TImage;
    Image12: TImage;
    giro: TMotionSensor;
    PlavPer: TTimer;
    Image3: TImage;
    Image4: TImage;
    Image13: TImage;
    Text1: TText;
    MenuBut: TCornerButton;
    H: TTimer;
    ColForm: TTimer;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    TextX: TText;
    Mno: TLabel;
    Mig: TTimer;
    Text2: TText;
    Image17: TImage;
    procedure FisJTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fieldTimer(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure giroStateChanged(Sender: TObject);
    procedure PlavPerTimer(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure MenuButClick(Sender: TObject);
    procedure ColFormTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormHide(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure TextXClick(Sender: TObject);
    procedure MigTimer(Sender: TObject);
    procedure Text2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure replacing;
procedure movej;
procedure jump;
procedure down;
procedure popal;
procedure MoveField;
procedure MoveCloud;
procedure Plav;
Procedure AllAble;
Procedure AllDisAble;
Procedure MayJ;
Procedure jjuummpp;
Procedure Genbomb1;
Procedure Genbomb5;
Procedure Genbomb6;
Procedure Genbomb7;
Procedure Genbomb8;
procedure die;
procedure Save;
procedure TakeSave;
procedure begining;
var
  Form2: TForm2;
  colvo: Integer;
  OnJ: Integer;
  j: boolean;
  imagespath:String;
  way:String;
  score:Integer;
  AddScore:Integer;
  pau:boolean;
  SlowGrass:Integer;
  f:Integer;
  cotoshariki:Integer;
implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}
{$R *.iPhone47in.fmx IOS}

procedure TForm2.Button2Click(Sender: TObject);
begin
   if image2.Position.X<clientwidth then begin
   image2.Position.X:=image2.Position.X+10;
   end
   else image2.Position.X:=image2.Position.X-60;
  (* replacing;
    image2.Position.X:=0;
    image2.position.y:=clientheight;
    colvo:=0;
    Onj:=3;
    (*if image2.position.y>form2.ClientHeight then begin
    movej;
    end; *)
end;

procedure TForm2.ColFormTimer(Sender: TObject);
begin
if pau=false then begin
if form2.Fill.Color>$ff000000 then
form2.Fill.Color:=form2.Fill.Color-1;
if image14.Position.Y+image14.Height<clientheight then
image14.Position.Y:=image14.Position.Y+1;
end;
end;

procedure TForm2.fieldTimer(Sender: TObject);
begin
if pau=false then begin
movefield;
MoveCloud;
end;
end;


procedure TForm2.FisJTimer(Sender: TObject);
var
  ht:Integer;
begin
(*ht:=random(3);

if ht=2 then
label1.textsettings.fontcolor:=$ffff0000;

if ht=1 then
label1.textsettings.fontcolor:=$ff00ff00;

if ht=0 then
label1.textsettings.fontcolor:=$ff0000ff;*)
//label2.Text:=FloatToStr(giro.Sensor.angleAccelX);
//image2.Position.X:=(*image2.Position.X+*)giro.Sensor.angleAccely;
(*if giro.Sensor<>nil then
label2.Text:=FloatToStr(giro.Sensor.AngleAccelX);*)
if pau=false then begin
image2.Position.X:=image2.Position.X+(giro.Sensor.accelerationx*22);//  popal;
  if ((form2.Image2.Position.Y-(form2.Image2.height)<form2.Image4.Position.Y) and (form2.Image2.Position.X<form2.Image4.Position.X+form2.Image4.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image4.Position.X) and (form2.Image2.Position.Y+(form2.Image4.height)>form2.Image4.Position.Y))
  then begin
    die;
  end;
if form2.Image2.Position.X>clientwidth then
form2.Image2.Position.X:=0;

if form2.Image2.Position.X<0 then
form2.Image2.Position.X:=clientwidth;

  if Image2.Position.Y < (Form2.ClientHeight + 1) then
  begin

    // onj:=3;
    Image2.Position.Y := Image2.Position.Y - round(OnJ*2);
    if (colvo < 30) and (j = false) then
    begin
      colvo := colvo + 1;
      jump;
    end;
    if (colvo > 29) and (j = false) then
      j := true;

    if j = true then
    begin
      popal;
      down;
      colvo := colvo - 1;
    end;
  end
  else
  begin
    (*Image2.Position.Y := Form2.ClientHeight;
    colvo := 0;
    OnJ := 4;
    j := false;*)
    die;
  end;


end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Save;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
save;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
begining;
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
save;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
save;
end;

procedure TForm2.FormHide(Sender: TObject);
begin
save;
end;



procedure TForm2.FormResize(Sender: TObject);
begin
save;
end;

procedure TForm2.FormShow(Sender: TObject);
var
f:Integer;
begin
begining;
end;

procedure TForm2.giroStateChanged(Sender: TObject);
begin
//label2.Text:=FloatToStr(giro.Sensor.angleAccelX);
image2.Position.X:=image2.Position.X+giro.Sensor.accelerationx;
 (*if giro.Sensor.accelerationx>0 then begin

 end;*)

(*if giro.Sensor<>nil then
label2.Text:=FloatToStr(giro.Sensor.AngleAccelX);*)
end;

procedure TForm2.Image10Click(Sender: TObject);
begin
save;
if pau=false then begin
pau:=true;
menubut.visible:=true;
end
else begin
pau:=false;
menubut.visible:=false;
end;
end;

procedure TForm2.Image13Click(Sender: TObject);
begin
fill.Color:=$ff0000ff;
label1.textsettings.Font.Size:=30;
label1.text:='0зв';
form2.Image14.Position.y:=-160-form2.Image14.Height;
allable;
image13.Visible:=false;
text1.Visible:=false;

if addscore=2 then mno.Text:='x2';
if addscore=3 then mno.Text:='x3';


form2.Image1.Position.Y:=clientheight-60;
form2.Image1.Position.X:=random(f);

form2.Image5.Position.Y:=clientheight-165;
form2.Image5.Position.X:=random(f);

form2.Image6.Position.Y:=clientheight-270;
form2.Image6.Position.X:=random(f);

form2.Image7.Position.Y:=clientheight-375;
form2.Image7.Position.X:=random(f);

form2.Image8.Position.Y:=clientheight-480;
form2.Image8.Position.X:=random(f);

form2.Image3.Width:=form2.ClientWidth;
form2.Image3.Height:=round(form2.ClientHeight/3);
form2.Image3.position.x:=0;
form2.Image3.position.y:=form2.ClientHeight-form2.Image3.Height;
save;
end;

procedure TForm2.Image15Click(Sender: TObject);
begin
textx.visible:=true;
image13.Visible:=false;
image15.Visible:=false;
text1.Visible:=false;
menubut.Position.Y:=round(clientheight/1.2);
image16.Visible:=true;
end;

procedure TForm2.Image16Click(Sender: TObject);
begin
textx.visible:=false;
image16.Visible:=false;
image13.Visible:=true;
image15.Visible:=true;
text1.Visible:=true;
menubut.Position.Y:=round(clientheight/2);
menubut.visible:=false;
end;

procedure TForm2.MenuButClick(Sender: TObject);
begin
mno.Text:='';
addscore:=1;
textx.Enabled:=true;
text2.Enabled:=true;
fill.Color:=$ffcccccc;
image16.Visible:=false;
replacing;
form2.field.Interval:=150;
image13.Visible:=true;
Text1.text:='BouncyMan';
label1.textsettings.Font.Size:=18;
cotoshariki:=cotoshariki+trunc(score/40);

label1.text:='Ваши котошарики: '+IntTostr(cotoshariki);
TEXT1.Visible:=true;
//form2.Fill.Color:=$ff0000ff;
alldisable;
menubut.Visible:=false;

score:=0;
j:=false;
image2.position.y:=form2.ClientHeight;
colvo := 0;
OnJ := 4;
//form2.Label1.text:=IntToStr(score);
save;
end;

procedure TForm2.MigTimer(Sender: TObject);
begin
if Mno.TextSettings.fontcolor=$ffffff00 then begin
Mno.TextSettings.fontcolor:=$ffff0000;
end
else Mno.TextSettings.fontcolor:=$ffffff00;

end;

procedure TForm2.PlavPerTimer(Sender: TObject);
begin
plav;
end;

procedure TForm2.Text2Click(Sender: TObject);
begin
if cotoshariki>3 then begin
cotoshariki:=cotoshariki-4;
label1.text:='Ваши котошарики: '+IntTostr(cotoshariki);
addscore:=addscore*3;
textx.Enabled:=false;
//text2.Enabled:=false;
//mno.Text:='x2';
save;
end;
end;

procedure TForm2.TextXClick(Sender: TObject);
begin
if cotoshariki>1 then begin
cotoshariki:=cotoshariki-2;
label1.text:='Ваши котошарики: '+IntTostr(cotoshariki);
addscore:=addscore*2;
textx.Enabled:=false;
//text2.Enabled:=false;
//mno.Text:='x2';
save;
end;
end;

procedure movej;
begin
  (* if colvo<30 then begin
    jump;
    end
    else begin
    down;
    end; *)
end;

procedure replacing;
begin

  form2.Image3.Width:=form2.ClientWidth;
  form2.Image3.Height:=round(form2.ClientHeight/3);
  form2.Image3.position.x:=0;
  form2.Image3.position.y:=form2.ClientHeight-form2.Image3.Height;

  Form2.image10.Position.X :=0;
  Form2.image10.Position.y :=0;
  form2.Image10.Width:=round(form2.ClientWidth/5);
  form2.Image10.Height:=round(form2.ClientHeight/12);

  form2.Label1.Position.x:=round(form2.ClientWidth/4);
  form2.Label1.Position.y:=0;
  form2.Label1.Width:=round(form2.ClientWidth/1.8);
  form2.label1.Height:=round(form2.ClientHeight/12);

  form2.giro.active:=true;

  form2.image16.Position.X:=form2.clientwidth-form2.image16.width;
  form2.image16.Position.y:=0;
  form2.image16.Width:=round(form2.ClientWidth/10);
  form2.image16.Height:=round(form2.ClientHeight/20);


  //Товары
  form2.textX.position.x:=0;
  form2.textx.position.y:=form2.image16.position.y+form2.Image16.height;
  form2.textX.width:=form2.clientwidth;
  form2.textx.textsettings.font.size:=(form2.ClientWidth/50);

  form2.text2.position.x:=0;
  form2.text2.position.y:=form2.textx.position.y+form2.textx.height;
  form2.text2.width:=form2.clientwidth;
  form2.text2.textsettings.font.size:=(form2.ClientWidth/50);
  //конец


  form2.Mno.Position.X:=form2.label1.Position.X+form2.Label1.Width;
  form2.Mno.Position.y:=0;
  form2.mno.width:=round(form2.ClientWidth/2);
  form2.mno.height:=round(form2.Clientheight/9);


  form2.menubut.Position.X:=form2.clientwidth/2-form2.menubut.width/2;
  form2.menubut.Position.y:=round(form2.clientheight/2);
  form2.menubut.Width:=round(form2.ClientWidth/1.8);
  form2.menubut.Height:=round(form2.ClientHeight/10);

  //Менюшки
  form2.text1.Position.X:=form2.clientwidth/2-form2.Text1.width/2;
  form2.text1.Position.y:=form2.Image13.Position.y-round(form2.Image13.Height*1.3);
  form2.text1.width:=round(form2.ClientWidth/1.05);
  form2.text1.height:=round(form2.Clientheight/7.5);

  form2.Image13.Position.X:=form2.clientwidth/2-form2.Image13.width/2;
  form2.Image13.Position.y:=round(form2.clientheight/3);
  form2.image13.width:=round(form2.ClientWidth/2.5);
  form2.image13.height:=round(form2.Clientheight/8);

  form2.image15.Position.X:=form2.image13.Position.X;
  form2.Image15.Position.y:=form2.Image13.Position.y+round(form2.Image13.Height*1.3);
  form2.image15.width:=round(form2.ClientWidth/2.5);
  form2.image15.height:=round(form2.Clientheight/8);

  form2.Image4.Visible:=false;

  //Платформы
  form2.Image1.Height:=(form2.clientheight/17);
  form2.Image1.Width:=round(form2.clientwidth/6.5);

  form2.Image5.Height:=(form2.clientheight/17);
  form2.Image5.Width:=round(form2.clientwidth/6.5);

  form2.Image6.Height:=(form2.clientheight/17);
  form2.Image6.Width:=round(form2.clientwidth/6.5);

  form2.Image7.Height:=(form2.clientheight/17);
  form2.Image7.Width:=round(form2.clientwidth/6.5);

  form2.Image8.Height:=(form2.clientheight/17);
  form2.Image8.Width:=round(form2.clientwidth/6.5);

  //Бомба
  form2.Image4.Height:=round(form2.Image8.Height*2);
  form2.Image4.Width:=round(form2.Image8.Width/1.2);

  //Звезды
  form2.Image14.Position.y:=-160-form2.Image14.Height;
  form2.Image14.Position.X:=0;
  form2.Image14.Width:=Form2.clientwidth;
  form2.Image14.Height:=Form2.clientheight;

end;

procedure jump;
begin
  if colvo < 15 then
  begin
    OnJ := 3;
    // colvo:=colvo+1;
  end;
  if (colvo = 15) or (colvo > 15) then
  begin
    OnJ := 2;
    // colvo:=colvo+1;
  end;
  if (colvo = 20) or (colvo > 20) then
  begin
    OnJ := 2;
    // colvo:=colvo+1;
  end;
  if (colvo = 25) or ((colvo > 25) and (colvo < 30)) then
  begin
    OnJ := 1;
  end;
end;

procedure down;
begin
  if colvo > 29 then
  begin
    OnJ := -1;
    // colvo:=colvo-1;
  end;
  if (colvo = 30) or (colvo < 30) then
  begin
    OnJ := -2;
    // colvo:=colvo-1;
  end;
  if (colvo = 20) or (colvo < 20) then
  begin
    OnJ := -2;
    // colvo:=colvo-1;
  end;
  if (colvo = 15) or (colvo < 15) then
  begin
    OnJ := -3;
    // colvo:=colvo-1;
  end;
end;

procedure popal;

begin

  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image5.Position.Y) and (form2.Image2.Position.X<form2.Image5.Position.X+form2.Image5.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image5.Position.X) and (form2.Image2.Position.Y+(form2.Image5.height)>form2.Image5.Position.Y))
  then begin
    MayJ;
    JJUUMMPP;

  end;

  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image6.Position.Y) and (form2.Image2.Position.X<form2.Image6.Position.X+form2.Image6.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image6.Position.X) and (form2.Image2.Position.Y+(form2.Image6.height)>form2.Image6.Position.Y))
  then begin
    MayJ;
    JJUUMMPP;

  end;

  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image7.Position.Y) and (form2.Image2.Position.X<form2.Image7.Position.X+form2.Image7.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image7.Position.X) and (form2.Image2.Position.Y+(form2.Image7.height)>form2.Image7.Position.Y))
  then begin
    MayJ;
    JJUUMMPP;

  end;

  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image8.Position.Y) and (form2.Image2.Position.X<form2.Image8.Position.X+form2.Image8.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image8.Position.X) and (form2.Image2.Position.Y+(form2.Image8.height)>form2.Image8.Position.Y))
  then begin
    MayJ;
    JJUUMMPP;

  end;


  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image1.Position.Y) and (form2.Image2.Position.X<form2.Image1.Position.X+form2.Image1.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image1.Position.X) and (form2.Image2.Position.Y+(form2.Image1.height)>form2.Image1.Position.Y))
  then begin
    MayJ;
    JJUUMMPP;

  end;



end;

procedure MoveField;
var
 ra:Integer;

begin
  form2.Image1.position.y:=form2.Image1.position.y+5;
  form2.Image5.position.y:=form2.Image5.position.y+5;
  form2.Image6.position.y:=form2.Image6.position.y+5;
  form2.Image7.position.y:=form2.Image7.position.y+5;
  form2.Image8.position.y:=form2.Image8.position.y+5;
  form2.Image4.position.y:=form2.Image4.position.y+5;



  //form2.Image9.position.y:=form2.Image9.position.y+1;




  if form2.Image1.position.y>form2.clientheight then begin

    form2.Image1.position.y:=round(form2.clientheight/9);
    form2.Image1.position.x:=random(form2.clientwidth-65);

    ra:=random(13);
    if ra=10 then
    genbomb1;
  end;

  if form2.Image5.position.y>form2.clientheight then begin
    form2.Image5.position.y:=round(form2.clientheight/9);
    form2.Image5.position.x:=random(form2.clientwidth-65);

    ra:=random(13);
    if ra=10 then
    genbomb5;

  end;
  if form2.Image6.position.y>form2.clientheight then begin
    form2.Image6.position.y:=round(form2.clientheight/9);
    form2.Image6.position.x:=random(form2.clientwidth-65);

    ra:=random(13);
    if ra=10 then
    genbomb6;

  end;
  if form2.Image7.position.y>form2.clientheight then begin
    form2.Image7.position.y:=round(form2.clientheight/9);
    form2.Image7.position.x:=random(form2.clientwidth-65);

    ra:=random(13);
    if ra=10 then
    genbomb7;

  end;
  if form2.Image8.position.y>form2.clientheight then begin
    form2.Image8.position.y:=round(form2.clientheight/9);
    form2.Image8.position.x:=random(form2.clientwidth-65);

    ra:=random(13);
    if ra=10 then
    genbomb8;

  end;
end;

procedure MoveCloud;
begin
  //Облако
  form2.Image9.position.x:=form2.Image9.position.x+3;
  form2.Image9.position.y:=form2.Image9.position.y+1;
  if form2.Image9.position.x>form2.clientwidth then begin
    form2.Image9.position.x:=0;
  end;
  if form2.Image9.position.y>form2.clientheight then begin
    form2.Image9.position.y:=random(form2.clientheight+40);
  end;

  form2.Image11.position.y:=form2.Image11.position.y+1;
  form2.Image11.position.x:=form2.Image11.position.x+2;
  if form2.Image11.position.x>form2.clientwidth then begin
    form2.Image11.position.x:=0;
  end;
  if form2.Image11.position.y>form2.clientheight then begin
    form2.Image11.position.y:=random(form2.clientheight+40);
  end;

  form2.Image12.position.y:=form2.Image12.position.y+1;
  form2.Image12.position.x:=form2.Image12.position.x+1;
  if form2.Image12.position.x>form2.clientwidth then begin
    form2.Image12.position.x:=0;
  end;
  if form2.Image12.position.y>form2.clientheight then begin
    form2.Image12.position.y:=random(form2.clientheight+40);
  end;
  if form2.Fill.Color<$ff000010 then begin
  form2.image12.Visible:=false;
  form2.image11.Visible:=false;
  form2.image9.Visible:=false;
  end;
  //конец облака
  //Трава
  if slowgrass=3 then begin
  form2.Image3.position.y:=form2.Image3.position.y+1;
  SlowGrass:=0;
  end
  else SlowGrass:=SlowGrass+1;
//  form2.Image12.position.x:=form2.Image12.position.x+1;
  (*if form2.Image3.position.x>form2.clientwidth then begin
    form2.Image12.position.x:=0;
  end;
  if form2.Image12.position.y>form2.clientheight then begin
    form2.Image12.position.y:=random(form2.clientheight+40);
  end;*)
end;

procedure Plav;
begin
  if ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image1.Position.Y) and (form2.Image2.Position.X<form2.Image1.Position.X+form2.Image1.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image1.Position.X) and (form2.Image2.Position.Y+(form2.Image1.height)>form2.Image1.Position.Y))
  or ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image5.Position.Y) and (form2.Image2.Position.X<form2.Image5.Position.X+form2.Image5.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image5.Position.X) and (form2.Image2.Position.Y+(form2.Image5.height)>form2.Image5.Position.Y))
  or ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image6.Position.Y) and (form2.Image2.Position.X<form2.Image6.Position.X+form2.Image6.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image6.Position.X) and (form2.Image2.Position.Y+(form2.Image6.height)>form2.Image6.Position.Y))
  or ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image7.Position.Y) and (form2.Image2.Position.X<form2.Image7.Position.X+form2.Image7.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image7.Position.X) and (form2.Image2.Position.Y+(form2.Image7.height)>form2.Image7.Position.Y))
  or ((form2.Image2.Position.Y-(form2.Image2.height+20)<form2.Image8.Position.Y) and (form2.Image2.Position.X<form2.Image8.Position.X+form2.Image8.width) and (form2.Image2.Position.X+form2.image2.width>form2.Image8.Position.X) and (form2.Image2.Position.Y+(form2.Image8.height)>form2.Image8.Position.Y))
then
movefield;
end;

Procedure AllDisable;
begin
  pau:=true;
  form2.image1.visible:=false;
  form2.image2.visible:=false;
  form2.image3.visible:=false;
  form2.image4.visible:=false;
  form2.image5.visible:=false;
  form2.image6.visible:=false;
  form2.image7.visible:=false;
  form2.image8.visible:=false;
  form2.image9.visible:=false;
  form2.image10.visible:=false;
  form2.image11.visible:=false;
  form2.image12.visible:=false;
  form2.image15.visible:=true;
end;

Procedure AllAble;
begin
  pau:=false;
  form2.image1.visible:=True;
  form2.image2.visible:=True;
  form2.image3.visible:=True;
  form2.image4.visible:=True;
  form2.image5.visible:=True;
  form2.image6.visible:=True;
  form2.image7.visible:=True;
  form2.image8.visible:=True;
  form2.image9.visible:=True;
  form2.image10.visible:=True;
  form2.image11.visible:=True;
  form2.image12.visible:=True;
  form2.image15.visible:=false;
end;

procedure GenBomb1;
begin
  if form2.Image4.Position.Y>form2.clientwidth then begin
  form2.image4.visible:=true;
  form2.image4.position.X:=form2.image1.position.X;
  form2.image4.position.y:=form2.image1.position.y+form2.image1.height-form2.image4.height;
  end;
end;

procedure GenBomb5;
begin
  if form2.Image4.Position.Y>form2.clientwidth then begin
  form2.image4.visible:=true;
  form2.image4.position.X:=form2.image5.position.X;
  form2.image4.position.y:=form2.image5.position.y+form2.image1.height-form2.image4.height;
  end;
end;

procedure GenBomb6;
begin
  if form2.Image4.Position.Y>form2.clientwidth then begin
  form2.image4.visible:=true;
  form2.image4.position.X:=form2.image6.position.X;
  form2.image4.position.y:=form2.image6.position.y+form2.image1.height-form2.image4.height;
  end;
end;

procedure GenBomb7;
begin
  if form2.Image4.Position.Y>form2.clientwidth then begin
  form2.image4.visible:=true;
  form2.image4.position.X:=form2.image7.position.X;
  form2.image4.position.y:=form2.image7.position.y+form2.image1.height-form2.image4.height;
  end;
end;

procedure GenBomb8;
begin
  if form2.Image4.Position.Y>form2.clientwidth then begin
  form2.image4.visible:=true;
  form2.image4.position.X:=form2.image8.position.X;
  form2.image4.position.y:=form2.image8.position.y+form2.image1.height-form2.image4.height;
  end;
end;

procedure JJUUMMPP;
begin
  if form2.field.Interval>40 then
  form2.field.Interval:=form2.field.Interval-1;

  Score:=score+addscore;
  form2.label1.Text:=IntToStr(Score)+'зв';
end;

Procedure MayJ;
begin
plav;
colvo := 0;
OnJ := 4;
j := false;

end;

procedure die;
begin
  alldisable;
  form2.Text1.Visible:=true;
  form2.fill.Color:=$ff000000;
  form2.text1.text:='Смерть';
  form2.MenuBut.visible:=true;
  form2.image15.visible:=false;
end;

procedure Save;
var
  r:TiniFile;
begin
  r:=Tinifile.Create(GetHomePath+'BM.ini');
  r.writeinteger('Info', 'cotoshariki', cotoshariki);
  r.writeinteger('dd', 'addscore', addscore);
  r.UpdateFile;
  r.Free;
end;

procedure TakeSave;
var
  r:TiniFile;
begin
  r:=Tinifile.Create(GetHomePath+'BM.ini');
  cotoshariki:=r.readinteger('Info', 'cotoshariki', cotoshariki);
  addscore:=r.readinteger('dd', 'addscore', addscore);
  r.UpdateFile;
  r.Free;
end;

procedure begining;
var
f:Integer;
begin
    form2.Mno.TextSettings.fontcolor:=$ffff00ff;
    replacing;
    form2.image16.Visible:=false;
    form2.label1.textsettings.Font.Size:=18;
    TakeSave;
    //addscore:=1;
    cotoshariki:=15;
    form2.label1.text:='Ваши котошарики: '+IntTostr(cotoshariki);
    if addscore=0 then addscore:=1;
    if addscore=2 then form2.textx.Enabled:=False;

    form2.Fill.Color:=$ffcccccc;
    form2.image13.Visible:=true;
    form2.TEXT1.Visible:=true;
    SlowGrass:=0;
//    image2.position.y:=500;
    //button1.Visible:=false;

    score:=0;
    f:=form2.clientwidth-105;
    //cotoshariki:=0;
    //imagesPath := ExtractFilePath(Application.Name)+way;
    j:=false;
    form2.image2.position.y:=form2.ClientHeight;

    form2.image9.position.y:=form2.ClientHeight/2;
    form2.image9.position.X:=0;

    form2.image11.position.y:=form2.ClientHeight/2;
    form2.image11.position.X:=50;

    form2.image12.position.y:=round(form2.ClientHeight/3);
    form2.image12.position.X:=0;

    form2.Image1.Position.Y:=form2.clientheight-form2.clientheight/5*4;
    form2.Image1.Position.X:=random(f);

    form2.Image5.Position.Y:=form2.clientheight-form2.clientheight/5*3;
    form2.Image5.Position.X:=random(f);

    form2.Image6.Position.Y:=form2.clientheight-form2.clientheight/5*2;
    form2.Image6.Position.X:=random(f);

    form2.Image7.Position.Y:=form2.clientheight-form2.clientheight/5;
    form2.Image7.Position.X:=random(f);

    form2.Image8.Position.Y:=form2.clientheight;
    form2.Image8.Position.X:=form2.Image2.Position.X;
    form2.image2.Position.X:=60;
    colvo:=0;
    Onj:=3;
    form2.menubut.visible:=false;

    form2.textx.visible:=false;
    imagesPath := ExtractFilePath(Application.Name);
    alldisable;
end;

end.


