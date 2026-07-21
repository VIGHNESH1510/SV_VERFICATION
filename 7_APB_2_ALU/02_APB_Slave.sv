`include "ALU.sv"
module APB_slave #(parameter d_w=8,a_w=8)(
  
  input PCLK,PRESETn,PWRITE,PSELx,PENABLE,
  input [d_w-1:0] PWDATA,
  input [a_w-1:0] PADDR,
  output reg [d_w-1:0] PRDATA,
  output reg PREADY
  
);
  
 
  
localparam ADDR_A = 8'h00;
localparam ADDR_B = 8'h04;
localparam ADDR_OPCODE = 8'h08;
localparam ADDR_RESULT = 8'h0C;
localparam ADDR_FLAG = 8'h10;
  
reg [d_w-1:0] A_reg;
reg [d_w-1:0] B_reg;
reg [d_w-1:0] opcode_reg;

wire [d_w-1:0] result;
wire [d_w-1:0] flag;
  
 ALU #(d_w) alu_inst(
    .A(A_reg),
    .B(B_reg),
    .opcode(opcode_reg),
    .result(result),
    .flag(flag)); 
  
  

  always @(posedge PCLK or negedge PRESETn)
    begin
      if(!PRESETn) begin
        A_reg <=0;
        B_reg <=0;
        opcode_reg <=0;
      end
      else if(PSELx && PENABLE && PWRITE)
        begin

          case(PADDR)
            ADDR_A: A_reg <= PWDATA;
            
            ADDR_B: B_reg <= PWDATA;
            
            ADDR_OPCODE: opcode_reg <= PWDATA[d_w-1:0];
          endcase
        end
        
    end
  
always @(*)
begin
  
    case(PADDR)
        ADDR_A: PRDATA = A_reg;

        ADDR_B: PRDATA = B_reg;

        ADDR_OPCODE: PRDATA = opcode_reg;

        ADDR_RESULT: PRDATA = result;

        ADDR_FLAG: PRDATA = flag;

        default: PRDATA = 0;
    endcase
end

always @(*) begin
    if (PSELx && PENABLE)
      PREADY = 1;
    else
      PREADY = 0;
  end

endmodule
