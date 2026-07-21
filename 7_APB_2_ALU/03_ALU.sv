module ALU #(parameter N=8)(input [N-1:0]A,B,
                            input [N-1:0] opcode, 
                            output reg [N-1:0]result,
                            output reg [N-1:0]flag);
  
  always @(*) begin
    flag = 0;
    case(opcode)
      3'd0: {flag[0],result} = A+B;
      3'd1: {flag[1],result} = A-B;
      3'd2: result = ~A;
      3'd3: result = A | B;
      3'd4: result = A ^ B;
      3'd5: result = A >> 1;
      3'd6: result = B << 1;
      default: result = 0;
    endcase
  end
  
  
endmodule
