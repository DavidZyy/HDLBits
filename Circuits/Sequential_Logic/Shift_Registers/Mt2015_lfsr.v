module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

  wire temp0;

  sub_module u_sub_module_0(
  	.clk  (KEY[0]),
    .L    (KEY[1]),
    .r_in (SW[0]),
    .q_in (LEDR[2]),
    .Q    (LEDR[0])
  );

  sub_module u_sub_module_1(
  	.clk  (KEY[0]),
    .L    (KEY[1]),
    .r_in (SW[1]),
    .q_in (LEDR[0]),
    .Q    (LEDR[1])
  );

  assign temp0 = LEDR[1] ^ LEDR[2];
  sub_module u_sub_module_2(
  	.clk  (KEY[0]),
    .L    (KEY[1]),
    .r_in (SW[2]),
    .q_in (temp0),
    .Q    (LEDR[2])
  );

endmodule



module sub_module(
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

  wire a;
  assign a = L ? r_in : q_in;

  always @(posedge clk) begin
    Q <= a;
  end

endmodule
