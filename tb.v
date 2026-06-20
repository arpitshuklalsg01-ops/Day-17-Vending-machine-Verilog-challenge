`timescale 1ns/1ps
module tb;
    reg clk, rst_n, coin_inserted, coin;
    wire dispense_a, dispense_b, return_1rs, return_2rs;

    vending_machine uut (
        .clk(clk),
        .rst_n(rst_n),
        .coin_inserted(coin_inserted),
        .coin(coin),
        .dispense_a(dispense_a),
        .dispense_b(dispense_b),
        .return_1rs(return_1rs),
        .return_2rs(return_2rs)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    task insert_coin;
        input c;
        begin
            coin_inserted = 1; coin = c;
            @(posedge clk); #1;
            coin_inserted = 0;
            @(posedge clk); #1;
        end
    endtask

    initial begin
      
      $dumpfile("dump.vcd");
      $dumpvars(1, tb);
      
        rst_n = 0; coin_inserted = 0; coin = 0;
        @(posedge clk); #1;
        rst_n = 1;

      insert_coin(1); insert_coin(2); insert_coin(1); insert_coin(0);
        $display("dispense_a=%b (expect 1)", dispense_a);
        @(posedge clk); #1;

      
      insert_coin(0); insert_coin(2); insert_coin(2); insert_coin(0);
        $display("dispense_b=%b return_1rs=%b (expect 1 1)", dispense_b, return_1rs);
        @(posedge clk); #1;

        $finish;
    end

endmodule
