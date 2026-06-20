module timer (clk,pre_scale,comp,en,clk_out);
    input clk,en;
    input [31:0] pre_scale,comp;
    output reg clk_out;

    wire pclk;
    reg [31:0] contr;

    prescale_timer ps1 (.val(pre_scale),.clk(clk),.tick(pclk));

    always@ (posedge pclk)
    begin
        if (contr == comp) begin
            contr <= 32'b0;
            clk_out <= 1'b1;
        end
        else begin
            contr <= contr + 1'b1;
            clk_out <= 1'b0;
        end
    end

endmodule