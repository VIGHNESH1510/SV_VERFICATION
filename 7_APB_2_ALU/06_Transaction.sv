class transaction #(parameter d_w =8 , a_w =8);
  
  bit read_write;
  rand bit [d_w-1:0]data;
  bit [a_w-1:0] address;
  bit [d_w-1:0] result;
  
  
endclass
