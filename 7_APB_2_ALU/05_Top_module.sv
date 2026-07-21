
`include "APB_master.sv"
`include "APB_slave.sv"
`include "interface.sv"
module top_module #(parameter d_w =8 , a_w=8)(
  signals sig
);
  
//   wire [a_w-1:0] PADDR;
//   wire [d_w-1:0] PWDATA;
//   wire [d_w-1:0] PRDATA;
//   wire PWRITE;
//   wire PSELx;
//   wire PENABLE;
//   wire PREADY;
  
  APB_master #( d_w,a_w) ins1(
    .PCLK(sig.PCLK),
    .PRESETn(sig.PRESETn),
    .transfer(sig.transfer),
    .READ_WRITE(sig.READ_WRITE),
    .PREADY(sig.PREADY),
    .PRDATA(sig.PRDATA),
    .apb_write_add(sig.apb_write_add), 
    .apb_read_add(sig.apb_read_add),
    .apb_write_data(sig.apb_write_data),
    .PADDR(sig.PADDR),
    .PWDATA(sig.PWDATA),
    .apb_read_data_out(sig.apb_read_data_out),
    .PWRITE(sig.PWRITE),
    .PSELx(sig.PSELx),
    .PENABLE(sig.PENABLE));
    
    
  APB_slave #(d_w,a_w) ins2(
    .PCLK(sig.PCLK),
    .PRESETn(sig.PRESETn),
    .PWRITE(sig.PWRITE),
    .PSELx(sig.PSELx),
    .PENABLE(sig.PENABLE),
    .PWDATA(sig.PWDATA),
    .PADDR(sig.PADDR),
    .PRDATA(sig.PRDATA),
    .PREADY(sig.PREADY));
 
      
endmodule 
