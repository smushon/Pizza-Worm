unit wormish;
interface
uses crt,graph,mgfx,chars,poligon{,pstack,pchain},tafrit;
type
 pointst=-12..300;
 digcolt=array[2..9,2..9] of byte;
 postype=^link_type;
 link_type=record
  next:postype;
  x:x_type;
  y:y_type;
  paint:array[-1..1,-1..1] of byte;
  end;
 worm_type=record
  anchor:postype;
  end;
procedure worm_init(var w:worm_type;var x:x_type;var y:y_type);
procedure worm_cut(var w:worm_type);
procedure move(var w:worm_type);{make colors seem advance}
function is_colision({var w:worm_type;}x1:x_type;y1:y_type):boolean;
procedure draw_pizza(px:x_type;py:y_type;r:rt);
procedure draw_drink(x2:x_type;y2:y_type);
procedure fill(xt,yt:integer);
procedure showscore(var points:pointst;var digcol1,digcol2,digcol3:digcolt);
procedure draw_chart(d:dt);
implementation
procedure worm_init(var w:worm_type;var x:x_type;var y:y_type);
 var
  q:postype;
 begin
 {build new head}
 new(w.anchor);
 new(q);
 q^.next:=nil;
 q^.x:=x;
 q^.y:=y;
 w.anchor^.next:=q;
 {give head background colors}
 q^.paint[0,0]:=getpixel(x,y);
 q^.paint[-1,-1]:=getpixel(x-1,y-1);
 q^.paint[-1,0]:=getpixel(x-1,y);
 q^.paint[-1,1]:=getpixel(x-1,y+1);
 q^.paint[0,-1]:=getpixel(x,y-1);
 q^.paint[0,1]:=getpixel(x,y+1);
 q^.paint[1,-1]:=getpixel(x+1,y-1);
 q^.paint[1,0]:=getpixel(x+1,y);
 q^.paint[1,1]:=getpixel(x+1,y+1);
 {draw head}
 pxl(x,y,2);
 pxl(x-1,y-1,2);
 pxl(x-1,y,2);
 pxl(x-1,y+1,2);
 pxl(x,y-1,2);
 pxl(x,y+1,2);
 pxl(x+1,y-1,2);
 pxl(x+1,y,2);
 pxl(x+1,y+1,2);
 end;
procedure worm_cut(var w:worm_type);
 var
  x:x_type;
  y:y_type;
  p,q:postype;
  j,i:-1..1;
 begin
 {p-tail, q-before tail}
 p:=w.anchor;
 while p^.next<>nil do
  begin
  q:=p;
  p:=p^.next;
  end;
 {draw background held by tail}
 x:=p^.x;
 y:=p^.y;
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   pxl(x+j,y+i,p^.paint[j,i]);
 {draw the ereased q}
 x:=q^.x;
 y:=q^.y;
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   pxl(x+j,y+i,7);
 {make q new tail}
 q^.next:=nil;
 dispose(p);
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
 co:=1;
 while p^.next<>nil do
  begin
  p:=p^.next;
  c:=c+1;
  if c=7 then{after 6 links of previous color change color}
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
   if co=1 then co:=7 else co:=1;
   end;
  end;
 end;
function is_colision({var w:worm_type;}x1:x_type;y1:y_type):boolean;
 var
  chk:boolean;
  c:byte;
  j,i:-1..1;
 begin
 chk:=false;
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   begin
   c:=getpixel(x1+j,y1+i);
   if (c=1) or (c=7) then chk:=true;
   end;
 is_colision:=chk;
 end;
{function is_colision(var w:worm_type;x1:x_type;y1:y_type):boolean;
 var
  p:postype;
  chk:boolean;
  count:1..64;
  j,i:-1..1;
 begin
 p:=w.anchor;
 for count:=1 to 64 do
  if p^.next<>nil then p:=p^.next;
 chk:=false;
 while (chk=false) and (p^.next<>nil) do
  begin
  p:=p^.next;
  for i:=-1 to 1 do
   for j:=-1 to 1 do
    if (p^.x+j=x1) and (p^.y+i=y1) then chk:=true;
  end;
 is_colision:=chk;
 end;}
procedure draw_pizza(px:x_type;py:y_type;r:rt);{make a pizza}
 var
  p,x,y:integer;
 procedure setpix;{fill pizza with black so i can use random-fill}
  var
   c:integer;
  begin
  {black lines are drawn to set the stage for fill}
  for c:=-y to y do
   pxl(px+x,py+c,0);
  for c:=-y to y do
   pxl(px-x,py+c,0);
  for c:=-x to x do
   pxl(px+y,py+c,0);
  for c:=-x to x do
   pxl(px-y,py+c,0);
  end;
 begin
 randomize;
 {use bressnham circle algoritem}
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
 cir4(px,py,r,brown);{pizza edjes}
 fill(px,py);
 end;
