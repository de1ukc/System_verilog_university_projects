module map(input logic clk,
           input logic reset,
			  input logic W, S, A, D,
			  output logic WIN, DIE);
			  
typedef enum logic [4:0] {cave, tunnel, river, the_sword_cache, Dragon, necropolis, Victory, Loose} statetype;
statetype state, nextstate;

logic sword = 0;
logic the_end = 0;
logic pobeda = 0;

always_ff @(posedge clk, posedge reset)
  if(reset) begin
  state <= cave;
  //sword <= 0;
    // перезапуск игры с началом в пещере
  end
  else state <= nextstate;
  
always_latch 
	begin
	case (state)
        cave:   if(D) nextstate <= tunnel;
                else  nextstate <= cave;
                      
        tunnel:    if(S) nextstate <= river;
							else if (A) nextstate <= cave;
							else nextstate <= tunnel;
							
        river:    if (A) nextstate <= the_sword_cache;
						else if (D) nextstate <= Dragon;
						else if (W) nextstate <= tunnel;
								
        the_sword_cache:    	begin
										sword <= 1;
										if (D) nextstate <= river;
										else nextstate <= the_sword_cache;
										end
        Dragon:    if(sword == 0) begin
											  nextstate <= necropolis;
											  the_end <= 1;
											  end
								else 
								begin
								nextstate <= Victory;
								pobeda <= 1;
								end
        necropolis:    	begin
								nextstate <= Loose;
								end
		  Victory:     sword <= 0; // опусти свой мечь в ножны, воин. Твоя битва кончена
		  Loose: 		pobeda <= 0;
        default: nextstate = cave;
endcase
end
  
assign WIN = (pobeda == 1); 
assign DIE = (the_end== 1);
  
endmodule 