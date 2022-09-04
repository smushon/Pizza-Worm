unit poligon;
interface
uses mgfx;
type
 dot_pos_type=^dot_type;
 dot_type=record
  x:x_type;
  y:y_type;
  next:dot_pos_type;
  end;
 pol_type=record
  anchor:dot_pos_type;
  end;
procedure pol_init(var pol:pol_type);
function pol_anchor(pol:pol_type):dot_pos_type;
function pol_end(pol:pol_type):dot_pos_type;
function pol_next(pol:pol_type;p:dot_pos_type):dot_pos_type;
function pol_pre(pol:pol_type;p:dot_pos_type):dot_pos_type;
procedure pol_insert(var pol:pol_type;p:dot_pos_type;x:x_type;y:y_type);
procedure pol_cut(var pol:pol_type;var p:dot_pos_type);
procedure pol_update(var pol:pol_type;p:dot_pos_type;x:x_type;y:y_type);
procedure pol_return(pol:pol_type;p:dot_pos_type;var x:x_type;var y:y_type);
function pol_empty(pol:pol_type):boolean;
procedure pol_draw(pol:pol_type;col:byte);
implementation
procedure pol_init(var pol:pol_type);
 begin
 new(pol.anchor);
 pol.anchor^.next:=nil;
 end;
function pol_anchor(pol:pol_type):dot_pos_type;
 begin
 pol_anchor:=pol.anchor;
 end;
function pol_end(pol:pol_type):dot_pos_type;
 begin
 pol_end:=nil;
 end;
function pol_next(pol:pol_type;p:dot_pos_type):dot_pos_type;
 begin
 pol_next:=p^.next;
 end;
function pol_pre(pol:pol_type;p:dot_pos_type):dot_pos_type;
 var
  q:dot_pos_type;
 begin
 q:=pol.anchor;
 while q^.next<>p do
  q:=q^.next;
 pol_pre:=q;
 end;
procedure pol_insert(var pol:pol_type;p:dot_pos_type;x:x_type;y:y_type);
 var
  q:dot_pos_type;
 begin
  new(q);
  q^.x:=x;
  q^.y:=y;
  q^.next:=p^.next;
  p^.next:=q;
 end;
procedure pol_cut(var pol:pol_type;var p:dot_pos_type);
 var
  q:dot_pos_type;
 begin
 q:=pol_pre(pol,p);
 q^.next:=p^.next;
 p^.next:=nil;
 p:=q^.next;
 end;
procedure pol_update(var pol:pol_type;p:dot_pos_type;x:x_type;y:y_type);
 begin
 p^.x:=x;
 p^.y:=y;
 end;
procedure pol_return(pol:pol_type;p:dot_pos_type;var x:x_type;var y:y_type);
 begin
 x:=p^.x;
 y:=p^.y;
 end;
function pol_empty(pol:pol_type):boolean;
 begin
 pol_empty:=pol.anchor^.next=nil;
 end;
procedure pol_draw(pol:pol_type;col:byte);
 var
  p,p1,p2:dot_pos_type;
  x1,x2:x_type;
  y1,y2:y_type;
 begin
 if pol.anchor^.next<>nil then
  begin
  p:=pol.anchor^.next;
  p1:=p;
  while p1^.next<>nil do
   begin
   x1:=p1^.x;
   y1:=p1^.y;
   p2:=p1^.next;
   x2:=p2^.x;
   y2:=p2^.y;
   dline(x1,y1,x2,y2,col);
   p1:=p2;
   end;
  x1:=p^.x;
  y1:=p^.y;
  dline(x2,y2,x1,y1,col);
  end;
 end;
end.