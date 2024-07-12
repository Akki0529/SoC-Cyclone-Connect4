module movement (RST, RedPixels, GrnPixels, L, R, D, CLOCK, column, turn);
	input logic RST;
	input logic CLOCK;
	input logic turn;
	input logic R,L,D;
	output logic [6:0] RedPixels; 
	output logic [6:0] GrnPixels;
	output logic [3:0] column;
	
	
//	always_ff @(posedge CLOCK) begin
//		if (RST) begin
//			RedPixels <= 7'b0;
//			GrnPixels <= 7'b0;
//		end else begin
//			if (turn) begin
//				GrnPixels <= 16'b1000000010000000;
//				RedPixels <= 16'b1000100010000000;
//				if (D)
//					RedPixels <= 16'b1000000010000000;
//					if (RedPixels == 16'b1100000010000000)
//						column <= 14;
//					else if (RedPixels == 16'b1010000010000000)
//						column <= 13;
//					else if (RedPixels == 16'b1001000010000000)
//						column <= 12;
//					else if (RedPixels == 16'b1000100010000000)
//						column <= 11;
//					else if (RedPixels == 16'b1000010010000000)
//						column <= 10;
//					else if (RedPixels == 16'b1000001010000000)
//						column <= 9;
//					else if (RedPixels == 16'b1000000110000000)
//						column <= 8;
//				else if(L && RedPixels != 16'b1100000010000000)
//					RedPixels <= (RedPixels << 1);
//				else if(L && RedPixels == 16'b1100000010000000)
//					RedPixels <= 16'b1100000010000000;
//				else if(R && RedPixels != 16'b1000000110000000)
//					RedPixels <= (RedPixels >> 1);
//				else if(R && RedPixels == 16'b1000000110000000)
//					RedPixels <= 16'b1000000110000000;
//				else
//					RedPixels <= RedPixels;
//			end else if (~turn) begin
//				RedPixels <= 16'b1000000010000000;
//				GrnPixels <= 16'b1000100010000000;
//				if (D)
//					GrnPixels <= 16'b1000000010000000;
//					if (GrnPixels == 16'b1100000010000000)
//						column <= 14;
//					else if (GrnPixels == 16'b1010000010000000)
//						column <= 13;
//					else if (GrnPixels == 16'b1001000010000000)
//						column <= 12;
//					else if (GrnPixels == 16'b1000100010000000)
//						column <= 11;
//					else if (GrnPixels == 16'b1000010010000000)
//						column <= 10;
//					else if (GrnPixels == 16'b1000001010000000)
//						column <= 9;
//					else if (GrnPixels == 16'b1000000110000000)
//						column <= 8;
//				else if(L && GrnPixels != 16'b1100000010000000)
//					GrnPixels <= (GrnPixels << 1);
//				else if(L && GrnPixels == 16'b1100000010000000)
//					GrnPixels <= 16'b1100000010000000;
//				else if(R && GrnPixels != 16'b1000000110000000)
//					GrnPixels <= (GrnPixels >> 1);
//				else if(R && GrnPixels == 16'b1000000110000000)
//					GrnPixels <= 16'b1000000110000000;
//				else
//					GrnPixels <= GrnPixels;
//			end
//		end
//	end
	
	always_ff @(posedge CLOCK) begin
		if (RST) begin
			RedPixels <= 7'b1000;
			GrnPixels <= 7'b0;
		end else begin // if not reset
			if (~turn) begin // if for red player or green player
//				GrnPixels <= 7'b0;
				if (RedPixels == 7'b0)
						RedPixels <= 7'b0001000;
				else if (D) begin // if button pushed down
					if (RedPixels == 7'b1000000) begin
						column <= 14;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0100000) begin 
						column <= 13;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0010000) begin 
						column <= 12;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0001000) begin 
						column <= 11;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0000100) begin 
						column <= 10;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0000010) begin 
						column <= 9;
						RedPixels <= 7'b0;
					end else if (RedPixels == 7'b0000001) begin 
						column <= 8;
						RedPixels <= 7'b0;
					end else
						column <= 15;
				end else if (~D) begin
//					if (RedPixels == 7'b0) begin
//						RedPixels <= 7'b0001000; 
//					end
					if(L && RedPixels != 7'b1000000) // if down not pushed down
						RedPixels <= (RedPixels << 1);
					else if(L && RedPixels == 7'b1000000)
						RedPixels <= 7'b1000000;
					else if(R && RedPixels != 7'b0000001)
						RedPixels <= (RedPixels >> 1);
					else if(R && RedPixels == 7'b0000001)
						RedPixels <= 7'b0000001;
					else
						RedPixels <= RedPixels;
				end
			end else if (turn) begin // if for red player or green player
//				RedPixels <= 7'b0;
				if (GrnPixels == 7'b0) begin
						GrnPixels <= 7'b0001000;
				end else if (D) begin // if button pushed down
					if (GrnPixels == 7'b1000000) begin
						column <= 14;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0100000) begin 
						column <= 13;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0010000) begin 
						column <= 12;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0001000) begin 
						column <= 11;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0000100) begin 
						column <= 10;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0000010) begin 
						column <= 9;
						GrnPixels <= 7'b0;
					end else if (GrnPixels == 7'b0000001) begin 
						column <= 8;
						GrnPixels <= 7'b0;
					end else
						column <= 15;
				end else if (~D) begin
//					if (GrnPixels == 7'b0) begin
//						GrnPixels <= 7'b0001000;
//					end
					if(L && GrnPixels != 7'b1000000) // if down not pushed down
						GrnPixels <= (GrnPixels << 1);
					else if(L && GrnPixels == 7'b1000000)
						GrnPixels <= 7'b1000000;
					else if(R && GrnPixels != 7'b0000001)
						GrnPixels <= (GrnPixels >> 1);
					else if(R && GrnPixels == 7'b0000001)
						GrnPixels <= 7'b0000001;
					else
						GrnPixels <= GrnPixels;
				end
			end
		end
	end


endmodule

module movement_testbench();
	logic RST;
	logic CLOCK;
	logic [6:0] RedPixels; // 16x16 array of red LEDs
	logic [6:0] GrnPixels; // 16x16 array of green LEDs
	logic R;
	logic L;
	logic D;
	logic [3:0] column;
	logic turn;
	
	movement dut (RST, RedPixels, GrnPixels, L, R, D, CLOCK, column, turn);
	
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=200;
	initial begin
		CLOCK <= 0;
		forever #(CLOCK_PERIOD/2) CLOCK <= ~CLOCK; // Forever toggle the clock
	end
	
	// Test the design.
	initial begin
		RST <= 1; @(posedge CLOCK); // Always reset FSMs at start
		RST <= 0; turn <= 0; D <= 0; @(posedge CLOCK);
		@(posedge CLOCK);
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0;repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 0; D <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		D <= 0; turn <= 1; repeat(5) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0;repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 0; D <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		D <= 0; turn <= 0; repeat(5) @(posedge CLOCK); // Test case 1: input is 0
		@(posedge CLOCK);
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1;repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 1; L <= 0; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		R <= 0; L <= 0; D <= 1; repeat(1) @(posedge CLOCK); // Test case 1: input is 0
		D <= 0; turn <= 1; repeat(5) @(posedge CLOCK); // Test case 1: input is 0
		@(posedge CLOCK);
		$stop; // End the simulation.
	end
endmodule