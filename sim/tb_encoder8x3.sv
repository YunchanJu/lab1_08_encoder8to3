`timescale 1ns/1ps

module tb_encoder8x3;

    reg [7:0] i;
    wire [2:0] a;

    integer n, k, checked = 0;
    reg [2:0] expected;

    encoder8x3 dut(i, a);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_encoder8x3);

        for (n = 0; n < 256; n = n + 1) begin
            i = n;
            expected = 3'd0;

            for (k = 0; k < 8; k = k + 1) begin
                if (n == (128 >> k))
                    expected = k;
            end

            #10;

            if (a !== expected)
                $fatal(1,
                    "FAIL encoder8x3 vector=%0d expected=%b actual=%b",
                    n, expected, a);

            checked = checked + 1;
        end

        if (checked != 256)
            $fatal(1, "Incomplete test");

        $display("LAB1_PASS encoder8x3 cases=%0d", checked);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "watchdog");
    end

endmodule