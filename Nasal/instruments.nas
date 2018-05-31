## Before anything else change random seed.
srand();


# Creating random offsets on left and right KPPM
var kppm_init = func(i) {
	var kppm_start_offset = int(360*rand());
	setprop("/instrumentation/kppm["~i~"]/scale-offset", kppm_start_offset);
	setprop("/instrumentation/nav["~i~"]/radials/selected-deg", kppm_start_offset);
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

##  SPU-7 comm
setprop("an24/SPU-7/lc_source", 0.0);
setprop("an24/SPU-7/rc_source", 0.0);
setprop("an24/SPU-7/eng_source", 0.0);
setprop("an24/SPU-7/nav_source", 0.0);
setprop("an24/SPU-7/listen_viewnr0", 0.0);
setprop("an24/SPU-7/listen_viewnr8", 0.0);
setprop("an24/SPU-7/listen_viewnr9", 0.0);
setprop("an24/SPU-7/listen_viewnr10", 0.0);
setprop("an24/SPU-7/general_viewnr0", 0.0);
setprop("an24/SPU-7/general_viewnr8", 0.0);
setprop("an24/SPU-7/general_viewnr9", 0.0);
setprop("an24/SPU-7/general_viewnr10", 0.0);

setprop("an24/AZS/sw0509", 0.0);
var r8021audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( (getprop("an24/SPU-7/lc_source") == 0.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 0.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 0.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 0.0 and viewnr == 10 ) ) {
	var listenvol = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "") * getprop("an24/R-802/volume-1") * getprop("an24/AZS/sw0509") ;
	if( listenvol == nil ) listenvol = 0.0 ;
	setprop("/instrumentation/comm[0]/volume", listenvol );
	}
	else {
	setprop("/instrumentation/comm[0]/volume", 0.0 );
	}
}

 setlistener("/sim/current-view/view-number", r8021audible);
 setlistener("an24/R-802/volume-1", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr0", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr8", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr9", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr10", r8021audible);
 setlistener("an24/SPU-7/lc_source", r8021audible);
 setlistener("an24/SPU-7/rc_source", r8021audible);
 setlistener("an24/SPU-7/eng_source", r8021audible);
 setlistener("an24/SPU-7/nav_source", r8021audible);

setprop("an24/AZS/sw0508", 0.0);
var r8022audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( (getprop("an24/SPU-7/lc_source") == 3.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 3.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 3.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 3.0 and viewnr == 10 ) ) {
	var listenvol = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "") * getprop("an24/R-802/volume-2") * getprop("an24/AZS/sw0508") ;
#	if( listenvol == nil ) listenvol = 0.0 ;
	setprop("/instrumentation/comm[1]/volume", listenvol );
	}
	else {
	setprop("/instrumentation/comm[1]/volume", 0.0 );
	}
}

 setlistener("/sim/current-view/view-number", r8022audible);
 setlistener("an24/R-802/volume-2", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr0", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr8", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr9", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr10", r8022audible);
 setlistener("an24/SPU-7/lc_source", r8022audible);
 setlistener("an24/SPU-7/rc_source", r8022audible);
 setlistener("an24/SPU-7/eng_source", r8022audible);
 setlistener("an24/SPU-7/nav_source", r8022audible);

#var r8361audible = func {
#	var viewnr = getprop("/sim/current-view/view-number");
#	if ( (getprop("an24/SPU-7/lc_source") == 3.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 3.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 3.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 3.0 and viewnr == 10 ) ) {
#	var listenvol = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "") * getprop("an24/R-836/eng_volume");
#	if( listenvol == nil ) listenvol = 0.0 ;
#	setprop("/instrumentation/comm[1]/volume", listenvol );
#	}
#	else {
#	setprop("/instrumentation/comm[1]/volume", 0.0 );
#	}
#}

