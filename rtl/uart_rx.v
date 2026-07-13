module uart_rx(din,clk,dp,r);
input din,clk,r;
output reg [31:0]dp;

reg [31:0]rx;
integer i;

always@ (posedge clk)
if (r == 1'b0) begin
   for (i=0; i<32; i=i+1) begin
    rx[i] <= din;
end 
end
else begin
    dp <= rx;
end
endmodule