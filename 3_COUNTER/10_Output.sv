xcelium> source /xcelium25.03/tools/xcelium/files/xmsimrc
xcelium> run
[GEN] time=15 up_down=0 
[DRI] time =20 , up_down =0
[GEN] time=25 up_down=0 
[MON] time=26 rst=0 up_down=0 out=15
[SCB] time=26 rst=0 up_down=0 expected=15 actual=15
[PASS] 

[DRI] time =30 , up_down =0
[GEN] time=35 up_down=0 
[MON] time=36 rst=0 up_down=0 out=14
[SCB] time=36 rst=0 up_down=0 expected=14 actual=14
[PASS] 

[DRI] time =40 , up_down =0
[GEN] time=45 up_down=0 
[MON] time=46 rst=0 up_down=0 out=13
[SCB] time=46 rst=0 up_down=0 expected=13 actual=13
[PASS] 

[DRI] time =50 , up_down =0
[GEN] time=55 up_down=1 
[MON] time=56 rst=0 up_down=0 out=12
[SCB] time=56 rst=0 up_down=0 expected=12 actual=12
[PASS] 

[DRI] time =60 , up_down =1
[GEN] time=65 up_down=1 
[MON] time=66 rst=1 up_down=1 out=0
[SCB] time=66 RESET detected , expected=0
[SCB] time=66 rst=1 up_down=1 expected=0 actual=0
[PASS] 

[DRI] time =70 , up_down =1
[GEN] time=75 up_down=0 
[MON] time=76 rst=0 up_down=1 out=1
[SCB] time=76 rst=0 up_down=1 expected=1 actual=1
[PASS] 

[DRI] time =80 , up_down =0
[GEN] time=85 up_down=1 
[MON] time=86 rst=0 up_down=0 out=0
[SCB] time=86 rst=0 up_down=0 expected=0 actual=0
[PASS] 

[DRI] time =90 , up_down =1
[GEN] time=95 up_down=1 
[MON] time=96 rst=0 up_down=1 out=1
[SCB] time=96 rst=0 up_down=1 expected=1 actual=1
[PASS] 

[DRI] time =100 , up_down =1
[GEN] time=105 up_down=1 
[MON] time=106 rst=0 up_down=1 out=2
[SCB] time=106 rst=0 up_down=1 expected=2 actual=2
[PASS] 

[DRI] time =110 , up_down =1
[GEN] time=115 up_down=0 
[MON] time=116 rst=0 up_down=1 out=3
[SCB] time=116 rst=0 up_down=1 expected=3 actual=3
[PASS] 

[DRI] time =120 , up_down =0
[GEN] time=125 up_down=1 
[MON] time=126 rst=0 up_down=0 out=2
[SCB] time=126 rst=0 up_down=0 expected=2 actual=2
[PASS] 

[DRI] time =130 , up_down =1
[GEN] time=135 up_down=0 
[MON] time=136 rst=0 up_down=1 out=3
[SCB] time=136 rst=0 up_down=1 expected=3 actual=3
[PASS] 

[DRI] time =140 , up_down =0
[GEN] time=145 up_down=0 
[MON] time=146 rst=0 up_down=0 out=2
[SCB] time=146 rst=0 up_down=0 expected=2 actual=2
[PASS] 

[DRI] time =150 , up_down =0
[GEN] time=155 up_down=0 
[MON] time=156 rst=0 up_down=0 out=1
[SCB] time=156 rst=0 up_down=0 expected=1 actual=1
[PASS] 

[DRI] time =160 , up_down =0
[GEN] time=165 up_down=1 
[MON] time=166 rst=0 up_down=0 out=0
[SCB] time=166 rst=0 up_down=0 expected=0 actual=0
[PASS] 

[DRI] time =170 , up_down =1
==============================
  TOTAL PASSED : 15
  TOTAL FAILED : 0
==============================
Simulation complete via $finish(1) at time 175 NS + 0
./testbench.sv:67     $finish;
