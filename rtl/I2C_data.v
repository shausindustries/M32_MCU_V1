module I2C_data(clk,data,w,oe,din,dout);
    input clk,w,oe;
    input [31:0]dout;
    inout [31:0]data;
    output reg [31:0]din;

    assign data = oe ? dout : 32'bz;
    
    always@ (posedge clk)
    begin
    if (!oe) begin
        din <= data;
    end
end
endmodule