(
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 64;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 2;

Task({
	3.wait;
	d = Dictionary.new;
	d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "samples_SC").entries);
	for (0, d[\foldernames].size-1,
		{arg i; d.add(d[\foldernames][i].folderName -> d[\foldernames][i].entries.collect({
			arg sf;
			Buffer.read(s,sf.fullPath);
		});
	)});
	("v1a1l1e1_SynthDefs.scd").loadRelative;
	"SynthDefs OK".postln;
	("Snippets.scd").loadRelative;
	3.wait;
	"Snippets OK".postln;
	StageLimiter.activate;
	"Setup done!".postln;
}).start;
)
