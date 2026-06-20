module prescale_timer(clk,val,tick);
input clk;
input [31:0] val;
output reg tick;

reg [31:0] counter;

always@ (posedge clk)
begin
    if (counter == val) begin
        counter <= 32'b0;
        tick <= 1'b1;
    end
    else begin
        counter <= counter + 1'b1;
        tick <= 1'b0;
    end
end
endmodule