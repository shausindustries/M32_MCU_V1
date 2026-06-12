module gpio_en(din,en_mask,clk,w);
input [31:0]din;
input w,clk;
output reg [31:0]en_mask;

reg [31:0]gp_en;

always@ (posedge clk)
begin
    if (w == 1'b1) begin
        gp_en <= din;
    end
    else
        en_mask = gp_en;
end
endmodule