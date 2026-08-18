module uart_tx(wd,t,clk,din,dout);
input wd,clk,t;
input [31:0]din;
output reg dout;

reg [31:0]tx;
integer i;

always@ (posedge clk)
if (wd == 1'b1) begin
    tx <= din;
end
else if (t ==1'b1)
    begin
        for (i=0; i<32; i = i + 1 ) begin
            dout <= tx[i];
        end
    end
endmodule