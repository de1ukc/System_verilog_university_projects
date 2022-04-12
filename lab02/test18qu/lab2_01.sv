module lab2_01(input logic clk,
               input logic reset,
               input logic left, right,
               output logic la, lb, lc, ra, rb, rc);

//я правильно понимаю, что эти три провода - это reset , left, right
typedef enum logic [2:0] {N0, R1, R2, R3, L1, L2, L3} statetype; // N0 - все фары выключены, R1/L1 - начало влючения поворотрника, то есть, 
//включается только одна фара
statetype state, nextstate;

always_ff @(posedge clk, posedge reset)
  if(reset) state <= N0;
  else state <= nextstate;
  
  
always_comb
	case (state)
        N0:     if(right) nextstate = R1;
                else if(left) nextstate = L1;
                      else nextstate = N0;// можно даже не писать, верно
        R1:    nextstate = R2;
        R2:    nextstate = R3;
        R3:    nextstate = N0;
        L1:    nextstate = L2;
        L2:    nextstate = L3;
        L3:    nextstate = N0;
        default: nextstate = N0;
  endcase

 
  
  assign la = (state == L1) || state == L2 || state == L3 ;
  assign lb = (state == L2) || state == L3;
  assign lc = (state == L3);
  
  assign ra = (state == R1) || state == R2 || state == R3;
  assign rb = (state == R2) || state == R3;  
  assign rc = (state == R3);        
endmodule 