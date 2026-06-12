module gpio_out(din,pin,clk,w,g_en,g_dir);
input [31:0]din,g_en,g_dir;
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
        for (i=0; i<32; i=i+1) begin
                if (g_en[i] == 1'b1) begin
                    if (g_dir[i] == 1'b1) begin
                        pin = gp_o;
                    end
                end
            end 
    end
end
endmodule