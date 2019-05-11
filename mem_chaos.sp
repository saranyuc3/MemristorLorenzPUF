* MEMRISTOR
* Ron, Roff - Resistance in ON / OFF States
* Rinit - Resistance at T=0
* D - Width of the thin film
* uv - Migration coefficient
* p - Parameter of the WINDOW-function
* for modeling nonlinear boundary conditions
* x - W/D Ratio, W is the actual width
* of the doped area (from 0 to D)
.include 'challenge_5000.txt'
.OPTION PROBE
*.PARAM s0=.9  s1=.1
.param cf=0.75f
*.PARAM v0 =1.95 Roff =12100 x0 =0.1
*+vth0='v0/2' vth1 ='v0/2'
* Other parameters :
*.PARAM Ron=121 
*+delta_R='Roff-Ron'
.PARAM Cx=50e-9 
+f0=10 
+delta_v =0.001
.PARAM D=10n 
+mu=1e-14 
+k='(mu*Ron/(D*D) )'
*.param roff= agauss(16k,0.8k,3)
.param roff= 16k
*.param ron= agauss(100,5,3)
.param ron= 100
*.param cs= agauss(0.75f,0.1f,3)
.param cs= 0.75f
*.param va= agauss(5,1.25,3)
.param va= 5
*.param supply= agauss(0.1,0.025,3)
.param supply= 0.1
*.param lorenz_c= agauss(50f,2.5f,3)
.param lorenz_c= 50f
*.param lorenz_r= agauss(1k,50,3)
.param lorenz_r= 1k
*.param vth0= agauss(0.471,0.02355,3)
.param vth0=0.471
*.param T= aunif(50,50)
.param T=27
.option RUNLVL=0
.SUBCKT memristor Plus Minus
+ Ron='ron' Roff='roff' Rinit=11K D=10N uv=10F p=10

* DIFFERENTIAL EQUATION MODELING *

.PARAM f(x,p)= '1-pow((2*x-1),(2*p))'
Gx 0 x value='I(Emem)*uv*Ron/pow(D,2)*f(V(x),p)'
Cx x 0 1 IC='(Roff-Rinit)/(Roff-Ron)'
Raux x 0 1T

* RESISTIVE PORT OF THE MEMRISTOR *
Emem plus aux value='-I(Emem)*V(x)*(Roff-Ron)'
Roff aux minus Roff

.ENDS memristor

.SUBCKT mem_32bit A1 A2 A_F A_S C_0 C_1 C_2 C_3 C_4 C_5 C_6 C_7 C_8 C_9 C_10 C_11 C_12 C_13 C_14 C_15 
X1 A1  o1 memristor 
X2 o1 o2 memristor

X3 o2 o3 memristor
X4 o3 o4 memristor

X5 o4  o5 memristor
X6 o5 o6 memristor

X7 o6 o7 memristor
X8 o7 o8 memristor

X9  o8  o9 memristor
X10 o9 o10 memristor

X11 o10 o11 memristor
X12 o11 o12 memristor

X13 o12  o13 memristor
X14 o13 o14 memristor

X15 o14 o15 memristor
X16 o15 o16 memristor
X17 o16 A_F memristor

Xs1 A2   so1 memristor
Xs2 so1 so2 memristor

Xs3 so2 so3 memristor
Xs4 so3 so4 memristor

Xs5 so4 so5 memristor
Xs6 so5 so6 memristor

Xs7 so6 so7 memristor
Xs8 so7 so8 memristor

Xs9  so8 so9 memristor
Xs10 so9 so10 memristor

Xs11 so10 so11 memristor
Xs12 so11 so12 memristor

Xs13 so12 so13 memristor
Xs14 so13 so14 memristor

Xs15 so14 so15 memristor
Xs16 so15 so16 memristor
Xs17 so16 A_S memristor



*X2 45 32 22 BCM_MEMRISTOR

