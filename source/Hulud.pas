program shaihulud;
uses crt,graph,mgfx,wormish,chars,boring,tafrit;
const
 n=4;
 m=3;
type
 person=record
  name:string;
  score:integer;
  end;
var
 check:0..7;
 s2:file of dt;
 s:file of person;
 p:array[1..10] of person;
 i,j:integer;
 x,x2:x_type;
 y,y2:y_type;
 dummy_char:char;
 w:worm_type;
 dy,dx,chkx,chky:-1..1;
 dyc,dxc:0..n-1;
 dyt,dxt:1..n;
 chk:1..m;
 size,lsize:0..5;
 q,q2,q3:postype;
 eat,rep,drink:boolean;
 points:pointst;
 top,count,code,code2:byte;
 pdelay,l,d:dt;
 pizcol:array[-12..12,-12..12] of byte;
 drinkcol:array[-3..3,-4..4] of byte;
 digcol1,digcol2,digcol3:digcolt;
 pic3,pic1b,pic9,picpiz:picptr;
 palete3,palete1b,palete9,paletepiz:palete_type;
 pauz:array[0..62,0..7] of byte;
label
 gone,jmp,again,start;
function worm_add:boolean;
 var
  x1:x_type;
  y1:y_type;
  r:0..24;
  p:integer;
 procedure chkeat;
  var
   a,b:-1..1;
  begin
  for b:=-1 to 1 do
   for a:=-1 to 1 do
    begin
    if (x+j=x1+a) and (y+i=y1+b) then eat:=true;
    if (x-j=x1+a) and (y+i=y1+b) then eat:=true;
    if (x+j=x1+a) and (y-i=y1+b) then eat:=true;
    if (x-j=x1+a) and (y-i=y1+b) then eat:=true;
    if (x+i=x1+a) and (y+j=y1+b) then eat:=true;
    if (x-i=x1+a) and (y+j=y1+b) then eat:=true;
    if (x+i=x1+a) and (y-j=y1+b) then eat:=true;
    if (x-i=x1+a) and (y-j=y1+b) then eat:=true;
    end;
  end;
 begin
 worm_add:=false;
 x1:=w.anchor^.next^.x+chkx;
 y1:=w.anchor^.next^.y+chky;
 {builds new head}
 new(q);
 q^.x:=x1;
 q^.y:=y1;
 q^.next:=w.anchor^.next;
 w.anchor^.next:=q;
 {checks for wall colision}
 if (x1-1=0) or (x1+1=319) or (y1-1=12) or (y1+1=199)
  then worm_add:=true;
 {start circle check the pizza for worm head}
 r:=2+size*2;
 j:=0;
 i:=r;
 p:=3-2*r;
 while j<i do
  begin
  chkeat;
  if p<0 then p:=p+4*j+6
   else begin
   p:=p+4*(j-i)+10;
   i:=i-1;
   end;
  j:=j+1;
  end;
 if j=i then chkeat;
 {draws pizza background}
 if eat then
  for i:=(-2-size*2) to (2+size*2) do
   for j:=(-2-size*2) to (2+size*2) do
    pxl(x+j,y+i,pizcol[j,i]);
 {check if worm head touches drink}
 if drink=false then
  begin
  for i:=-1 to 1 do
   for j:=-1 to 1 do
    if (x1+j<=x2+3) and (x1+j>=x2-3) and (y1+i<=y2+4) and (y1+i>=y2-4) then drink:=true;
  if drink then
   begin
   for i:=-4 to 4 do
    for j:=-3 to 3 do
     pxl(x2+j,y2+i,drinkcol[j,i]);
   points:=points+10;
   showscore(points,digcol1,digcol2,digcol3);
   {cut worms tail}
   if l>3 then
    begin
    if top=0 then
     lsize:=1;
    r:=lsize*24;
    q3:=q;
    for p:=1 to 8*l-r do
     q3:=q3^.next;
    q2:=q3;
    for p:=1 to (r-top) do
     begin
     q2:=q2^.next;
     for i:=-1 to 1 do
      for j:=-1 to 1 do
       pxl(q2^.x+j,q2^.y+i,q2^.paint[j,i]);
     end;
    q3^.next:=nil;
    for i:=-1 to 1 do
     for j:=-1 to 1 do
      pxl(q3^.x+j,q3^.y+i,14);
    l:=l-3;
    top:=24*lsize-24;
    end;
   end;
  end;
 {check for self colision}
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   if is_colision(w,x1+j,y1+i) then worm_add:=true;
 {old head disapear so new head can have true colors}
 for i:=-1 to 1 do
  for j:=-1 to 1 do
    pxl(q^.next^.x+j,q^.next^.y+i,q^.next^.paint[j,i]);
 {give new head true background colors}
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   q^.paint[j,i]:=getpixel(x1+j,y1+i);
 {return old head, draw new head}
 for i:=-1 to 1 do
  for j:=-1 to 1 do
   begin
   pxl(q^.next^.x+j,q^.next^.y+i,2);
   pxl(x1+j,y1+i,2);
   end;
 delay(d);
 end;
