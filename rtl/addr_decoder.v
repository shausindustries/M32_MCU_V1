module addr_decoder(addr,da,ga,gena,gina,drina,dm,t_cnf,tc,tp,ut,ur,ue);
input [31:0] addr;
output reg [31:0]da;
output reg ga,gina,drina,gena,dm,t_cnf,tc,tp,ut,ur,ue;

always@ (*)
begin
    if (addr < 32'h00004000) begin
        da = addr;
        dm = 1'b1;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00003FFF && addr < 32'h00004004) begin
        dm = 1'b0;
        ga = 1'b1;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00004003 && addr < 32'h00004008) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b1;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00004007 && addr < 32'h0000400C) begin
        dm = 1'b1;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b1;
        drina = 1'b0;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h0000400B && addr < 32'h00004011) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b1;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00004010 && addr < 32'h00004015) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b1;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00004014 && addr < 32'h00004019) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b0;
        tc = 1'b1;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h00004018 && addr < 32'h0000401D) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b0;
        tc = 1'b0;
        t_cnf = 1'b1;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 32'h0000401C && addr < 00004021) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b0;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b1;
        ur = 1'b0;
        ue = 1'b0;
    end
    else if (addr > 00004020 && addr < 00004025) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b0;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b1;
        ue = 1'b0;
    end
    else if (addr > 00004024 && addr < 00004029) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
        tp = 1'b0;
        tc = 1'b0;
        t_cnf = 1'b0;
        ut = 1'b0;
        ur = 1'b0;
        ue = 1'b1;
    end
end
endmodule