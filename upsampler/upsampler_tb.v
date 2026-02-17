/*
    To run: 
        iverilog -o upsampler_tb.vvp upsampler/upsampler_tb.v upsampler/upsampler.v
        vvp upsampler_tb.vvp
        gtkwave upsampler_tb.vcd
*/
module upsampler_tb;
    reg clk;
    reg rst;
    reg [15:0] in;
    wire [15:0] out;

    upsampler #(.W(16), .L(3)) uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units (100 MHz)

    initial begin
        $dumpfile("upsampler_tb.vcd");
        $dumpvars(0, upsampler_tb);
        // Initialize signals
        clk = 0;
        rst = 1;
        in = 16'h0000;

        // Release reset after some time
        #10 rst = 0;

        // Apply test vectors
        in = 16'h1234; // First input
        #30 in = 16'h5678; // Second input after some cycles
        #30 in = 16'h9ABC; // Third input after some cycles

        // Finish simulation after some time
        #25 $finish;
    end
endmodule