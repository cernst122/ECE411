import lc3b_types::*;

module cache (
	input clk,

	/* Memory signals from cpu */
	input mem_resp,
	input lc3b_word mem_rdata,
	output mem_read,
	output mem_write,
	output lc3b_mem_wmask mem_byte_enable,
	output lc3b_word mem_address,
	output lc3b_word mem_wdata
	
	/* Memory signals from main memory */
	input pmem_resp,
   input lc3b_pmem_line pmem_rdata,
   output pmem_read,
   output pmem_write,
   output lc3b_pmem_addr pmem_address,
   output lc3b_pmem_line pmem_wdata
);

endmodule : cache