~audio=s.outputBus

(
SynthDef(\analisi,{
	|in|
	var amp,loud,fft;
	amp = Amplitude.kr(in);
	fft = FFT(LocalBuf(2048.dup(2), 1));
	loud = Loudness.kr(fft);
	SendReply.kr(Impulse.kr(1),'/data',[amp,loud]);
}).add;
)

Synth(\analisi,[\in,~audio]);

o = OSCFunc({ |msg| msg.postln }, '/data');