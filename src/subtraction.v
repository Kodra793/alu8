module subtraction (
    input [7:0] a, 
    input [7:0] b,
    output [7:0] out
);
wire [8:0] cin;
assign cin[0] = 1'b1;
genvar i;
generate
    for (i=0; i<8;i=i+1) begin: subtraction
        full_adder fa(.a(a[i]), .b(b[i]), .cin(cin[i]), .sum(out[i]), .cout(cin[i+1]));
    end
endgenerate
endmodule