begin
svga256;
present('loading...',105,90,5);
new(pic3);
new(pic1b);
new(pic9);
new(picpiz);
memobmp('3.bmp',pic3,palete3);
memobmp('piz.bmp',picpiz,paletepiz);
memobmp('1b.bmp',pic1b,palete1b);
memobmp('9.bmp',pic9,palete9);
assign(s2,'delay.dat');
reset(s2);
read(s2,d);
close(s2);
start:
putpic(pic3,palete3);
pal(2,0,42,0);
pal(14,63,63,21);
mushon(d);
again:
assign(s2,'delay.dat');
reset(s2);
read(s2,d);
close(s2);
cleardevice;
putpic(pic9,palete9);
pal(2,42,0,0);
pal(14,63,63,21);
worm(d);
case choose(d) of
 2:goto start;
 3:goto jmp;
 end;
putpic(picpiz,paletepiz);
pal(0,0,0,0);
pal(2,0,42,0);
pal(3,0,42,42);
pal(4,42,0,0);
pal(6,42,21,0);
pal(14,63,63,21);
pal(15,63,63,63);
pal(9,21,21,63);
for i:=2 to 9 do
 for j:=2 to 9 do
  digcol1[j,i]:=getpixel(j,i);
for i:=2 to 9 do
 for j:=2 to 9 do
  digcol2[j,i]:=getpixel(j+9,i);
for i:=2 to 9 do
 for j:=2 to 9 do
  digcol3[j,i]:=getpixel(j+18,i);
randomize;
{--------score frame}
dline(0,0,0,11,9);
dline(29,0,29,11,9);
dline(1,0,28,0,9);
dline(1,11,28,11,9);
{---------'000'}
draw2('0',2,2,white);
draw2('0',11,2,white);
draw2('0',20,2,white);
present('score',33,2,9);
{let there be a worm}
x:=random(316)+2;
y:=random(184)+14;
worm_init(w,x,y);
{get direction}
repeat
 code:=port[$60];
 while keypressed do dummy_char:=readkey;
 until (code=72) or (code=75) or (code=77) or (code=80) or (code=1);
dxc:=0;
dyc:=0;
{initialize parameters acording to first direction}
case code of
 72:begin
    dy:=-1;
    dx:=0;
    dxt:=3;
    dyt:=1;
    end;
 75:begin
    dy:=0;
    dx:=-1;
    dxt:=1;
    dyt:=3;
    end;
 77:begin
    dy:=0;
    dx:=1;
    dxt:=1;
    dyt:=3;
    end;
 80:begin
    dy:=1;
    dx:=0;
    dyt:=1;
    dxt:=3;
    end;
 end;
