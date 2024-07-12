module falling (CLOCK, RST, RedPixelsIn, GrnPixelsIn, RedPixelsOut, GrnPixelsOut, D, column, turn);
	input logic [15:0][15:0] RedPixelsIn;
	input logic [15:0][15:0] GrnPixelsIn;
	input logic [3:0] column;
	input logic CLOCK, RST;
	input logic D;
	output logic [15:0][15:0] RedPixelsOut;
	output logic [15:0][15:0] GrnPixelsOut;
	output logic turn;
	logic [7:0] count;
	logic shift;

	enum logic [3:0] {row0 = 4'b0, row8 = 4'b1000, row9, row10, row11, row12, row13, row14} ps,ns;
	always_comb begin
		case(ps)
			row8:		if (RedPixelsIn[9][column] || GrnPixelsIn[9][column])		ns = row8;
						else																		ns = row9;
			row9:		if (RedPixelsIn[10][column] || GrnPixelsIn[10][column])	ns = row9;
						else																		ns = row10;
			row10:	if (RedPixelsIn[11][column] || GrnPixelsIn[11][column])	ns = row10;
						else																		ns = row11;
			row11:	if (RedPixelsIn[12][column] || GrnPixelsIn[12][column])	ns = row11;
						else																		ns = row12;
			row12:	if (RedPixelsIn[13][column] || GrnPixelsIn[13][column])	ns = row12;
						else																		ns = row13;
			row13:	if (RedPixelsIn[14][column] || GrnPixelsIn[14][column])	ns = row13;
						else																		ns = row14;
			row14:																				ns = row14;
			row0:																					ns = row0;
		endcase
	end

	always_ff @(posedge CLOCK) begin
		if (RST) begin
			count <= 8'b0;
			shift <= 0;
		end else if (count == 8'b11111111) begin
			count <= 0;
			shift <= 1;
		end else begin
			count <= count +1;
			shift <= 0;
		end
	end
	
	
	always_ff @(posedge CLOCK) begin
		if (RST) begin
			GrnPixelsOut <= '0;
			RedPixelsOut <= '0;
			ps <= row0;
			turn <= 0;
		end else begin
			if	(~turn) begin
				GrnPixelsOut[ps][column] <= 1;
				GrnPixelsOut[ps-1][column] <= 0;
			end else begin
				RedPixelsOut[ps][column] <= 1;
				RedPixelsOut[ps-1][column] <= 0;
			end
			if (D) begin
				ps <= row8;
				turn <= ~turn;
			end else begin
				if (shift)
				ps <= ns;
				else
				ps <= ps;
			end
		end
	end
		
endmodule

module falling_testbench();
	logic [15:0][15:0] RedPixelsIn;
	logic [15:0][15:0] GrnPixelsIn;
	logic [3:0] column;
	logic CLOCK;
	logic RST;
	logic D;
	logic [15:0][15:0] RedPixelsOut;
	logic [15:0][15:0] GrnPixelsOut;
	logic turn;
	
	falling dut (CLOCK, RST, RedPixelsIn, GrnPixelsIn, RedPixelsOut, GrnPixelsOut, D, column, turn);
	
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
							repeat(5) @(posedge CLOCK)
		column <= 10; RedPixelsIn <= '0; GrnPixelsIn <= '0; D <= 1;	repeat(1) @(posedge CLOCK);
		D <= 0;			repeat(3) @(posedge CLOCK); // Test case 1: input is 0
		column <= 10; RedPixelsIn[14][10] <= 1; D <= 1;	repeat(1) @(posedge CLOCK);
		D <= 0;			repeat(15) @(posedge CLOCK); // Test case 1: input is 0
		column <= 13; GrnPixelsIn[13][10] <= 1; D <= 1;	repeat(1) @(posedge CLOCK);
		D <= 0;			repeat(15) @(posedge CLOCK); // Test case 1: input is 0
		$stop; // End the simulation.
	end
endmodule