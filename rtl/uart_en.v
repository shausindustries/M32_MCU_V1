module uart_en(clk,in,mask,w);
input clk,w;
input [31:0]in;
output reg [31:0]mask;

reg [31:0]umask;

always@ (posedge clk)
begin
    if (w == 1'b1) begin
        umask <= in;
    end
    else
        begin
            mask <= umask;
        end
end
endmodule