MNor1 o1 C_0  0 0  NMOS_VTL  W='100n' L='50n' 
MNor2 o2 C_1  0 0  NMOS_VTL  W='100n' L='50n' 
MNor3 o3 C_2  0 0  NMOS_VTL  W='100n' L='50n'
MNor4 o4 C_3  0 0  NMOS_VTL  W='100n' L='50n' 
MNor5 o5 C_4  0 0  NMOS_VTL  W='100n' L='50n' 
MNor6 o6 C_5  0 0  NMOS_VTL  W='100n' L='50n'
MNor7 o7 C_6  0 0  NMOS_VTL  W='100n' L='50n' 

MNor8  o8  C_7  0 0  NMOS_VTL  W='100n' L='50n' 
MNor9  o9  C_8  0 0  NMOS_VTL  W='100n' L='50n' 
MNor10 o10 C_9  0 0  NMOS_VTL  W='100n' L='50n'
MNor11 o11 C_10  0 0  NMOS_VTL  W='100n' L='50n' 
MNor12 o12 C_11  0 0  NMOS_VTL  W='100n' L='50n' 
MNor13 o13 C_12  0 0  NMOS_VTL  W='100n' L='50n'
MNor14 o14 C_13  0 0  NMOS_VTL  W='100n' L='50n' 
MNor15 o15 C_14  0 0  NMOS_VTL  W='100n' L='50n'
MNor16 o16 C_15  0 0  NMOS_VTL  W='100n' L='50n' 

 
MNors1 so1 C_15  0 0  NMOS_VTL  W='100n' L='50n' 
MNors2 so2 C_14  0 0  NMOS_VTL  W='100n' L='50n' 
MNors3 so3 C_13  0 0  NMOS_VTL  W='100n' L='50n'
MNors4 so4 C_12  0 0  NMOS_VTL  W='100n' L='50n' 
MNors5 so5 C_11  0 0  NMOS_VTL  W='100n' L='50n' 
MNors6 so6 C_10  0 0  NMOS_VTL  W='100n' L='50n'
MNors7 so7 C_9  0 0  NMOS_VTL  W='100n' L='50n'

MNors8  so8  C_8   0 0  NMOS_VTL  W='100n' L='50n' 
MNors9  so9  C_7   0 0  NMOS_VTL  W='100n' L='50n' 
MNors10 so10 C_6   0 0  NMOS_VTL  W='100n' L='50n'
MNors11 so11 C_5  0 0  NMOS_VTL  W='100n' L='50n' 
MNors12 so12 C_4  0 0  NMOS_VTL  W='100n' L='50n' 
MNors13 so13 C_3  0 0  NMOS_VTL  W='100n' L='50n'
MNors14 so14 C_2  0 0  NMOS_VTL  W='100n' L='50n'
MNors15 so15 C_1  0 0  NMOS_VTL  W='100n' L='50n'
MNors16 so16 C_0  0 0  NMOS_VTL  W='100n' L='50n'

 

c1 o1 0 'cf'
c2 o2 0 'cf'
c3 o3 0 'cf'
c4 o4 0 'cf'
c5 o5 0 'cf'
c6 o6 0 'cf'
c7 o7 0 'cf'
c8 o8 0 'cf'
c9 o9 0 'cf'
c10 o10 0 'cf'
c11 o11 0 'cf'
c12 o12 0 'cf'
c13 o13 0 'cf'
c14 o14 0 'cf'
c15 o15 0 'cf'
c16 o16 0 'cf'
c17 A_F 0 'cf'

cs1 so1 0 'cs'
cs2 so2 0 'cs'
cs3 so3 0 'cs'
cs4 so4 0 'cs'
cs5 so5 0 'cs'
cs6 so6 0 'cs'
cs7 so7 0 'cs'
cs8 so8 0 'cs'

