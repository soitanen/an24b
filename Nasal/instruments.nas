## Before anything else change random seed.
srand();


# Creating random offsets on left and right KPPM
var kppm_init = func(i) {
	var kppm_start_offset = int(360*rand());
	setprop("/instrumentation/kppm["~i~"]/scale-offset", kppm_start_offset);
}

kppm_init(0);
kppm_init(1);

#Creating random magnetic heading indication on start-up
var gik_init = func {
	var gik_indicated_heading = 360*rand();
	setprop("/instrumentation/gik-1/indicated-heading", gik_indicated_heading);
	setprop("/instrumentation/gik-1/correction-speed-degsec", 0.05);
}

gik_init();


# Code for GIK-1

var gik_update = func(period) {
	var input_heading = getprop("/orientation/heading-magnetic-deg");
	var indicated_heading = getprop("/instrumentation/gik-1/indicated-heading");
	var yaw_rate = getprop("/orientation/yaw-rate-degps");
	if ( yaw_rate == nil ) yaw_rate = 0.0;
	var delta_heading = geo.normdeg180(indicated_heading - input_heading);

	if (delta_heading < 0) {
		var correction_speed = getprop("/instrumentation/gik-1/correction-speed-degsec");
	} else if (delta_heading >= 0) {
		var correction_speed = getprop("/instrumentation/gik-1/correction-speed-degsec") * -1;
	}

	if (abs(yaw_rate) > 0.2) {
		correction_speed = yaw_rate;
	}

	controls.slewProp ("/instrumentation/gik-1/indicated-heading", correction_speed );
	indicated_heading = geo.normdeg(getprop("/instrumentation/gik-1/indicated-heading"));
	setprop("/instrumentation/gik-1/indicated-heading", indicated_heading);
	#setprop("/instrumentation/gik-1/delta-heading", delta_heading); # FOR DEBUG
	#setprop("/instrumentation/gik-1/corr-speed-fact", correction_speed); # FOR DEBUG
	settimer(func {gik_update(period);}, period);
}

gik_update(0); #run GIK-1 at framerate rate


#save sound volume and deny sound for startup

var vol = getprop("/sim/sound/volume");
	  setprop("an24/volume", vol);  
	  setprop("/sim/sound/volume", 0.0);
print("PNK started");

#set parking brake after simulator start-up

var parkBrakeSet = func {
	setprop("/controls/gear/brake-parking", 1);
}
setlistener("/sim/signals/fdm-initialized", parkBrakeSet);

# ARK No.1 Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-1", 120.0);
setprop("an24/ARK-11/fine-khz-1", 0.0);

var addfreqs = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-1");
 var finetune = getprop("an24/ARK-11/fine-khz-1");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-1", finalfreq);
 setprop("/instrumentation/adf[0]/frequencies/selected-khz", finalfreq);
}

 setlistener("an24/ARK-11/sub-band-khz-1", addfreqs);
 setlistener("an24/ARK-11/fine-khz-1", addfreqs);

# ARK No.2 Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-2", 120.0);
setprop("an24/ARK-11/fine-khz-2", 0.0);

var addfreqs = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-2");
 var finetune = getprop("an24/ARK-11/fine-khz-2");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-2", finalfreq);
 setprop("/instrumentation/adf[1]/frequencies/selected-khz", finalfreq);
}

 setlistener("an24/ARK-11/sub-band-khz-2", addfreqs);
 setlistener("an24/ARK-11/fine-khz-2", addfreqs);


# AChS stopwatch
var stopwatch = func {
        var startbtn = getprop("an24/AChS/start-btn");
	if ( startbtn = 1) {
        var flighttime = getprop("/sim/time/elapsed-sec") - getprop("an24/AChS/begin");
	setprop("an24/AChS/flighttime", int(flighttime));
        settimer(stopwatch, 0.4);
	}
	else {
	setprop("an24/AChS/flighttime", 0);
	}
}

 setlistener("an24/AChS/start-btn", stopwatch);
