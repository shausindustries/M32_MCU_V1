module gpio_in(pin,gpi,clk,w,g_en,g_dir);
input [31:0]pin,g_en,g_dir;
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
           for (i=0; i<32; i=i+1) begin
            if (g_en[i] == 1'b1) begin
                if (g_dir[i] == 1'b0) begin
                    gpi = gp_i;
                end
            end
        end 
    end
end
endmodule