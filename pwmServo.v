/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Control the speed of servo motor 
*/

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2022 09:40:31 PM
// Design Name: 
// Module Name: servoMotor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module servoMotor(
                 clk,
                 rst,
                 duty_cycle_i,
                 servo_o

    );
    
    input clk;
    input [7:0] duty_cycle_i;
    input rst;
    output wire servo_o;
    reg servo;
    integer state;
    integer counter;
    integer duty_cycle;
    integer counter_clock;
    reg clock_enable;
    
    assign servo_o = servo;
    
    always @ (posedge clk)
      begin
        if (!rst)
          begin
            state <= 0;
            counter <=0;
            duty_cycle <= 0;
            counter_clock <= 0;
            clock_enable <=0;
            servo <= 0;
          end 
        else
          counter_clock <= counter_clock +1;
          //counter_clock <= 0;
          if (counter_clock ==8'h77)
            begin
              clock_enable <= 1;
              counter_clock <= 1;
            end 
          
          if (clock_enable)
            begin
            counter <= counter +1;
              case (state)
                0:
                  begin
                    duty_cycle <= duty_cycle_i +100;
                    state <= 1;
                    counter <= 0;
                  end 
                1:
                  begin
                    servo <= 1;
                    if (counter == duty_cycle )
                      begin
                        servo <= 0;
                        state <= 2;
                      end 
                  end 
                2:
                  begin
                    if (counter == 16'h7CE)
                      begin
                        counter <= 0;
                        state <= 1;
                        duty_cycle <= duty_cycle_i +100;
                      end 
                  end 
              endcase
            end 
      end 
endmodule

/*
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2022 10:03:41 PM
// Design Name: 
// Module Name: tbServo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tbServo(

    );
    
    reg clk;
    reg [7:0] duty_cycle_i;
    reg rst;
    wire  servo_o;
    
    servoMotor dut(
                 clk,
                 rst,
                 duty_cycle_i,
                 servo_o

    );
    
    initial
      begin
        clk =0;
        duty_cycle_i <= 0;
        rst = 0;
        #10
        rst =1;
        
      end 
      
    always
      begin
        #5 clk = ! clk;
      end 
    

endmodule

*/
