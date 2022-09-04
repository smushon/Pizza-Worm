program mushi;
uses crt;
type
 person=record
  name:string;
  score:integer;
  end;
var
 p:person;
 bin:file of person;
begin
assign(bin,'scores.dat');
rewrite(bin);
p.name:='mushon';
p.score:=250;
write(bin,p);
p.score:=240;
write(bin,p);
p.score:=230;
write(bin,p);
p.score:=215;
write(bin,p);
p.score:=200;
write(bin,p);
p.score:=190;
write(bin,p);
p.score:=180;
write(bin,p);
p.score:=165;
write(bin,p);
p.score:=150;
write(bin,p);
p.score:=130;
write(bin,p);
close(bin);
end.