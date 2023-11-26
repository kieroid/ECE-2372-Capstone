//incrementer

module increment(A, R, C);
	input C, R;
	output reg [5:0] A;
	initial begin
		A = 6'b000000;
	end
	always@(C, R) begin
		if(C) begin
			A = A + 6'b000001;
				if(A == 6'b001010 ) begin
				A = 6'b000000;
				end
		end
		if(R) begin
			A = 6'b000000;
		end
	end
endmodule

//full adder
module full_adder(A, B, C, F, G);
	input A,B,C;
	output reg F,G;

	always@(A,B,C) begin
		G = A ^ B ^ C;

		F = A&B | C&B | C&A;
	end
endmodule

module top_adder(A, B, C, S);
	input [5:0]A,B;
	input C;
	output [5:0]S; //no reg when top because its not a continuous assignment

	wire w0;
	wire w1;
	wire w2;
	wire w3;
	wire w4;

	full_adder U0(.A(A[0]), .B(B[0]^C), .C(C), .F(w0), .G(S[0]));
	full_adder U1(.A(A[1]), .B(B[1]^C), .C(w0), .F(w1), .G(S[1]));
	full_adder U2(.A(A[2]), .B(B[2]^C), .C(w1), .F(w2), .G(S[2]));
	full_adder U3(.A(A[3]), .B(B[3]^C), .C(w2), .F(w3), .G(S[3]));
	full_adder U4(.A(A[4]), .B(B[4]^C), .C(w3), .F(w4), .G(S[4]));
	full_adder U5(.A(A[5]), .B(B[5]^C), .C(w4), .G(S[5]));
endmodule

//converter
module converter(A, B, C);
	input [5:0]A;
	output reg [5:0] B, C;

	always@(A)begin

	if((A >= 10) & (A < 6'b100000)) begin
		B = 6'b000001;
		C = A - 10;
	end else if(A >= 6'b100000) begin
		B = 6'b001010;
		C = ~A + 1;
	end else begin
		B = 6'b000000;
		C = A;
	end
	end
endmodule

//7 segment decoder
module Seg7decode(       // convert active-high 4-bit hex to 7-segment display code, active high
   input [5:0] bin,      // binary input
   output reg [6:0] seg7 // LED Anode outputs,active high, assumes common anode LEDs. Not actually registers. 
    );
  always @(bin)
    begin
       case(bin)
  //   bit order is segments ABCDEFG
          6'b000000: seg7 = 7'b1111110; // "0"  
          6'b000001: seg7 = 7'b0110000; // "1"
          6'b000010: seg7 = 7'b1101101; // "2"
          6'b000011: seg7 = 7'b1111001; // "3"
          6'b000100: seg7 = 7'b0110011; // "4"
          6'b000101: seg7 = 7'b1101101; // "5"
          6'b000110: seg7 = 7'b1011111; // "6"
          6'b000111: seg7 = 7'b1110000; // "7"
          6'b001000: seg7 = 7'b1111111; // "8"
          6'b001001: seg7 = 7'b1111011; // "9"
          6'b001010: seg7 = 7'b0000001; // "-"
          
      //////////// insert code here for input patterns 4'b001 through 4'b1111 
     
          default: seg7 = 7'b1101010; // "n" ("n" for none, but this will never happen)
       endcase
    end   
endmodule

module MUX(
	input C, 
	input [5:0] num1, num2, conv1, conv2,
	output reg [5:0] out1, out2
);
always@* begin
if(C) begin
	out1 = conv1;
	out2 = conv2;
end else begin
	out1 = num1;
	out2 = num2;
end
end
endmodule

module top(
	input inc1, inc2, tog, eq, rst,
	output [6:0] sseg1, sseg2
);
	//inc1: input from button 1
	//inc2: input from button 2
	//rst: reset
	//tog: toggles between adding and subtracting
	//eq: swtich to display the sum or difference
	//sseg1: the output of the 1st 7seg display
	//sseg2: the output of the 2nd 7seg display

	wire [5:0] number1; 
	wire [5:0] number2;
	wire [5:0] toconv;
	wire [5:0] convnum1;
	wire [5:0] convnum2;

	wire [5:0] seg1;
	wire [5:0] seg2;

	increment i1(.C(inc1), .R(rst), .A(number1));
	increment i2(.C(inc2), .R(rst), .A(number2));
	top_adder AS(.A(number1), .B(number2), .C(tog), .S(toconv));
	converter CNV(.A(toconv), .B(convnum1), .C(convnum2));
		
	MUX MU(.C(eq), .num1(number1), .num2(number2), .conv1(convnum1), .conv2(convnum2), .out1(seg1), .out2(seg2));
	
	Seg7decode d1(.bin(seg1), .seg7(sseg1));
	Seg7decode d2(.bin(seg2), .seg7(sseg2));
	

endmodule
