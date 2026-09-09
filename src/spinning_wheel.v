`default_nettype none
`timescale 1ns/1ps

// this module spins the wheel in a clockwise direction
module spinning_wheel #(
    localparam CLK_FREQ = 10000000
)(
    input wire              clk, 	
    input wire              reset_n,	// synchronous
    input wire [7:0]        speed,	// speed (0 = stationary, 15 = fastest) 	
    output wire [6:0]       segments    // output to 7-segment display
    );
    
    localparam COUNT_WIDTH = $clog2(CLK_FREQ+256); // +258 to prevent wrapping around
    reg [5:0] shift_reg;
    reg [COUNT_WIDTH-1:0] count;
    reg [7:0] speed_reg;
    
	
    assign segments = {1'b0, shift_reg}; // 7th bit is middle segment
    
    always@(posedge clk) begin
        if (!reset_n) begin
	    shift_reg <= 6'b000001;
	    count <= 0;
	    speed_reg <= 0;
	end else begin
	    speed_reg <= speed;
	    if (count >= CLK_FREQ) begin
	        shift_reg <= {shift_reg[4:0], shift_reg[5]};
	        count <= 0;
	    end else begin
		count <= count + speed_reg;
	    end
	end
    end
endmodule

