*cmos
.include TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param Width_N={20*LAMBDA}
.global vdd gnd
VGS G gnd 1.8
VDS D gnd 1
VBS B gnd 0
M1 D G gnd B CMOSN  W={width_N} L={2*LAMBDA} AS={5* LAMBDA *WIDTH_N}  AD={5*WIDTH_N*LAMBDA} PS ={10*LAMBDA +2*WIDTH_N} PD={10*LAMBDA+ 2*WIDTH_N}
.dc VGS 0 1.8 0.1

.control
run
let x =-VDS#branch
plot x
plot sqrt(x)
plot deriv(sqrt(x))
.endc
