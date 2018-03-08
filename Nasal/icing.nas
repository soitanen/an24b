# amount of build-up or subliminating should be rather something like this:
# ice-cm + icing-severity * /velocities/airspeed-kt * (sensitivity + ice-amount) * deltatime

setprop("an24/Anti-Ice/window_heating-left-low", "0.0");
setprop("an24/Anti-Ice/window_heating-left-intense", "0.0");
setprop("an24/Anti-Ice/elements/windowL_cm", "0.0");
setprop("an24/Anti-Ice/elements/windowL_cmpermin", "0.0");

# low window heat switch 0.25 (?W), intense 1.0 (?W), so full power 1.25; if tat -62,5 degC/-50 = 1.25 -> heating = freezing; fantasy numbers,
# real ones need to be investigated

var Lwindow_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/windowL_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -50 ) - getprop("an24/Anti-Ice/window_heating-left-low") - getprop("an24/Anti-Ice/window_heating-left-intense") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/windowL_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/windowL_cm", thickness + (cmpermin/10*speedup), 6 );
	}
});

Lwindow_icing.start();

setprop("an24/Anti-Ice/window_heating-right-low", "0.0");
setprop("an24/Anti-Ice/window_heating-right-intense", "0.0");
setprop("an24/Anti-Ice/elements/windowR_cm", "0.0");
setprop("an24/Anti-Ice/elements/windowR_cmpermin", "0.0");

var Rwindow_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/windowR_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -50 ) - getprop("an24/Anti-Ice/window_heating-right-low") - getprop("an24/Anti-Ice/window_heating-right-intense") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/windowR_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/windowR_cm", thickness + (cmpermin/10*speedup), 6 );
	}
});

Rwindow_icing.start();

var Cwindow_icing = func {
        var thickness = ( getprop("an24/Anti-Ice/elements/windowL_cm") + getprop("an24/Anti-Ice/elements/windowR_cm") )/2 ;
	setprop("an24/Anti-Ice/elements/windowC_cm", thickness);
};

 setlistener("an24/Anti-Ice/elements/windowL_cm", Cwindow_icing);
 setlistener("an24/Anti-Ice/elements/windowR_cm", Cwindow_icing);

## Pitots

setprop("an24/Anti-Ice/pitot_S1S5A1", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S1S5A1_cm", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S1S5A1_cmpermin", 0.0 );

var pitots1s5a1_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S1S5A1_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -70 ) - abs(getprop("an24/Anti-Ice/pitot_S1S5A1") );
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/pitot_S1S5A1_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/pitot_S1S5A1_cm", thickness + (cmpermin/10*speedup), 6 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[0]/serviceable", 0 );
	setprop("/systems/static[4]/serviceable", 0 );
	setprop("/systems/pitot[0]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[0]/serviceable", 1 );
	setprop("/systems/static[4]/serviceable", 1 );
	setprop("/systems/pitot[0]/serviceable", 1 );
	}
});

pitots1s5a1_icing.start();

setprop("an24/Anti-Ice/pitot_S3A2", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S3A2_cm", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S3A2_cmpermin", 0.0 );

var pitots3a2_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S3A2_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -70 ) - abs(getprop("an24/Anti-Ice/pitot_S3A2") );
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/pitot_S3A2_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/pitot_S3A2_cm", thickness + (cmpermin/10*speedup), 6 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[2]/serviceable", 0 );
	setprop("/systems/pitot[1]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[2]/serviceable", 1 );
	setprop("/systems/pitot[1]/serviceable", 1 );
	}
});

pitots3a2_icing.start();

setprop("an24/Anti-Ice/pitot_S2S6A3", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S2S6A3_cm", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S2S6A3_cmpermin", 0.0 );

var pitots2s6a3_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S2S6A3_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -70 ) - abs(getprop("an24/Anti-Ice/pitot_S2S6A3") );
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/pitot_S2S6A3_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/pitot_S2S6A3_cm", thickness + (cmpermin/10*speedup), 6 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[1]/serviceable", 0 );
	setprop("/systems/static[5]/serviceable", 0 );
	setprop("/systems/pitot[2]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[1]/serviceable", 1 );
	setprop("/systems/static[5]/serviceable", 1 );
	setprop("/systems/pitot[2]/serviceable", 1 );
	}
});

pitots2s6a3_icing.start();

setprop("an24/Anti-Ice/pitot_S4S7", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S4S7_cm", 0.0 );
setprop("an24/Anti-Ice/elements/pitot_S4S7_cmpermin", 0.0 );

var pitots4s7_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S4S7_cm");
        var cmpermin = ( getprop("/environment/temperature-degc") / -70 ) - abs(getprop("an24/Anti-Ice/pitot_S4S7") );
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	setprop("an24/Anti-Ice/elements/pitot_S4S7_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/pitot_S4S7_cm", thickness + (cmpermin/10*speedup), 6 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[3]/serviceable", 0 );
	setprop("/systems/static[6]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[3]/serviceable", 1 );
	setprop("/systems/static[6]/serviceable", 1 );
	}
});

pitots4s7_icing.start();