cs9  so9  0 'cs'
cs10 so10 0 'cs'
cs11 so11 0 'cs'
cs12 so12 0 'cs'
cs13 so13 0 'cs'
cs14 so14 0 'cs'
cs15 so15 0 'cs'
cs16 so16 0 'cs'
cs17 A_S 0 'cs'
.ends


x_mem32_1 A A A_F A_S C_0 C_1 C_2 C_3 C_4 C_5 C_6 C_7 C_8 C_9 C_10 C_11 C_12 C_13 C_14 C_15 mem_32bit 

x_mem32_2 A_F A_S A_F1 A_S1 C_16 C_17 C_18 C_19 C_20 C_21 C_22 C_23 C_24 C_25 C_26 C_27 C_28 C_29 C_30 C_31 mem_32bit 

x_mem32_3 A_F1 A_S1 A_F2 A_S2 C_32 C_33 C_34 C_35 C_36 C_37 C_38 C_39 C_40 C_41 C_42 C_43 C_44 C_45 C_46 C_47 mem_32bit 

x_mem32_4 A_F2 A_S2 A_F3 A_S3 C_48 C_49 C_50 C_51 C_52 C_53 C_54 C_55 C_56 C_57 C_58 C_59 C_60 C_61 C_62 C_63 mem_32bit 

V A1 0 pulse 0 'va' 1n 1p 1p 3n 4u 
GswitchA A1 A VCR PWL(1) A1 0 0v,1T 1v,1u 

V0 C_0 0 pulse 0 'V_0' 2n 1p 1p 1.5n 8u
V1 C_1 0 pulse 0 'V_1' 2n 1p 1p 1.5n 8u
V2 C_2 0 pulse 0 'V_2'  2n 1p 1p 1.5n 8u
V3 C_3 0 pulse 0 'V_3'  2n 1p 1p 1.5n 8u
V4 C_4 0 pulse  0 'V_4'  2n 1p 1p 1.5n 8u
V5 C_5 0 pulse 0 'V_5' 2n 1p 1p 1.5n 8u
V6 C_6 0 pulse 0 'V_6' 2n 1p 1p 1.5n 8u
 
V7 C_7 0 pulse 0 'V_7' 2n 1p 1p 1.5n 8u
V8 C_8 0 pulse 0 'V_8' 2n 1p 1p 1.5n 8u
V9 C_9 0 pulse 0 'V_9'  2n 1p 1p 1.5n 8u
V10 C_10 0 pulse 0 'V_10'  2n 1p 1p 1.5n 8u
V11 C_11 0 pulse  0 'V_11'  2n 1p 1p 1.5n 8u
V12 C_12 0 pulse 0 'V_12' 2n 1p 1p 1.5n 8u
V13 C_13 0 pulse 0 'V_13' 2n 1p 1p 1.5n 8u
V14 C_14 0 pulse 0 'V_14' 2n 1p 1p 1.5n 8u
V15 C_15 0 pulse 0 'V_15' 2n 1p 1p 1.5n 8u
V16 C_16 0 pulse 0 'V_16' 2n 1p 1p 1.5n 8u
V17 C_17 0 pulse 0 'V_17' 2n 1p 1p 1.5n 8u
V18 C_18 0 pulse 0 'V_18'  2n 1p 1p 1.5n 8u
V19 C_19 0 pulse 0 'V_19'  2n 1p 1p 1.5n 8u
V20 C_20 0 pulse  0 'V_20'  2n 1p 1p 1.5n 8u
V21 C_21 0 pulse 0 'V_21' 2n 1p 1p 1.5n 8u
V22 C_22 0 pulse 0 'V_22' 2n 1p 1p 1.5n 8u
 
