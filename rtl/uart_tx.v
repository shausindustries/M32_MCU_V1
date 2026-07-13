module uart_tx(w,clk,din,dout);
input w,clk;
input [31:0]din;
output reg dout;

reg [31:0]tx;
integer i;

always@ (posedge clk)
if (w == 1'b1) begin
    tx <= din;
end
else
    begin
        for (i=0; i<32; i = i + 1 ) begin
            dout <= tx[i];
        end
    end
endmodule