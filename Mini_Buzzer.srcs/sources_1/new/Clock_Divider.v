`timescale 1ns / 1ps
    /*
    ??? 261
    ??? 293
    ?? 329
    ??? 349
    ??? 391
    ??? 440
    ??? 493
    */

module Clock_Divider(
    input i_clk,
    input i_reset,
    input[31:0] i_tone,
    output o_clk
    );
    
    reg r_clk = 0;
    reg[31:0] r_counter = 0;
    assign o_clk = r_clk;

    always @(posedge i_clk or posedge i_reset) begin

        if(!i_reset || i_tone == 0) begin
            r_clk <= 1'b0;
            r_counter <= 0;
        end

        else begin
            if(r_counter == 50_000_000/i_tone - 1 )begin  
                r_counter <= 0;
                r_clk <= ~r_clk;
            end
            else begin
                r_counter <= r_counter + 1;
            end
         end
    end
endmodule