("v1a1l1e1_setup.scd").loadRelative;
d.add(\scale -> Scale.chromatic(\et24));
p.fadeTime=2;
p.clock.tempo=2


MandelHub.join('vale',action:{m=MandelHub.instance;});
m.clear;
m.gui;
s.latency_(0.12);


~sk = Pbind(\instrument, \kick, \dur,4,\amp,1)
~sk.stop(5);

~k1 = Pbind(\instrument, \kick, \dur, Pwrand([Pbjorklund2(Prand([3,5],2),8,16)/4,Pn(0.125,2),Pn(0.25,4)],[0.8,0.05,0.15],inf),\amp,1);
~k1.stop(4);

~k2 = Pbind(\instrument, \kick2, \dur, Prand([0.25,0.5],inf),\amp,1);
~k2.stop(4);

~r1 = Pbind(\instrument, \ring1, \scale, d[\scale],\degree, Prand([0,7,10,14,4],inf),\dur,0.5,\octave,2,\amp,0.25);
~r1.stop(2);

~cl = Pbind(\instrument, \bz,\amp,1, \rel,0.5, \dur, Pseq([0.5,Pseq([1,0.5],inf)],inf));
~cl.stop;
~cl2 = Pbind(\instrument, \bz,\amp,0.1, \rel,0.15, \dur, Pbjorklund(3,8,inf)/3);
~cl2.stop(1);

~r2 = Pbind(\instrument, \ring1, \scale, d[\scale],\degree, Pstutter(Prand([2,3],inf),Prand([Pseq([3,6,9,2],inf),Pseq([12,17,4],4),Prand([3,11,7],8)],inf)),\dur,0.5,\octave,Prand([3,4],inf),\amp,0.1);
~r2.stop(4);

~dr1 = Pbind(\instrument, \mu, \dur,1, \scale, d[\scale], \degree, Prand(d[\scale].degrees,inf),\octave,Prand([4,5],inf), \amp,0.1);
~dr1.stop(5);

~sig = {SinOsc.ar([80,80.5],0,0.1)};
~pul = {Pulse.ar([15,15.1])};
~mod = {~sig.ar*~pul.ar};
~out = {~dr1.ar*~mod.ar};
~out.stop;

~dly = {CombC.ar([~out.ar],0.2,0.5,LFNoise0.kr(0.1).range(3,6),0.5)};
~dly.stop(10);

~wo = Pbind(\instrument, \wo,\dur,0.5,\amp,2.5, \scale, d[\scale],\ocatve,1,\degree,Prand([3,4],inf));
~wo.stop(2);

~flt = {RHPF.ar([~k1.ar,~k2.ar,~wo.ar],SinOsc.kr(0.1).range(100,300),0.1,0.2)};
~flt.stop(3);

