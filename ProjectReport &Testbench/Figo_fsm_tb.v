module Figo_fsm_tb;
    
    reg clk, reset, move_input;
    wire [2:0] current_location;
    
    Figo_fsm fig (
        .clk(clk),
        .reset(reset),
        .move_input(move_input),
        .current_location(current_location)
    );
    // Clock generation
    always begin
       clk =0;
       #5;
      clk=1;
     #5;
    end
    
    
    // Stimulus generation
    initial begin
        // Test Case 1: Figo moves five times ('1-0-0-0-1')
      reset = 1;
      #5 reset = 0;
      move_input = 1;
       #10;
       move_input = 0;
        #10;
        move_input = 0;
        #10;
        move_input = 0;
        #10;
        move_input = 1;
        #10;
        $display($time , "Test case 1: Current Location = %b", current_location);
       //Test case 2:Figo moves five times ('1-1-0-1-1')
      reset=1;
     #10 reset=0;
       move_input = 1;
        #10;
        move_input = 1;
        #10;
        move_input = 0;
        #10;
        move_input = 1;
        #10;
        move_input = 1;
        #10;
       $display($time ,"Test case 2: Current Location = %b", current_location);
       //Test case 3:Figo moves five times ('0-1-0-1-0')
       reset = 1;
       #10 reset = 0;
       move_input = 0;
        #10;
        move_input = 1;
        #10;
        move_input = 0;
        #10;
        move_input = 1;
        #10;
        move_input = 0;
        #10;
       $display($time ,"Test case 3: Current Location = %b", current_location);
       //Test case 4:Figo moves five times ('0-1-1-1-0')
        reset = 1;
        #10 reset=0;
       move_input = 0;
        #10;
        move_input = 1;
        #10;
        move_input = 1;
        #10;
        move_input = 1;
        #10;
        move_input = 0;
        #10;
       $display($time ,"Test case 4: Current Location = %b", current_location);
      //Test case5:Figo moves five times ('1-1-0-0-1')
       reset = 1;
        #10 reset = 0;
       move_input = 1;
        #10;
        move_input = 1;
        #10;
        move_input = 0;
        #10;
        move_input = 0;
        #10;
        move_input = 1;
        #10;
        reset=1;
       $display($time ,"Test case 5: Current Location = %b", current_location);
		
        		  #10 $finish;
       
    end
	 
   endmodule
	  
    
