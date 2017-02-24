import lc3b_types::*;

module cache_datapath (
    input clk,
    output lc3b_word mem_rdata,
    input lc3b_word mem_address,

    input lc3b_pmem_line pmem_rdata,

    input load_set_one,
    input load_set_two,

    input lc3b_word mem_wdata,

    output hit,

    output set_one_hit,
    output set_two_hit,

    input load_lru,
    output current_lru,

    output set_one_valid,
    output set_two_valid,

    input cache_in_mux_sel
);

logic hit_sig;
lc3b_pmem_line full_data;
lc3b_pmem_line insert_data;
lc3b_pmem_line cache_in_data;
lc3b_pmem_line insert_data;

mux2 #(.width(128)) cache_in_mux (
    .a(pmem_rdata),
    .b(insert_data),
    .sel(cache_in_mux_sel),
    .f(cache_in_data)
);

byte_insert binsert (
    .sel_index(mem_address[3:0]),
    .write_data(mem_wdata),
    .input_data(full_data),
    .output_data(insert_data)
);

cache_block main_block (
    .clk(clk),
    .cache_addr(mem_address),
    .hit(hit_sig),
    .out_data_block(mem_rdata),
    .load_set_one(load_set_one),
    .load_set_two(load_set_two),
    .input_data(cache_in_data),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .set_one_valid(set_one_valid),
    .set_two_valid(set_two_valid),
    .out_data_full(full_data)
);

lru main_lru (
    .clk(clk),
    .lru_index(mem_address[6:4]),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .load_lru(load_lru),
    .lru_of_set(current_lru)
);

assign hit = hit_sig;

endmodule : cache_datapath