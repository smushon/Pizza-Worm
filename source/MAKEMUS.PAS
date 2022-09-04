program mush;
uses crt,tafrit2;
var
 d:dt;
 bin:file of dt;
begin
assign(bin,'delay.dat');
rewrite(bin);
d:=360;
write(bin,d);
close(bin);
end.