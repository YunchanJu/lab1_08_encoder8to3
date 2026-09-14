module encoder8x3(
    input wire [7:0] i,
    output reg [2:0] a
);

    always @* begin
        case (i)
            8'h80: a = 3'd0;
            8'h40: a = 3'd1;
            8'h20: a = 3'd2;
            8'h10: a = 3'd3;
            8'h08: a = 3'd4;
            8'h04: a = 3'd5;
            8'h02: a = 3'd6;
            8'h01: a = 3'd7;
            default: a = 3'd0;
        endcase
    end

endmodule