V23 C_23 0 pulse 0 'V_23' 2n 1p 1p 1.5n 8u
V24 C_24 0 pulse 0 'V_24' 2n 1p 1p 1.5n 8u
V25 C_25 0 pulse 0 'V_25'  2n 1p 1p 1.5n 8u
V26 C_26 0 pulse 0 'V_26'  2n 1p 1p 1.5n 8u
V27 C_27 0 pulse  0 'V_27'  2n 1p 1p 1.5n 8u
V28 C_28 0 pulse 0 'V_28' 2n 1p 1p 1.5n 8u
V29 C_29 0 pulse 0 'V_29' 2n 1p 1p 1.5n 8u
V30 C_30 0 pulse 0 'V_30' 2n 1p 1p 1.5n 8u
V31 C_31 0 pulse 0 'V_31' 2n 1p 1p 1.5n 8u

V32 C_32 0 pulse 0 'V_32' 2n 1p 1p 1.5n 8u
V33 C_33 0 pulse 0 'V_33' 2n 1p 1p 1.5n 8u
V34 C_34 0 pulse 0 'V_34'  2n 1p 1p 1.5n 8u
V35 C_35 0 pulse 0 'V_35'  2n 1p 1p 1.5n 8u
V36 C_36 0 pulse  0 'V_36'  2n 1p 1p 1.5n 8u
V37 C_37 0 pulse 0 'V_37' 2n 1p 1p 1.5n 8u
V38 C_38 0 pulse 0 'V_38' 2n 1p 1p 1.5n 8u
 
V39 C_39 0 pulse 0 'V_39' 2n 1p 1p 1.5n 8u
V40 C_40 0 pulse 0 'V_40' 2n 1p 1p 1.5n 8u
V41 C_41 0 pulse 0 'V_41'  2n 1p 1p 1.5n 8u
V42 C_42 0 pulse 0 'V_42'  2n 1p 1p 1.5n 8u
V43 C_43 0 pulse  0 'V_43'  2n 1p 1p 1.5n 8u
V44 C_44 0 pulse 0 'V_44' 2n 1p 1p 1.5n 8u
V45 C_45 0 pulse 0 'V_45' 2n 1p 1p 1.5n 8u
V46 C_46 0 pulse 0 'V_46' 2n 1p 1p 1.5n 8u
V47 C_47 0 pulse 0 'V_47' 2n 1p 1p 1.5n 8u
V48 C_48 0 pulse 0 'V_48' 2n 1p 1p 1.5n 8u
V49 C_49 0 pulse 0 'V_49' 2n 1p 1p 1.5n 8u
V50 C_50 0 pulse 0 'V_50'  2n 1p 1p 1.5n 8u
V51 C_51 0 pulse 0 'V_51'  2n 1p 1p 1.5n 8u
V52 C_52 0 pulse  0 'V_52'  2n 1p 1p 1.5n 8u
V53 C_53 0 pulse 0 'V_53' 2n 1p 1p 1.5n 8u
V54 C_54 0 pulse 0 'V_54' 2n 1p 1p 1.5n 8u
 
V55 C_55 0 pulse 0 'V_55' 2n 1p 1p 1.5n 8u
V56 C_56 0 pulse 0 'V_56' 2n 1p 1p 1.5n 8u
V57 C_57 0 pulse 0 'V_57'  2n 1p 1p 1.5n 8u
V58 C_58 0 pulse 0 'V_58'  2n 1p 1p 1.5n 8u
V59 C_59 0 pulse  0 'V_59'  2n 1p 1p 1.5n 8u
V60 C_60 0 pulse 0 'V_60' 2n 1p 1p 1.5n 8u
V61 C_61 0 pulse 0 'V_61' 2n 1p 1p 1.5n 8u
V62 C_62 0 pulse 0 'V_62' 2n 1p 1p 1.5n 8u
V63 C_63 0 pulse 0 'V_63' 2n 1p 1p 1.5n 8u
 

***********************************chaotic circuit************************************************

*Lorenz attractor
*Parameters and models
*------------------------------------------------

*.param SUPPLY = 'supply'
.temp 'T'
.include 'mosistsmc180.sp'

*Simulation netlist
*------------------------------------------------
*implementing interfacing circuit with PUF
*------------------------------------------------

