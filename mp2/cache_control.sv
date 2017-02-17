import lc3b_types::*;


module cache_control (
    input clk

    /* Memory signals from cpu */
    output mem_resp,

    /* Memory signals to/from main memory */
    input pmem_resp,
    output pmem_read,
    output pmem_write,

    output load_set_one,
    output load_set_two,

    input hit
);

enum int unsigned {
    /* List of states */
    hit_s,
    fetch_s,
    wait_mem_s,
    write_cache_s
} state, next_state;


always_comb
begin : state_actions
    mem_resp = 0;

    case(state)
        hit_s: begin
            mem_resp = 1;
        end

        fetch_s: begin

        end

        write_cache_s : begin

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

        write_cache_s: begin
            next_state = hit_s;
        end
    endcase
end : next_state_logic


always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
     state <= next_state;
end : next_state_assignment


endmodule : cache_control // cache_set