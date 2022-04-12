module testbench(); 
  logic        clk, reset;
  logic        W, S, A, D, WIN, DIE, WIN_exp, DIE_exp;
  logic [5:0]  expected;
  logic [31:0] vectornum, errors;
  logic [7:0]  testvectors[10000:0];
  

// инстанцировать тестируемое устройство 
map dut(clk, reset, W, S, A, D, WIN, DIE); 

// generate clock 
always 
  begin
    clk=1; #5; clk=0; #5; 
  end 

// на старте теста, загрузите вектора и запустите сброс
initial 
  begin
    $readmemb("hero_die.tv", testvectors); 
    vectornum = 0; errors = 0; reset = 1; #22; reset = 0; 
  end 

// применение тестовых векторов по нарастающему фронту тактового сигнала
always @(posedge clk) 
  begin
    #1; {W, S, A, D, WIN_exp, DIE_exp} = testvectors[vectornum]; 
  end 

// проверка результатов по спадающему фронту сигнала clk
always @(negedge clk) 
  if (~reset) begin    // skip during reset
    if (WIN !== WIN_exp | DIE !== DIE_exp ) begin // check result 
      $display("Error: inputs = %b %b %b %b (%b %b expected)", W, S, A, D, WIN_exp, DIE_exp);
      $display(" outputs = (%b %b)", WIN, DIE); 
      errors = errors + 1; 
    end
    vectornum = vectornum + 1;
	 
	 if (WIN === WIN_exp & DIE === DIE_exp & WIN === 1'b1 & DIE === 1'b0) $display("WIN");
	 else if (WIN === WIN_exp & DIE === DIE_exp & WIN === 1'b0 & DIE === 1'b1) $display("DIE");
		
    if (testvectors[vectornum] === 6'bx) begin 
      $display("%d tests completed with %d errors", vectornum, errors); 
      $stop; 
    end 
  end 
endmodule 