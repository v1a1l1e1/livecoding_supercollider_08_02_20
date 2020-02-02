("v1a1l1e1_setup.scd").loadRelative;
d.add(\scale -> Scale.chromatic(\et12));
p.fadeTime=2;
p.clock.tempo=2
/* --KICK-- */

/*
~k1 = Pbind(\instrument, \kick, \dur, Prand([0.5,0.25,1],inf));
*/
~k1 = Pbind(\instrument, \kick, \dur, Pwrand([Pbjorklund2(Pseq([3,5],16),Prand([8,11],inf),16)/4,Prand([0.5,0.25,1],8)],[0.6,0.4],inf),\amp,Prand([0.9,0.75],inf));
~k2 = Pbind(\instrument, \k, \dur, Pseq([1,0.5,],inf), \amp, 1);
~k1.play;~k2.play;

~k3 = Pbind(\instrument, \kick3, \dur,4,\amp,6);
~k3.stop;
~k2.stop

/* --SNARE-- */

~bz = Pbind(\instrument, \bz, \dur, Pbjorklund(3,8)/2,\amp,0.4,\ocatve, 1, \scale, Scale.major,\degree, Prand([0,3,5],inf));
~bz2 = Pbind(\instrument, \bz, \scale, Scale.major, \degree, Prand([2,4,7],inf), \dur, Pbjorklund(3,8,inf,3), \ocatve, 2,\amp, 0.4);
~bz.play; ~bz2.play;

/* --BASS-- */

~bass = Pbind(\instrument, \bass2,\dur,Pseq([0.5,1,0.5,0.25,1,0.5],inf),\scale, d[\scale], \degree, Pseq([1,3,5,4,6,8,0,2,4,5,7,3],inf),\octave,Prand([3,4],inf));
~bass.play

/* --HIHAT-- */
~hh = Pbind(\instrument, \hh, \dur, Prand([2,4],inf), \amp, Prand([0.3,0.5],inf));
~hh.play;

/* --CLAP-- */

/* --GLITCH-- */

/* --SYNTH-- */

~r1 = Pbind(\instrument, \ring1, \freq, Pstutter(Prand([1,3],inf), Prand([45,90,22.5],inf)), \dur, Pseq([1,0.5,0.25],inf),\amp,0.3);
~r2 = Pbind(\instrument, \ring1, \freq, Pstutter(Prand([1,2],inf), Prand([Pseq([45,90],4),Prand([180,90,67.5],4)],inf))*Pseq([0.5,1],inf), \dur, Pwrand([1,0.5],[0.9,0.1],inf),\amp,0.2);
~r1.play; ~r2.play;
~r2.stop(3)

d.add(\scale -> Scale.chromatic(\et12));

~sfb = Pbind(\instrument, \sinfb, \scale, d[\scale], \degree,Prand([[0,4,8],[2,6,10],[8,12,16],[2,6,10],[4,8,12]],inf), \dur, Pbjorklund(Pseq([3,5],inf),8) ,\rel,0.1,\fb,Pwhite(0.4,0.7),\octave, Prand([2,3,4,5],inf),\amp,Pwrand([0.08,0.05],[0.3,0.7],inf));
~sfb.stop(30);

~rm = Pbind(\instrument, \ringM, \dur, Pbjorklund2(3,8)/2, \scale, d[\scale], \degree, Prand([[0,2,6],[0,4,12],[2,6,10],[4,8,12],],inf), \mod, Prand([50,120,60,80,40,140],inf), \octave, Prand([4,6,5],inf),\amp,0.05);
~rm.stop(10);

/* --FX-- */

/* --DRONES-- */
~d1 = Pbind(\instrument, \82, \dur, 0.5, \amp, 0.6, \base_freq, Prand([2,3,4],inf), \freq_l,Pwhite(0.5,2.5), \freq_r,Pkey(\freq_l)*1.01);
~d1.stop(40);

~mu = Pbind(\instrument, \mu, \scale, d[\scale], \degree, Prand(d[\scale].degrees,inf), \octave, Prand([2,3,4],inf), \dur, 2,\amp,0.5);
~mu.play;

~mu.stop(10);

/* --CHAOS--*/

/* --MODULAR-- */

~sin = {SinOsc.ar([10,12],0,0.3)}
~pulse={Pulse.ar([6,7],SinOsc.kr(0.5).range(0.01,1),0.3)}
~sp = {~sin.ar*~pulse.ar}
~sp.play;

~flt = {RHPF.ar([~sp.ar],SinOsc.kr(0.01).range(20,500),LFNoise1.kr(0.1).range(0.01,0.1),0.2)};
~flt.play;

~dly={CombC.ar([~sfb.ar],1,LFNoise1.kr(0.1).range(0.1,0.3),2)}
~dly.play;~sp.stop;
~panner = {Pan2.ar([~dly.ar],SinOsc.kr(0.1).range(-0.7,0.7),0.05)};
~panner.stop(5);~sp.stop(3)