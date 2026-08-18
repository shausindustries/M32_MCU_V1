module gpio_in(pin,gpi,clk,w);
input [31:0]pin;
input w,clk;
output reg [31:0]gpi;

integer i;
reg [31:0] gp_i;

always@ (posedge clk)
begin
    if (w == 1'b1) begin
        gp_i <= pin;
    end
    else begin
        gpi <= gp_i;
    end
end
endmodule