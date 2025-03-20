
`include "TrafficLightController.v"
module TrafficLightController_tb;

 //inputs  --> wires
 //outputs --> reg

   reg X,clk,clear;
   wire [1:0]HW,CR;

   TrafficLightController uut(X,CR,HW,clk,clear);

   initial
   begin
     clk=0;
     clear=1;
   end
    
    always
    #5 clk=!clk;

   initial
  begin
  
   $dumpfile("idonnofile12.vcd");
   $dumpvars(0,TrafficLightController_tb);
   
    #7 clear=0;
    #5 X=1;
    #45 X=0;
  end

endmodule