# setlistener("/sim/current-view/view-number", r8361audible);
# setlistener("an24/R-836/eng_volume", r8361audible);
# setlistener("an24/SPU-7/listen_viewnr0", r8361audible);
# setlistener("an24/SPU-7/listen_viewnr8", r8361audible);
# setlistener("an24/SPU-7/listen_viewnr9", r8361audible);
# setlistener("an24/SPU-7/listen_viewnr10", r8361audible);
# setlistener("an24/SPU-7/lc_source", r8361audible);
# setlistener("an24/SPU-7/rc_source", r8361audible);
# setlistener("an24/SPU-7/eng_source", r8361audible);
# setlistener("an24/SPU-7/nav_source", r8361audible);

setprop("an24/AZS/sw0512", 0.0);
var ark1audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( (getprop("an24/SPU-7/lc_source") == 4.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 4.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 4.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 4.0 and viewnr == 10 ) ) {
	var listenvol = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "") * getprop("an24/ARK-11/vol-1") * getprop("an24/AZS/sw0512") * getprop("an24/AZS/sw0513") ;
	if( listenvol == nil ) listenvol = 0 ;
	setprop("/instrumentation/adf[0]/volume-norm", listenvol );
	setprop("/instrumentation/adf[2]/volume-norm", listenvol );
	}
	else {
	setprop("/instrumentation/adf[0]/volume-norm", 0.0 );
	setprop("/instrumentation/adf[2]/volume-norm", 0.0 );
	}
}

 setlistener("/sim/current-view/view-number", ark1audible);
 setlistener("an24/ARK-11/vol-1", ark1audible);
# setlistener("an24/ARK-11/volumeknob-1", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr0", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr8", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr9", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr10", ark1audible);
 setlistener("an24/SPU-7/lc_source", ark1audible);
 setlistener("an24/SPU-7/rc_source", ark1audible);
 setlistener("an24/SPU-7/eng_source", ark1audible);
 setlistener("an24/SPU-7/nav_source", ark1audible);

setprop("an24/AZS/sw0514", 0.0);
var ark2audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( (getprop("an24/SPU-7/lc_source") == 5.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 5.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 5.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 5.0 and viewnr == 10 ) ) {
	var listenvol = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "") * getprop("an24/ARK-11/vol-2") * getprop("an24/AZS/sw0514") * getprop("an24/AZS/sw0515") ;
	if( listenvol == nil ) listenvol = 0 ;
	setprop("/instrumentation/adf[1]/volume-norm", listenvol );
	setprop("/instrumentation/adf[3]/volume-norm", listenvol );
	}
	else {
	setprop("/instrumentation/adf[1]/volume-norm", 0.0 );
	setprop("/instrumentation/adf[3]/volume-norm", 0.0 );
	}
}

 setlistener("/sim/current-view/view-number", ark2audible);
 setlistener("an24/ARK-11/vol-2", ark2audible);
# setlistener("an24/ARK-11/volumeknob-2", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr0", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr8", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr9", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr10", ark2audible);
 setlistener("an24/SPU-7/lc_source", ark2audible);
 setlistener("an24/SPU-7/rc_source", ark2audible);
 setlistener("an24/SPU-7/eng_source", ark2audible);
 setlistener("an24/SPU-7/nav_source", ark2audible);

##  AChS
setprop("an24/AChS/mp_l-press-anim", 0 );
setprop("an24/AChS/rc_l-press-anim", 0 );
setprop("an24/AChS/nav_l-press-anim", 0 );

#  Middle panel AChS Stopwatch
setprop("an24/AChS/mp_stopwatch", 0 );
setprop("an24/AChS/mp_r-turn", 1 );
setprop("an24/AChS/mp_r-mode", 2 );

var mp_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/mp_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/mp_stopwatch", int(sw_time));
});

# Middle panel AChS Flighttime
setprop("an24/AChS/mp_flighttime", 0 );
setprop("an24/AChS/mp_l-mode", 0 );

var mp_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/mp_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/mp_flighttime", int(fl_time));
});

# Middle panel AChS wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
setprop("an24/AChS/mp_wind_up", 1000 );

