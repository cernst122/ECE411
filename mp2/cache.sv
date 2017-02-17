import lc3b_types::*;

module cache (
    input clk,

    /* Memory signals from cpu */
    output mem_resp,
    output lc3b_word mem_rdata,
    input mem_read,
    input mem_write,
    input lc3b_mem_wmask mem_byte_enable,
    input lc3b_word mem_address,
    input lc3b_word mem_wdata,

    /* Memory signals from main memory */
    input pmem_resp,
    input lc3b_pmem_line pmem_rdata,
    output pmem_read,
    output pmem_write,
    output lc3b_pmem_addr pmem_address,
    output lc3b_pmem_line pmem_wdata
);


// Unconditionally forward the memory address, we will always be using it for write and reads anyway
assign pmem_address = mem_address;

endmodule : cache