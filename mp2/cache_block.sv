import lc3b_types::*;

/* Block might be a bad name, this basically represents
	both cache sets for 2 way assoicativity  

	hits and misses are also calculated here
	
	
	Offset bits are [2:0]
	Index bits are  [5:3]
	Tag bits are    [15:6]

*/
module cache_block (
	input clk,
	input lc3b_pmem_addr cache_addr,
	output hit,
	output lc3b_word out_data_block,

	/* Writing logic */
	input load_set_one,
	input load_set_two,
	input lc3b_pmem_line input_data

	/* Used for LRU */
	output set_one_hit,
	output set_two_hit,

	output set_one_valid,
	output set_two_valid
);

logic out_valid_set_one;
logic out_dirty_set_one;
lc3b_cache_tag out_tag_set_one; 
lc3b_pmem_line out_data_set_one;

logic out_valid_set_two;
logic out_dirty_set_two;
lc3b_cache_tag out_tag_set_two; 
lc3b_pmem_line out_data_set_two;

cache_set set_one(
	.clk(clk),
	.in_index(cache_addr[5:3]),
	.out_valid(out_valid_set_one),
	.out_dirty(out_dirty_set_one),
	.out_tag(out_tag_set_one),
	.out_data(out_data_set_one),
	.set_load(load_set_one),
	.in_data(input_data),
	.in_tag(cache_addr[15:6])
);

cache_set set_two(
	.clk(clk),
	.in_index(cache_addr[5:3]),
	.out_valid(out_valid_set_two),
	.out_dirty(out_dirty_set_two),
	.out_tag(out_tag_set_two),
	.out_data(out_data_set_two)
	.set_load(load_set_two),
	.in_data(input_data),
	.in_tag(cache_addr[15:6])
);

always_comb
begin
	hit = ((cache_addr[15:6] == out_tag_set_one) && out_valid_set_one) || ((cache_addr[15:6] == out_tag_set_two) && out_valid_set_two)
	set_one_hit = (cache_addr[15:6] == out_tag_set_one) && out_valid_set_one;
	set_two_hit = (cache_addr[15:6] == out_tag_set_two) && out_valid_set_two;
	if((cache_addr[15:6] == out_tag_set_one))
		case(cache_addr[2:0])
			3b'000: begin
				out_data_block = out_data_set_one[15:0];
			end
			3b'001: begin
				out_data_block = out_data_set_one[31:16];
			end
			3b'010: begin
				out_data_block = out_data_set_one[47:32];
			end
			3b'011: begin
				out_data_block = out_data_set_one[63:48];
			end
			3b'100: begin
				out_data_block = out_data_set_one[79:64];
			end
			3b'101: begin
				out_data_block = out_data_set_one[95:80];
			end
			3b'110: begin
				out_data_block = out_data_set_one[111:96];
			end
			3b'111: begin
				out_data_block = out_data_set_one[127:112];
			end
		endcase
	else
		case(cache_addr[2:0])
			3b'000: begin
				out_data_block = out_data_set_two[15:0];
			end
			3b'001: begin
				out_data_block = out_data_set_two[31:16];
			end
			3b'010: begin
				out_data_block = out_data_set_two[47:32];
			end
			3b'011: begin
				out_data_block = out_data_set_two[63:48];
			end
			3b'100: begin
				out_data_block = out_data_set_two[79:64];
			end
			3b'101: begin
				out_data_block = out_data_set_two[95:80];
			end
			3b'110: begin
				out_data_block = out_data_set_two[111:96];
			end
			3b'111: begin
				out_data_block = out_data_set_two[127:112];
			end
		endcase
end

assign set_one_valid = out_valid_set_one;
assign set_two_valid = out_valid_set_two;

endmodule : cache_block



