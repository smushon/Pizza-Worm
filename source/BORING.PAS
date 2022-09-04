unit boring;
interface
uses crt,mgfx,wormish,tafrit,chars;
var
 w:worm_type;
 x:x_type;
 y:y_type;
 col:byte;
 i,j:integer;
 c:byte;
 dummy_char:char;
procedure pxl2(x:x_type;y:y_type;col:byte);
procedure smash(var x:x_type;var y:y_type;var d:dt);
procedure worm(var d:dt);
procedure mushon(var d:dt);
procedure mushon2(var d:dt);
implementation
procedure pxl2(x:x_type;y:y_type;col:byte);
 begin
 if (y>=12) and (y<=199) and (x>=0) and (x<=319) then
  mem[$A000:320*y+x]:=col;
 end;
procedure move(var w:worm_type);{move links effect}
 var
  p:postype;
  co:byte;
  c:0..5;
  x:x_type;
  y:y_type;
 begin
 p:=w.anchor;
 c:=0;
 co:=14;
 while p^.next<>nil do
  begin
  p:=p^.next;
  c:=c+1;
  if c=5 then
   begin
   c:=1;
   x:=p^.x;
   y:=p^.y;
   pxl(x,y,co);
   pxl(x-1,y-1,co);
   pxl(x-1,y,co);
   pxl(x-1,y+1,co);
   pxl(x,y-1,co);
   pxl(x,y+1,co);
   pxl(x+1,y-1,co);
   pxl(x+1,y,co);
   pxl(x+1,y+1,co);
   if co=14 then co:=2 else co:=14;
   end;
  end;
 end;
procedure worm_add(var w:worm_type;x:x_type;y:y_type);
 var
  q:postype;
 begin
 new(q);
 q^.x:=x;
 q^.y:=y;
 q^.next:=w.anchor^.next;
 w.anchor^.next:=q;
 pxl2(x-1,y-1,2);
 pxl2(x-1,y,2);
 pxl2(x-1,y+1,2);
 pxl2(x,y-1,2);
 pxl2(x,y,2);
 pxl2(x,y+1,2);
 pxl2(x+1,y-1,2);
 pxl2(x+1,y,2);
 pxl2(x+1,y+1,2);
 end;
