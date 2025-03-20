`define TRUE 1'b1
`define FALSE 1'b0

module TrafficLightController(X,CR,HW,clk,clear);
    input X,clk,clear;
    output reg[1:0]CR,HW;
     
    //definition of the states and next states
    reg [2:0]state,next_state;
    parameter [2:0]S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4,S5=3'd5;
    parameter [1:0]RED=2'b00,YELLOW=2'b01,GREEN=2'b10;


    //ff logic
    always @(posedge clk) 
    begin
        if(clear)
        state<=S0;
        else
        state<=next_state;
    end

    //combinational logic
    always @(state,X)
    begin

        case(state)
        S0: begin
            CR=RED;
            HW=GREEN;
            next_state<=X? S1:S0;
            end

        S1: begin
            CR=RED;
            HW=YELLOW;
            repeat (3)
            @(posedge clk);

            next_state<=S2;
            end
        
        S2: begin
            CR=RED;
            HW=RED;
            repeat (2)
            @(posedge clk);
            next_state<=S3;
            end
        
        S3: begin
            CR=GREEN;
            HW=RED;
            next_state<=X?S3:S4;
            end
        
        S4: begin
            CR=YELLOW;
            HW=RED;
            repeat (3)
            @(posedge clk);
            next_state<=S0;
            end
        
        default: next_state<=S0;

        endcase
    end



endmodule