Vcntrl vcntrl gnd PULSE 0 1 1ns 1ps 1ps 30ns 50ns
Vcntr2 vcntr2 gnd PULSE 0 1 1ns 1ps 1ps 30ns 33ns
Gp gnd cap3 CUR='V(vcntrl)*V(A_F3)*20u'
Gn cap3 gnd CUR='V(vcntrl)*V(A_S3)*20u'
Gswitchv cap outv VCR PWL(1) vcntr2 gnd 0v,10u 1v,1000meg
Gswitchu gnd outu VCR PWL(1) vcntrl gnd 0v,10meg 1v,10u
Gswitchw gnd outw VCR PWL(1) vcntrl gnd 0v,10meg 1v,10u
Ccap cap gnd 1p IC=0
Rcap cap cap3 1k

*------------------------------------------------
*implementing opamps 1 & 2
*------------------------------------------------

R1 outv inv1 '10*lorenz_r'
R2 outu noninv1 '10*lorenz_r'
R3 noninv1 gnd '10*lorenz_r'
R4 inv1 out1 '10*lorenz_r'
R5 out1 inv2 '4.99*lorenz_r' 
C1 inv2 outu1 'lorenz_c'
Eopamp1 out1 gnd noninv1 inv1 MAX=+5 MIN=-5 10000.0 
Eopamp2 outu1 gnd gnd inv2 MAX=+5 MIN=-5 10000.0
Ru outu1 outu 'lorenz_r'

*------------------------------------------------
*implementing opamps 3, 4, 5 & 6 
*------------------------------------------------

R6 inv3 gnd '10*lorenz_r'
R7 inv3 out3 '10*lorenz_r'
R8 outv inv4 '20*lorenz_r'
R9 uw inv4 'lorenz_r'
R10 out3 noninv4 '4.99*lorenz_r'
R11 noninv4 gnd '6.34*lorenz_r' ***6.34k is optimum for chaos and 1.94k for bistable system***
R12 inv4 out4 'lorenz_r'
R13 out4 inv5 '10*lorenz_r'
R14 inv5 out5 '10*lorenz_r'
R15 out5 inv6 '4.02*lorenz_r'
C2 inv6 outv1 'lorenz_c'
Eopamp3 out3 gnd outu inv3 MAX=+5 MIN=-5 10000.0 
Eopamp4 out4 gnd noninv4 inv4 MAX=+5 MIN=-5 10000.0 
Eopamp5 out5 gnd gnd inv5 MAX=+5 MIN=-5 10000.0 
Eopamp6 outv1 gnd gnd inv6 MAX=+5 MIN=-5 10000.0 
Emul1 uw gnd VOL='V(outu) * V(outw)'
Rv outv1 outv 'lorenz_r'

*------------------------------------------------
*implementing opamps 7 & 8 
*------------------------------------------------

R16 uv_p inv7 '10*lorenz_r'
R17 outw noninv7 '10*lorenz_r'
R18 noninv7 gnd '6.65*lorenz_r'
R19 inv7 out7 '10*lorenz_r'
R20 out7 inv8 '15.8*lorenz_r'
C3 inv8 outw1 'lorenz_c'
Eopamp7 out7 gnd noninv7 inv7 MAX=+5 MIN=-5 10000.0 
Eopamp8 outw1 gnd gnd inv8 MAX=+5 MIN=-5 10000.0 
Emul2 uv_p gnd VOL='V(outu) * V(outv)'
Rw outw1 outw 'lorenz_r'

*------------------------------------------------
*digitizing using comparator
*------------------------------------------------

Vref ref gnd 0
Ecomp out_final gnd outu ref MAX=+1 MIN=0 10000.0 ***out_final is the digitized output*** 

*------------------------------------------------
* Stimulus
*------------------------------------------------


.TRAN  .1n 55n UIC sweep data=datanm

*.option list node post=2 ingold=2
.PROBE tran output

