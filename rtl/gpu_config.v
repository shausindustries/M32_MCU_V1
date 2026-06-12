module gpio_config (gin,genin,cout);
input [31:0]gin,genin;
output reg [31:0] cout;

integer i;

always@ (*)
begin
    for (i = 0; i < 32; i = i+1 ) begin
            cout[i] = gin[i];
            if (genin[i] == 1'b0) begin
                cout[i] = 1'bz;
            end
            else begin
                cout[i] = gin[i];
            end
    end
end
endmodule