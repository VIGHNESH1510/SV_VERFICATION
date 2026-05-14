xcelium> source /xcelium25.03/tools/xcelium/files/xmsimrc
xcelium> run
time =0 GENERATOR A=1 B=0 Cin=1 sum=0 carry=0
time =0 DRIVER , inputs applied
time =5 GENERATOR A=0 B=0 Cin=0 sum=0 carry=0
time =5 DRIVER , inputs applied
time =5 Monitor A=0 B=0 Cin=0 sum=0 carry=1
time =5 TEST CASE PASSED 

time =10 GENERATOR A=0 B=1 Cin=0 sum=0 carry=0
time =10 DRIVER , inputs applied
time =10 Monitor A=0 B=1 Cin=0 sum=0 carry=0
time =10 TEST CASE PASSED 

time =15 GENERATOR A=1 B=0 Cin=1 sum=0 carry=0
time =15 DRIVER , inputs applied
time =15 Monitor A=1 B=0 Cin=1 sum=1 carry=0
time =15 TEST CASE PASSED 

time =20 GENERATOR A=1 B=1 Cin=1 sum=0 carry=0
time =20 DRIVER , inputs applied
time =20 Monitor A=1 B=1 Cin=1 sum=0 carry=1
time =20 TEST CASE PASSED 

time =25 GENERATOR A=1 B=1 Cin=1 sum=0 carry=0
time =25 DRIVER , inputs applied
time =25 Monitor A=1 B=1 Cin=1 sum=1 carry=1
time =25 TEST CASE PASSED 

time =30 GENERATOR A=0 B=0 Cin=0 sum=0 carry=0
time =30 DRIVER , inputs applied
time =30 Monitor A=0 B=0 Cin=0 sum=1 carry=1
time =30 TEST CASE PASSED 

time =35 GENERATOR A=1 B=0 Cin=0 sum=0 carry=0
time =35 DRIVER , inputs applied
time =35 Monitor A=1 B=0 Cin=0 sum=0 carry=0
time =35 TEST CASE PASSED 

time =40 GENERATOR A=0 B=0 Cin=0 sum=0 carry=0
time =40 DRIVER , inputs applied
time =40 Monitor A=0 B=0 Cin=0 sum=1 carry=0
time =40 TEST CASE PASSED 

time =45 GENERATOR A=0 B=1 Cin=0 sum=0 carry=0
time =45 DRIVER , inputs applied
time =45 Monitor A=0 B=1 Cin=0 sum=0 carry=0
time =45 TEST CASE PASSED 

time =50 GENERATOR A=1 B=1 Cin=1 sum=0 carry=0
time =50 DRIVER , inputs applied
time =50 Monitor A=1 B=1 Cin=1 sum=1 carry=0
time =50 TEST CASE PASSED 

time =55 GENERATOR A=1 B=0 Cin=0 sum=0 carry=0
time =55 DRIVER , inputs applied
time =55 Monitor A=1 B=0 Cin=0 sum=1 carry=1
time =55 TEST CASE PASSED 

time =60 GENERATOR A=1 B=1 Cin=0 sum=0 carry=0
time =60 DRIVER , inputs applied
time =60 Monitor A=1 B=1 Cin=0 sum=1 carry=0
time =60 TEST CASE PASSED 

time =65 GENERATOR A=1 B=0 Cin=0 sum=0 carry=0
time =65 DRIVER , inputs applied
time =65 Monitor A=1 B=0 Cin=0 sum=0 carry=1
time =65 TEST CASE PASSED 

time =70 GENERATOR A=1 B=1 Cin=0 sum=0 carry=0
time =70 DRIVER , inputs applied
time =70 Monitor A=1 B=1 Cin=0 sum=1 carry=0
time =70 TEST CASE PASSED 

time =75 GENERATOR A=1 B=1 Cin=0 sum=0 carry=0
time =75 DRIVER , inputs applied
time =75 Monitor A=1 B=1 Cin=0 sum=0 carry=1
time =75 TEST CASE PASSED 

time =80 GENERATOR A=1 B=1 Cin=1 sum=0 carry=0
time =80 DRIVER , inputs applied
time =80 Monitor A=1 B=1 Cin=1 sum=0 carry=1
time =80 TEST CASE PASSED 

time =85 GENERATOR A=1 B=1 Cin=0 sum=0 carry=0
time =85 DRIVER , inputs applied
time =85 Monitor A=1 B=1 Cin=0 sum=1 carry=1
time =85 TEST CASE PASSED 

time =90 GENERATOR A=1 B=0 Cin=0 sum=0 carry=0
time =90 DRIVER , inputs applied
time =90 Monitor A=1 B=0 Cin=0 sum=0 carry=1
time =90 TEST CASE PASSED 

time =95 GENERATOR A=0 B=1 Cin=0 sum=0 carry=0
time =95 DRIVER , inputs applied
time =95 Monitor A=0 B=1 Cin=0 sum=1 carry=0
time =95 TEST CASE PASSED 

Simulation complete via $finish(1) at time 100 NS + 0
./testbench.sv:28       $finish;
xcelium> exit
