
.include TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param Width_N={20*LAMBDA}
.global vdd gnd
VGS G gnd 'SUPPLY'
VDS1 D1 gnd 'SUPPLY'
VDS2 D2 gnd 'SUPPLY'

M2 D1 G S gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*Width_N*LAMBDA} AD={5*Width_N*LAMBDA} PS={10*LAMBDA+2*Width_N}
+PD={10*LAMBDA+2*Width_N}

M3 S G gnd gnd  CMOSN W={width_N} L={2*LAMBDA} AS={5*Width_N*LAMBDA} AD={5*Width_N*LAMBDA} PS={10*LAMBDA+2*Width_N}
+PD={10*LAMBDA+2*Width_N}

M1 D2 G gnd gnd CMOSN W={width_N} L={4*LAMBDA} AS={5*Width_N*LAMBDA} AD={5*Width_N*LAMBDA} PS={10*LAMBDA+2*Width_N}
+PD={10*LAMBDA+2*Width_N}

.dc VDS2 0 1.8 0.1
.control
set colro0=white
set colro1=black
run
plot -VDS2#branch
.endc
