module dwn_top(input clk, input [3199:0] x, output reg [2:0] y);
  wire [9:0] h0;
  reg  [9:0] h0_r;
  assign h0[0] = 64'b0100100011001100110010001001011111010000011011000111010001111100 >> {x[675], x[2824], x[5], x[3103], x[3146], x[684]};
  assign h0[1] = 64'b1000100001100110111111111111110100100000101001001101100010000100 >> {x[3113], x[681], x[3053], x[1947], x[3140], x[3172]};
  assign h0[2] = 64'b0000000000000000010001001100001001010001000100000001010000000000 >> {x[2921], x[413], x[2881], x[669], x[3144], x[719]};
  assign h0[3] = 64'b0101000100000000010000000111000001010101000010000100000001010110 >> {x[1018], x[2922], x[722], x[2878], x[718], x[720]};
  assign h0[4] = 64'b0011011100110010001110110000000001000100000000000000000000000000 >> {x[751], x[2811], x[561], x[3034], x[2998], x[556]};
  assign h0[5] = 64'b1111101010000000111000000000001010101000000000000010101000000010 >> {x[752], x[559], x[753], x[1], x[0], x[560]};
  assign h0[6] = 64'b0000100000001000000000001000010100000000100100000001000100010101 >> {x[190], x[3152], x[2675], x[2501], x[2546], x[754]};
  assign h0[7] = 64'b0000000000000000000100011011010111001101000000001110000000000000 >> {x[2955], x[6], x[2919], x[32], x[2919], x[1402]};
  assign h0[8] = 64'b0010110001111111000001010111001101000011011101100000100000100010 >> {x[120], x[156], x[2876], x[2879], x[2872], x[43]};
  assign h0[9] = 64'b0001111001001101000100110011110100001100010010100000000100011000 >> {x[144], x[2661], x[2875], x[2880], x[74], x[448]};
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