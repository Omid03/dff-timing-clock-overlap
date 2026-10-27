Part1
**********************************Libs**********************************
.lib	'mm018.l'	tt
*********************************INPUTS*********************************
Vs	vdd	GND	vd
Vcl	clk	0	Pulse	0	vd	0	t	t	5n	10n
VR	rst	GND	vd
*********************************Inverter*******************************
.SUBCKT	INV	in	out
M1	out	in	0	0	nch	L=Lmin	W=Wnmos
M2	out	in	Vdin	Vdin	pch	L=Lmin	W=Wpmos
Vsupply	Vdin	0	vd
.ENDS INV
**********************************DFF***********************************
*******************PMOS*******************
M1	A	clk	N1	vdd	pch	L=Lmin	W='Wpmos*2'
M2	N1	Qb	vdd	vdd	pch	L=Lmin	W='Wpmos*2'
M3	N4	clk	vdd	vdd	pch	L=Lmin	W='Wpmos*2'
M13	B	A	N4	vdd	pch	L=Lmin	W='Wpmos*2'
M4	B	rst	vdd	vdd	pch	L=Lmin	W=Wpmos
M5	Qb	B	vdd	vdd	pch	L=Lmin	W=Wpmos
M6	Q	Qb	vdd	vdd	pch	L=Lmin	W=Wpmos
*******************NMOS*******************
M7	A	Qb	GND	GND	nch	L=Lmin	W=Wnmos
M8	N2	clk	GND	GND	nch	L=Lmin	W='Wnmos*2'
M9	B	A	N2	GND	nch	L=Lmin	W='Wnmos*2'
M10	N3	B	GND	GND	nch	L=Lmin	W='Wnmos*2'
M11	Qb	clk	N3	GND	nch	L=Lmin	W='Wnmos*2'
M12	Q	Qb	GND	GND	nch	L=Lmin	W=Wnmos
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ Wmin = 220n
+ Wnmos = Wmin
+ Wpmos = '2*Wmin'
+ vd = 1.8V
+ t = 50p
+ tsetup = 113p
+ thold = 900p
******************************SIMULATION********************************
.op
.tran	    1p	    800n
.print	V(Q)