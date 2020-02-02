(
SynthDef("amino", { arg out, freq=440, sustain=1.0, pan, p, amp=0.1;
    var u;
    u = Line.kr(1, 0, sustain, doneAction:2) *
            SinOsc.ar(freq,
                SinOsc.ar(freq * p, 0, BrownNoise.kr(pi/8))
            );
    Out.ar(out, Pan2.ar(u, pan, amp));

}).add;
)



// load from a file
(
x = AminoacidPattern.new.loadData("escherichia-coli".resolveRelative);
//x.asStream.all.postcs; // the aminoacids
)

(
Pbind(
    \instrument, \amino,
	\scale, Scale.chromatic(\et24),
	\degree, x - Pseq([4,8,2],inf) ,
    \stepsPerOctave, 24,
    \dur, 0.125*3,
    \p, x / 20,
    \legato, Prand([1, 0.5, 2], inf) * 1.4,
    \pan, x / 10 - 1,
    \amp, Pbrown(0.01, 0.15, 0.05, inf)
).play;
)