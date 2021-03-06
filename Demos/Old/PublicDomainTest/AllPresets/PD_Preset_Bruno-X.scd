// ==================================
// Preset: Bruno-X
// Number of voices: 8
// Most recent year sampled: 1973
// Comments: Sweet spot for changes are a) add / remove one or two hits ('1' value) into your amp; b) your startPos ~hancockStartPos should most of the time match your player number, but try to occasionally change it to another player number (1-8); for example, if you are ~hancockStartPos[1], you may try ~hancockStartPos[4], etc. c) one or two players at a time might try rate -1 (reverse sound), or even -2
// ==================================

// Loop duration -- abs times taken from audio file (seconds)
~hancockLoopDur = 16.529 - 11.411;

// Start positions divided by 8 laptops
~hancockStartPos = [nil] ++  Array.series(8, 11.411, ~hancockLoopDur / 8);

Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos, ~hancockStartPos[1] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([1, 0, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;

Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[2] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.03,
	\amp, Pseq([0, 1, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;

Pbindef(\p3,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[3] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([0, 0, 1, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;

Pbindef(\p4,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[4] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 1, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;

Pbindef(\p5,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[5] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 1, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;

Pbindef(\p6,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[6] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 1, 0, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;


Pbindef(\p7,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[7] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 1, 0], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;


Pbindef(\p8,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, Prand([1, 1, 1, 1.5], inf),
	\startPos,  ~hancockStartPos[8] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 0, 1], inf),
	\legato, 1
).play(~clock, quant: ~hancockLoopDur).quant = ~hancockLoopDur;


/*
// tight loop
(
Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 16.529 - 11.411, // abs times taken from audio file
	\rate, 1,
	\startPos, 11.411 / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.01,
	\amp, 1,
	\legato, 1
).play(~clock, quant: 4).quant = 4;
)
*/
