//////// Buttons for useful functions like this:

Butz.clear;
Butz.numButz = 20;
Butz.style.font_(Butz.style.font.size_(14));
try { Butz.w.close };
Butz.makeWin;
Butz.w.layout.margins = [4, 4, 4, 4];
Butz.w.layout.spacing_(2);
Butz.w.moveTo(0, 0);


///// make all button names here first, in the desired order.
///// put simple actions in directly;
///// put more complex actions in as MFdef(name) or WinBounds.showOrMake(name);
///// and fill those functions later.



// custom buttons

Butz.add(~myName.asSymbol, {
	(
		"My name is "
		++
		~myName.asString
		++
		[
			" and I shall not be moved",
			" and I approve of this message"
		].choose;
	).postln;
});


Butz.add('   -   ', { "this is just a space divider" });



Butz.add('Dirt Samples', {
	d = SCLOrkSamples.loadFolder(Quarks.folder +/+ "Dirt-Samples")
});

Butz.add('SCLOrkSynths', {
	/*
	(PathName(q.hyperfolder).parentPath ++ "25x25_SynthDefs.scd").load;
	(PathName(q.hyperfolder).parentPath ++ "25x25_Functions.scd").load;
	(PathName(q.hyperfolder).parentPath ++ "25x25_NdefSetup.scd").load;
	*/
	SCLOrkSynths.gui;
});

Butz.add('SCLOrkChat', {
	if( ~myName == "bruno", {

		~myClient = SCLOrkChatClient.new(
			serverAddress: "cmn17.stanford.edu",
			serverPort: 61010
		);

		SCLOrkChat.new(~myName.asString, true, ~myClient);

		"LOGGED IN AS CONDUCTOR".postln;

	}, {
		SCLOrkChat.new(~myName.asString)
	});
});

Butz.add('Load All The Rest', {

	(q.hyperfolder +/+ "customProxySpaceTempoClock.scd").load;
	(q.hyperfolder +/+ "customSynthDefs.scd").load;
	(q.hyperfolder +/+ "customFunctions.scd").load;

});


Butz.add('-', { "this is just a space divider" });




Butz.add('my scd file', {
	try({ (
		PathName(q.hyperfolder).parentPath
		++
		~myName.asString
		++
		".scd"
	).openDocument;
	},
	{ "***oops -- are you sure your nickname matches your scd file?".postln; }
);
});

Butz.add(' - ', { "this is just a space divider" });

Butz.add('PUBLIC', MFdef('PUBLIC'));
Butz.add('PRIVATE', MFdef('PRIVATE'));

MFdef('PUBLIC').add(\winColor, { Butz.w.background_(Color.black) });
MFdef('PRIVATE').add(\winColor, { Butz.w.background_(Color.red) });


Butz.add('  -  ', { "this is just a space divider" });

// ====================
// utility buttons
Butz.add('StartupFile', {
	if( (try { StartupFile.select }).isNil, { StartupFile.choose });
});

// Butz.add('hyperfolder', { q.hyperfolder.openOS });

Butz.add(\postPeers, {
	var peers = q.oscRouter.peers;
	"*** q.oscRouter has % peers: \n%\n".postf(peers.size, peers.sort)
});



// Butz.add('loadSynthLib', { (q.hyperfolder +/+ "libs/_SynthLib.scd").load });
// Butz.add('loadSampLib', { (q.hyperfolder +/+ "libs/_SampleLib.scd").load });
// Butz.add('loadFXLib', { (q.hyperfolder +/+ "libs/_FXLib.scd").load });

// Butz.add('CodingDojo', MFdef('CodingDojo'));

Butz.add( \History, { WinBounds.showOrMake(\History) });
Butz.add( \SyncText, MFdef(\SyncText) );


// Butz.add('ndefmix', { WinBounds.showOrMake(\ndefmix) });


// Butz.add(\DRAW, { WinBounds.showOrMake(\DRAW) });
// Butz.add('MFdef_draw', { WinBounds.showOrMake('MFdef_draw') });


// Butz.add('scope', { WinBounds.showOrMake(\scope) });

Butz.add(\meter, {
	// s.meter.window.close;
	WinBounds.showOrMake(\meter);
	Window.find(\meter).moveTo(120, 0);
});
// Butz.add('recSetup', MFdef('recSetup'));
// Butz.add('record', { s.record });
// Butz.add('stopRec', { s.stopRecording });

/*
Butz.add(\MainFX, { WinBounds.showOrMake(\MasterFX) });
WinBounds.addMake(\MasterFX, { MasterFX(s).gui.parent.name_(\MasterFX) });
*/


WinBounds.addMake(\ndefmix, {
	q.mixer = NdefMixer(s, 24);
	q.mixer.parent.name_(\ndefmix);
	ProxyMeter.addMixer(q.mixer);
	q.mixer.parent;
});

WinBounds.addMake(\meter, {
	var w;
	w = s.meter.window;
	w.name_(\meter);
	w.alwaysOnTop_(true);
	w;
});
/*
MFdef('recSetup').add(\makeDoc, {
	Document("myRecSetup", [
		"/**** ",
		"for sharing recordings, convert to mp3 files (192 kbps),",
		"and upload them to HyperDisCo_shared!",
		"****/",
		"",
		"// my recording setup - recordings go here:",
		"Platform.recordingsDir = %;".format(Platform.recordingsDir.cs),
		"Platform.recordingsDir.openOS;",
		"",
		"// other record settings:",
		"s.recChannels_(%);".format(s.recChannels.cs),
		"/// one of: 'wav', 'aiff', (on macOS also:), 'caf'",
		"s.recHeaderFormat_(%);".format("wav"),
		"/// one of: 'int16', 'int24', , 'float'",
		"s.recSampleFormat_(%);".format(s.recSampleFormat.cs),
	].join("\n")
	);
	nil;
});

WinBounds.addMake(\scope, {
	var w = s.scope.window;
	w.name_(\scope);
});



