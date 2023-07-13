module Figo_fsm (
  input clk,reset, move_input,
  output reg [2:0] current_location
);

  // Define the states
  parameter[2:0]
  ROOM0 = 3'b000,
  ROOM1 = 3'b001,
  ROOM2 = 3'b010,
  ROOM3 = 3'b011,
  ROOM4 = 3'b100,
  ROOM5 = 3'b101,
  ROOM6 = 3'b110,
  ROOM7 = 3'b111;
  
  //Internal state register
  reg[2:0] state;

  // Define the next state logic
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= ROOM0;
    end else begin
      case (state)
        ROOM0: begin
          if (move_input)
            state<= ROOM2;
          else
            state <= ROOM1;
        end
        ROOM1: begin
          if (move_input)
            state <= ROOM4;
          else
            state <= ROOM3;
        end
        ROOM2: begin
          if (move_input)
            state <= ROOM7;
          else
            state <= ROOM3;
        end
        ROOM3: begin
          if (move_input)
            state <= ROOM7;
          else
            state <= ROOM3;
        end
        ROOM4: begin
          if (move_input)
            state <= ROOM5;
          else
            state <= ROOM0;
        end
        ROOM5: begin
          if (move_input)
            state <= ROOM5;
          else
            state <= ROOM6;
        end
        ROOM6: begin
          if (move_input)
            state <= ROOM5;
          else
            state <= ROOM6;
        end
        ROOM7: begin
          if (move_input)
            state <= ROOM4;
          else
            state <= ROOM1;
        end
      endcase
    end
  end
  
  always @(state) begin
    case(state)
	 ROOM0:current_location=ROOM0;
         ROOM1:current_location=ROOM1;
	 ROOM2:current_location=ROOM2;
	 ROOM3:current_location=ROOM3;
	 ROOM4:current_location=ROOM4;
	 ROOM5:current_location=ROOM5;
	 ROOM6:current_location=ROOM6;
	 ROOM7:current_location=ROOM7;
	 endcase
	end
endmodule
