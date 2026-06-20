module timer_prescale(w,clk,in,out,rst);
input clk,w,rst;
inout [31:0]in;
output reg [31:0]out;

reg [31:0] ps;

always@ (posedge clk)
begin
    if (rst == 1'b1) begin
        ps <= 32'b0;
    end
    else begin
       if (w == 1'b1) begin
        ps <= in;
    end
    else
        begin
            out = ps;
        end 
    end
end

endmodule