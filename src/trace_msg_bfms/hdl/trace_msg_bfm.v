
/****************************************************************************
 * trace_msg_bfm.v
 * 
 ****************************************************************************/

module trace_msg_bfm #(
		parameter MSG_SZ = 32 // Maximum characters in msg fields
        ) (
        input                            clock,
        input                            reset
        );
        
    reg            in_reset = 0;
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            in_reset <= 1;
        end else begin
            if (in_reset) begin
                _reset();
                in_reset <= 1'b0;
            end
        end
    end
    
    reg[8*MSG_SZ-1:0]				msg00 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg01 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg02 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg03 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg04 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg05 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg06 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg07 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg08 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg09 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg10 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg11 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg12 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg13 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg14 = {MSG_SZ{8'h00}};
    reg[8*MSG_SZ-1:0]				msg15 = {MSG_SZ{8'h00}};
    
    task _clr_msg(input reg[7:0] idx);
   	begin
    	case (idx)
    		0: msg00 = {MSG_SZ{8'h00}};
    		1: msg01 = {MSG_SZ{8'h00}};
    		2: msg02 = {MSG_SZ{8'h00}};
    		3: msg03 = {MSG_SZ{8'h00}};
    		4: msg04 = {MSG_SZ{8'h00}};
    		5: msg04 = {MSG_SZ{8'h00}};
    		6: msg06 = {MSG_SZ{8'h00}};
    		7: msg07 = {MSG_SZ{8'h00}};
    		8: msg08 = {MSG_SZ{8'h00}};
    		9: msg09 = {MSG_SZ{8'h00}};
    		10: msg10 = {MSG_SZ{8'h00}};
    		11: msg11 = {MSG_SZ{8'h00}};
    		12: msg12 = {MSG_SZ{8'h00}};
    		13: msg13 = {MSG_SZ{8'h00}};
    		14: msg14 = {MSG_SZ{8'h00}};
    		15: msg15 = {MSG_SZ{8'h00}};
    	endcase
   	end
    endtask
    
    task _set_msg_c(input reg[7:0] msg, input reg[7:0] idx, input reg[7:0] c);
   	begin
    	idx = MSG_SZ-idx-1;
    	case (msg)
    		0: msg00 = ((msg00 & ~('hff << 8*idx)) | (c << 8*idx));
    		1: msg01 = ((msg01 & ~('hff << 8*idx)) | (c << 8*idx));
    		2: msg02 = ((msg02 & ~('hff << 8*idx)) | (c << 8*idx));
    		3: msg03 = ((msg03 & ~('hff << 8*idx)) | (c << 8*idx));
    		4: msg04 = ((msg04 & ~('hff << 8*idx)) | (c << 8*idx));
    		5: msg04 = ((msg05 & ~('hff << 8*idx)) | (c << 8*idx));
    		6: msg06 = ((msg06 & ~('hff << 8*idx)) | (c << 8*idx));
    		7: msg07 = ((msg07 & ~('hff << 8*idx)) | (c << 8*idx));
    		8: msg08 = ((msg08 & ~('hff << 8*idx)) | (c << 8*idx));
    		9: msg09 = ((msg09 & ~('hff << 8*idx)) | (c << 8*idx));
    		10: msg10 = ((msg10 & ~('hff << 8*idx)) | (c << 8*idx));
    		11: msg11 = ((msg11 & ~('hff << 8*idx)) | (c << 8*idx));
    		12: msg12 = ((msg12 & ~('hff << 8*idx)) | (c << 8*idx));
    		13: msg13 = ((msg13 & ~('hff << 8*idx)) | (c << 8*idx));
    		14: msg14 = ((msg14 & ~('hff << 8*idx)) | (c << 8*idx));
    		15: msg15 = ((msg15 & ~('hff << 8*idx)) | (c << 8*idx));
    	endcase
   	end
    endtask
        
    task init;
    begin
        $display("trace_msg_bfm: %m");
        _set_parameters(MSG_SZ);
    end
    endtask
	
    // Auto-generated code to implement the BFM API
`ifdef PYBFMS_GEN
${pybfms_api_impl}
`endif

endmodule
