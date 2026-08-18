module gpio_out(din,pin,clk,w);
input [31:0]din;
input w,clk;
output reg [31:0]pin;

reg [31:0] gp_o;
integer i;

always@ (posedge clk)
begin
    if (w == 1'b1) begin
        gp_o <= din;
    end
    else begin
        pin <= gp_o;
    end
end
endmodule