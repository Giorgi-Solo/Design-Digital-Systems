
g
Command: %s
1870*	planAhead22
open_checkpoint bft_routed.dcp2default:defaultZ12-2866h px? 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.09 ; elapsed = 00:00:00.09 . Memory (MB): peak = 2110.723 ; gain = 0.000 ; free physical = 880 ; free virtual = 40102default:defaulth px? 
V
Loading part %s157*device2#
xc7k70tfbg484-22default:defaultZ21-403h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.052default:default2
2112.8282default:default2
0.0002default:default2
5872default:default2
37322default:defaultZ17-722h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1282default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2020.12default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
L
*Restoring timing data from binary archive.264*timingZ38-478h px? 
F
$Binary timing data restore complete.265*timingZ38-479h px? 
L
*Restoring constraints from binary archive.481*projectZ1-856h px? 
E
#Binary constraint restore complete.478*projectZ1-853h px? 
?
Reading XDEF placement.
206*designutilsZ20-206h px? 
D
Reading placer database...
1602*designutilsZ20-1892h px? 
=
Reading XDEF routing.
207*designutilsZ20-207h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
Read XDEF File: 2default:default2
00:00:00.372default:default2
00:00:00.712default:default2
2417.7152default:default2
5.9382default:default2
1282default:default2
31002default:defaultZ17-722h px? 
?
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
0.4300002default:default2
6.5275652default:defaultZ20-1924h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common20
Finished XDEF File Restore: 2default:default2
00:00:00.372default:default2
00:00:00.712default:default2
2417.7152default:default2
5.9382default:default2
1282default:default2
31002default:defaultZ17-722h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2417.7152default:default2
0.0002default:default2
1282default:default2
31002default:defaultZ17-722h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
'Checkpoint was created with %s build %s378*project2+
Vivado v2020.1 (64-bit)2default:default2
29025402default:defaultZ1-604h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
open_checkpoint: 2default:default2
00:00:142default:default2
00:00:182default:default2
2417.7152default:default2
306.9922default:default2
1272default:default2
30992default:defaultZ17-722h px? 
c
Command: %s
53*	vivadotcl22
write_bitstream -force bft.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
G
"No user IP repositories specified
1154*coregenZ19-1704h px? 
?
"Loaded Vivado IP repository '%s'.
1332*coregen27
#/tools/Xilinx/Vivado/2020.1/data/ip2default:defaultZ19-2313h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[0].ct/xOutReg_reg	%arnd1/transformLoop[0].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[0].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[0].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[0].ct/xOutStepReg_reg	)arnd1/transformLoop[0].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[0].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[0].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[1].ct/xOutReg_reg	%arnd1/transformLoop[1].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[1].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[1].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[1].ct/xOutStepReg_reg	)arnd1/transformLoop[1].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[1].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[1].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[2].ct/xOutReg_reg	%arnd1/transformLoop[2].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[2].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[2].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[2].ct/xOutStepReg_reg	)arnd1/transformLoop[2].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[2].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[2].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[3].ct/xOutReg_reg	%arnd1/transformLoop[3].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[3].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[3].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[3].ct/xOutStepReg_reg	)arnd1/transformLoop[3].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[3].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[3].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[4].ct/xOutReg_reg	%arnd1/transformLoop[4].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[4].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[4].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[4].ct/xOutStepReg_reg	)arnd1/transformLoop[4].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[4].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[4].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[5].ct/xOutReg_reg	%arnd1/transformLoop[5].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[5].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[5].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[5].ct/xOutStepReg_reg	)arnd1/transformLoop[5].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[5].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[5].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[6].ct/xOutReg_reg	%arnd1/transformLoop[6].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[6].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[6].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[6].ct/xOutStepReg_reg	)arnd1/transformLoop[6].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[6].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[6].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd1/transformLoop[7].ct/xOutReg_reg	%arnd1/transformLoop[7].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd1/transformLoop[7].ct/xOutReg_reg/P[47:0]'arnd1/transformLoop[7].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd1/transformLoop[7].ct/xOutStepReg_reg	)arnd1/transformLoop[7].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd1/transformLoop[7].ct/xOutStepReg_reg/P[47:0]+arnd1/transformLoop[7].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct0/xOutReg_reg	arnd2/ct0/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct0/xOutReg_reg/P[47:0]arnd2/ct0/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct0/xOutStepReg_reg	arnd2/ct0/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct0/xOutStepReg_reg/P[47:0]arnd2/ct0/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct1/xOutReg_reg	arnd2/ct1/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct1/xOutReg_reg/P[47:0]arnd2/ct1/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct1/xOutStepReg_reg	arnd2/ct1/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct1/xOutStepReg_reg/P[47:0]arnd2/ct1/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct2/xOutReg_reg	arnd2/ct2/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct2/xOutReg_reg/P[47:0]arnd2/ct2/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct2/xOutStepReg_reg	arnd2/ct2/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct2/xOutStepReg_reg/P[47:0]arnd2/ct2/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct3/xOutReg_reg	arnd2/ct3/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct3/xOutReg_reg/P[47:0]arnd2/ct3/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct3/xOutStepReg_reg	arnd2/ct3/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct3/xOutStepReg_reg/P[47:0]arnd2/ct3/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct4/xOutReg_reg	arnd2/ct4/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct4/xOutReg_reg/P[47:0]arnd2/ct4/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct4/xOutStepReg_reg	arnd2/ct4/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct4/xOutStepReg_reg/P[47:0]arnd2/ct4/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct5/xOutReg_reg	arnd2/ct5/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct5/xOutReg_reg/P[47:0]arnd2/ct5/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct5/xOutStepReg_reg	arnd2/ct5/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct5/xOutStepReg_reg/P[47:0]arnd2/ct5/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct6/xOutReg_reg	arnd2/ct6/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct6/xOutReg_reg/P[47:0]arnd2/ct6/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct6/xOutStepReg_reg	arnd2/ct6/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct6/xOutStepReg_reg/P[47:0]arnd2/ct6/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2X
 "B
