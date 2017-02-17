import lc3b_types::*;

module cache_datapath (
	input clk,
	output mem_resp,
	output lc3b_word mem_rdata,
	input mem_read,
	input mem_write,
	input lc3b_mem_wmask mem_byte_enable,
	input lc3b_word mem_address,
	input lc3b_word mem_wdata
	
	input pmem_resp,
   input lc3b_pmem_line pmem_rdata,
   output pmem_read,
   output pmem_write,
   output lc3b_pmem_addr pmem_address,
   output lc3b_pmem_line pmem_wdata
);

logic hit_sig;

cache_block main_block (
	.clk(clk),
	.cache_addr(mem_address),
	.hit(hit_sig),
	.out_data_block(mem_read)
);



endmodule : cache_datapath