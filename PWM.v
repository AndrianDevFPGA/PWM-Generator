/*
  Author : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description: Program generate PWM signal
*/

`timescale 1ns / 1ps

module PWM
          (
           clk,
           rst,
           duty,
           pwm
           );         
   input clk;
   input rst;
   input [31:0] duty;
   output pwm;
  
   integer counter;
  
  always @ (posedge clk)
    begin
      counter <= counter +1 ;
      if (rst)
        begin
          pwm <=0;
          counter <=0;
        end 
      else
        begin
          if (counter < duty)
            begin
              pwm <= 1;
            end 
          else
            begin
              pwm <=0;
            end 
        end 
    end 
         
endmodule
