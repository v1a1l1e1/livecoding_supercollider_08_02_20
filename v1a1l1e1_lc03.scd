("v1a1l1e1_setup.scd").loadRelative;
d.add(\scale -> Scale.chromatic(\et12));
p.fadeTime=2;
p.clock.tempo=2

~sfb = Pbind(\instrument, \sinfb, \scale, d[\scale], \degree,Pseq([Prand([Pstutter(2,Pseq([2,5,9],1)),Pseq([4,8,11],1)],3),Pseq([Pseq([2,5,9],1),Pseq([7,11,14],1),Pseq([0,4,7],1)],4),Pseq([0,7,11,2],4)],inf),\octave,3,\dur,Pwrand([Pseq([0.25,1,0.5],16),l/2],[0.95,0.5],inf),\rel,0.1,\fb,0.5,\amp,2);

~k1 = Pbind(\instrument, \kick, \dur, Pwrand([Pbjorklund2(Pseq([3,5],16),Prand([8,11],inf),16)/4,Prand([0.5,0.25,1],8)],[0.6,0.4],inf),\amp,Prand([1,0.9],inf));
~k2 = Pbind(\instrument, \k, \dur, Pseq([1,0.5,],inf), \amp, 0.9);

~r1 = Pbind(\instrument, \ring1, \freq, Pseq([45,90],inf), \dur, Pseq([1,0.5,0.25],inf),\amp,0.1);
~r2 = Pbind(\instrument, \ring1, \freq, Pstutter(Prand([1,2],inf), Prand([Pseq([45,90],4),Prand([180,90,67.5],4)],inf))*Pseq([0.5,1],inf), \dur, Pwrand([1,0.5],[0.9,0.1],inf),\amp,0.1);

~sfb.play;
~k1.play;~k2.play;
~r1.play;~r2.play;

~flt = {DFM1.ar([~sfb.ar],LFNoise1.kr(0.2).range(1000,3000),SinOsc.kr(10).range(0.001,0.3),mul:0.4)}
~flt.stop;~sfb.stop;

(
l = Prewrite(0,(
	0:#[0.5,1,2,0],
	1:#[2,1],
	2:#[0.5,1,2]
),21);
)


~sine = {SinOsc.ar([60,60.5],0,0.2)};
~pulse = {Pulse.ar([15,15.5],LFNoise1.kr(0.2).range(0.1,0.7),0.3)};
~sig = {~sine.ar*~pulse.ar};
~sig.play;


~del = {CombC.ar([~sig.ar,~sfb.ar],0.3, SinOsc.kr(1).range(3,7),3,0.8)};
~del.play;~sig.stop;


Bus