import lc3b_types::*;

module cache_set (
	input clk,
	
	lc3b_cache_index in_index,
	
	logic out_valid,
	logic out_dirty,
	lc3b_cache_tag out_tag, 
	lc3b_pmem_line out_data,
);

/* The various elements of the cache set */
logic valid [7:0];
logic dirty [7:0];
lc3b_cache_tag tag  [7:0];
lc3b_pmem_line data [7:0];

/* Initalize everything to zero */
initial
begin
	for (int i = 0; i < 7; i++)
	begin
		valid[i] = 1'b0;
		dirty[i] = 1'b0;
		tag[i]   = 8'b0;
		data[i]  = 128'b0;
   end
end

/* Loading will go here

		Skipped for now
*/

/* Get Data */
always_comb
begin
	out_valid = valid[in_index];
	out_dirty = dirty[in_index];
	out_tag   = tag[in_index];
	out_data  = data[in_index];
end

endmodule : cache_set