.meas tran output find  v(out_final) AT='45n'



************************************model_vtl*****************************************************
* Customized PTM 45 NMOS

.model  NMOS_VTL  nmos  level = 54

+version = 4.0    binunit = 1    paramchk= 1    mobmod  = 0
+capmod  = 2      igcmod  = 1    igbmod  = 1    geomod  = 1
+diomod  = 1      rdsmod  = 0    rbodymod= 1    rgatemod= 1
+permod  = 1      acnqsmod= 0    trnqsmod= 0

* parameters related to the technology node
+tnom = 27    epsrox = 3.9
+eta0 = 0.0049    nfactor = 2.1    wint = 5e-09
+cgso = 1.1e-10    cgdo = 1.1e-10    xl = -2e-08

* parameters customized by the user
+toxe = 1.75e-09    toxp = 1.1e-09    toxm = 1.75e-09    toxref = 1.75e-09
+dtox = 6.5e-10    lint = 3.75e-09
+vth0 = 'vth0'    k1 = 0.53    u0 = 0.04359    vsat = 147390
+rdsw = 155    ndep = 3.3e+18    xj = 1.4e-08

* secondary parameters
+ll      = 0            wl      = 0            lln     = 1            wln     = 1          
+lw      = 0            ww      = 0            lwn     = 1            wwn     = 1          
+lwl     = 0            wwl     = 0            xpart   = 0               
+k2      = 0.01         k3      = 0          
+k3b     = 0            w0      = 2.5e-006     dvt0    = 1            dvt1    = 2       
+dvt2    = -0.032       dvt0w   = 0            dvt1w   = 0            dvt2w   = 0          
+dsub    = 0.1          minv    = 0.05         voffl   = 0            dvtp0   = 1.0e-009     
+dvtp1   = 0.1          lpe0    = 0            lpeb    = 0               
+ngate   = 2e+020       nsd     = 2e+020       phin    = 0          
+cdsc    = 0.000        cdscb   = 0            cdscd   = 0            cit     = 0          
+voff    = -0.13        etab    = 0          
+vfb     = -0.55        ua      = 6e-010       ub      = 1.2e-018     
+uc      = 0            a0      = 1.0          ags     = 1e-020     
+a1      = 0            a2      = 1.0          b0      = 0            b1      = 0          
+keta    = 0.04         dwg     = 0            dwb     = 0            pclm    = 0.04       
+pdiblc1 = 0.001        pdiblc2 = 0.001        pdiblcb = -0.005       drout   = 0.5        
+pvag    = 1e-020       delta   = 0.01         pscbe1  = 8.14e+008    pscbe2  = 1e-007     
+fprout  = 0.2          pdits   = 0.08         pditsd  = 0.23         pditsl  = 2.3e+006   
+rsh     = 5            rsw     = 85           rdw     = 85        
+rdswmin = 0            rdwmin  = 0            rswmin  = 0            prwg    = 0          
+prwb    = 6.8e-011     wr      = 1            alpha0  = 0.074        alpha1  = 0.005      
+beta0   = 30           agidl   = 0.0002       bgidl   = 2.1e+009     cgidl   = 0.0002     
+egidl   = 0.8          

+aigbacc = 0.012        bigbacc = 0.0028       cigbacc = 0.002     
+nigbacc = 1            aigbinv = 0.014        bigbinv = 0.004        cigbinv = 0.004      
+eigbinv = 1.1          nigbinv = 3            aigc    = 0.012        bigc    = 0.0028     
+cigc    = 0.002        aigsd   = 0.012        bigsd   = 0.0028       cigsd   = 0.002     
+nigc    = 1            poxedge = 1            pigcd   = 1            ntox    = 1          

+xrcrg1  = 12           xrcrg2  = 5          
+cgbo    = 2.56e-011    cgdl    = 2.653e-10     
+cgsl    = 2.653e-10    ckappas = 0.03         ckappad = 0.03         acde    = 1          
+moin    = 15           noff    = 0.9          voffcv  = 0.02       

