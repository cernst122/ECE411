import lc3b_types::*;

module byte_insert (
	input lc3b_cache_offset sel_index,
	input lc3b_word write_data,
	input lc3b_pmem_line input_data,
	output lc3b_pmem_line output_data
	);

always_comb begin
	output_data = input_data;
	case(sel_index)
		4'b0000: begin
			output_data = {input_data[127:16], write_data};
		end
		4'b0001: begin
			output_data = {input_data[127:24], write_data, input_data[7:0]};
		end
		4'b0010: begin
			output_data = {input_data[127:32], write_data, input_data[15:0]};
		end
		4'b0011: begin
			output_data = {input_data[127:40], write_data, input_data[23:0]};
		end
		4'b0100: begin
			output_data = {input_data[127:48], write_data, input_data[31:0]};
		end
		4'b0101: begin
			output_data = {input_data[127:56], write_data, input_data[39:0]};
		end
		4'b0110: begin
			output_data = {input_data[127:64], write_data, input_data[47:0]};
		end
		4'b0111: begin
			output_data = {input_data[127:72], write_data, input_data[55:0]};
		end
		4'b1000: begin
			output_data = {input_data[127:80], write_data, input_data[63:0]};
		end
		4'b1001: begin
			output_data = {input_data[127:88], write_data, input_data[71:0]};
		end
		4'b1010: begin
			output_data = {input_data[127:96], write_data, input_data[79:0]};
		end
		4'b1011: begin
			output_data = {input_data[127:104], write_data, input_data[87:0]};
		end
		4'b1100: begin
			output_data = {input_data[127:112], write_data, input_data[95:0]};
		end
		4'b1101: begin
			output_data = {input_data[127:120], write_data, input_data[103:0]};
		end
		4'b1110: begin
			output_data = {write_data, input_data[111:0]};
		end
		4'b1111: begin
			output_data = {write_data[7:0], input_data[119:0]};
		end
		default: begin
			output_data = input_data;
		end
	endcase
end

endmodule : byte_insert