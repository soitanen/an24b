##
# ARK-11 stuff

setprop("an24/ARK-11/mem1/fix1sb", 120.0);
setprop("an24/ARK-11/mem1/fix2sb", 120.0);
setprop("an24/ARK-11/mem1/fix3sb", 120.0);
setprop("an24/ARK-11/mem1/fix4sb", 120.0);
setprop("an24/ARK-11/mem1/fix5sb", 120.0);
setprop("an24/ARK-11/mem1/fix6sb", 120.0);
setprop("an24/ARK-11/mem1/fix7sb", 120.0);
setprop("an24/ARK-11/mem1/fix8sb", 120.0);
setprop("an24/ARK-11/mem1/fix9sb", 120.0);
setprop("an24/ARK-11/mem1/fix1ff", 0.0);
setprop("an24/ARK-11/mem1/fix2ff", 0.0);
setprop("an24/ARK-11/mem1/fix3ff", 0.0);
setprop("an24/ARK-11/mem1/fix4ff", 0.0);
setprop("an24/ARK-11/mem1/fix5ff", 0.0);
setprop("an24/ARK-11/mem1/fix6ff", 0.0);
setprop("an24/ARK-11/mem1/fix7ff", 0.0);
setprop("an24/ARK-11/mem1/fix8ff", 0.0);
setprop("an24/ARK-11/mem1/fix9ff", 0.0);
setprop("an24/ARK-11/mem2/fix1sb", 120.0);
setprop("an24/ARK-11/mem2/fix2sb", 120.0);
setprop("an24/ARK-11/mem2/fix3sb", 120.0);
setprop("an24/ARK-11/mem2/fix4sb", 120.0);
setprop("an24/ARK-11/mem2/fix5sb", 120.0);
setprop("an24/ARK-11/mem2/fix6sb", 120.0);
setprop("an24/ARK-11/mem2/fix7sb", 120.0);
setprop("an24/ARK-11/mem2/fix8sb", 120.0);
setprop("an24/ARK-11/mem2/fix9sb", 120.0);
setprop("an24/ARK-11/mem2/fix1ff", 0.0);
setprop("an24/ARK-11/mem2/fix2ff", 0.0);
setprop("an24/ARK-11/mem2/fix3ff", 0.0);
setprop("an24/ARK-11/mem2/fix4ff", 0.0);
setprop("an24/ARK-11/mem2/fix5ff", 0.0);
setprop("an24/ARK-11/mem2/fix6ff", 0.0);
setprop("an24/ARK-11/mem2/fix7ff", 0.0);
setprop("an24/ARK-11/mem2/fix8ff", 0.0);
setprop("an24/ARK-11/mem2/fix9ff", 0.0);
setprop("an24/ARK-11/signal-1", 0.0);
setprop("an24/ARK-11/signal-2", 0.0);

## ARK-11 No. 1
#
# ARK No. 1 Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-1", 120.0);
setprop("an24/ARK-11/fine-khz-1", 0.0);
var addfreqs1 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-1");
 var finetune = getprop("an24/ARK-11/fine-khz-1");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-1", finalfreq);
 setprop("/instrumentation/adf[0]/frequencies/selected-khz", finalfreq);
 setprop("/instrumentation/adf[2]/frequencies/selected-khz", finalfreq);
}

 setlistener("an24/ARK-11/sub-band-khz-1", addfreqs1);
 setlistener("an24/ARK-11/fine-khz-1", addfreqs1);

#  ARK No. 1 output volume (lowest is best-> antenna at 90° (indication 0°) to source, least interference)
#  adf[2] serves as background reference
setprop("an24/ARK-11/mode-1", 0.0 );
setprop("an24/ARK-11/volumeknob-1", 0.0 );
setprop("an24/ARK-11/vol-1", 0.0 );
setprop("/instrumentation/adf[0]/mode", "off" );
setprop("/instrumentation/adf[0]/indicated-bearing-deg", 180.0 );
setprop("/instrumentation/adf[0]/ident-audible", "true" );
setprop("/instrumentation/adf[0]/serviceable", 1.0 );
setprop("/instrumentation/adf[2]/mode", "off" );
setprop("/instrumentation/adf[2]/indicated-bearing-deg", 0.0 );
setprop("/instrumentation/adf[2]/ident-audible", "true" );
setprop("/instrumentation/adf[2]/serviceable", 1.0 );
setprop("/instrumentation/adf[2]/volume-norm", 1.0 );

var arkoutput1 = func {
	var volume_knob = getprop("an24/ARK-11/volumeknob-1");
	var signalstrength = abs(math.cos( 0.017453 * ( 90 + getprop("/instrumentation/adf[2]/indicated-bearing-deg") - getprop("/instrumentation/adf[0]/indicated-bearing-deg") ) ) );
	setprop("an24/ARK-11/signal-1", signalstrength );
	if ( getprop("an24/ARK-11/mode-1") == 3.0 ) {
	setprop("an24/ARK-11/vol-1", signalstrength );
	}
	else {
	setprop("an24/ARK-11/vol-1", volume_knob );
	}
}

 setlistener("an24/ARK-11/volumeknob-1", arkoutput1);
 setlistener("an24/ARK-11/mode-1", arkoutput1);
 setlistener("/instrumentation/adf[0]/indicated-bearing-deg", arkoutput1);
 setlistener("/instrumentation/adf[2]/indicated-bearing-deg", arkoutput1);


## ARK-11 No. 2
#
# Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-2", 120.0);
setprop("an24/ARK-11/fine-khz-2", 0.0);
var addfreqs2 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-2");
 var finetune = getprop("an24/ARK-11/fine-khz-2");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-2", finalfreq);
 setprop("/instrumentation/adf[1]/frequencies/selected-khz", finalfreq);
 setprop("/instrumentation/adf[3]/frequencies/selected-khz", finalfreq);
}

 setlistener("an24/ARK-11/sub-band-khz-2", addfreqs2);
 setlistener("an24/ARK-11/fine-khz-2", addfreqs2);

