/*
    Description: An L-stage upsampler for W-bit inputs
*/
module upsampler
#(
    parameter W = 16,
    parameter L = 2
)(
    input clk,
    input rst,
    input [W-1:0] in,
    output [W-1:0] out
);
    parameter N = $clog2(L);
    reg [N-1:0] counter;
    reg [W-1:0] temp;
    wire flag = ~|(counter); // ~(counter[N-1] OR coutner[N-2] OR ... OR counter[0]) (zero state)
    always @(posedge clk) begin
        if(rst)
        begin
            counter <= L-1;
        end
        else
        begin
            if (counter == L-1) // if counter is at max value, reset to 0
                counter <= 0;
            else
                counter <= counter + 1;
        end
        temp <= in; // store input in temp register
    end
    assign out = flag ? temp : 0; // if flag is 1, output in, else output 0
endmodule