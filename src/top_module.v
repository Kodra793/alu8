module top_module(
    input [7:0] a, 
    input [7:0] b, 
    input [1:0] sel,
    output reg [7:0] out

);
wire [7:0] add_out , sub_out;
subtraction sub(.a(a[7:0]), .b(b[7:0]), .out(sub_out));
addition add(.a(a[7:0]), .b(b[7:0]), .out(add_out));
 always @(*) begin
    case(sel)
    2'b00 : out[7:0] = a[7:0] | b[7:0]; 
    2'b01 : out[7:0] = a[7:0] & b[7:0];
    2'b10 : out [7:0] = add_out ;
    2'b11 : out[7:0] = sub_out ;
    default : out = {8{1'b0}};
    endcase
 end
endmodule