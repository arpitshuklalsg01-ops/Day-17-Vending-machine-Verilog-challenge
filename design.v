`timescale 1ns/1ps
module vending_machine (
    input clk,
    input rst_n,         
    input coin_inserted, 
    input coin,          
    output reg  dispense_a,    
    output reg  dispense_b,     
    output reg  return_1rs,    
    output reg  return_2rs
);

    localparam [3:0]
        S0 = 4'd0,   
        S1 = 4'd1,   
        S2 = 4'd2,
        S3 = 4'd3,
        S4 = 4'd4,
        S5 = 4'd5,
        S6 = 4'd6,
        S7 = 4'd7,
        S8 = 4'd8,   
        S9 = 4'd9; 

    reg [3:0] curr_state, next_state;

    always @(posedge clk) begin
        if (!rst_n)
            curr_state <= S0;
        else
            curr_state <= next_state;
    end

    always @(*) begin
        next_state = curr_state; 

        if (coin_inserted) begin
            case (curr_state)
                S0:      next_state = coin ? S1 : S2;
                S1:      next_state = coin ? S2 : S3;
                S2:      next_state = coin ? S3 : S4;
                S3:      next_state = coin ? S4 : S5;
                S4:      next_state = coin ? S5 : S6;
                S5:      next_state = coin ? S6 : S7;
                S6:      next_state = coin ? S7 : S8;
                S7:      next_state = coin ? S8 : S9;
                default: next_state = S0;
            endcase
        end

        if (curr_state == S8 || curr_state == S9)
            next_state = S0;
    end
  
    always @(*) begin
        dispense_a = 1'b0;
        dispense_b = 1'b0;
        return_1rs = 1'b0;
        return_2rs = 1'b0;

        case (curr_state)
            S4:      dispense_a = 1'b1;
            S7:      dispense_b = 1'b1;
            S8: begin dispense_b = 1'b1; return_1rs = 1'b1; end
            S9: begin dispense_b = 1'b1; return_2rs = 1'b1; end
            default: ;
        endcase
    end

endmodule
