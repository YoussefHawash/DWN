module dwn_top(input clk, input [3199:0] x, output reg [2:0] y);
  wire [9:0] h0;
  reg  [9:0] h0_r;
  assign h0[0] = 64'b0000000100000000110110011110100000101010001010101111101010101010 >> {x[90], x[682], x[2545], x[3076], x[9], x[3131]};
  assign h0[1] = 64'b0010110110001101000000001000110000111101110101110000001000111100 >> {x[23], x[3154], x[672], x[577], x[3090], x[148]};
  assign h0[2] = 64'b0000001001000100000000000110110000011011110001001011000011100000 >> {x[407], x[3109], x[718], x[2046], x[2879], x[3158]};
  assign h0[3] = 64'b0101010001010000000000000000000000000000000000000000000010101010 >> {x[720], x[2922], x[3150], x[2595], x[2587], x[668]};
  assign h0[4] = 64'b0000011100010001101000101000001000000000000000001111000010000000 >> {x[124], x[2998], x[557], x[751], x[1], x[554]};
  assign h0[5] = 64'b1000000110100001100000100000001010011100001000001100010011000000 >> {x[140], x[560], x[752], x[753], x[0], x[753]};
  assign h0[6] = 64'b0000011100001100010011110100010000100010000000001000111011001000 >> {x[2918], x[2955], x[2917], x[754], x[2927], x[3086]};
  assign h0[7] = 64'b0000000000001001101010100010111001001100010001100100010010000101 >> {x[755], x[600], x[2820], x[3124], x[2919], x[3164]};
  assign h0[8] = 64'b1000111010101110010010000100010011111111000011100000000101000100 >> {x[2879], x[132], x[2014], x[2878], x[169], x[3085]};
  assign h0[9] = 64'b1110011110000100101000000001001100000011111111010000000011101100 >> {x[3137], x[162], x[2877], x[141], x[1400], x[2677]};
  always @(posedge clk) h0_r <= h0;
  wire [9:0] f = h0_r;
  reg [1:0] p0_0;
  always @(posedge clk) p0_0 <= f[0] + f[1];
  reg [1:0] cnt0;
  always @(posedge clk) cnt0 <= p0_0;
  reg [1:0] p1_0;
  always @(posedge clk) p1_0 <= f[2] + f[3];
  reg [1:0] cnt1;
  always @(posedge clk) cnt1 <= p1_0;
  reg [1:0] p2_0;
  always @(posedge clk) p2_0 <= f[4] + f[5];
  reg [1:0] cnt2;
  always @(posedge clk) cnt2 <= p2_0;
  reg [1:0] p3_0;
  always @(posedge clk) p3_0 <= f[6] + f[7];
  reg [1:0] cnt3;
  always @(posedge clk) cnt3 <= p3_0;
  reg [1:0] p4_0;
  always @(posedge clk) p4_0 <= f[8] + f[9];
  reg [1:0] cnt4;
  always @(posedge clk) cnt4 <= p4_0;
  reg [1:0] v0_0; reg [2:0] i0_0;
  always @(posedge clk) if (cnt0 >= cnt1) begin v0_0 <= cnt0; i0_0 <= 3'd0; end else begin v0_0 <= cnt1; i0_0 <= 3'd1; end
  reg [1:0] v0_1; reg [2:0] i0_1;
  always @(posedge clk) if (cnt2 >= cnt3) begin v0_1 <= cnt2; i0_1 <= 3'd2; end else begin v0_1 <= cnt3; i0_1 <= 3'd3; end
  reg [1:0] v0_2; reg [2:0] i0_2;
  always @(posedge clk) begin v0_2 <= cnt4; i0_2 <= 3'd4; end
  reg [1:0] v1_0; reg [2:0] i1_0;
  always @(posedge clk) if (v0_0 >= v0_1) begin v1_0 <= v0_0; i1_0 <= i0_0; end else begin v1_0 <= v0_1; i1_0 <= i0_1; end
  reg [1:0] v1_1; reg [2:0] i1_1;
  always @(posedge clk) begin v1_1 <= v0_2; i1_1 <= i0_2; end
  always @(posedge clk) y <= (v1_0 >= v1_1) ? i1_0 : i1_1;
endmodule