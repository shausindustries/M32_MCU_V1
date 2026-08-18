module gpio_controller (pin_out,pin_in,gen,go,gi,uen,ud,gdr,uin,ins);
input ud;
input [31:0]gen,go,uen,gdr,pin_in;
output reg [31:0]pin_out,gi;
output reg uin,ins;

reg [31:0]input_buffer, output_buffer;
integer i;

always@ (*)
begin
    for (i=0; i<32; i = i + 1) begin
        if (gen[i] == 1'b1) begin
            if (gdr[i] == 1'b1) begin
                ins <= 1'b0;
                if (uen[i] == 1'b1) begin
                    pin_out[i] = ud;
                end
                else begin
                    pin_out[i] = go[i]; 
                end
            end
            else begin
                ins <= 1'b1;
                if (uen[i] == 1'b0) begin
                    uin = pin_in[i]; 
                end
                else begin
                    gi[i] = pin_in[i];
                end
        end
    end
end
end
endmodule