procedure smash(var x:x_type;var y:y_type;var d:dt);
 begin
 pxl2(x,y,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x,y+1,5);
 pxl2(x,y-1,5);
 pxl2(x+1,y,5);
 pxl2(x-1,y,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x+1,y+1,5);
 pxl2(x-1,y+1,5);
 pxl2(x+1,y-1,5);
 pxl2(x-1,y-1,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x+2,y,5);
 pxl2(x+3,y,5);
 pxl2(x-2,y,5);
 pxl2(x-1,y-2,5);
 pxl2(x+1,y+2,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x+1,y-2,5);
 pxl2(x+2,y-2,5);
 pxl2(x-2,y-2,5);
 pxl2(x-3,y,5);
 pxl2(x+3,y+1,5);
 pxl2(x-3,y+1,5);
 pxl2(x-1,y+2,5);
 pxl2(x-2,y+2,5);
 pxl2(x+1,y+2,5);
 pxl2(x+2,y+2,5);
 pxl2(x+3,y+2,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x+3,y-4,5);
 pxl2(x-1,y-3,5);
 pxl2(x-2,y-3,5);
 pxl2(x+2,y-3,5);
 pxl2(x+3,y-3,5);
 pxl2(x,y-2,5);
 pxl2(x-3,y-2,5);
 pxl2(x+3,y-2,5);
 pxl2(x+2,y-1,5);
 pxl2(x+5,y,5);
 pxl2(x-4,y,5);
 pxl2(x-2,y+1,5);
 pxl2(x+2,y+1,5);
 pxl2(x+4,y+1,5);
 pxl2(x,y+2,5);
 pxl2(x+4,y+2,5);
 pxl2(x+5,y+2,5);
 pxl2(x-2,y+3,5);
 pxl2(x-3,y+3,5);
 pxl2(x,y+4,5);
 pxl2(x+2,y+4,5);
 pxl2(x-3,y+4,5);
 pxl2(x+3,y+4,5);
 pxl2(x+2,y+5,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x-2,y-5,5);
 pxl2(x+3,y-5,5);
 pxl2(x+4,y-4,5);
 pxl2(x-1,y-4,5);
 pxl2(x-2,y-4,5);
 pxl2(x+5,y-4,5);
 pxl2(x-4,y-3,5);
 pxl2(x-3,y-3,5);
 pxl2(x+1,y-3,5);
 pxl2(x+4,y-3,5);
 pxl2(x-4,y-2,5);
 pxl2(x-2,y-1,5);
 pxl2(x-3,y-1,5);
 pxl2(x-5,y-1,5);
 pxl2(x+3,y-1,5);
 pxl2(x+5,y-1,5);
 pxl2(x-6,y,5);
 pxl2(x+6,y,5);
 pxl2(x+5,y+1,5);
 pxl2(x-4,y+1,5);
 pxl2(x-5,y+1,5);
 pxl2(x+2,y+2,5);
 pxl2(x+3,y+2,5);
 pxl2(x+6,y+2,5);
 pxl2(x-1,y+3,5);
 pxl2(x+3,y+3,5);
 pxl2(x+4,y+3,5);
 pxl2(x+5,y+3,5);
 pxl2(x+6,y+3,5);
 pxl2(x-4,y+4,5);
 pxl2(x+5,y+4,5);
 pxl2(x,y+5,5);
 pxl2(x-1,y+5,5);
 pxl2(x-3,y+5,5);
 pxl2(x-4,y+5,5);
 pxl2(x+3,y+5,5);
 pxl2(x+4,y+5,5);
 pxl2(x+2,y+6,5);
 delay(d);
 delay(d);
 delay(d);
 pxl2(x-3,y-8,5);
 pxl2(x-1,y-7,5);
 pxl2(x-2,y-7,5);
 pxl2(x-3,y-7,5);
 pxl2(x,y-6,5);
 pxl2(x-1,y-6,5);
 pxl2(x-2,y-6,5);
 pxl2(x-3,y-6,5);
 pxl2(x+4,y-6,5);
 pxl2(x+5,y-6,5);
 pxl2(x+6,y-6,5);
 pxl2(x+5,y-5,5);
 pxl2(x+4,y-5,5);
 pxl2(x+2,y-5,5);
 pxl2(x,y-5,5);
 pxl2(x-1,y-5,5);
 pxl2(x-5,y-5,5);
 pxl2(x+6,y-4,5);
 pxl2(x+2,y-4,5);
 pxl2(x+1,y-4,5);
 pxl2(x,y-4,5);
 pxl2(x-4,y-4,5);
 pxl2(x-5,y-4,5);
 pxl2(x-6,y-4,5);
 pxl2(x+6,y-3,5);
 pxl2(x+5,y-3,5);
 pxl2(x,y-3,5);
 pxl2(x-5,y-3,5);
 pxl2(x+5,y-2,5);
 pxl2(x+4,y-2,5);
 pxl2(x+4,y-1,5);
 pxl2(x-4,y-1,5);
 pxl2(x+4,y,5);
 pxl2(x+7,y,5);
 pxl2(x-8,y,5);
 pxl2(x-6,y,5);
 pxl2(x+8,y+1,5);
 pxl2(x+6,y+1,5);
 pxl2(x+7,y+1,5);
 pxl2(x-7,y+1,5);
 pxl2(x-6,y+1,5);
 pxl2(x+7,y+2,5);
 pxl2(x-3,y+2,5);
 pxl2(x-4,y+2,5);
 pxl2(x-5,y+2,5);
 pxl2(x-6,y+2,5);
 pxl2(x-7,y+2,5);
 pxl2(x+6,y+4,5);
 pxl2(x+1,y+4,5);
 pxl2(x-1,y+4,5);
 pxl2(x-5,y+4,5);
 pxl2(x+1,y+5,5);
 pxl2(x-5,y+5,5);
 pxl2(x-6,y+5,5);
 pxl2(x+3,y+6,5);
 pxl2(x-1,y+6,5);
 pxl2(x+2,y+7,5);
 pxl2(x+3,y+7,5);
 pxl2(x+4,y+7,5);
 pxl2(x-1,y+7,5);
 pxl2(x-2,y+7,5);
 pxl2(x+1,y+8,5);
 pxl2(x+2,y+8,5);
 delay(d);
 delay(d);
 delay(d);
 delay(d);
 delay(d);
 delay(d);
 end;