eat:=true;
top:=7;
l:=1;
size:=0;
drink:=true;
points:=-2;
chk:=m-1;
check:=0;
code:=28;
repeat
 code2:=code;
 code:=port[$60];
 while keypressed do dummy_char:=readkey;
 if code=25 then
  begin
  for i:=0 to 7 do
   for j:=0 to 61 do
    pauz[j,i]:=getpixel(130+j,100+i);
  present('pause',130,100,4);
  repeat
   code:=port[$60];
   while keypressed do dummy_char:=readkey;
   until code=153;
  repeat
   code:=port[$60];
   while keypressed do dummy_char:=readkey;
   until code=25;
  repeat
   code:=port[$60];
   while keypressed do dummy_char:=readkey;
   until code=153;
  for i:=0 to 7 do
   for j:=0 to 61 do
    pxl(130+j,100+i,pauz[j,i]);
  code:=code2;
  end else
   if ((code2=75) or (code2=77)) and (code<>75) and (code<>77) and (code<>203) and (code<>205) then code:=code2;
 {inc counters}
 chkx:=0;
 if dxt<n then
  begin
  if dxc=dxt-1 then begin dxc:=0; chkx:=dx; end
   else dxc:=dxc+1;
  end;
 chky:=0;
 if dyt<n then
  begin
  if dyc=dyt-1 then begin dyc:=0; chky:=dy; end
    else dyc:=dyc+1;
  end;
 {if worm havnt drunk yet after appearence}
 if drink=false then
  begin
  if count<255 then{after 256 steps the drink disappears}
   count:=count+1 else
    begin
    drink:=true;
    for i:=-4 to 4 do
     for j:=-3 to 3 do
      pxl(x2+j,y2+i,drinkcol[j,i]);
    end;
  end;
 {no drink on screen and random bull's-eye}
 if drink and (random(3500)=0) then
  begin
  {search for a new drink spot}
  repeat
   rep:=false;
   x2:=random(312)+4;
   y2:=random(178)+17;
   q:=w.anchor;
   while (q^.next<>nil) and (rep=false) do
    begin
    q:=q^.next;
    for i:=-1 to 1 do
     for j:=-1 to 1 do
      if (x2+3>=q^.x+j) and (x2-3<=q^.x+j) and (y2+4>=q^.y+i) and (y2-4<=q^.y+i) then rep:=true;
    end;
   for i:=-4 to 4 do
    for j:=-3 to 3 do
     if (x2+j>=x-2-size*2) and (x2+j<=x+2+2*size) and (y2+i>=y-2-size*2) and (y2+i<=y+2+2*size) then rep:=true;
   until rep=false;
  {save previous background before drink}
  for i:=-4 to 4 do
   for j:=-3 to 3 do
    drinkcol[j,i]:=getpixel(x2+j,y2+i);
  draw_drink(x2,y2);{draw drink}
  drink:=false;
  count:=0;
  end;
 {if worm ate a pizza}
 if eat=true then
  begin
  lsize:=size;
  points:=points+size*2+2;{update score}
  l:=l+size*3;{update worm size parameter}
  if d>5 then
  d:=d-size;
  top:=top+size*24;{let worm grow}
  {set new pizza size}
  i:=random(11)+1;
  case i of
   1..2:size:=1;
   3..5:size:=2;
   6..8:size:=3;
   9..10:size:=4;
   11:size:=5;
   end;
  {search for a new pizza spot}
  repeat
   rep:=false;
   x:=random(314-size*4)+3+size*2;
   y:=random(182-size*4)+15+size*2;
   q:=w.anchor;
   {make sure pizza not on worm}
   while (q^.next<>nil) and (rep=false) do
    begin
    q:=q^.next;
    for i:=-1 to 1 do
     for j:=-1 to 1 do
      if (x+2+size*2>=q^.x+j) and (x-2-size*2<=q^.x+j) and (y+2+size*2>=q^.y+i) and (y-2-size*2<=q^.y+i) then rep:=true;
    end;
   {make sure pizza not on drink}
   for i:=-4 to 4 do
    for j:=-3 to 3 do
     if (x2+j>=x-2-size*2) and (x2+j<=x+2+2*size) and (y2+i>=y-2-size*2) and (y2+i<=y+2+2*size) then rep:=true;
   until rep=false;
  {save background before pizza}
  for i:=(-2-size*2) to (2+size*2) do
   for j:=(-2-size*2) to (2+size*2) do
    pizcol[j,i]:=getpixel(x+j,y+i);
  draw_pizza(x,y,2+size*2);{draw pizza}
  eat:=false;
  showscore(points,digcol1,digcol2,digcol3);
  pdelay:=0;
  end else
  begin
  pdelay:=pdelay+1;
  if pdelay=2000 then{if pizza has been waiting for some time}
   begin
   pdelay:=0;
   {return background from pizza}
   for i:=(-2-size*2) to (2+size*2) do
    for j:=(-2-size*2) to (2+size*2) do
     pxl(x+j,y+i,pizcol[j,i]);
   {look for a new pizza spot}
   repeat
    rep:=false;
    x:=random(314-size*4)+3+size*2;
    y:=random(182-size*4)+15+size*2;
    q:=w.anchor;
    {make sure pizza not on worm}
    while (q^.next<>nil) and (rep=false) do
     begin
     q:=q^.next;
     for i:=-1 to 1 do
      for j:=-1 to 1 do
       if (x+2+size*2>=q^.x+j) and (x-2-size*2<=q^.x+j) and (y+2+size*2>=q^.y+i) and (y-2-size*2<=q^.y+i) then rep:=true;
     end;
    {make sure pizza not on drink}
    for i:=-4 to 4 do
     for j:=-3 to 3 do
      if (x2+j>=x-2-size*2) and (x2+j<=x+2+2*size) and (y2+i>=y-2-size*2) and (y2+i<=y+2+2*size) then rep:=true;
    until rep=false;
   {save piza background}
   for i:=(-2-size*2) to (2+size*2) do
    for j:=(-2-size*2) to (2+size*2) do
     pizcol[j,i]:=getpixel(x+j,y+i);
   draw_pizza(x,y,2+size*2);{draw pizza}
   end;
  end;
 if worm_add then goto gone;
 move(w);
 if top=0 then worm_cut(w);
 if top>0 then top:=top-1;
 {regenerate parameters according to direction}
 if check=7 then
 case code of
  75:begin
     if (code2<>75) and (code2<>77) then chk:=m
      else if chk<m then chk:=chk+1 else chk:=1;
     if chk=m then
      begin
      if (dy=-1) and (dx<1) and (dxt>1) then begin dxt:=dxt-1;
       dxc:=0; if dx=0 then dx:=-1; end else
      if (dy=-1) and (dx=1) and (dyt=1) then begin dxt:=dxt+1;
       dxc:=0; if dxt=n then dx:=0; end else
      if (dy=1) and (dx>-1) and (dxt>1) then begin dxt:=dxt-1;
       dxc:=0; if dx=0 then dx:=1; end else
      if (dy=1) and (dx=-1) and (dyt=1) then begin dxt:=dxt+1;
       dxc:=0; if dxt=n then dx:=0; end else
      if (dx=-1) and (dy=-1) and (dxt=1) then begin dyt:=dyt+1;
       dyc:=0; if dyt=n then dy:=0; end else
      if (dx=-1) and (dy>-1) and (dyt>1) then begin dyt:=dyt-1;
       dyc:=0; if dy=0 then dy:=1; end else
      if (dx=1) and (dy=1) and (dxt=1) then begin dyt:=dyt+1;
       dyc:=0; if dyt=n then dy:=0; end else
       begin dyt:=dyt-1; dyc:=0; if dy=0 then dy:=-1; end;
      end;
     end;
  77:begin
     if (code2<>75) and (code2<>77) then chk:=m
      else if chk<m then chk:=chk+1 else chk:=1;
     if chk=m then
      begin
      if (dy=-1) and (dx>-1) and (dxt>1) then begin dxt:=dxt-1;
       dxc:=0; if dx=0 then dx:=1; end else
      if (dy=-1) and (dx=-1) and (dyt=1) then begin dxt:=dxt+1;
       dxc:=0; if dxt=n then dx:=0; end else
      if (dy=1) and (dx<1) and (dxt>1) then begin dxt:=dxt-1;
       dxc:=0; if dx=0 then dx:=-1; end else
      if (dy=1) and (dx=1) and (dyt=1) then begin dxt:=dxt+1;
       dxc:=0; if dxt=n then dx:=0; end else
      if (dx=1) and (dy=-1) and (dxt=1) then begin dyt:=dyt+1;
       dyc:=0; if dyt=n then dy:=0; end else
      if (dx=1) and (dy>-1) and (dyt>1) then begin dyt:=dyt-1;
       dyc:=0; if dy=0 then dy:=1; end else
      if (dx=-1) and (dy=1) and (dxt=1) then begin dyt:=dyt+1;
       dyc:=0; if dyt=n then dy:=0; end else
       begin dyt:=dyt-1; dyc:=0; if dy=0 then dy:=-1; end;
      end;
     end;
  end else check:=check+1;
 until code=1;
gone:
smash(w.anchor^.next^.x,w.anchor^.next^.y,d);
cleardevice;
putpic(pic1b,palete1b);
pal(2,0,42,0);
pal(14,63,63,21);
pal(13,63,12,36);
draw_chart(d);
assign(s,'scores.dat');
reset(s);
j:=0;
for i:=1 to 10 do
 begin
 read(s,p[i]);
 if (j=0) and (points>p[i].score) then j:=i;
 end;
if j>0 then
 begin
 for i:=10 downto j+1 do
  p[i]:=p[i-1];
 p[j].score:=points;
 p[j].name:='';
 end;
present('hall of fame',97,30,13);
for i:=1 to 10 do
 begin
 present(p[i].name,67,30+i*15,2);
 present(num2st(p[i].score),167,30+i*15,14);
 end;
if j>0 then
 begin
 p[j].name:=getst(67,30+j*15,9,2);
 present(p[j].name,67,30+i*15,2);
 present(num2st(p[j].score),167,30+i*15,14);
 seek(s,j-1);
 for i:=j to 10 do
  write(s,p[i]);
 end;
close(s);
repeat
 if j>0 then
  begin
  present(p[j].name,67,30+j*15,0);
  present(num2st(p[j].score),167,30+j*15,0);
  delay(2000);
  present(p[j].name,67,30+j*15,2);
  present(num2st(p[j].score),167,30+j*15,14);
  delay(2000);
  end;
 code:=port[$60];
 while keypressed do dummy_char:=readkey;
 until (code=28) or (code=1);
q:=w.anchor^.next;
while q^.next<>nil do
 begin
 q2:=q;
 q:=q^.next;
 dispose(q2);
 end;
dispose(q);
dispose(w.anchor);
goto again;
jmp:
q:=nil;
q2:=nil;
q3:=nil;
closegraph;
end.