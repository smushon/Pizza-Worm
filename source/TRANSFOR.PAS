unit transfor;
interface
type
 vector=array[1..3] of real;
 matrix=array[1..3] of vector;
 point=record
  x,y:real;
  col:byte;
  end;
procedure vectorbymatrix(var rv:vector;var v:vector;var m:matrix);
{returns the cross product of v and m to rv}
procedure matrixbymatrix(var rm,m1,m2:matrix);
{returns the cross product of m1 and m2 to rm}
procedure point2vector(var v:vector;var p:point);
procedure vector2point(var p:point;var v:vector);
procedure rotate_matrix(var m:matrix;angle:real);
procedure move_matrix(var m:matrix;dx,dy:real);
procedure move(var p:point;dx,dy:real);
procedure rotate(var p:point;angle:real;pivot:point);
implementation
procedure vectorbymatrix(var rv:vector;var v:vector;var m:matrix);
 var
 i,j:integer;
 begin
 for i:=1 to 3 do
  rv[i]:=0;
 for i:=1 to 3 do
  for j:=1 to 3 do
   rv[j]:=rv[j]+v[i]*m[j,i];
 end;
procedure matrixbymatrix(var rm,m1,m2:matrix);
 var
 i,j,k:integer;
 begin
 for i:=1 to 3 do
  for i:=1 to j do
   rm[i,j]:=0;
 for i:=1 to 3 do
  for j:=1 to 3 do
   for k:=1 to 3 do
    rm[i,j]:=rm[i,j]+m1[i,j]*m2[i,k];
 end;
procedure point2vector(var v:vector;var p:point);
 begin
 v[1]:=p.x;
 v[2]:=p.y;
 v[3]:=1;
 end;
procedure vector2point(var p:point;var v:vector);
 begin
 p.x:=v[1];
 p.y:=v[2];
 end;
procedure rotate_matrix(var m:matrix;angle:real);
 begin
 m[1,1]:=cos(angle);
 m[1,2]:=-sin(angle);
 m[1,3]:=0;
 m[2,1]:=-m[1,2];
 m[2,2]:=m[1,1];
 m[2,3]:=0;
 m[3,1]:=0;
 m[3,2]:=0;
 m[3,3]:=1;
 end;
procedure move_matrix(var m:matrix;dx,dy:real);
 begin
 m[1,1]:=1;
 m[1,2]:=0;
 m[1,3]:=dx;
 m[2,1]:=0;
 m[2,2]:=1;
 m[2,3]:=dy;
 m[3,1]:=0;
 m[3,2]:=0;
 m[3,3]:=1;
 end;
procedure move(var p:point;dx,dy:real);
 var
 m:matrix;
 pv,rv:vector;
 begin
 move_matrix(m,dx,dy);
 point2vector(pv,p);
 vectorbymatrix(rv,pv,m);
 vector2point(p,rv);
 end;
procedure rotate(var p:point;angle:real;pivot:point);
 var
  mov_m,rot_m,rm:matrix;
  v1,v2:vector;
 begin
 point2vector(v1,p);
 move_matrix(mov_m,-pivot.x,-pivot.y);
 rotate_matrix(rot_m,angle);
 vectorbymatrix(v2,v1,mov_m);
 vectorbymatrix(v1,v2,rot_m);
 move_matrix(mov_m,pivot.x,pivot.y);
 vectorbymatrix(v2,v1,mov_m);
 vector2point(p,v2);
 end;
end.