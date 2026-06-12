module gpio_dir (clk,w,din,dir_mask);
input w,clk;
input [31:0]din;
output reg [31:0]dir_mask;

reg [31:0]gp_d;

always@ (posedge clk)
begin
    if (w == 1'b1) begin
        gp_d <= din;
    end
    else begin
        dir_mask = gp_d;
        end
end
endmodule