.include TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.09u

* .param width_N=1.8u
* .param width_N=3.6u
* .param width_N=18u
.param width_N=36u
.global vdd gnd
VDS D gnd 'SUPPLY'
VGS G gnd pulse 0 1.8 0ns 100ns 100ns 500us 1m
M1 D G gnd gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.tran 10n 1m
.control
run
let x=(-VDS#branch)
set curplottitle="id vs vgs"
plot x
.endc