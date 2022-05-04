/*
  Author : Rakotojaona Nambinina
  
*/

`timescale 1ns / 1ps

module PWM
         #(
          parameter dutyValue = 7,
          parameter counterValue =3
          )
          (
           clk,
           rst,
           duty,
           sig_drv
           );         
  input clk;
  input rst;
  input [dutyValue-1:0] duty;
  output reg sig_drv;
  reg [counterValue-1:0] counter;
  
  // counter 
  always @ (posedge clk)
  begin
    if (rst)
    begin
       sig_drv <=0;
       counter <= 8'd0;
    end
    else
    begin
       counter <= counter +1;
    end 
  end
  
 // handle pwm 
 
 always @ (*)
 begin
   if (duty > counter)
   begin
       sig_drv <= 1'b1;
   end
   else
   begin
       sig_drv <=1'b0;
   end 
 end 
         
endmodule
