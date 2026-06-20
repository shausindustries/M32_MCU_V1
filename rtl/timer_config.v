module timer_config(w,in,out,clk,rst);
input w,clk,rst;
input [31:0]in;
output reg [31:0]out;

reg [31:0] tc;

always@ (posedge clk)
begin
    if (rst == 1'b1) begin
        tc <= 32'b0;
    end
    else begin
        if (w == 1'b1) begin
            tc <= in;
        end
        else begin
            out = tc;
        end
    end
end
endmodule