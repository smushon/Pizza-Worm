program mush;
uses crt,tafrit;
var
 d:dt;
 bin:file of dt;
begin
assign(bin,'delay.dat');
rewrite(bin);
d:=350;
write(bin,d);
close(bin);
end.