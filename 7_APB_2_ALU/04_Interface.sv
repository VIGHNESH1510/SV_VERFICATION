interface signals #(parameter d_w =8, a_w =8, N=8)(input logic PCLK);
  
  logic  PRESETn, transfer, READ_WRITE, PREADY;
  logic [d_w-1:0]PRDATA;
  logic [a_w-1:0] apb_write_add, apb_read_add;
  logic [d_w-1:0] apb_write_data;
  logic [a_w-1:0]PADDR;
  logic [d_w-1:0]PWDATA;
  logic [d_w-1:0]apb_read_data_out;
  logic PWRITE,PSELx,PENABLE;
 
  
  logic [N-1:0]A,B;
  logic [N-1:0] opcode;
  logic [N-1:0]result;
  logic [N-1:0]flag;
  
  
endinterface
