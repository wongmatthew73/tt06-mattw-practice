`default_nettype none
`timescale 1ns/1ns
module pwm #(
    parameter WIDTH = 8,
    parameter INVERT = 0
    )(
    input wire clk,
    input wire reset,
    output reg out,
    input wire [WIDTH-1:0] level
    );
    
    reg [WIDTH-1:0] count;
    wire pwm_on = count < level;
    //reg [7:0] counter;
    
    
    always @(posedge clk) begin
    	if(reset) begin
    		count <= 1'b0;
    	end
    	else begin
    		count <= count + 1'b1;
    	end
    end
    
    always @(posedge clk) begin
    	if(reset) begin
    		out <= 0;
    	end
    	else begin
    		out <= INVERT == 1'b0 ? pwm_on : ! pwm_on;
    	end
    end
    
    //assign out = reset ? 1'b0:
    	
	
endmodule
