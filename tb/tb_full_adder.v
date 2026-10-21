`timescale 1ns/1ps

module tb_full_adder ;
    reg a, b, cin;
    wire sum, cout; // khai báo input là reg, output là wire

    reg [1:0] expected; // the expected result
    integer i, errors; 

    full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)); // DUT: device under test
// after declare inputs, outputs, connect these wire to DUT, we begin the intial command
    initial begin
        //PART1: PREPARE
        $dumpfile("tb_full_adder.vcd"); // create a waveform file
        $dumpvars(0, tb_full_adder);
        errors = 0;
        //PART2: EXPERIMENT
        for (i=0; i<8; i=i+1) begin
            // change i into bit of a, b, cin
            {a, b, cin} = i [2:0]; // this i will transform from decimal to binary
            expected = a + b + cin;
            //wait to avoid propagation delay
            #10;
            // compare with the value to get result PASS or FAIL
            if ({cout, sum} !== expected) begin
                errors = errors + 1;
                $display("FAIL...");
            end else begin 
                $display("PASS...");
            end
        end

    end

endmodule