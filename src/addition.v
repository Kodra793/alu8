module addition (
    input [7:0] a, 
    input [7:0] b,
    output [7:0] out
);
wire [7:0] cin;
assign cin[0] = 1'b1;
endmodule