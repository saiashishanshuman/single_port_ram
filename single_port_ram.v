module single_port_ram(
    input [7:0] data, //data line
    input [5:0] addr, //address line
    input we, //write enable
    input clk, // clock
    output [7:0] q // output
);

    reg[0:7] ram [63:0]; //8*64 bit ram memory blocks
    reg[5:0] addr_reg;  //address register

    always @ (posedge clk)
        begin
            if(we)
                ram[addr] <= data;
            else
                addr_reg <= addr;
        end
    
    assign q = ram[addr_reg];

endmodule
