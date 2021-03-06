/*

this file contains:

- the ~dursFrom function that extracts duration from an Array
- custom event type \dirt which picks mono or stereo synthdef according to given sample
- ProxySpace clock creation
- bpm change shortcut

*/




// shortcut to manipulate tempo
~bpm = { |bpm| p.clock.tempo = bpm/60 };



// Custom function - takes in a list and optional cycle duration in beats.
// Returns a list of durations based on the composition of the array
~dursFrom = {|array, dur=1|
    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~dursFrom.value(item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;
};


Event.addEventType(\dirt, {
	~instrument = if(d.at(~sampleName).numChannels == 1, { \pb1 }, { \pb2 });
	~buf = d.at(~sampleName);
	~testFunc = { |number| number * 2 };
	~type = \note;
	currentEnvironment.play;
});


// List all existing Ndefs, with info whether it's playing and monitoring
~listAll = {
	var isPlaying, isMonitoring, string, return;
	return = List.new;
	Ndef.dictFor(s).do({ | ndef |
		var key = ndef.key;
		isPlaying = if(Ndef(key).isPlaying, { 1 }, { 0 });
		isMonitoring = if(Ndef(key).isMonitoring, { 1 }, { 0 });
		string = "m % p % Ndef(%)";
		if( (isPlaying==1) && (isMonitoring==1),
			{ string = "***" ++ string };
		);
		return.add(string.format(isMonitoring, isPlaying, ("\\" ++ key.asString)));
	});
	return.sort.do({ |s| s.postln });
	"m=monitoring, p=playing";
};

// Free all Ndefs except the ones in the list provided as argument
~freeAll = { | fadeTime = 5, leaveAlone |
	var exceptions = if( leaveAlone.isArray.not, { [ leaveAlone ] }, { leaveAlone });

	// never free metronome Ndefs
	exceptions = exceptions.add([\t, \tempo]).flat;

	Ndef.dictFor(s).do({ | ndef |
		var key = ndef.key;
		if( (exceptions.includes(key).not) && (ndef.isPlaying), {
			("Freeing Ndef(\\" ++ key.asString ++ ")...").postln;
			Ndef(key.asSymbol).free(fadeTime);
		}, {
			// ("Ndef(\\" ++ key.asString ++ ") left untouched").postln;
		})
	});
	"freeing active Ndefs over % seconds... \n".postf(fadeTime);
};

/*
~sendScoreMsg = { | string |
	try { ~myClient.sendMessage(
		SCLOrkChatMessage.new(
			senderId: 0,
			recipientIds: [0],
			type: \plain,
			contents: string,
		)
	);
	}
};
*/

currentEnvironment.pairsDo({ |k, v| [k, v].postln });

"Utility Functions loaded".postln;






