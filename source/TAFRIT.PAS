unit tafrit;
interface
uses crt,graph,chars,mgfx,transfor;
type
 ch=0..3;
function choose(var d:dt;var n:byte):ch;
procedure choose2(var d:dt;var n:byte);
implementation
function choose(var d:dt;var n:byte):ch;
 label
  stop,again;
 var
  s2:file of dt;
  c:ch;
  st:string;
  c1,c2:char;
  i:-4..7;
  j:-4..61;
  col1,col2,col3,col4:array[-4..4,-4..4] of byte;
  text1:array[0..52,0..7] of byte;
  text2:array[0..61,0..7] of byte;
  text3:array[0..43,0..7] of byte;
  text4:array[0..34,0..7] of byte;
  v,w,x,y,z,p,a,b,l,m,q,r,s,t:point;
 begin
 again:
 q.x:=120;
 q.y:=28;
 r.x:=120;
 r.y:=20;
 s.x:=116;
 s.y:=25;
 t.x:=124;
 t.y:=23;
 l.x:=121;
 l.y:=28;
 m.x:=119;
 m.y:=20;
 a.x:=116;
 a.y:=25;
 b.x:=124;
 b.y:=23;
 p.x:=120;
 p.y:=24;
 v.x:=118;
 v.y:=23;
 w.x:=122;
 w.y:=23;
 x.x:=119;
 x.y:=25;
 y.x:=120;
 y.y:=25;
 z.x:=121;
 z.y:=25;
 for j:=0 to 52 do
  for i:=0 to 7 do
   text1[j,i]:=getpixel(130+j,20+i);
 for j:=0 to 61 do
  for i:=0 to 7 do
   text2[j,i]:=getpixel(130+j,31+i);
 for j:=0 to 43 do
  for i:=0 to 7 do
   text3[j,i]:=getpixel(130+j,42+i);
 for j:=0 to 34 do
  for i:=0 to 7 do
   text4[j,i]:=getpixel(130+j,53+i);
 present('start',130,20,44);
 present('options',130,31,44);
 present('intro',130,42,44);
 present('exit',130,53,44);
 st:='mushon'+chr(39)+'s pizza worm v1.5';
 present(st,5,190,2);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col1[j,i]:=getpixel(120+j,24+i);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col2[j,i]:=getpixel(120+j,35+i);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col3[j,i]:=getpixel(120+j,46+i);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col4[j,i]:=getpixel(120+j,57+i);
 cir4(120,24,4,44);
 pxl(121,28,14);
 pxl(119,20,14);
 pxl(116,24,14);
 pxl(124,24,14);
 pxl(120,28,14);
 pxl(120,20,14);
 pxl(116,25,14);
 pxl(124,23,14);
 pxl(118,23,44);
 pxl(122,23,44);
 pxl(119,25,44);
 pxl(120,25,44);
 pxl(121,25,44);
 c:=0;
 repeat
  repeat
   repeat
    repeat
     rotate(v,0.392699081,p);
     rotate(w,0.392699081,p);
     rotate(x,0.392699081,p);
     rotate(y,0.392699081,p);
     rotate(z,0.392699081,p);
     rotate(a,0.392699081,p);
     rotate(b,0.392699081,p);
     rotate(l,0.392699081,p);
     rotate(m,0.392699081,p);
     rotate(q,0.392699081,p);
     rotate(r,0.392699081,p);
     rotate(s,0.392699081,p);
     rotate(t,0.392699081,p);
     case c of
      0:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,24+i,col1[j,i]);
      1:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,35+i,col2[j,i]);
      2:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,46+i,col3[j,i]);
      3:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,57+i,col4[j,i]);
      end;
     cir4(120,24+c*11,4,44);
     pxl(round(v.x),round(v.y)+c*11,44);
     pxl(round(w.x),round(w.y)+c*11,44);
     pxl(round(x.x),round(x.y)+c*11,44);
     pxl(round(y.x),round(y.y)+c*11,44);
     pxl(round(z.x),round(z.y)+c*11,44);
     pxl(round(a.x),round(a.y)+c*11,14);
     pxl(round(b.x),round(b.y)+c*11,14);
     pxl(round(l.x),round(l.y)+c*11,14);
     pxl(round(m.x),round(m.y)+c*11,14);
     pxl(round(q.x),round(q.y)+c*11,14);
     pxl(round(r.x),round(r.y)+c*11,14);
     pxl(round(s.x),round(s.y)+c*11,14);
     pxl(round(t.x),round(t.y)+c*11,14);
     delay(d*6);
     until keypressed;
    c1:=readkey;
    if ord(c1)=13 then goto stop;
    until ord(c1)=0;
   c2:=readkey;
   until (ord(c2)=72) or (ord(c2)=80);
  if ((c=0) and (ord(c2)=80)) or ((c=2) and (ord(c2)=72)) then
   begin
   c:=1;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,24+i,col1[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,46+i,col3[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,57+i,col4[j,i]);
   cir4(120,35,4,44);
   pxl(round(v.x),round(v.y+11),44);
   pxl(round(w.x),round(w.y+11),44);
   pxl(round(x.x),round(x.y+11),44);
   pxl(round(y.x),round(y.y+11),44);
   pxl(round(z.x),round(z.y+11),44);
   pxl(round(a.x),round(a.y+11),14);
   pxl(round(b.x),round(b.y+11),14);
   pxl(round(l.x),round(l.y+11),14);
   pxl(round(m.x),round(m.y+11),14);
   pxl(round(q.x),round(q.y+11),14);
   pxl(round(r.x),round(r.y+11),14);
   pxl(round(s.x),round(s.y+11),14);
   pxl(round(t.x),round(t.y+11),14);
   end else
  if ((c=1) and (ord(c2)=80)) or ((c=3) and (ord(c2)=72)) then
   begin
   c:=2;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,24+i,col1[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,57+i,col4[j,i]);
   cir4(120,46,4,44);
   pxl(round(v.x),round(v.y+22),44);
   pxl(round(w.x),round(w.y+22),44);
   pxl(round(x.x),round(x.y+22),44);
   pxl(round(y.x),round(y.y+22),44);
   pxl(round(z.x),round(z.y+22),44);
   pxl(round(a.x),round(a.y+22),14);
   pxl(round(b.x),round(b.y+22),14);
   pxl(round(l.x),round(l.y+22),14);
   pxl(round(m.x),round(m.y+22),14);
   pxl(round(q.x),round(q.y+22),14);
   pxl(round(r.x),round(r.y+22),14);
   pxl(round(s.x),round(s.y+22),14);
   pxl(round(t.x),round(t.y+22),14);
   end else
  if ((c=1) and (ord(c2)=72)) or ((c=3) and (ord(c2)=80)) then
   begin
   c:=0;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,46+i,col3[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,57+i,col4[j,i]);
   cir4(120,24,4,44);
   pxl(round(v.x),round(v.y),44);
   pxl(round(w.x),round(w.y),44);
   pxl(round(x.x),round(x.y),44);
   pxl(round(y.x),round(y.y),44);
   pxl(round(z.x),round(z.y),44);
   pxl(round(a.x),round(a.y),14);
   pxl(round(b.x),round(b.y),14);
   pxl(round(l.x),round(l.y),14);
   pxl(round(m.x),round(m.y),14);
   pxl(round(q.x),round(q.y),14);
   pxl(round(r.x),round(r.y),14);
   pxl(round(s.x),round(s.y),14);
   pxl(round(t.x),round(t.y),14);
   end else
  if ((c=0) and (ord(c2)=72)) or ((c=2) and (ord(c2)=80)) then
   begin
   c:=3;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,46+i,col3[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,24+i,col1[j,i]);
   cir4(120,56,4,44);
   pxl(round(v.x),round(v.y)+33,44);
   pxl(round(w.x),round(w.y)+33,44);
   pxl(round(x.x),round(x.y)+33,44);
   pxl(round(y.x),round(y.y)+33,44);
   pxl(round(z.x),round(z.y)+33,44);
   pxl(round(a.x),round(a.y)+33,14);
   pxl(round(b.x),round(b.y)+33,14);
   pxl(round(l.x),round(l.y)+33,14);
   pxl(round(m.x),round(m.y)+33,14);
   pxl(round(q.x),round(q.y)+33,14);
   pxl(round(r.x),round(r.y)+33,14);
   pxl(round(s.x),round(s.y)+33,14);
   pxl(round(t.x),round(t.y)+33,14);
   end;
  until ord(c1)=13;
 stop:
 if c=1 then
  begin
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
  for j:=0 to 52 do
   for i:=0 to 7 do
    pxl(130+j,20+i,text1[j,i]);
  for j:=0 to 61 do
   for i:=0 to 7 do
    pxl(130+j,31+i,text2[j,i]);
  for j:=0 to 43 do
   for i:=0 to 7 do
    pxl(130+j,42+i,text3[j,i]);
  for j:=0 to 34 do
   for i:=0 to 7 do
    pxl(130+j,53+i,text4[j,i]);
  end;
 if c=1 then
  begin
  choose2(d,n);
  assign(s2,'delay.dat');
  rewrite(s2);
  write(s2,d);
  close(s2);
  goto again;
  end;
 choose:=c;
 end;
procedure choose2(var d:dt;var n:byte);
 label
  again2;
 var
  ok:boolean;
  v,w,x,y,z,p,a,b,l,m,q,r,s,t:point;
  text1:array[0..134,0..7] of byte;
  text2:array[0..115,0..7] of byte;
  text3:array[0..34,0..7] of byte;
  i:-4..7;
  j:-4..187;
  col1,col2,col3:array[-4..4,-4..4] of byte;
  c:0..2;
  c1,c2:char;
 begin
 q.x:=120;
 q.y:=28;
 r.x:=120;
 r.y:=20;
 s.x:=116;
 s.y:=25;
 t.x:=124;
 t.y:=23;
 l.x:=121;
 l.y:=28;
 m.x:=119;
 m.y:=20;
 a.x:=116;
 a.y:=25;
 b.x:=124;
 b.y:=23;
 p.x:=120;
 p.y:=24;
 v.x:=118;
 v.y:=23;
 w.x:=122;
 w.y:=23;
 x.x:=119;
 x.y:=25;
 y.x:=120;
 y.y:=25;
 z.x:=121;
 z.y:=25;
 for j:=0 to 134 do
  for i:=0 to 7 do
   text1[j,i]:=getpixel(130+j,20+i);
 for j:=0 to 115 do
  for i:=0 to 7 do
   text2[j,i]:=getpixel(130+j,31+i);
 for j:=0 to 34 do
  for i:=0 to 7 do
   text3[j,i]:=getpixel(130+j,42+i);
 present('delay[20-2000]:',130,20,44);
 present(num2st(d),265,20,44);
 present('angle factor:',130,31,44);
 present(num2st(n),246,31,44);
 present('back',130,42,44);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col1[j,i]:=getpixel(120+j,24+i);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col2[j,i]:=getpixel(120+j,35+i);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   col3[j,i]:=getpixel(120+j,46+i);
 cir4(120,24,4,44);
 pxl(121,28,14);
 pxl(119,20,14);
 pxl(116,24,14);
 pxl(124,24,14);
 pxl(120,28,14);
 pxl(120,20,14);
 pxl(116,25,14);
 pxl(124,23,14);
 pxl(118,23,44);
 pxl(122,23,44);
 pxl(119,25,44);
 pxl(120,25,44);
 pxl(121,25,44);
 c:=0;
 repeat
  repeat
   ok:=true;
   repeat
    repeat
     rotate(v,0.392699081,p);
     rotate(w,0.392699081,p);
     rotate(x,0.392699081,p);
     rotate(y,0.392699081,p);
     rotate(z,0.392699081,p);
     rotate(a,0.392699081,p);
     rotate(b,0.392699081,p);
     rotate(l,0.392699081,p);
     rotate(m,0.392699081,p);
     rotate(q,0.392699081,p);
     rotate(r,0.392699081,p);
     rotate(s,0.392699081,p);
     rotate(t,0.392699081,p);
     case c of
      0:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,24+i,col1[j,i]);
      1:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,35+i,col2[j,i]);
      2:for i:=-4 to 4 do
         for j:=-4 to 4 do
          pxl(120+j,46+i,col3[j,i]);
      end;
     cir4(120,24+c*11,4,44);
     pxl(round(v.x),round(v.y)+c*11,44);
     pxl(round(w.x),round(w.y)+c*11,44);
     pxl(round(x.x),round(x.y)+c*11,44);
     pxl(round(y.x),round(y.y)+c*11,44);
     pxl(round(z.x),round(z.y)+c*11,44);
     pxl(round(a.x),round(a.y)+c*11,14);
     pxl(round(b.x),round(b.y)+c*11,14);
     pxl(round(l.x),round(l.y)+c*11,14);
     pxl(round(m.x),round(m.y)+c*11,14);
     pxl(round(q.x),round(q.y)+c*11,14);
     pxl(round(r.x),round(r.y)+c*11,14);
     pxl(round(s.x),round(s.y)+c*11,14);
     pxl(round(t.x),round(t.y)+c*11,14);
     delay(d*6);
     until keypressed;
    c1:=readkey;
    until (ord(c1)=0) or (ord(c1)=13);
   if ord(c1)=0 then
    begin
    c2:=readkey;
    if not((ord(c2)=72) or (ord(c2)=75) or (ord(c2)=77) or (ord(c2)=80)) then
     ok:=false;
    end;
   until ok=true;
  if (ord(c1)=0) and (((c=0) and (ord(c2)=80)) or ((c=2) and (ord(c2)=72)))then
   begin
   c:=1;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,24+i,col1[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,46+i,col3[j,i]);
   cir4(120,35,4,44);
   pxl(round(v.x),round(v.y+11),44);
   pxl(round(w.x),round(w.y+11),44);
   pxl(round(x.x),round(x.y+11),44);
   pxl(round(y.x),round(y.y+11),44);
   pxl(round(z.x),round(z.y+11),44);
   pxl(round(a.x),round(a.y+11),14);
   pxl(round(b.x),round(b.y+11),14);
   pxl(round(l.x),round(l.y+11),14);
   pxl(round(m.x),round(m.y+11),14);
   pxl(round(q.x),round(q.y+11),14);
   pxl(round(r.x),round(r.y+11),14);
   pxl(round(s.x),round(s.y+11),14);
   pxl(round(t.x),round(t.y+11),14);
   end else
  if (ord(c1)=0) and( ((c=1) and (ord(c2)=72)) or ((c=2) and (ord(c2)=80)))then
   begin
   c:=0;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,46+i,col3[j,i]);
   cir4(120,24,4,44);
   pxl(round(v.x),round(v.y),44);
   pxl(round(w.x),round(w.y),44);
   pxl(round(x.x),round(x.y),44);
   pxl(round(y.x),round(y.y),44);
   pxl(round(z.x),round(z.y),44);
   pxl(round(a.x),round(a.y),14);
   pxl(round(b.x),round(b.y),14);
   pxl(round(l.x),round(l.y),14);
   pxl(round(m.x),round(m.y),14);
   pxl(round(q.x),round(q.y),14);
   pxl(round(r.x),round(r.y),14);
   pxl(round(s.x),round(s.y),14);
   pxl(round(t.x),round(t.y),14);
   end else
  if (ord(c1)=0) and (((c=0) and (ord(c2)=72)) or ((c=1) and (ord(c2)=80)))then
   begin
   c:=2;
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,35+i,col2[j,i]);
   for i:=-4 to 4 do
    for j:=-4 to 4 do
     pxl(120+j,24+i,col1[j,i]);
   cir4(120,46,4,44);
   pxl(round(v.x),round(v.y+22),44);
   pxl(round(w.x),round(w.y+22),44);
   pxl(round(x.x),round(x.y+22),44);
   pxl(round(y.x),round(y.y+22),44);
   pxl(round(z.x),round(z.y+22),44);
   pxl(round(a.x),round(a.y+22),14);
   pxl(round(b.x),round(b.y+22),14);
   pxl(round(l.x),round(l.y+22),14);
   pxl(round(m.x),round(m.y+22),14);
   pxl(round(q.x),round(q.y+22),14);
   pxl(round(r.x),round(r.y+22),14);
   pxl(round(s.x),round(s.y+22),14);
   pxl(round(t.x),round(t.y+22),14);
   end else
  if (c=1) and (ord(c1)=0) then
   begin
   if (ord(c2)=75) and (n>1) then
    begin
    n:=n-1;
    for j:=0 to 16 do
     for i:=0 to 7 do
      pxl(246+j,31+i,1);
    present(num2st(n),246,31,44);
    end
    else if (ord(c2)=77) and (n<10) then
     begin
     n:=n+1;
     for j:=0 to 16 do
      for i:=0 to 7 do
       pxl(246+j,31+i,1);
     present(num2st(n),246,31,44);
     end;
   end else
  if (c=0) and (ord(c1)=13) then
   begin
   again2:
   for j:=0 to 35 do
    for i:=0 to 7 do
     pxl(265+j,20+i,1);
   d:=getnum(265,20,4,44,d);
   if (d<20) or (d>2000) then goto again2;
   end;
  until (ord(c1)=13) and (c=2);
 for i:=-4 to 4 do
  for j:=-4 to 4 do
   pxl(120+j,46+i,col3[j,i]);
 for j:=0 to 134 do
  for i:=0 to 7 do
   pxl(130+j,20+i,text1[j,i]);
 for j:=0 to 115 do
  for i:=0 to 7 do
   pxl(130+j,31+i,text2[j,i]);
 for j:=0 to 35 do
  for i:=0 to 7 do
   pxl(265+j,20+i,1);
 for j:=0 to 16 do
  for i:=0 to 7 do
   pxl(246+j,31+i,1);
 for j:=0 to 34 do
  for i:=0 to 7 do
   pxl(130+j,42+i,text3[j,i]);
 end;
end.