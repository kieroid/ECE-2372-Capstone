`timescale 1ns / 1ps

module Calculator_tb;

    // Inputs
    reg inc_1;
    reg inc_2;
    reg sign;
    reg set;
    reg rst;

    // Outputs
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] signal;

    // Instantiate the Unit Under Test (UUT)
    Calculator uut (
        .inc_1(inc_1), 
        .inc_2(inc_2), 
        .sign(sign), 
        .set(set), 
        .rst(rst), 
        .seg1(seg1), 
        .seg2(seg2), 
        .signal(signal)
    );

    initial begin
        // Initialize Inputs
        inc_1 = 0;
        inc_2 = 0;
        sign = 0;
        set = 0;
        rst = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        // Reset the calculator
        rst = 1; #10;
        rst = 0; #10;

        // Increment first number
        repeat (10) begin
            inc_1 = 1; #10;
            inc_1 = 0; #10;
        end

        // Increment second number
        repeat (10) begin
            inc_2 = 1; #10;
            inc_2 = 0; #10;
        end

        // Test addition
        sign = 0; // Select addition mode
        set = 1; // Show result
        #10;
        set = 0; // Show inputs

        // Test subtraction
        sign = 1; // Select subtraction mode
        set = 1; // Show result
        #10;
        set = 0; // Show inputs

        // Reset at the end of the test
        rst = 1; #10;
        rst = 0; #10;

        // End simulation
        $finish;
    end

endmodule


 

