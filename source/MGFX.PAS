unit mgfx;
interface
{$x+}
type
 palete_type=array[0..255] of record red,green,blue,a:byte; end;
 picture=array[0..319,0..199] of byte;
 picptr=^picture;
 x_type=0..319;
 y_type=0..199;
 rt=4..12;
procedure svga256;{320/200 with 256 colors}
procedure pal(col,r,g,b:byte);{changes 'col' in palete}
procedure pxl(x:x_type;y:y_type;col:byte);
procedure cir4(px:x_type;py:y_type;r:rt;col:byte);{bressnham circle}
procedure memobmp(filename:string;var pic:picptr;var palete:palete_type);
{returns a pointer to picture; saves palete}
procedure putpic(var pic:picptr;var palete:palete_type);
{read palete and put picture which is 320/200 size}
procedure dline(x1:x_type;y1:y_type;x2:x_type;y2:y_type;col:byte);{direct line}
procedure getdrink;
implementation
uses
 graph,crt;
{$f+}
procedure svga256;
 var
  testdriver,driver,mode:integer;
 function testdetect:integer;
  begin
  testdetect:=0;
  end;
 {$f-}
 begin
 testdriver:=installuserdriver('svga256',@testdetect);
 driver:=detect;
 mode:=0;
 initgraph(driver,mode,'');
 end;
 {$f+}
procedure pal(col,r,g,b:byte);
 begin
 port[$3c8]:=col;
 port[$3c9]:=r;
 port[$3c9]:=g;
 port[$3c9]:=b;
 end;
procedure pxl(x:x_type;y:y_type;col:byte);
 begin
 mem[$A000:320*y+x]:=col;
 end;
procedure cir4(px:x_type;py:y_type;r:rt;col:byte);
 var
  p,x,y:integer;
 procedure setpix;
  begin
  pxl(px+x,py+y,col);
  pxl(px-x,py+y,col);
  pxl(px+x,py-y,col);
  pxl(px-x,py-y,col);
  pxl(px+y,py+x,col);
  pxl(px-y,py+x,col);
  pxl(px+y,py-x,col);
  pxl(px-y,py-x,col);
  end;
 begin
 x:=0;
 y:=r;
 p:=3-2*r;
 while x<y do
  begin
  setpix;
  if p<0 then p:=p+4*x+6
   else begin
   p:=p+4*(x-y)+10;
   y:=y-1;
   end;
  x:=x+1;
  end;
 if x=y then setpix;
 end;
procedure memobmp(filename:string;var pic:picptr;var palete:palete_type);
 var
  data:byte;
  f:file;
  i:0..199;
  j:0..319;
 begin
 assign(f,filename);
 reset(f,1);
 seek(f,54);
 blockread(f,palete,1024);
 for i:=0 to 199 do
  for j:=0 to 319 do
   begin
   blockread(f,data,1);
   pic^[j,i]:=data;
   end;
 end;
procedure putpic(var pic:picptr;var palete:palete_type);
 var
  i:0..199;
  j:0..319;
 begin
 for j:=0 to 255 do
  pal(j,palete[j].blue div 4,palete[j].green div 4,palete[j].red div 4);
 for j:=0 to 319 do
  for i:=0 to 199 do
   pxl(j,i,pic^[j,i]);
 end;
procedure dline(x1:x_type;y1:y_type;x2:x_type;y2:y_type;col:byte);
 var
  x,t:x_type;
  y:y_type;
 begin
 if x1=x2 then
  begin
  if y1>y2 then
   begin
   t:=x1; x1:=x2; x2:=t;
   t:=y1; y1:=y2; y2:=t;
   end;
  for y:=y1 to y2 do
   pxl(x1,y,col);
  end else
  begin
  if x1>x2 then
   begin
   t:=x1; x1:=x2; x2:=t;
   t:=y1; y1:=y2; y2:=t;
   end;
  for x:=x1 to x2 do
   pxl(x,y1,col);
  end;
 end;
procedure getdrink;
 var
  data:byte;
  f:file;
  i:-5..199;
  j:-3..319;
  n:167..255;
  Palette:array[0..255] of Record red,green,blue,a:byte; end;
  r,g,b:byte;
 begin
 assign(f,'cola4.bmp');
 reset(f,1);
 seek(f,54);
 blockread(f,palette,1024);
 {occupy last 88 places of palete with drink colors}
 n:=167;
 for i:=-5 to 5 do
  for j:=-3 to 4 do
   begin
   blockread(f,data,1);
   n:=n+1;
   pal(n,palette[data].blue div 4,palette[data].green div 4,palette[data].red div 4);
   end;
 end;
end.