import lc3b_types::*;

module cache_control (
    input clk,

    /* Memory signals from cpu */
    output logic mem_resp,
    input mem_read,
	 input mem_write,

    /* Memory signals to/from main memory */
    input pmem_resp,
    output logic pmem_read,
    output logic pmem_write,

    output logic load_set_one,
    output logic load_set_two,

    input set_one_hit,
    input set_two_hit,

    output logic load_lru,
    input  current_lru, 

    input set_one_valid,
    input set_two_valid,

    input hit,

    output logic cache_in_mux_sel,
	 output logic write_type_set_one,
	 output logic write_type_set_two
);

enum int unsigned {
    /* List of states */
    hit_s,
    fetch_s,
	 pmem_wrt_s,
    write_s
} state, next_state;


always_comb
begin : state_actions
    mem_resp     = 0;
    pmem_read    = 0;
    load_set_one = 0;
    load_set_two = 0;
	 load_lru     = 0;
    cache_in_mux_sel = 0;
	 write_type_set_one = 0;
	 write_type_set_two = 0;

    case(state)
        hit_s: begin
            if((mem_read == 1) && (hit == 1)) begin
                mem_resp = 1;
                /* Update LRU as well */
                load_lru = 1;
            end
				if((mem_write == 1) && (hit == 1)) begin
					mem_resp = 1;
					load_lru = 1;
					if(set_one_hit == 1) begin
						load_set_one = 1;
						write_type_set_one = 1;
						cache_in_mux_sel = 1;
					end
					if(set_two_hit == 1) begin
						load_set_two = 1;
						write_type_set_two = 1;
						cache_in_mux_sel = 1;
					end
				end
        end

        fetch_s: begin
            pmem_read = 1;
        end
		  
		  pmem_wrt_s: begin
				pmem_write = 1;
			end

        write_s: begin
            /* Check if we are replacing based on LRU or on validity  */
            if((set_one_valid == 1) && (set_two_valid == 1)) begin
                /* Since both sets are valid, we need to check LRU */
                if (current_lru == 0) begin
                    /* Set one is LRU, replace */
                    load_set_one = 1;
                end 
                else begin
                    /* Set two is LRU, replace */
                    load_set_two = 1;
                end
            end
            else begin
                /* If one isn't valid, just write there, no need to check LRU */
                if (set_one_valid == 0) begin
                    /* Set one is invalid, replace */
                    load_set_one = 1;
                end 
                else begin
                    /* Set two is invalid, replace */
                    load_set_two = 1;
                end
            end
        end
    endcase
end : state_actions

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;
      
    case(state)
        hit_s: begin
            if(hit)
                next_state = hit_s;
            else
                next_state = fetch_s;
        end

        fetch_s: begin
            if(!pmem_resp)
                next_state = fetch_s;
            else
                next_state = write_s;
        end
		  
		  pmem_wrt_s: begin
            if(!pmem_resp)
                next_state = pmem_wrt_s;
            else
                next_state = write_s;
        end

        write_s: begin
            next_state = hit_s;
        end
    endcase
end : next_state_logic


always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
     state <= next_state;
end : next_state_assignment


endmodule : cache_control