+kt1     = -0.11        kt1l    = 0            kt2     = 0.022        ute     = -1.5       
+ua1     = 4.31e-009    ub1     = 7.61e-018    uc1     = -5.6e-011    prt     = 0          
+at      = 33000      

+fnoimod = 1            tnoimod = 0          

+jss     = 0.0001       jsws    = 1e-011       jswgs   = 1e-010       njs     = 1          
+ijthsfwd= 0.01         ijthsrev= 0.001        bvs     = 10           xjbvs   = 1          
+jsd     = 0.0001       jswd    = 1e-011       jswgd   = 1e-010       njd     = 1          
+ijthdfwd= 0.01         ijthdrev= 0.001        bvd     = 10           xjbvd   = 1          
+pbs     = 1            cjs     = 0.0005       mjs     = 0.5          pbsws   = 1          
+cjsws   = 5e-010       mjsws   = 0.33         pbswgs  = 1            cjswgs  = 3e-010     
+mjswgs  = 0.33         pbd     = 1            cjd     = 0.0005       mjd     = 0.5        
+pbswd   = 1            cjswd   = 5e-010       mjswd   = 0.33         pbswgd  = 1          
+cjswgd  = 5e-010       mjswgd  = 0.33         tpb     = 0.005        tcj     = 0.001      
+tpbsw   = 0.005        tcjsw   = 0.001        tpbswg  = 0.005        tcjswg  = 0.001      
+xtis    = 3            xtid    = 3          

+dmcg    = 0e-006       dmci    = 0e-006       dmdg    = 0e-006       dmcgt   = 0e-007     
+dwj     = 0.0e-008     xgw     = 0e-007       xgl     = 0e-008     

+rshg    = 0.4          gbmin   = 1e-010       rbpb    = 5            rbpd    = 15         
+rbps    = 15           rbdb    = 15           rbsb    = 15           ngcon   = 1          

* Customized PTM 45 PMOS

.model  PMOS_VTL  pmos  level = 54

+version = 4.0    binunit = 1    paramchk= 1    mobmod  = 0
+capmod  = 2      igcmod  = 1    igbmod  = 1    geomod  = 1
+diomod  = 1      rdsmod  = 0    rbodymod= 1    rgatemod= 1
+permod  = 1      acnqsmod= 0    trnqsmod= 0

* parameters related to the technology node
+tnom = 27    epsrox = 3.9
+eta0 = 0.0049    nfactor = 2.1    wint = 5e-09
+cgso = 1.1e-10    cgdo = 1.1e-10    xl = -2e-08

* parameters customized by the user
+toxe = 1.85e-09    toxp = 1.1e-09    toxm = 1.85e-09    toxref = 1.85e-09
+dtox = 7.5e-10    lint = 3.75e-09
+vth0 = -0.423    k1 = 0.491    u0 = 0.00432    vsat = 70000
+rdsw = 155    ndep = 2.54e+18    xj = 1.4e-08

