("v1a1l1e1_setup.scd").loadRelative;

/* --KICK-- */

/*
~k1 = Pbind(\instrument, \kick, \dur, Prand([0.5,0.25,1],inf));
*/
~k1 = Pbind(\instrument, \kick, \dur, Pwrand([Pbjorklund2(Pseq([3,5],16),8,16)/2,Prand([0.5,0.25,1],8)],[0.6,0.4],inf),\amp,Prand([1,0.9],inf));
~k2 = Pbind(\instrument, \k, \dur, 1, \amp, 1.5);
~k1.play;~k2.play;


/* --SNARE-- */

~bz = Pbind(\instrument, \bz, \dur, Pbjorklund(3,8)/2,\amp,0.4,\ocatve, 1, \scale, Scale.major,\degree, Prand([0,3,5],inf));
~bz2 = Pbind(\instrument, \bz, \scale, Scale.major, \degree, Prand([2,4,7],inf), \dur, Pbjorklund(3,8,inf,3), \ocatve, 2,\amp, 0.4);
~bz.play; ~bz2.play;

/* --BASS-- */

~b = Pbind(\instrument, \bass, \scale, Scale.major, \degree, Pseq([1,[3,5],4,6,8,0,2,4,[5,7],3],inf),\octave,Prand([2,3],inf), \dur, Pbjorklund2(Pseq([3,5],inf),8)/4);
~b.play;

/* --HIHAT-- */
~hh = Pbind(\instrument, \hh, \dur, Prand([2,4],inf), \amp, Prand([0.3,0.5],inf));
~hh.play;

/* --CLAP-- */

/* --GLITCH-- */

/* --SYNTH-- */

~r1 = Pbind(\instrument, \ring1, \freq, Pstutter(Prand([1,2,3],inf), Prand([45,90,22.5],inf)), \dur, Pseq([1,0.5,0.25],inf));
~r2 = Pbind(\instrument, \ring1, \freq, Pstutter(Prand([1,2],inf), Prand([Pseq([45,90],4),Prand([180,90,67.5],4)],inf))*Pseq([0.5,1],inf), \dur, Pwrand([1,0.5],[0.9,0.1],inf));
~r1.play; ~r2.play;

~sfb = Pbind(\instrument, \sinfb, \scale, Scale.major, \degree, Pstutter(Prand([2,1],inf),Prand([4,5,7],inf)),\rel,0.2,\fb,Pwhite(0.01,0.5),\dur,Prand([1,0.5],inf),\octave, Prand([2,3,4],inf),\amp,0.2);
~sfb.play;

~rm = Pbind(\instrument, \ringM, \dur, 2, \scale, Scale.major, \degree, Prand([0,[2,4],5,6,7],inf), \octave, Prand([4,5],inf),\amp,0.1);
~rm.play;

/* --FX-- */

/* --DRONES-- */
~d1 = Pbind(\instrument, \82, \dur, 0.5, \amp, 0.5, \base_freq, Prand([2,3,4],inf), \freq_l,Pwhite(0.5,2.5), \freq_r,Pkey(\freq_l)*1.01);
~d1.play;

~mu = Pbind(\instrument, \mu, \scale, Scale.major, \degree, Prand([3,5,7,9],inf), \octave, Prand([2,3,4],inf), \dur, 2);
~mu.play;

/* --CHAOS--*/

/* --MODULAR-- */

~lpf = {RLPF.ar([~rm.ar],LFNoise0.kr(0.1).exprange(100,200),0.07);}
~lpf.play;
