// This module defines states and logic for the traffic lights design
module intersection (clk, SN, SS, RedPixels, GrnPixels);
	input logic clk, SN, SS;
	output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
   output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	logic T, L, S;
	logic sel, sel2;
	
	// State variables
	enum { R, HG, HY, FG, FY} ps, ns;
	
	// Next State logic
	always_comb begin
		case (ps)
		//S -> sensor
		//T-> timer
		//L-> long timer (direction)
		
		R:		 if(~T) ns = R;
		       else if((L&T) | (~S & T)) ns = HG;
				 else(~L & T & S) ns = FG;
		HG:    if(~L | ~T | ~S) ns = HG;
				 else(S & T & L) ns = HY;
		HY:    if(T) ns = R;
				 else ns = HY;	
		FG:	 if(~T) ns = FG;
				 else ns = FY;
		FY:	 if(T) ns = R;
				 else ns = FY;	
		endcase
	end
	// Output logic
	always_comb begin
		case (ps)
		HY:    begin
          RedPixels[00] = 16'b0000111000000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000001;
          RedPixels[06] = 16'b0000000000000001;
          RedPixels[07] = 16'b0000000000000001;
          RedPixels[08] = 16'b1000000000000000;
          RedPixels[09] = 16'b1000000000000000;
          RedPixels[10] = 16'b1000000000000000;
          RedPixels[11] = 16'b0000000000000000;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000000111000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000000000000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000001;
          GrnPixels[06] = 16'b0000000000000001;
          GrnPixels[07] = 16'b0000000000000001;
          GrnPixels[08] = 16'b1000000000000000;
          GrnPixels[09] = 16'b1000000000000000;
          GrnPixels[10] = 16'b1000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000000000000000;

        end
		R:    begin
      //                  FEDCBA9876543210
          RedPixels[00] = 16'b0000000011100000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000001;
          RedPixels[06] = 16'b0000000000000001;
          RedPixels[07] = 16'b0000000000000001;
          RedPixels[08] = 16'b1000000000000000;
          RedPixels[09] = 16'b1000000000000000;
          RedPixels[10] = 16'b1000000000000000;
          RedPixels[11] = 16'b0000000000000000;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000011100000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000000000000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000000;
          GrnPixels[06] = 16'b0000000000000000;
          GrnPixels[07] = 16'b0000000000000000;
          GrnPixels[08] = 16'b0000000000000000;
          GrnPixels[09] = 16'b0000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000000000000000;

        end
		FG:    begin
          RedPixels[00] = 16'b0000000000000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000000;
          RedPixels[06] = 16'b1000000000000000;
          RedPixels[07] = 16'b1000000000000000;
          RedPixels[08] = 16'b1000000000000000;
          RedPixels[09] = 16'b0000000000000001;
          RedPixels[10] = 16'b0000000000000001;
          RedPixels[11] = 16'b0000000000000001;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000000000000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000011100000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000000;
          GrnPixels[06] = 16'b0000000000000000;
          GrnPixels[07] = 16'b0000000000000000;
          GrnPixels[08] = 16'b0000000000000000;
          GrnPixels[09] = 16'b0000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000000011100000;

        end
		HG:    begin
      //                  FEDCBA9876543210
          RedPixels[00] = 16'b0000111000000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000000;
          RedPixels[06] = 16'b0000000000000000;
          RedPixels[07] = 16'b1000000000000001;
          RedPixels[08] = 16'b1000000000000001;
          RedPixels[09] = 16'b1000000000000001;
          RedPixels[10] = 16'b0000000000000000;
          RedPixels[11] = 16'b0000000000000000;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000000111000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000000000000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000001;
          GrnPixels[05] = 16'b0000000000000001;
          GrnPixels[06] = 16'b0000000000000001;
          GrnPixels[07] = 16'b1000000000000000;
          GrnPixels[08] = 16'b1000000000000000;
          GrnPixels[09] = 16'b1000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000000000000000;

        end
		FY:    begin
          RedPixels[00] = 16'b0000011100000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000000;
          RedPixels[06] = 16'b1000000000000000;
          RedPixels[07] = 16'b1000000000000000;
          RedPixels[08] = 16'b1000000000000000;
          RedPixels[09] = 16'b0000000000000001;
          RedPixels[10] = 16'b0000000000000001;
          RedPixels[11] = 16'b0000000000000001;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000000011100000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000011100000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000000;
          GrnPixels[06] = 16'b0000000000000000;
          GrnPixels[07] = 16'b0000000000000000;
          GrnPixels[08] = 16'b0000000000000000;
          GrnPixels[09] = 16'b0000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000000011100000;

        end
		endcase
		
	end
	
	// DFFs
	always_ff @(posedge clk) begin
			S = SN;
			sel = ~sel;
			T =~T;
			if(sel) sel2=~sel2;
			if(sel2) L=~L;
			
	end
	
endmodule

//Intersection testbench
module intersection_testbench();
    logic clk, SN, SS;
    logic [15:0][15:0] RedPixels_tb;
    logic [15:0][15:0] GrnPixels_tb;
    
    intersection dut (
        .clk(clk),
        .SN(SN),
        .SS(SS),
        .RedPixels(RedPixels_tb),
        .GrnPixels(GrnPixels_tb)
    );

    // Set up a simulated clock.
    parameter CLOCK_PERIOD = 10;
    always #CLOCK_PERIOD clk = ~clk;

    // Initialize inputs
    initial begin
        clk = 0;
        SN = 0;
        SS = 0;
        
        // Apply stimulus
        #40 SN = 1; SS = 0; // North cycle, rest red
        #40 SN = 0; SS = 1; // South cycle, rest red
        #40 SN = 0; SS = 0; // Normal (counterclockwise) cycle
        #150 SN = 1; SS = 0; // North cycle
        #80 SN = 0; SS = 0; // Normal cycle
        #80 SN = 1; SS = 1; // Normal cycle
        #80 $stop; // End the simulation
    end
    
endmodule