var mp_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/mp_wind_up");
	if ( getprop("an24/AChS/mp_wind_up") > 0 and getprop("/instrumentation/clock/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/mp_wind_up", int(windup));
	setprop("an24/AChS/mp_running", 1 );
	}
	else {
	setprop("an24/AChS/mp_running", 0 );
	mp_wtimer.stop();
	mp_stopwatch.stop();
	mp_flitetimer.stop();
	}
});
mp_wtimer.start();

#  Right console AChS Stopwatch
setprop("/instrumentation/clock[1]/serviceable", 1 );
setprop("an24/AChS/rc_stopwatch", 0 );
setprop("an24/AChS/rc_r-turn", 1 );
setprop("an24/AChS/rc_r-mode", 2 );

var rc_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/rc_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/rc_stopwatch", int(sw_time));
});

# Right console AChS Flighttime
setprop("an24/AChS/rc_flighttime", 0 );
setprop("an24/AChS/rc_l-mode", 0 );

var rc_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/rc_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/rc_flighttime", int(fl_time));
});

# Right console AChS wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
setprop("an24/AChS/rc_wind_up", 1000 );

var rc_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/rc_wind_up");
	if ( getprop("an24/AChS/rc_wind_up") > 0 and getprop("/instrumentation/clock[1]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/rc_wind_up", int(windup));
	setprop("an24/AChS/rc_running", 1 );
	}
	else {
	setprop("an24/AChS/rc_running", 0 );
	rc_wtimer.stop();
	rc_stopwatch.stop();
	rc_flitetimer.stop();
	}
});
rc_wtimer.start();

#  Navigator's AChS Stopwatch
setprop("/instrumentation/clock[2]/serviceable", 1 );
setprop("an24/AChS/nav_stopwatch", 0 );
setprop("an24/AChS/nav_r-turn", 1 );
setprop("an24/AChS/nav_r-mode", 2 );

var nav_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/nav_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/nav_stopwatch", int(sw_time));
});

# Navigator's AChS Flighttime
setprop("an24/AChS/nav_flighttime", 0 );
setprop("an24/AChS/nav_l-mode", 0 );

var nav_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/nav_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/nav_flighttime", int(fl_time));
});

# Navigator's AChS wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
setprop("an24/AChS/nav_wind_up", 1000 );

var nav_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/nav_wind_up");
	if ( getprop("an24/AChS/nav_wind_up") > 0 and getprop("/instrumentation/clock[2]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/nav_wind_up", int(windup));
	setprop("an24/AChS/nav_running", 1 );
	}
	else {
	setprop("an24/AChS/nav_running", 0 );
	nav_wtimer.stop();
	nav_stopwatch.stop();
	nav_flitetimer.stop();
	}
});
nav_wtimer.start();

# 2PPT1-4 Fuel Level Indicator
var fuelind = func {
	if ( getprop("an24/PG5and2PPT1/selected-ind") == 1.0 ) {
        var indicatedl = (getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg") + getprop("/consumables/fuel/tank[2]/level-kg")) * 2 / 3;
        var indicatedr = (getprop("/consumables/fuel/tank[3]/level-kg") + getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg")) * 2 / 3;
	}
	else if ( getprop("an24/PG5and2PPT1/selected-ind") == 2.0 ) {
        var indicatedl = getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg");
        var indicatedr = getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg");
	}
	else if ( getprop("an24/PG5and2PPT1/selected-ind") == 3.0 ) {
        var indicatedl = getprop("/consumables/fuel/tank[2]/level-kg");
        var indicatedr = getprop("/consumables/fuel/tank[3]/level-kg");
	}
	else {
        var indicatedl = 0.0;
        var indicatedr = 0.0;
	}
	interpolate("an24/PG5and2PPT1/indicatedl", indicatedl, 0.8 );
	interpolate("an24/PG5and2PPT1/indicatedr", indicatedr, 0.8 );
	settimer(fuelind, 23);
}

 setlistener("an24/PG5and2PPT1/selected-ind", fuelind);
