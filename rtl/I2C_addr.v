module I2C_addr(clk,w,din,dout);
input clk,w;
input [31:0]din;
output reg [31:0]dout;

reg [31:0] iaddar;

always@ (posedge clk)
begin
    if (w) begin
        iaddar <= din;
    end
    else
        dout <= iaddar;
end
endmodule