arnd2/ct7/xOutReg_reg	arnd2/ct7/xOutReg_reg2default:default2default:default2b
 "L
arnd2/ct7/xOutReg_reg/P[47:0]arnd2/ct7/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2`
 "J
arnd2/ct7/xOutStepReg_reg	arnd2/ct7/xOutStepReg_reg2default:default2default:default2j
 "T
!arnd2/ct7/xOutStepReg_reg/P[47:0]arnd2/ct7/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[0].ct0/xOutReg_reg	&arnd3/transformLoop[0].ct0/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[0].ct0/xOutReg_reg/P[47:0](arnd3/transformLoop[0].ct0/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[0].ct0/xOutStepReg_reg	*arnd3/transformLoop[0].ct0/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[0].ct0/xOutStepReg_reg/P[47:0],arnd3/transformLoop[0].ct0/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[0].ct1/xOutReg_reg	&arnd3/transformLoop[0].ct1/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[0].ct1/xOutReg_reg/P[47:0](arnd3/transformLoop[0].ct1/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[0].ct1/xOutStepReg_reg	*arnd3/transformLoop[0].ct1/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[0].ct1/xOutStepReg_reg/P[47:0],arnd3/transformLoop[0].ct1/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[1].ct0/xOutReg_reg	&arnd3/transformLoop[1].ct0/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[1].ct0/xOutReg_reg/P[47:0](arnd3/transformLoop[1].ct0/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[1].ct0/xOutStepReg_reg	*arnd3/transformLoop[1].ct0/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[1].ct0/xOutStepReg_reg/P[47:0],arnd3/transformLoop[1].ct0/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[1].ct1/xOutReg_reg	&arnd3/transformLoop[1].ct1/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[1].ct1/xOutReg_reg/P[47:0](arnd3/transformLoop[1].ct1/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[1].ct1/xOutStepReg_reg	*arnd3/transformLoop[1].ct1/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[1].ct1/xOutStepReg_reg/P[47:0],arnd3/transformLoop[1].ct1/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[2].ct0/xOutReg_reg	&arnd3/transformLoop[2].ct0/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[2].ct0/xOutReg_reg/P[47:0](arnd3/transformLoop[2].ct0/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[2].ct0/xOutStepReg_reg	*arnd3/transformLoop[2].ct0/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[2].ct0/xOutStepReg_reg/P[47:0],arnd3/transformLoop[2].ct0/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[2].ct1/xOutReg_reg	&arnd3/transformLoop[2].ct1/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[2].ct1/xOutReg_reg/P[47:0](arnd3/transformLoop[2].ct1/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[2].ct1/xOutStepReg_reg	*arnd3/transformLoop[2].ct1/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[2].ct1/xOutStepReg_reg/P[47:0],arnd3/transformLoop[2].ct1/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[3].ct0/xOutReg_reg	&arnd3/transformLoop[3].ct0/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[3].ct0/xOutReg_reg/P[47:0](arnd3/transformLoop[3].ct0/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[3].ct0/xOutStepReg_reg	*arnd3/transformLoop[3].ct0/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[3].ct0/xOutStepReg_reg/P[47:0],arnd3/transformLoop[3].ct0/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2z
 "d
&arnd3/transformLoop[3].ct1/xOutReg_reg	&arnd3/transformLoop[3].ct1/xOutReg_reg2default:default2default:default2?
 "n
.arnd3/transformLoop[3].ct1/xOutReg_reg/P[47:0](arnd3/transformLoop[3].ct1/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "l
*arnd3/transformLoop[3].ct1/xOutStepReg_reg	*arnd3/transformLoop[3].ct1/xOutStepReg_reg2default:default2default:default2?
 "v
2arnd3/transformLoop[3].ct1/xOutStepReg_reg/P[47:0],arnd3/transformLoop[3].ct1/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[0].ct/xOutReg_reg	%arnd4/transformLoop[0].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[0].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[0].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[0].ct/xOutStepReg_reg	)arnd4/transformLoop[0].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[0].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[0].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[1].ct/xOutReg_reg	%arnd4/transformLoop[1].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[1].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[1].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[1].ct/xOutStepReg_reg	)arnd4/transformLoop[1].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[1].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[1].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[2].ct/xOutReg_reg	%arnd4/transformLoop[2].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[2].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[2].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[2].ct/xOutStepReg_reg	)arnd4/transformLoop[2].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[2].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[2].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[3].ct/xOutReg_reg	%arnd4/transformLoop[3].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[3].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[3].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[3].ct/xOutStepReg_reg	)arnd4/transformLoop[3].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[3].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[3].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[4].ct/xOutReg_reg	%arnd4/transformLoop[4].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[4].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[4].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[4].ct/xOutStepReg_reg	)arnd4/transformLoop[4].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[4].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[4].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[5].ct/xOutReg_reg	%arnd4/transformLoop[5].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[5].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[5].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[5].ct/xOutStepReg_reg	)arnd4/transformLoop[5].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[5].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[5].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[6].ct/xOutReg_reg	%arnd4/transformLoop[6].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[6].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[6].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[6].ct/xOutStepReg_reg	)arnd4/transformLoop[6].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[6].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[6].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2x
 "b
%arnd4/transformLoop[7].ct/xOutReg_reg	%arnd4/transformLoop[7].ct/xOutReg_reg2default:default2default:default2?
 "l
-arnd4/transformLoop[7].ct/xOutReg_reg/P[47:0]'arnd4/transformLoop[7].ct/xOutReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "j
)arnd4/transformLoop[7].ct/xOutStepReg_reg	)arnd4/transformLoop[7].ct/xOutStepReg_reg2default:default2default:default2?
 "t
1arnd4/transformLoop[7].ct/xOutStepReg_reg/P[47:0]+arnd4/transformLoop[7].ct/xOutStepReg_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[10]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[10]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[5]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[5]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[5]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[11]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[11]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[6]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[6]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[6]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[12]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[12]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[7]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[7]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[7]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[13]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[13]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[8]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[8]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[8]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[14]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[14]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[9]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[9]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[9]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[5]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[5]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[0]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[0]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[0]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[6]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[6]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[1]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[1]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[1]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[7]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[7]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[2]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[2]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[2]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[8]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[8]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[3]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[3]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[3]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[9]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRARDADDR[9]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[4]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr[4]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[4]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.wr_addr_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[10]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[10]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[5]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[5]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[5]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[11]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[11]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[6]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[6]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[6]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[12]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[12]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[7]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[7]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[7]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[13]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[13]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[8]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[8]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[8]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[14]begressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[14]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[9]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[9]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[9]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[5]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[5]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[0]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[0]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[0]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[6]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[6]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[1]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[1]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[1]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[7]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[7]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[2]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[2]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[2]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[8]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[8]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[3]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[3]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[3]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg	RegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg2default:default2default:default2?
 "?
aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[9]aegressLoop[0].egressFifo/buffer_fifo/infer_fifo.block_ram_performance.fifo_ram_reg/ADDRBWRADDR[9]2default:default2default:default2?
 "?
:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[4]:egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr[4]2default:default2default:default2?
 "?
>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[4]	>egressLoop[0].egressFifo/buffer_fifo/infer_fifo.rd_addr_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 86 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
82default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
Z
Writing bitstream %s...
11*	bitstream2
	./bft.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
?
?'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2?
?/home/giorgi/Desktop/ass3/Vivado_Tutorial/Tutorial_Created_Data/project_bft/project_bft.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Fri Sep  9 13:17:54 20222default:default2M
9/tools/Xilinx/Vivado/2020.1/doc/webtalk_introduction.html2default:defaultZ17-186h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
862default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:192default:default2
00:00:232default:default2
2874.5552default:default2
456.8402default:default2
4282default:default2
31042default:defaultZ17-722h px? 


End Record