*secondary parameters
+ll      = 0            wl      = 0            lln     = 1            wln     = 1          
+lw      = 0            ww      = 0            lwn     = 1            wwn     = 1          
+lwl     = 0            wwl     = 0            xpart   = 0               
+k2      = -0.01        k3      = 0          
+k3b     = 0            w0      = 2.5e-006     dvt0    = 1            dvt1    = 2       
+dvt2    = -0.032       dvt0w   = 0            dvt1w   = 0            dvt2w   = 0          
+dsub    = 0.1          minv    = 0.05         voffl   = 0            dvtp0   = 1e-009     
+dvtp1   = 0.05         lpe0    = 0            lpeb    = 0               
+ngate   = 2e+020       nsd     = 2e+020       phin    = 0          
+cdsc    = 0.000        cdscb   = 0            cdscd   = 0            cit     = 0          
+voff    = -0.126       etab    = 0          
+vfb     = 0.55         ua      = 2.0e-009     ub      = 0.5e-018     
+uc      = 0            a0      = 1.0          ags     = 1e-020     
+a1      = 0            a2      = 1            b0      = -1e-020      b1      = 0          
+keta    = -0.047       dwg     = 0            dwb     = 0            pclm    = 0.12       
+pdiblc1 = 0.001        pdiblc2 = 0.001        pdiblcb = 3.4e-008     drout   = 0.56       
+pvag    = 1e-020       delta   = 0.01         pscbe1  = 8.14e+008    pscbe2  = 9.58e-007  
+fprout  = 0.2          pdits   = 0.08         pditsd  = 0.23         pditsl  = 2.3e+006   
+rsh     = 5            rsw     = 85           rdw     = 85        
+rdswmin = 0            rdwmin  = 0            rswmin  = 0            prwg    = 3.22e-008  
+prwb    = 6.8e-011     wr      = 1            alpha0  = 0.074        alpha1  = 0.005      
+beta0   = 30           agidl   = 0.0002       bgidl   = 2.1e+009     cgidl   = 0.0002     
+egidl   = 0.8          

+aigbacc = 0.012        bigbacc = 0.0028       cigbacc = 0.002     
+nigbacc = 1            aigbinv = 0.014        bigbinv = 0.004        cigbinv = 0.004      
+eigbinv = 1.1          nigbinv = 3            aigc    = 0.69         bigc    = 0.0012     
+cigc    = 0.0008       aigsd   = 0.0087       bigsd   = 0.0012       cigsd   = 0.0008     
+nigc    = 1            poxedge = 1            pigcd   = 1            ntox    = 1 
         
+xrcrg1  = 12           xrcrg2  = 5          
+cgbo    = 2.56e-011    cgdl    = 2.653e-10
+cgsl    = 2.653e-10    ckappas = 0.03         ckappad = 0.03         acde    = 1
+moin    = 15           noff    = 0.9          voffcv  = 0.02

+kt1     = -0.11        kt1l    = 0            kt2     = 0.022        ute     = -1.5       
+ua1     = 4.31e-009    ub1     = 7.61e-018    uc1     = -5.6e-011    prt     = 0          
+at      = 33000      

+fnoimod = 1            tnoimod = 0          

+jss     = 0.0001       jsws    = 1e-011       jswgs   = 1e-010       njs     = 1          
+ijthsfwd= 0.01         ijthsrev= 0.001        bvs     = 10           xjbvs   = 1          
+jsd     = 0.0001       jswd    = 1e-011       jswgd   = 1e-010       njd     = 1          
+ijthdfwd= 0.01         ijthdrev= 0.001        bvd     = 10           xjbvd   = 1          
+pbs     = 1            cjs     = 0.0005       mjs     = 0.5          pbsws   = 1          
+cjsws   = 5e-010       mjsws   = 0.33         pbswgs  = 1            cjswgs  = 3e-010     
+mjswgs  = 0.33         pbd     = 1            cjd     = 0.0005       mjd     = 0.5        
+pbswd   = 1            cjswd   = 5e-010       mjswd   = 0.33         pbswgd  = 1          
+cjswgd  = 5e-010       mjswgd  = 0.33         tpb     = 0.005        tcj     = 0.001      
+tpbsw   = 0.005        tcjsw   = 0.001        tpbswg  = 0.005        tcjswg  = 0.001      
+xtis    = 3            xtid    = 3          

+dmcg    = 0e-006       dmci    = 0e-006       dmdg    = 0e-006       dmcgt   = 0e-007     
+dwj     = 0.0e-008     xgw     = 0e-007       xgl     = 0e-008     

+rshg    = 0.4          gbmin   = 1e-010       rbpb    = 5            rbpd    = 15         
+rbps    = 15           rbdb    = 15           rbsb    = 15           ngcon   = 1          

.END


