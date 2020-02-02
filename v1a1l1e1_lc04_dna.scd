("v1a1l1e1_setup.scd").loadRelative;
d.add(\dna -> AminoacidPattern.new.loadData("escherichia-coli".resolveRelative));

~dna = Pbind(\instrument, \bz,\dur,d[\dna]/10*0.25,\pan, d[\dna]/10-1,\amp, 0.4);
~dna = Pbind(\instrument, \bz, \dur, Pbjorklund(3,8)/2,\amp,0.4,\ocatve, 1, \scale, Scale.major,\degree, Prand([0,3,5],inf));

(
~dna2 = Pbind(
    \instrument, \ring1,
	\scale, Scale.chromatic(\et24),
	\degree, d[\dna]*Prand([1,0.5,1.5],inf),
	\octave,Prand([2,3],inf),
	\dur, d[\dna]/10,
	\p, d[\dna] / 20,
	\fb,0,
	\pan, d[\dna] / 10 - 1,
    \amp, 0.05
);
)

~dna.play;~dna2.play;

~mu = Pbind(\instrument, \mu, \scale, d[\scale], \degree, Prand(d[\scale].degrees,inf), \octave, Prand([3,4],inf), \dur, 2,\amp,0.3);
~mu.stop;
~d1 = Pbind(\instrument, \82, \dur, 0.5, \amp, 0.3, \base_freq, Prand([2,3,4],inf), \freq_l,Pwhite(0.5,2.5), \freq_r,Pkey(\freq_l)*1.01);
~d1.play;

~k1 = Pbind(\instrument, \kick, \dur, Pwrand([Pbjorklund2(Pseq([3,5],16),Prand([8,11],inf),16)/4,Prand([0.5,0.25,1],8)],[0.6,0.4],inf),\amp,Prand([2,1.5],inf));
~k2 = Pbind(\instrument, \k, \dur, Pseq([1,0.5,],inf), \amp, 3);
~k1.play;~k2.play;


j=AminoacidPattern.new.loadData("escherichia-coli".resolveRelative)
a = j.asStream.all
b = Array.newClear(a.size);
(
i=0;
a.do{|el|
	if (el ==(-1))
	{b.put(i,0)}
	{b.put(i,el)};
	i=i+1;
	};
)