procedure draw_drink(x2:x_type;y2:y_type);
 var
 i:-5..5;
 j:-3..4;
 n:156..255;
 begin
 n:=167;
 for i:=-5 to 5 do
  for j:=-3 to 4 do
   begin
   n:=n+1;
   if (n<>208)and(n<>215)and(n<>216)and(n<>223)and(n<>224)and(n<>231)and
      (n<>232)and(n<>239)and(n<>240)and(n<>247)and(n<>248)and(n<>255)and
      (n<=248)
      then pxl(x2+j,y2+i,n);
   end;
 end;
procedure fill(xt,yt:integer);{fill pizza with suitable colors}
 const
  colors:array[1..10] of byte=(yellow,yellow,yellow,yellow,5,5,5,black,black,green);
{ var
  up,down:boolean;
  stack:pos_type;
 procedure bla(xt,yt:integer);
  begin
  while getpixel(xt-1,yt)=0 do
   xt:=xt-1;
  up:=false;
  down:=false;
  repeat
   if up=true then
    if getpixel(xt,yt-1)>0 then
     up:=false;
   if up=false then
    if getpixel(xt,yt-1)=0 then
     begin
     up:=true;
     stack_push(stack,xt,yt-1);
     end;
   if down=true then
    if getpixel(xt,yt+1)>0 then
     down:=false;
   if down=false then
    if getpixel(xt,yt+1)=0 then
     begin
     down:=true;
     stack_push(stack,xt,yt+1);
     end;
   pxl(xt,yt,colors[random(10)+1]);
   xt:=xt+1;
   until getpixel(xt,yt)>0;
  end;
 begin
{ stack_init(stack);{by using my stack there wont be an overflow}
{ bla(xt,yt);
  while not(stack_empty(stack)) do
   begin
   stack_pop(stack,xt,yt);
   bla(xt,yt);
   end;}
 begin
 if getpixel(xt,yt)=0{black} then
  begin
  putpixel(xt,yt,colors[random(10)+1]);
  fill(xt+1,yt);
  fill(xt-1,yt);
  fill(xt,yt+1);
  fill(xt,yt-1);
  end;
 end;
procedure showscore(var points:pointst;var digcol1,digcol2,digcol3:digcolt);
 var
  a,b:2..9;
 begin
 if points>9 then
  begin
  if points<100 then
   begin
   for a:=2 to 9 do
    for b:=2 to 9 do
     begin
     pxl(b+9,a,digcol2[b,a]);
     pxl(b+18,a,digcol3[b,a]);
     end;
   present(num2st(points),11,2,white);
   end else
    begin
    for a:=2 to 9 do
     for b:=2 to 9 do
      begin
      pxl(b,a,digcol1[b,a]);
      pxl(b+9,a,digcol2[b,a]);
      pxl(b+18,a,digcol3[b,a]);
      end;
    present(num2st(points),2,2,white);
    end;
  end else
  begin
  for a:=2 to 9 do
   for b:=2 to 9 do
    pxl(b+18,a,digcol3[b,a]);
  present(num2st(points),20,2,white);
  end;
 end;
procedure draw_chart(d:dt);
 var
  p1,p2,p3,p4:dot_pos_type;
  pol:pol_type;
  i:0..150;
  x:x_type;
  y:y_type;
 begin
 pol_init(pol);
 pol_insert(pol,pol_anchor(pol),159,107);
 p1:=pol_next(pol,pol_anchor(pol));
 pol_insert(pol,p1,159,108);
 p2:=pol_next(pol,p1);
 pol_insert(pol,p2,160,108);
 p3:=pol_next(pol,p2);
 pol_insert(pol,p3,160,107);
 p4:=pol_next(pol,p3);
 for i:=0 to 97 do
  begin
  pol_draw(pol,0);
  pol_return(pol,p1,x,y);
  pol_update(pol,p1,x-1,y);
  pol_return(pol,p2,x,y);
  pol_update(pol,p2,x-1,y);
  pol_return(pol,p3,x,y);
  pol_update(pol,p3,x+1,y);
  pol_return(pol,p4,x,y);
  pol_update(pol,p4,x+1,y);
  pol_draw(pol,15);
  delay(d div 4);
  end;
 for i:=0 to 82 do
  begin
  pol_draw(pol,0);
  pol_return(pol,p1,x,y);
  pol_update(pol,p1,x,y-1);
  pol_return(pol,p2,x,y);
  pol_update(pol,p2,x,y+1);
  pol_return(pol,p3,x,y);
  pol_update(pol,p3,x,y+1);
  pol_return(pol,p4,x,y);
  pol_update(pol,p4,x,y-1);
  pol_draw(pol,15);
  delay(d div 4);
  end;
 dispose(pol.anchor);
 {chart inner lines}
 for i:=0 to 150 do
  begin
  if 40+i<=190 then pxl(159,40+i,15);
  if 160-i>=62 then
   begin
   pxl(159-i,40,15);
   pxl(159+i,40,15);
   end;
  delay(d div 4);
  end;
 end;
end.