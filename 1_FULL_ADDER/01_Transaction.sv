class Transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  bit sum ,carry;
  bit exp_sum ,exp_carry;
  function void display(string name);
    $display("time =%0t %s A=%b B=%b Cin=%b sum=%b carry=%b",$time,name,a,b,cin,sum,carry);
  endfunction
endclass
