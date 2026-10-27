Part2
**********************************Libs**********************************
.inc	'32nm_bulk.pm'	32n
*********************************INPUTS*********************************
Vs	vdd	GND	vd
Vcl	clk	0	Pulse	0	vd	0	t	t	3n	6n
VD	D	GND	Pulse	0	vd	0	t	t	'30n-t-tsetup'	30n	
*********************************Inverter*******************************
.SUBCKT	INV	in	out
M1	out	in	GND	GND	nmos	L=Lmin	W=Wnmos
M2	out	in	vdd	vdd	pmos	L=Lmin	W=Wpmos
Vd	vdd	GND	vd
.ENDS INV
************************************TG**********************************
.SUBCKT	TG	in1	in2	in3	out
M1	out	in2	in1	vdd	pmos	L=Lmin	W=Wpmos
M2	out	in3	in1	GND	nmos	L=Lmin	W=Wnmos
Vd	vdd	GND	vd
.ENDS TG
**********************************TGDFF*********************************
X1	D	clk	clkb	N1	TG
X2	N1	N1p		INV
X3	N1p	clkb	clk	N2	TG
X4	N2	Q		INV
X5	clk	N3		INV
X6	N3	N4		INV
X7	N4	N5		INV
X8	N5	N6		INV
X9	N6	N7		INV
X10	N7	N8		INV
X11	N8	N9		INV
X12	N9	N10		INV
X13	N10	clkb	INV
*******************************CAPACITOR********************************
C1	N1	GND	10f
C2	N2	GND	10f
*******************************PARAMETERS*******************************
.param  Lmin = 32n
+ Wmin = '3*Lmin'
+ Wnmos = Wmin
+ Wpmos = '2*Wmin'
+ vd = 1V
+ t = 80p
+ tsetup = 150p
******************************SIMULATION********************************
.op
.tran	    1p	    160n
.print	V(D)	V(Q)	V(clk)	