module timer_cop (clk,w,in,out,rst);
input clk,w,rst;
input [31:0] in;
output reg [31:0]out;

reg [31:0] comp;

always @(posedge clk) begin
    if (rst == 1'b1) begin
        comp <= 32'b0;
    end
    else begin
       if (w  == 1'b0) begin
        comp <= in;
    end
       else
        out = comp; 
    end
end
endmodule