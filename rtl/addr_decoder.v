module addr_decoder(addr,da,ga,gena,gina,drina,dm);
input [31:0] addr;
output reg [31:0]da;
output reg ga,gina,drina,gena,dm;

always@ (*)
begin
    if (addr < 32'h00004000) begin
        da = addr;
        dm = 1'b1;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
    end
    else if (addr > 32'h00003FFF && addr < 32'h00004004) begin
        dm = 1'b0;
        ga = 1'b1;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b0;
    end
    else if (addr > 32'h00004003 && addr < 32'h00004008) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b1;
        gena = 1'b0;
        drina = 1'b0;
    end
    else if (addr > 32'h00004007 && addr < 32'h0000400C) begin
        dm = 1'b1;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b1;
        drina = 1'b0;
    end
    else if (addr > 32'h0000400B && addr < 32'h00004011) begin
        dm = 1'b0;
        ga = 1'b0;
        gina= 1'b0;
        gena = 1'b0;
        drina = 1'b1;
    end
end
endmodule