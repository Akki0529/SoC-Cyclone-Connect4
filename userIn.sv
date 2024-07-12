module userIn (CLOCK, button, cur);

	input logic CLOCK;
	input logic button;
	output logic cur;
	enum bit {pressed = 1'b1, unpressed = 1'b0} ps, ns;

	always_comb begin
		case(ps)
			unpressed:	if (button == 1)		ns = pressed;
							else						ns = unpressed;
			pressed:		if (button == 1)		ns = pressed;
							else						ns = unpressed;
		endcase
	end
	
	assign cur = ~ps & button;
	
	always_ff @(posedge CLOCK) begin
		ps <= ns;
	end
endmodule
