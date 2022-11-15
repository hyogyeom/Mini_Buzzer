`timescale 1ns / 1ps

module TOP_Buzzer(
    input i_clk,
    input i_reset,
    input[31:0] i_tone,
    output o_buzzer
    );

    
    Clock_Divider Clock_Divider(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_tone(i_tone),
    .o_clk(o_buzzer) 
    );

endmodule
