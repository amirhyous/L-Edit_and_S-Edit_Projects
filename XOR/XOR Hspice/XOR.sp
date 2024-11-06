* Circuit Extracted by Tanner Research's L-Edit Version 8.30 / Extract Version 8.30 ;
* TDB File:  \\Mac\Windows files\CA1 (L-Edit)-VLSI-022\L_Edit\Layout_XOR.tdb
* Cell:  Cell0	Version 1.02
* Extract Definition File:  ..\CA1 Files\L-Edit\Tech\Part1\MHP_N05.EXT
* Extract Date and Time:  03/28/2024 - 03:31

* Warning:  Layers with Unassigned AREA Capacitance.
*   <allsubs>
*   <Poly Resistor>
*   <poly wire>
*   <N Diff Resistor>
*   <LPNP collector>
*   <n well wire>
*   <LPNP emitter>
*   <P Diff Resistor>
*   <N Well Resistor>
*   <subs>
*   <Metal1>
*   <Metal1-Tight>
*   <Metal2>
*   <Metal2-Tight>
* Warning:  Layers with Unassigned FRINGE Capacitance.
*   <Pad Comment>
*   <AllMetal1>
*   <allsubs>
*   <Poly Resistor>
*   <poly wire>
*   <N Diff Resistor>
*   <ndiff>
*   <LPNP collector>
*   <n well wire>
*   <LPNP emitter>
*   <pdiff>
*   <P Diff Resistor>
*   <N Well Resistor>
*   <subs>
*   <AllMetal2>
*   <Metal3>
*   <Metal1>
*   <Metal1-Tight>
*   <Metal2>
*   <Metal2-Tight>
* Warning:  Layers with Zero Resistance.
*   <Pad Comment>
*   <allsubs>
*   <poly wire>
*   <cap using Cap-Well>
*   <LPNP collector>
*   <n well wire>
*   <LPNP emitter>
*   <NMOS Capacitor>
*   <PMOS Capacitor>
*   <subs>
*   <Metal1>
*   <Metal1-Tight>
*   <Metal2>
*   <Metal2-Tight>

.inc '0.5micron.lib'

*****PARAMETERS*****
.param	vdd=5
.param t=1n

Cpar1 1 0 C=75.7995f
Cpar2 GND 0 C=73.8425f
Cpar3 3 0 C=112.437f
Cpar4 out 0 C=91.7185f
Cpar5 VDD 0 C=121.44725f
Cpar6 6 0 C=35.553f

*****INVERTER GATE*****
.SUBCKT	INV	Vin	Vout
M1	Vout	Vin	0	0	NMOS	L=4.5u W=5u 
M2	Vout	Vin	DD	DD	PMOS	L=4.5u W=5u 
Vsupply	DD	0	vdd
.ENDS	INV	

*****CIRCUIT*****
X1	A	9	INV
X2	B	8	INV

* Warning: Node 7 has zero nodal parasitic capacitance.
* Warning: Node 8 has zero nodal parasitic capacitance.
* Warning: Node 9 has zero nodal parasitic capacitance.
* Warning: Node 10 has zero nodal parasitic capacitance.
// 10 == A
// 9 == Ab
// 8 == Bb
// 7 == B
M1 out A 1 GND NMOS L=4.5u W=5u AD=23.75p PD=14.5u AS=35p PS=24u 
* M1 DRAIN GATE SOURCE BULK (-20.5 10.5 -16 15.5) 
M2 6 9 out GND NMOS L=4.5u W=5u AD=32.5p PD=18u AS=23.75p PS=14.5u 
* M2 DRAIN GATE SOURCE BULK (-6.5 10.5 -2 15.5) 
M3 GND 8 6 GND NMOS L=4.5u W=5u AD=32.5p PD=18u AS=32.5p PS=18u 
* M3 DRAIN GATE SOURCE BULK (11 10.5 15.5 15.5) 
M4 1 B GND GND NMOS L=4.5u W=5u AD=57.5p PD=33u AS=32.5p PS=18u 
* M4 DRAIN GATE SOURCE BULK (28.5 10.5 33 15.5) 
M5 3 A VDD VDD PMOS L=4.5u W=5u AD=23.75p PD=14.5u AS=37.5p PS=25u 
* M5 DRAIN GATE SOURCE BULK (-20.5 33.5 -16 38.5) 
M6 out 9 3 VDD PMOS L=4.5u W=5u AD=32.5p PD=18u AS=23.75p PS=14.5u 
* M6 DRAIN GATE SOURCE BULK (-6.5 33.5 -2 38.5) 
M7 3 8 out VDD PMOS L=4.5u W=5u AD=32.5p PD=18u AS=32.5p PS=18u 
* M7 DRAIN GATE SOURCE BULK (11 33.5 15.5 38.5) 
M8 VDD B 3 VDD PMOS L=4.5u W=5u AD=55p PD=32u AS=32.5p PS=18u 
* M8 DRAIN GATE SOURCE BULK (28.5 33.5 33 38.5) 

* Total Nodes: 10
* Total Elements: 14
* Total Number of Shorted Elements not written to the SPICE file: 0
* Extract Elapsed Time: 0 seconds

Vsupply	VDD	0	vdd
Vgnd	GND	0	0
*****Inputs:
Va A 0 Pulse 0 vdd 0 t t 1000n 2000n
Vb B 0 Pulse 0 vdd 0 t t 2000n 4000n


*****SIMULATION*****
.measure	tran	avg_power	AVg	POWER	from=0n		to=4000n

.measure	tran	trise	trig	V(out)	td=0.5u	val='vdd*0.1' cross=1
+targ	V(out)	td=0.5u	val='vdd*0.9' cross=1	

.measure	tran	tfall	trig	V(out)	td=2.5u	val='vdd*0.9' cross=1
+targ	V(out)	td=2.5u	val='vdd*0.1' cross=1


.op
.tran	1p	4000n
.OPTIONS post=2

.END