procedure worm;
 var
  q,q2:postype;
 begin
 x:=70;
 y:=150;
 worm_init(w,x,y);
 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 for i:=1 to 8 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 for i:=1 to 8 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
  move(w);
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;

 for i:=1 to 23 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;
 for i:=1 to 24 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 for i:=1 to 16 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 for i:=1 to 28 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;

 for i:=1 to 33 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 for i:=1 to 24 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);

 for i:=1 to 5 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);

 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);

 for i:=1 to 12 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
  move(w);
  end;
 for i:=1 to 12 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);

 for i:=1 to 9 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;

 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;
 for i:=1 to 21 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 for j:=3 downto 1 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);

 for j:=1 to 3 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 for i:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 for i:=1 to 30 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 for i:=1 to 29 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);

 for j:=1 to 3 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 for i:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);

 for j:=1 to 3 do
  begin
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
   move(w);
   end;
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
  end;

 for i:=1 to 20 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
  end;
 q:=w.anchor^.next;
 while q^.next<>nil do
  begin
  q2:=q;
  q:=q^.next;
  dispose(q2);
  end;
 dispose(q);
 dispose(w.anchor);
 end;
procedure mushon(var d:dt);
 label
  stop,jmp;
 var
  q,q2:postype;
 begin
 x:=2;
 y:=100;
 col:=2;
 worm_init(w,x,y);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 30 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 19 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for j:=3 downto 1 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);

 for j:=1 to 3 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 30 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 29 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);

 for j:=1 to 3 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);

 for j:=1 to 3 do
  begin
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 for i:=1 to 20 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 {------------------------}
 for i:=1 to 16 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 32 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 23 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 for j:=1 to 3 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 for j:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);

 for i:=1 to 23 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 32 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
{----------------------------}
 for i:=1 to 32 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;

 for j:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for j:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for i:=1 to 8 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for j:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for j:=1 to 2 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for j:=2 downto 0 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  for i:=1 to j do
   begin
   worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
   move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
   delay(d);
   end;
  end;
 for i:=1 to 17 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
{---------------------------}
 for i:=1 to 16 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 33 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 10 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 9 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 8 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
{---------------}
 for i:=1 to 13 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 24 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 15 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x-1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 16 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 28 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 33 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 24 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;

 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 mushon2(d);
 goto jmp;
 stop:
 q:=w.anchor^.next;
 while q^.next<>nil do
  begin
  q2:=q;
  q:=q^.next;
  dispose(q2);
  end;
 dispose(q);
 dispose(w.anchor);
 while keypressed do dummy_char:=readkey;
 jmp:
 end;
procedure mushon2(var d:dt);
 label
  stop;
 var
  q,q2:postype;
 begin
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y-1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 4 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y+1);
 move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
 delay(d);
 for i:=1 to 24 do
  begin
  worm_add(w,w.anchor^.next^.x,w.anchor^.next^.y+1);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for i:=1 to 40 do
  begin
  worm_add(w,w.anchor^.next^.x+1,w.anchor^.next^.y);
  move(w);
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  end;
 for c:=63 downto 42 do
  begin
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  pal(yellow,c,c,21);
  end;
 for c:=41 downto 21 do
  begin
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  pal(yellow,c,c,21);
  pal(green,0,c,0);
  end;
 for c:=20 downto 0 do
  begin
 if keypressed then begin dummy_char:=readkey; if (dummy_char=chr(13)) or (dummy_char=chr(27)) then goto stop; end;
  delay(d);
  pal(yellow,c,c,c);
  pal(green,0,c,0);
  end;
 stop:
 q:=w.anchor^.next;
 while q^.next<>nil do
  begin
  q2:=q;
  q:=q^.next;
  dispose(q2);
  end;
 dispose(q);
 dispose(w.anchor);
 while keypressed do dummy_char:=readkey;
 end;
end.
