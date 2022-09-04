{  75:begin
     if dy=-1 then
      begin
      if dx=1 then
       begin
       if dyt>1 then begin dyt:=dyt-1; dyc:=0; if dy=0 then dy:=-1; end
        else begin dxt:=dxt+1; dxc:=0; if dxt=5 then dx:=0; end;
       end else
       begin
       if dx=-1 then
        begin
        if dxt>1 then begin dxt:=dxt-1; dxc:=0; if dx=0 then dx:=-1; end
         else begin dyt:=dyt+1; dyc:=0; if dyt=5 then dy:=0; end;
        end else if dxt>1 then begin dxt:=dxt-1; dxc:=0; if dx=0 then dx:=-1; end;
       end;
      end else
      begin
      if dy=1 then
       begin
       if dx=1 then
        begin
        if dxt>1 then begin dxt:=dxt-1; dxc:=0; if dx=0 then dx:=1; end
         else begin dyt:=dyt+1; dyc:=0; if dyt=5 then dy:=0; end;
        end else
        begin
        if dx=-1 then
         begin
         if dyt>1 then begin dyt:=dyt-1; dyc:=0; if dy=0 then dy:=1; end
          else begin dxt:=dxt+1; dxc:=0; if dxt=5 then dx:=0; end;
         end else if dxt>1 then begin dxt:=dxt-1; dxc:=0; if dx=0 then dx:=1; end;
        end;
       end else if dyt>1 then
        begin
        dyt:=dyt-1;
        dyc:=0;
        if dy=0 then
         begin
         if dx=-1 then dy:=1
          else if dx=1 then dy:=-1;
         end;
        end;
      end;
     end;}
