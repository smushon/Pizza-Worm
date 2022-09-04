program mush;
uses crt,tafrit;
var
 n:byte;
 bin:file of byte;
begin
assign(bin,'angle.dat');
rewrite(bin);
n:=4;
write(bin,n);
close(bin);
end.