module winnerConnect4(RST, CLOCK, RedPixels, GrnPixels, HEXW);
	input logic RST;
	input logic CLOCK;
	input logic [15:0][15:0] RedPixels;
	input logic [15:0][15:0] GrnPixels;
	output logic [6:0] HEXW;
//	logic [1:0] gameOverRow;
//	logic [1:0] gameOverCol;
//	logic [1:0] gameOverUR;
//	logic [1:0] gameOverDR;
	logic [1:0] gameOver;

	
	always_comb begin
	if (RedPixels[14][14] == 1 && RedPixels [14][13] == 1 && RedPixels[14][12] == 1 && RedPixels[14][11] == 1 || 
		RedPixels[14][13] == 1 && RedPixels [14][12] == 1 && RedPixels[14][11] == 1 && RedPixels[14][10] == 1 ||
		RedPixels[14][12] == 1 && RedPixels [14][11] == 1 && RedPixels[14][10] == 1 && RedPixels[14][9] == 1 || 
		RedPixels[14][11] == 1 && RedPixels [14][10] == 1 && RedPixels[14][9] == 1 && RedPixels[14][8] == 1 ||
		RedPixels[13][14] == 1 && RedPixels [13][13] == 1 && RedPixels[13][12] == 1 && RedPixels[13][11] == 1 || 
		RedPixels[13][13] == 1 && RedPixels [13][12] == 1 && RedPixels[13][11] == 1 && RedPixels[13][10] == 1 ||
		RedPixels[13][12] == 1 && RedPixels [13][11] == 1 && RedPixels[13][10] == 1 && RedPixels[13][9] == 1 || 
		RedPixels[13][11] == 1 && RedPixels [13][10] == 1 && RedPixels[13][9] == 1 && RedPixels[13][8] == 1 ||
		RedPixels[12][14] == 1 && RedPixels [12][13] == 1 && RedPixels[12][12] == 1 && RedPixels[12][11] == 1 || 
		RedPixels[12][13] == 1 && RedPixels [12][12] == 1 && RedPixels[12][11] == 1 && RedPixels[12][10] == 1 ||
		RedPixels[12][12] == 1 && RedPixels [12][11] == 1 && RedPixels[12][10] == 1 && RedPixels[12][9] == 1 || 
		RedPixels[12][11] == 1 && RedPixels [12][10] == 1 && RedPixels[12][9] == 1 && RedPixels[12][8] == 1 ||
		RedPixels[11][14] == 1 && RedPixels [11][13] == 1 && RedPixels[11][12] == 1 && RedPixels[11][11] == 1 || 
		RedPixels[11][13] == 1 && RedPixels [11][12] == 1 && RedPixels[11][11] == 1 && RedPixels[11][10] == 1 ||
		RedPixels[11][12] == 1 && RedPixels [11][11] == 1 && RedPixels[11][10] == 1 && RedPixels[11][9] == 1 || 
		RedPixels[11][11] == 1 && RedPixels [11][10] == 1 && RedPixels[11][9] == 1 && RedPixels[11][8] == 1 ||
		RedPixels[10][14] == 1 && RedPixels [10][13] == 1 && RedPixels[10][12] == 1 && RedPixels[10][11] == 1 || 
		RedPixels[10][13] == 1 && RedPixels [10][12] == 1 && RedPixels[10][11] == 1 && RedPixels[10][10] == 1 ||
		RedPixels[10][12] == 1 && RedPixels [10][11] == 1 && RedPixels[10][10] == 1 && RedPixels[10][9] == 1 || 
		RedPixels[10][11] == 1 && RedPixels [10][10] == 1 && RedPixels[10][9] == 1 && RedPixels[10][8] == 1 ||
		RedPixels[9][14] == 1 && RedPixels [9][13] == 1 && RedPixels[9][12] == 1 && RedPixels[9][11] == 1 || 
		RedPixels[9][13] == 1 && RedPixels [9][12] == 1 && RedPixels[9][11] == 1 && RedPixels[9][10] == 1 ||
		RedPixels[9][12] == 1 && RedPixels [9][11] == 1 && RedPixels[9][10] == 1 && RedPixels[9][9] == 1 || 
		RedPixels[9][11] == 1 && RedPixels [9][10] == 1 && RedPixels[9][9] == 1 && RedPixels[9][8] == 1 ||
		RedPixels[8][14] == 1 && RedPixels [8][13] == 1 && RedPixels[8][12] == 1 && RedPixels[8][11] == 1 || 
		RedPixels[8][13] == 1 && RedPixels [8][12] == 1 && RedPixels[8][11] == 1 && RedPixels[8][10] == 1 ||
		RedPixels[8][12] == 1 && RedPixels [8][11] == 1 && RedPixels[8][10] == 1 && RedPixels[8][9] == 1 || 
		RedPixels[8][11] == 1 && RedPixels [8][10] == 1 && RedPixels[8][9] == 1 && RedPixels[8][8] == 1 ||
		RedPixels[14][14] == 1 && RedPixels [13][14] == 1 && RedPixels[12][14] == 1 && RedPixels[11][14] == 1 || 
		RedPixels[13][14] == 1 && RedPixels [12][14] == 1 && RedPixels[11][14] == 1 && RedPixels[11][14] == 1 || 
		RedPixels[12][14] == 1 && RedPixels [11][14] == 1 && RedPixels[10][14] == 1 && RedPixels[9][14] == 1 || 
		RedPixels[11][14] == 1 && RedPixels [10][14] == 1 && RedPixels[9][14] == 1 && RedPixels[8][14] == 1 ||
		RedPixels[14][13] == 1 && RedPixels [13][13] == 1 && RedPixels[12][13] == 1 && RedPixels[11][13] == 1 || 
		RedPixels[13][13] == 1 && RedPixels [12][13] == 1 && RedPixels[11][13] == 1 && RedPixels[11][13] == 1 || 
		RedPixels[12][13] == 1 && RedPixels [11][13] == 1 && RedPixels[10][13] == 1 && RedPixels[9][13] == 1 || 
		RedPixels[11][13] == 1 && RedPixels [10][13] == 1 && RedPixels[9][13] == 1 && RedPixels[8][13] == 1 || 
		RedPixels[14][12] == 1 && RedPixels [13][12] == 1 && RedPixels[12][12] == 1 && RedPixels[11][12] == 1 || 
		RedPixels[13][12] == 1 && RedPixels [12][12] == 1 && RedPixels[11][12] == 1 && RedPixels[11][12] == 1 || 
		RedPixels[12][12] == 1 && RedPixels [11][12] == 1 && RedPixels[10][12] == 1 && RedPixels[9][12] == 1 || 
		RedPixels[11][12] == 1 && RedPixels [10][12] == 1 && RedPixels[9][12] == 1 && RedPixels[8][12] == 1 ||
		RedPixels[14][11] == 1 && RedPixels [13][11] == 1 && RedPixels[12][11] == 1 && RedPixels[11][11] == 1 || 
		RedPixels[13][11] == 1 && RedPixels [12][11] == 1 && RedPixels[11][11] == 1 && RedPixels[11][11] == 1 || 
		RedPixels[12][11] == 1 && RedPixels [11][11] == 1 && RedPixels[10][11] == 1 && RedPixels[9][11] == 1 || 
		RedPixels[11][11] == 1 && RedPixels [10][11] == 1 && RedPixels[9][11] == 1 && RedPixels[8][11] == 1 ||
		RedPixels[14][10] == 1 && RedPixels [13][10] == 1 && RedPixels[12][10] == 1 && RedPixels[11][10] == 1 || 
		RedPixels[13][10] == 1 && RedPixels [12][10] == 1 && RedPixels[11][10] == 1 && RedPixels[11][10] == 1 || 
		RedPixels[12][10] == 1 && RedPixels [11][10] == 1 && RedPixels[10][10] == 1 && RedPixels[9][10] == 1 || 
		RedPixels[11][10] == 1 && RedPixels [10][10] == 1 && RedPixels[9][10] == 1 && RedPixels[8][10] == 1 ||
		RedPixels[14][9] == 1 && RedPixels [13][9] == 1 && RedPixels[12][9] == 1 && RedPixels[11][9] == 1 || 
		RedPixels[13][9] == 1 && RedPixels [12][9] == 1 && RedPixels[11][9] == 1 && RedPixels[11][9] == 1 || 
		RedPixels[12][9] == 1 && RedPixels [11][9] == 1 && RedPixels[10][9] == 1 && RedPixels[9][9] == 1 || 
		RedPixels[11][9] == 1 && RedPixels [10][9] == 1 && RedPixels[9][9] == 1 && RedPixels[8][9] == 1 ||
		RedPixels[14][8] == 1 && RedPixels [13][8] == 1 && RedPixels[12][8] == 1 && RedPixels[11][8] == 1 || 
		RedPixels[13][8] == 1 && RedPixels [12][8] == 1 && RedPixels[11][8] == 1 && RedPixels[11][8] == 1 || 
		RedPixels[12][8] == 1 && RedPixels [11][8] == 1 && RedPixels[10][8] == 1 && RedPixels[9][8] == 1 || 
		RedPixels[11][8] == 1 && RedPixels [10][8] == 1 && RedPixels[9][8] == 1 && RedPixels[8][8] == 1 ||
		RedPixels[8][14] == 1 && RedPixels [9][13] == 1 && RedPixels[10][12] == 1 && RedPixels[11][11] == 1 || 
		RedPixels[8][13] == 1 && RedPixels [9][12] == 1 && RedPixels[10][11] == 1 && RedPixels[11][10] == 1 || 
		RedPixels[8][12] == 1 && RedPixels [9][11] == 1 && RedPixels[10][10] == 1 && RedPixels[11][9] == 1 || 
		RedPixels[8][11] == 1 && RedPixels [9][10] == 1 && RedPixels[10][9] == 1 && RedPixels[11][8] == 1 || 
		RedPixels[9][14] == 1 && RedPixels [10][13] == 1 && RedPixels[11][12] == 1 && RedPixels[12][11] == 1 || 
		RedPixels[9][13] == 1 && RedPixels [10][12] == 1 && RedPixels[11][11] == 1 && RedPixels[12][10] == 1 || 
		RedPixels[9][12] == 1 && RedPixels [10][11] == 1 && RedPixels[11][10] == 1 && RedPixels[12][9] == 1 || 
		RedPixels[9][11] == 1 && RedPixels [10][10] == 1 && RedPixels[11][9] == 1 && RedPixels[12][8] == 1 || 
		RedPixels[10][14] == 1 && RedPixels [11][13] == 1 && RedPixels[12][12] == 1 && RedPixels[13][11] == 1 || 
		RedPixels[10][13] == 1 && RedPixels [11][12] == 1 && RedPixels[12][11] == 1 && RedPixels[13][10] == 1 || 
		RedPixels[10][12] == 1 && RedPixels [11][11] == 1 && RedPixels[12][10] == 1 && RedPixels[13][9] == 1 || 
		RedPixels[10][11] == 1 && RedPixels [11][10] == 1 && RedPixels[12][9] == 1 && RedPixels[13][8] == 1 || 
		RedPixels[11][14] == 1 && RedPixels [12][13] == 1 && RedPixels[13][12] == 1 && RedPixels[14][11] == 1 || 
		RedPixels[11][13] == 1 && RedPixels [12][12] == 1 && RedPixels[13][11] == 1 && RedPixels[14][10] == 1 || 
		RedPixels[11][12] == 1 && RedPixels [12][11] == 1 && RedPixels[13][10] == 1 && RedPixels[14][9] == 1 || 
		RedPixels[11][11] == 1 && RedPixels [12][10] == 1 && RedPixels[13][9] == 1 && RedPixels[14][8] == 1 || 
		RedPixels[14][14] && RedPixels[13][13] && RedPixels[12][12] && RedPixels[11][11] ||
		RedPixels[14][13] && RedPixels[13][12] && RedPixels[12][11] && RedPixels[11][10] ||
		RedPixels[14][12] && RedPixels[13][11] && RedPixels[12][10] && RedPixels[11][09] ||
		RedPixels[14][11] && RedPixels[13][10] && RedPixels[12][09] && RedPixels[11][08] ||
		RedPixels[13][14] && RedPixels[12][13] && RedPixels[11][12] && RedPixels[10][11] ||
		RedPixels[13][13] && RedPixels[12][12] && RedPixels[11][11] && RedPixels[10][10] ||
		RedPixels[13][12] && RedPixels[12][11] && RedPixels[11][10] && RedPixels[10][09] ||
		RedPixels[13][11] && RedPixels[12][10] && RedPixels[11][09] && RedPixels[10][08] ||
		RedPixels[12][14] && RedPixels[11][13] && RedPixels[10][12] && RedPixels[09][11] ||
		RedPixels[12][13] && RedPixels[11][12] && RedPixels[10][11] && RedPixels[09][10] ||
		RedPixels[12][12] && RedPixels[11][11] && RedPixels[10][10] && RedPixels[09][09] ||
		RedPixels[12][11] && RedPixels[11][10] && RedPixels[10][09] && RedPixels[09][08] ||
		RedPixels[11][14] && RedPixels[10][13] && RedPixels[09][12] && RedPixels[08][11] ||
		RedPixels[11][13] && RedPixels[10][12] && RedPixels[09][11] && RedPixels[08][10] ||
		RedPixels[11][12] && RedPixels[10][11] && RedPixels[09][10] && RedPixels[08][09] ||
		RedPixels[11][11] && RedPixels[10][10] && RedPixels[09][09] && RedPixels[08][08]) begin
			gameOver = 2'b10;
		end else if (GrnPixels[14][14] == 1 && GrnPixels [14][13] == 1 && GrnPixels[14][12] == 1 && GrnPixels[14][11] == 1 || 
		GrnPixels[14][13] == 1 && GrnPixels [14][12] == 1 && GrnPixels[14][11] == 1 && GrnPixels[14][10] == 1 ||
		GrnPixels[14][12] == 1 && GrnPixels [14][11] == 1 && GrnPixels[14][10] == 1 && GrnPixels[14][9] == 1 || 
		GrnPixels[14][11] == 1 && GrnPixels [14][10] == 1 && GrnPixels[14][9] == 1 && GrnPixels[14][8] == 1 ||
		GrnPixels[13][14] == 1 && GrnPixels [13][13] == 1 && GrnPixels[13][12] == 1 && GrnPixels[13][11] == 1 || 
		GrnPixels[13][13] == 1 && GrnPixels [13][12] == 1 && GrnPixels[13][11] == 1 && GrnPixels[13][10] == 1 ||
		GrnPixels[13][12] == 1 && GrnPixels [13][11] == 1 && GrnPixels[13][10] == 1 && GrnPixels[13][9] == 1 || 
		GrnPixels[13][11] == 1 && GrnPixels [13][10] == 1 && GrnPixels[13][9] == 1 && GrnPixels[13][8] == 1 ||
		GrnPixels[12][14] == 1 && GrnPixels [12][13] == 1 && GrnPixels[12][12] == 1 && GrnPixels[12][11] == 1 || 
		GrnPixels[12][13] == 1 && GrnPixels [12][12] == 1 && GrnPixels[12][11] == 1 && GrnPixels[12][10] == 1 ||
		GrnPixels[12][12] == 1 && GrnPixels [12][11] == 1 && GrnPixels[12][10] == 1 && GrnPixels[12][9] == 1 || 
		GrnPixels[12][11] == 1 && GrnPixels [12][10] == 1 && GrnPixels[12][9] == 1 && GrnPixels[12][8] == 1 ||
		GrnPixels[11][14] == 1 && GrnPixels [11][13] == 1 && GrnPixels[11][12] == 1 && GrnPixels[11][11] == 1 || 
		GrnPixels[11][13] == 1 && GrnPixels [11][12] == 1 && GrnPixels[11][11] == 1 && GrnPixels[11][10] == 1 ||
		GrnPixels[11][12] == 1 && GrnPixels [11][11] == 1 && GrnPixels[11][10] == 1 && GrnPixels[11][9] == 1 || 
		GrnPixels[11][11] == 1 && GrnPixels [11][10] == 1 && GrnPixels[11][9] == 1 && GrnPixels[11][8] == 1 ||
		GrnPixels[10][14] == 1 && GrnPixels [10][13] == 1 && GrnPixels[10][12] == 1 && GrnPixels[10][11] == 1 || 
		GrnPixels[10][13] == 1 && GrnPixels [10][12] == 1 && GrnPixels[10][11] == 1 && GrnPixels[10][10] == 1 ||
		GrnPixels[10][12] == 1 && GrnPixels [10][11] == 1 && GrnPixels[10][10] == 1 && GrnPixels[10][9] == 1 || 
		GrnPixels[10][11] == 1 && GrnPixels [10][10] == 1 && GrnPixels[10][9] == 1 && GrnPixels[10][8] == 1 ||
		GrnPixels[9][14] == 1 && GrnPixels [9][13] == 1 && GrnPixels[9][12] == 1 && GrnPixels[9][11] == 1 || 
		GrnPixels[9][13] == 1 && GrnPixels [9][12] == 1 && GrnPixels[9][11] == 1 && GrnPixels[9][10] == 1 ||
		GrnPixels[9][12] == 1 && GrnPixels [9][11] == 1 && GrnPixels[9][10] == 1 && GrnPixels[9][9] == 1 || 
		GrnPixels[9][11] == 1 && GrnPixels [9][10] == 1 && GrnPixels[9][9] == 1 && GrnPixels[9][8] == 1 ||
		GrnPixels[8][14] == 1 && GrnPixels [8][13] == 1 && GrnPixels[8][12] == 1 && GrnPixels[8][11] == 1 || 
		GrnPixels[8][13] == 1 && GrnPixels [8][12] == 1 && GrnPixels[8][11] == 1 && GrnPixels[8][10] == 1 ||
		GrnPixels[8][12] == 1 && GrnPixels [8][11] == 1 && GrnPixels[8][10] == 1 && GrnPixels[8][9] == 1 || 
		GrnPixels[8][11] == 1 && GrnPixels [8][10] == 1 && GrnPixels[8][9] == 1 && GrnPixels[8][8] == 1 ||
		GrnPixels[14][14] == 1 && GrnPixels [13][14] == 1 && GrnPixels[12][14] == 1 && GrnPixels[11][14] == 1 || 
		GrnPixels[13][14] == 1 && GrnPixels [12][14] == 1 && GrnPixels[11][14] == 1 && GrnPixels[11][14] == 1 || 
		GrnPixels[12][14] == 1 && GrnPixels [11][14] == 1 && GrnPixels[10][14] == 1 && GrnPixels[9][14] == 1 || 
		GrnPixels[11][14] == 1 && GrnPixels [10][14] == 1 && GrnPixels[9][14] == 1 && GrnPixels[8][14] == 1 ||
		GrnPixels[14][13] == 1 && GrnPixels [13][13] == 1 && GrnPixels[12][13] == 1 && GrnPixels[11][13] == 1 || 
		GrnPixels[13][13] == 1 && GrnPixels [12][13] == 1 && GrnPixels[11][13] == 1 && GrnPixels[11][13] == 1 || 
		GrnPixels[12][13] == 1 && GrnPixels [11][13] == 1 && GrnPixels[10][13] == 1 && GrnPixels[9][13] == 1 || 
		GrnPixels[11][13] == 1 && GrnPixels [10][13] == 1 && GrnPixels[9][13] == 1 && GrnPixels[8][13] == 1 || 
		GrnPixels[14][12] == 1 && GrnPixels [13][12] == 1 && GrnPixels[12][12] == 1 && GrnPixels[11][12] == 1 || 
		GrnPixels[13][12] == 1 && GrnPixels [12][12] == 1 && GrnPixels[11][12] == 1 && GrnPixels[11][12] == 1 || 
		GrnPixels[12][12] == 1 && GrnPixels [11][12] == 1 && GrnPixels[10][12] == 1 && GrnPixels[9][12] == 1 || 
		GrnPixels[11][12] == 1 && GrnPixels [10][12] == 1 && GrnPixels[9][12] == 1 && GrnPixels[8][12] == 1 ||
		GrnPixels[14][11] == 1 && GrnPixels [13][11] == 1 && GrnPixels[12][11] == 1 && GrnPixels[11][11] == 1 || 
		GrnPixels[13][11] == 1 && GrnPixels [12][11] == 1 && GrnPixels[11][11] == 1 && GrnPixels[11][11] == 1 || 
		GrnPixels[12][11] == 1 && GrnPixels [11][11] == 1 && GrnPixels[10][11] == 1 && GrnPixels[9][11] == 1 || 
		GrnPixels[11][11] == 1 && GrnPixels [10][11] == 1 && GrnPixels[9][11] == 1 && GrnPixels[8][11] == 1 ||
		GrnPixels[14][10] == 1 && GrnPixels [13][10] == 1 && GrnPixels[12][10] == 1 && GrnPixels[11][10] == 1 || 
		GrnPixels[13][10] == 1 && GrnPixels [12][10] == 1 && GrnPixels[11][10] == 1 && GrnPixels[11][10] == 1 || 
		GrnPixels[12][10] == 1 && GrnPixels [11][10] == 1 && GrnPixels[10][10] == 1 && GrnPixels[9][10] == 1 || 
		GrnPixels[11][10] == 1 && GrnPixels [10][10] == 1 && GrnPixels[9][10] == 1 && GrnPixels[8][10] == 1 ||
		GrnPixels[14][9] == 1 && GrnPixels [13][9] == 1 && GrnPixels[12][9] == 1 && GrnPixels[11][9] == 1 || 
		GrnPixels[13][9] == 1 && GrnPixels [12][9] == 1 && GrnPixels[11][9] == 1 && GrnPixels[11][9] == 1 || 
		GrnPixels[12][9] == 1 && GrnPixels [11][9] == 1 && GrnPixels[10][9] == 1 && GrnPixels[9][9] == 1 || 
		GrnPixels[11][9] == 1 && GrnPixels [10][9] == 1 && GrnPixels[9][9] == 1 && GrnPixels[8][9] == 1 ||
		GrnPixels[14][8] == 1 && GrnPixels [13][8] == 1 && GrnPixels[12][8] == 1 && GrnPixels[11][8] == 1 || 
		GrnPixels[13][8] == 1 && GrnPixels [12][8] == 1 && GrnPixels[11][8] == 1 && GrnPixels[11][8] == 1 || 
		GrnPixels[12][8] == 1 && GrnPixels [11][8] == 1 && GrnPixels[10][8] == 1 && GrnPixels[9][8] == 1 || 
		GrnPixels[11][8] == 1 && GrnPixels [10][8] == 1 && GrnPixels[9][8] == 1 && GrnPixels[8][8] == 1 ||
		GrnPixels[8][14] == 1 && GrnPixels [9][13] == 1 && GrnPixels[10][12] == 1 && GrnPixels[11][11] == 1 || 
		GrnPixels[8][13] == 1 && GrnPixels [9][12] == 1 && GrnPixels[10][11] == 1 && GrnPixels[11][10] == 1 || 
		GrnPixels[8][12] == 1 && GrnPixels [9][11] == 1 && GrnPixels[10][10] == 1 && GrnPixels[11][9] == 1 || 
		GrnPixels[8][11] == 1 && GrnPixels [9][10] == 1 && GrnPixels[10][9] == 1 && GrnPixels[11][8] == 1 || 
		GrnPixels[9][14] == 1 && GrnPixels [10][13] == 1 && GrnPixels[11][12] == 1 && GrnPixels[12][11] == 1 || 
		GrnPixels[9][13] == 1 && GrnPixels [10][12] == 1 && GrnPixels[11][11] == 1 && GrnPixels[12][10] == 1 || 
		GrnPixels[9][12] == 1 && GrnPixels [10][11] == 1 && GrnPixels[11][10] == 1 && GrnPixels[12][9] == 1 || 
		GrnPixels[9][11] == 1 && GrnPixels [10][10] == 1 && GrnPixels[11][9] == 1 && GrnPixels[12][8] == 1 || 
		GrnPixels[10][14] == 1 && GrnPixels [11][13] == 1 && GrnPixels[12][12] == 1 && GrnPixels[13][11] == 1 || 
		GrnPixels[10][13] == 1 && GrnPixels [11][12] == 1 && GrnPixels[12][11] == 1 && GrnPixels[13][10] == 1 || 
		GrnPixels[10][12] == 1 && GrnPixels [11][11] == 1 && GrnPixels[12][10] == 1 && GrnPixels[13][9] == 1 || 
		GrnPixels[10][11] == 1 && GrnPixels [11][10] == 1 && GrnPixels[12][9] == 1 && GrnPixels[13][8] == 1 || 
		GrnPixels[11][14] == 1 && GrnPixels [12][13] == 1 && GrnPixels[13][12] == 1 && GrnPixels[14][11] == 1 || 
		GrnPixels[11][13] == 1 && GrnPixels [12][12] == 1 && GrnPixels[13][11] == 1 && GrnPixels[14][10] == 1 || 
		GrnPixels[11][12] == 1 && GrnPixels [12][11] == 1 && GrnPixels[13][10] == 1 && GrnPixels[14][9] == 1 || 
		GrnPixels[11][11] == 1 && GrnPixels [12][10] == 1 && GrnPixels[13][9] == 1 && GrnPixels[14][8] == 1 || 
		GrnPixels[14][14] && GrnPixels[13][13] && GrnPixels[12][12] && GrnPixels[11][11] ||
		GrnPixels[14][13] && GrnPixels[13][12] && GrnPixels[12][11] && GrnPixels[11][10] ||
		GrnPixels[14][12] && GrnPixels[13][11] && GrnPixels[12][10] && GrnPixels[11][09] ||
		GrnPixels[14][11] && GrnPixels[13][10] && GrnPixels[12][09] && GrnPixels[11][08] ||
		GrnPixels[13][14] && GrnPixels[12][13] && GrnPixels[11][12] && GrnPixels[10][11] ||
		GrnPixels[13][13] && GrnPixels[12][12] && GrnPixels[11][11] && GrnPixels[10][10] ||
		GrnPixels[13][12] && GrnPixels[12][11] && GrnPixels[11][10] && GrnPixels[10][09] ||
		GrnPixels[13][11] && GrnPixels[12][10] && GrnPixels[11][09] && GrnPixels[10][08] ||
		GrnPixels[12][14] && GrnPixels[11][13] && GrnPixels[10][12] && GrnPixels[09][11] ||
		GrnPixels[12][13] && GrnPixels[11][12] && GrnPixels[10][11] && GrnPixels[09][10] ||
		GrnPixels[12][12] && GrnPixels[11][11] && GrnPixels[10][10] && GrnPixels[09][09] ||
		GrnPixels[12][11] && GrnPixels[11][10] && GrnPixels[10][09] && GrnPixels[09][08] ||
		GrnPixels[11][14] && GrnPixels[10][13] && GrnPixels[09][12] && GrnPixels[08][11] ||
		GrnPixels[11][13] && GrnPixels[10][12] && GrnPixels[09][11] && GrnPixels[08][10] ||
		GrnPixels[11][12] && GrnPixels[10][11] && GrnPixels[09][10] && GrnPixels[08][09] ||
		GrnPixels[11][11] && GrnPixels[10][10] && GrnPixels[09][09] && GrnPixels[08][08]) begin
			gameOver = 2'b01;
		end
		else
			gameOver = 2'b00;
	 end