#  ARK No. 2 output volume (lowest is best-> antenna at 90° (indication 0°) to source, least interference)
#  adf[3] serves as background reference
setprop("an24/ARK-11/mode-2", 0.0 );
setprop("an24/ARK-11/volumeknob-2", 0.0 );
setprop("an24/ARK-11/vol-2", 0.0 );
setprop("/instrumentation/adf[1]/mode", "off" );
setprop("/instrumentation/adf[1]/indicated-bearing-deg", 180.0 );
setprop("/instrumentation/adf[1]/ident-audible", "true" );
setprop("/instrumentation/adf[1]/serviceable", 1.0 );
setprop("/instrumentation/adf[3]/mode", "off" );
setprop("/instrumentation/adf[3]/indicated-bearing-deg", 0.0 );
setprop("/instrumentation/adf[3]/ident-audible", "true" );
setprop("/instrumentation/adf[3]/serviceable", 1.0 );
setprop("/instrumentation/adf[3]/volume-norm", 1.0 );

var arkoutput2 = func {
	var volume_knob = getprop("an24/ARK-11/volumeknob-2");
	var signalstrength = abs(math.cos( 0.017453 * ( 90 + getprop("/instrumentation/adf[3]/indicated-bearing-deg") - getprop("/instrumentation/adf[1]/indicated-bearing-deg") ) ) );
	setprop("an24/ARK-11/signal-2", signalstrength );
	if ( getprop("an24/ARK-11/mode-2") == 3.0 ) {
	setprop("an24/ARK-11/vol-2", signalstrength );
	}
	else {
	setprop("an24/ARK-11/vol-2", volume_knob );
	}
}

 setlistener("an24/ARK-11/volumeknob-2", arkoutput2);
 setlistener("an24/ARK-11/mode-2", arkoutput2);
 setlistener("/instrumentation/adf[1]/indicated-bearing-deg", arkoutput2);
 setlistener("/instrumentation/adf[3]/indicated-bearing-deg", arkoutput2);


##  R-802 Stuff
setprop("an24/R-802/volume-1", 0.0);
setprop("an24/R-802/volume-2", 0.0);

#  R-802 Summing up frequencies
setprop("an24/R-802/dial100", 100.0);
setprop("an24/R-802/dial10", 0.0);
setprop("an24/R-802/dial1", 0.0);
setprop("/instrumentation/comm[0]/frequencies/selected-mhz", 100.0 );
setprop("/instrumentation/comm[1]/frequencies/selected-mhz", 100.0 );

var add802freqs = func {
 var freq100 = getprop("an24/R-802/dial100");
 var freq10 = getprop("an24/R-802/dial10");
 var freq1 = getprop("an24/R-802/dial1");
 var final802freq = freq100 + freq10 + freq1 / 10 ;
 setprop("an24/R-802/finalfreq", final802freq);
 setprop("/instrumentation/comm[1]/frequencies/selected-mhz", final802freq);
}

 setlistener("an24/R-802/dial100", add802freqs);
 setlistener("an24/R-802/dial10", add802freqs);
 setlistener("an24/R-802/dial1", add802freqs);

#  R-802 Store frequencies
setprop("an24/R-802/memory/num[1]", 100.0);
setprop("an24/R-802/memory/num[2]", 100.0);
setprop("an24/R-802/memory/num[3]", 100.0);
setprop("an24/R-802/memory/num[4]", 100.0);
setprop("an24/R-802/memory/num[5]", 100.0);
setprop("an24/R-802/memory/num[6]", 100.0);
setprop("an24/R-802/memory/num[7]", 100.0);
setprop("an24/R-802/memory/num[8]", 100.0);
setprop("an24/R-802/memory/num[9]", 100.0);
setprop("an24/R-802/memory/num[10]", 100.0);
setprop("an24/R-802/finalfreq", 100.0);
setprop("an24/R-802/channel", 1.0);

var freqmem = func {
var channel = getprop("an24/R-802/channel");
var curfreq = getprop("an24/R-802/finalfreq");
setprop("an24/R-802/memory/num[" ~ channel ~ "]", curfreq);
setprop("/instrumentation/comm[0]/frequencies/selected-mhz", curfreq );
}

 setlistener("an24/R-802/memscrew", freqmem);

#  R-802 Remember frequencies
var freqremem = func {
var channel = getprop("an24/R-802/channel");
var storedfreq = getprop("an24/R-802/memory/num[" ~ channel ~ "]");
interpolate("an24/R-802/dial100", sprintf("%.2s", storedfreq) * 10, 0.2 );
interpolate("an24/R-802/dial10", int(storedfreq) - sprintf("%.2s", storedfreq) * 10, 0.4 );
interpolate("an24/R-802/dial1", (storedfreq - int(storedfreq)) * 10, 0.6 );
setprop("an24/R-802/finalfreq", storedfreq);
setprop("/instrumentation/comm[1]/frequencies/selected-mhz", storedfreq);
}

 setlistener("an24/R-802/rememscrew", freqremem);

#  R-802 Choose Channel
var freqchoice = func {
var channel = getprop("an24/R-802/channel");
var storedfreq = getprop("an24/R-802/memory/num[" ~ channel ~ "]");
setprop("/instrumentation/comm[0]/frequencies/selected-mhz", storedfreq );
}

 setlistener("an24/R-802/channel", freqchoice);
 setlistener("an24/R-802/rememscrew", freqchoice);
