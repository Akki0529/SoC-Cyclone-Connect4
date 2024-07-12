// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
   output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0]  LEDR;
   input  logic [3:0]  KEY;
   input  logic [9:0]  SW;
   output logic [35:0] GPIO_1;
   input logic CLOCK_50;
	logic temp1;
	logic temp2;
	logic temp3;
	logic leftInitial;
	logic rightInitial;
	logic downInitial;
	logic left;
	logic right;
	logic down;
	logic turn;
	logic [3:0] column;
	logic [15:0][15:0]RedPixelsfake; // 16 x 16 array representing red LEDs
   logic [15:0][15:0]GrnPixelsfake; // 16 x 16 array representing green LEDs
	logic [6:0] row7LEDsRed;
	logic [6:0] row7LEDsGrn;
	
	
	
	// Turn off HEX displays
   assign HEX1 = '1;
   assign HEX2 = '1;
   assign HEX3 = '1;
   assign HEX4 = '1;
   assign HEX5 = '1;
	 
	//setup clock

	logic [31:0] clk;
	logic SYSTEM_CLOCK;
	logic FALLING_CLOCK;
	clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
	assign SYSTEM_CLOCK = clk[13]; // 1526 Hz clock signal	 
	assign FALLING_CLOCK = clk[16]; // 1526 Hz clock signal	
	//Userinput
	always_ff @(posedge SYSTEM_CLOCK) begin
		temp1 <= ~KEY[2];
		temp2 <= ~KEY[0];
		temp3 <= ~KEY[1];
		leftInitial <= temp1;
		rightInitial <= temp2;
		downInitial <= temp3;
	end

	//LED Board Driver setup
	logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
   logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	logic RST;                   // reset - toggle this on startup 
	assign RST = SW[9]; 
	LEDDriver Driver (.CLK(SYSTEM_CLOCK), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);

	// set up borders
	always_comb begin
		for(int n = 15; n > 6; n = n-1) begin
			RedPixels[n][15] = 1;
			RedPixels[n][7] = 1;
			GrnPixels[n][15] = 1;
			GrnPixels[n][7] = 1;
		end
		
		for(int i = 14; i > 7; i = i-1) begin
			RedPixels[07][i] = row7LEDsRed[i-8];
			GrnPixels[07][i] = row7LEDsGrn[i-8];
			for (int j = 14; j > 7; j = j-1) begin
				RedPixels[i][j] = RedPixelsfake[i][j];
				GrnPixels[i][j] = GrnPixelsfake[i][j];
			end
		end
		
		for(int m = 15; m > 8; m = m-1) begin
			RedPixels[m][6] = 0;
			GrnPixels[m][6] = 0;
			RedPixels[m][5] = 0;
			GrnPixels[m][5] = 0;
			RedPixels[m][4] = 0;
			GrnPixels[m][4] = 0;
			RedPixels[m][3] = 0;
			GrnPixels[m][3] = 0;
			RedPixels[m][2] = 0;
			GrnPixels[m][2] = 0;
			RedPixels[m][1] = 0;
			GrnPixels[m][1] = 0;
			RedPixels[m][0] = 0;
			GrnPixels[m][0] = 0;
		end
		
		RedPixels[06:00] = 16'b0;
		GrnPixels[06:00] = 16'b0;
		
		RedPixels[15][14:08] = 7'b1111111;
		GrnPixels[15][14:08] = 7'b1111111;
		RedPixels[07][15] = 1;
		RedPixels[07][7] = 1;
		GrnPixels[07][15] = 1;
		GrnPixels[07][7] = 1;
	end
	
	
	//initialize non used pixels
	
		
	userIn tapper1 (.CLOCK(SYSTEM_CLOCK), .button(leftInitial), .cur(left));
	userIn tapper2 (.CLOCK(SYSTEM_CLOCK), .button(rightInitial), .cur(right));
	userIn tapper3 (.CLOCK(SYSTEM_CLOCK), .button(downInitial), .cur(down));
	movement move (.RST, .RedPixels(row7LEDsRed), .GrnPixels(row7LEDsGrn), .L(left), .R(right), .D(down), .CLOCK(SYSTEM_CLOCK), .column, .turn);
	falling fall (.CLOCK(SYSTEM_CLOCK), .RST, .RedPixelsIn(RedPixels), .GrnPixelsIn(GrnPixels), .RedPixelsOut(RedPixelsfake), .GrnPixelsOut(GrnPixelsfake), .D(down), .column, .turn);
	winnerConnect4 winner (.RST, .CLOCK(SYSTEM_CLOCK), .RedPixels(RedPixelsfake), .GrnPixels(GrnPixelsfake), .HEXW(HEX0));
	
		//Add everything to GrnPixels & RedPixels
endmodule









module DE1_SoC_testbench();
   logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0]  LEDR;
   logic [3:0]  KEY;
   logic [9:0]  SW;
   logic [35:0] GPIO_1;
   logic CLOCK_50;
	logic temp1;
	logic temp2;
	logic temp3;
	logic leftInitial;
	logic rightInitial;
	logic downInitial;
	logic left;
	logic right;
	logic down;
	logic turn;
	logic [3:0] column;
	logic [15:0][15:0]RedPixelsfake; // 16 x 16 array representing red LEDs
   logic [15:0][15:0]GrnPixelsfake; // 16 x 16 array representing green LEDs
	logic [6:0] row7LEDsRed;
	logic [6:0] row7LEDsGrn;
	logic [31:0] clk;
	logic SYSTEM_CLOCK;
	logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
   logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	logic RST;  
	DE1_SoC dut (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
	
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=200;
	initial begin
		SYSTEM_CLOCK <= 0;
		forever #(CLOCK_PERIOD/2) SYSTEM_CLOCK <= ~SYSTEM_CLOCK; // Forever toggle the clock
	end
	
	// Test the design.
	initial begin
		SW[9] <= 1; @(posedge SYSTEM_CLOCK); // Always reset FSMs at start
		SW[9] <= 0; @(posedge SYSTEM_CLOCK);
		@(posedge SYSTEM_CLOCK);
		KEY[1] <= 0; @(posedge SYSTEM_CLOCK);
		KEY[2] <= 0; @(posedge SYSTEM_CLOCK);
		KEY[0] <= 1; @(posedge SYSTEM_CLOCK);
		KEY[0] <= 0; @(posedge SYSTEM_CLOCK);
		KEY[2] <= 1; @(posedge SYSTEM_CLOCK);
		KEY[2] <= 0; @(posedge SYSTEM_CLOCK);
		KEY[1] <= 1; @(posedge SYSTEM_CLOCK);
		KEY[1] <= 0; @(posedge SYSTEM_CLOCK);
		$stop; // End the simulation.
	end
endmodule