//	always_comb begin
//		for(int w = 14; w > 7; w = w-1) begin
//			for(int l = 14; l > 10; l = l-1) begin
//				if(RedPixels[w][l] && RedPixels[w][l-1] && RedPixels[w][l-2] && RedPixels[w][l-3]) 
//					gameOverRow = 2'b10;
//				else if(GrnPixels[w][l] && GrnPixels[w][l-1] && GrnPixels[w][l-2] && GrnPixels[w][l-3])
//					gameOverRow = 2'b01;
//				else
//					gameOverRow = 2'b0;
//			end
//		end
//		
//		for(int x = 14; x > 10; x = x-1) begin
//			for(int y = 14; y > 7; y = y-1) begin
//				if(RedPixels[x][y] && RedPixels[x-1][y] && RedPixels[x-2][y] && RedPixels[x-3][y])
//					gameOverCol = 2'b10;
//				else if(GrnPixels[x][y] && GrnPixels[x-1][y] && GrnPixels[x-2][y] && GrnPixels[x-3][y])
//					gameOverCol = 2'b01;
//				else
//					gameOverCol = 2'b0;
//			end
//		end
//		
//		for(int o = 14; o > 10; o = o-1) begin
//			for(int p = 14; p > 10; p = p-1) begin
//			// up right
//				if(RedPixels[o][p] && RedPixels[o-1][p-1] && RedPixels[o-2][p-2] && RedPixels[o-3][p-3])
//					gameOverUR = 2'b10;
//				else if(GrnPixels[o][p] && GrnPixels[o-1][p-1] && GrnPixels[o-2][p-2] && GrnPixels[o-3][p-3])
//					gameOverUR = 2'b01;
//				else
//					gameOverUR = 2'b00;
//			end
//		end
//				
//		for(int b = 11; b > 8; b = b-1) begin
//			for(int bj = 14; bj > 10; bj = bj-1) begin
//				//diagonals down right
//				if(RedPixels[b][bj] && RedPixels[b+1][bj-1] && RedPixels[b+2][bj-2] && RedPixels[b+3][bj-3])
//					gameOverDR = 2'b10;
//				else if(GrnPixels[b][bj] && GrnPixels[b+1][bj-1] && GrnPixels[b+2][bj-2] && GrnPixels[b+3][bj-3])
//					gameOverDR = 2'b01;				
//				else
//					gameOverDR = 2'b00;
//			end
//		end
//		
//		if(gameOverRow == 2'b10 || gameOverCol == 2'b10 || gameOverUR == 2'b10 || gameOverDR == 2'b10) // If player 1 wins displays 1
//			HEXW = 7'b0000110;
//		else if(gameOverRow == 2'b01 || gameOverCol == 2'b01 || gameOverUR == 2'b01 || gameOverDR == 2'b01) // If player 2 wins displays 2
//			HEXW = 7'b1011011;
//		else
//			HEXW = 7'b1111111;
//			//gameOver = 2'b00; // undefined because neither player wins	
//	end
	
	
	
	 
	always_ff @(posedge CLOCK) begin
		if(RST)
			HEXW = 7'b1111111;
		else begin
			if(gameOver == 2'b10) // If player 1 wins displays 1
				HEXW = 7'b1111001;
			else if(gameOver == 2'b01) // If player 2 wins displays 2
				HEXW = 7'b0100100;
			else
				HEXW = 7'b1111111;
				//gameOver = 2'b00; // undefined because neither player wins
		end
	end
	 
endmodule

module winnerConnect4_testbench();
	logic RST;
	logic CLOCK;
	logic [15:0][15:0] RedPixels;
	logic [15:0][15:0] GrnPixels;
	logic [6:0] HEXW;
	logic [1:0] gameOver;
	
	winnerConnect4 dut (RST, CLOCK, RedPixels, GrnPixels, HEXW);
	
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=200;
	initial begin
		CLOCK <= 0;
		forever #(CLOCK_PERIOD/2) CLOCK <= ~CLOCK; // Forever toggle the clock
	end
	
	// Test the design.
	initial begin
							repeat(1) @(posedge CLOCK);
		RST <= 1; 		repeat(1) @(posedge CLOCK); // Always reset FSMs at start
		RST <= 0; 		repeat(1) @(posedge CLOCK);
							repeat(5) @(posedge CLOCK);
		RedPixels <= '0; GrnPixels <= '0; repeat(1) @(posedge CLOCK);
		RedPixels[14][14] <= 1; RedPixels[13][14] <= 1;  RedPixels[12][14] <= 1; RedPixels[11][14] <= 1; repeat(1) @(posedge CLOCK);
							repeat(5) @(posedge CLOCK);
		RedPixels[14][12] <= 1; RedPixels[14][11] <= 1;  RedPixels[14][10] <= 1; RedPixels[14][9] <= 1; repeat(1) @(posedge CLOCK);
		repeat(5) @(posedge CLOCK);
		
		$stop; // End the simulation.
	end
endmodule