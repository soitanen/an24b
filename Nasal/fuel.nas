setprop("an24/FuelControl/crossfeed", 0.0);
setprop("an24/FuelControl/lmainecn_press", 0.0);
setprop("an24/FuelControl/lfront463_press", 0.0);
setprop("an24/FuelControl/lrear463_press", 0.0);
setprop("an24/FuelControl/rmainecn_press", 0.0);
setprop("an24/FuelControl/rrear463_press", 0.0);
setprop("an24/FuelControl/rfront463_press", 0.0);

var autol = func {
	if ( getprop("an24/FuelControl/sw0402") == 0.0 or ( getprop("an24/FuelControl/sw0402") == 1.0 and ( getprop("an24/FuelControl/lrear463_press") > 0.12 and getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg") > 450.0 or getprop("/consumables/fuel/tank[2]/level-kg") < 0.1 ) ) ) {
	setprop("an24/FuelControl/lmainecn_press", 0.0 );
	}
	else {
	setprop("an24/FuelControl/lmainecn_press", 0.6 );
	}
 settimer(autol, 0.1);
}

setlistener("sim/signals/fdm-initialized", autol);

var autor = func {
	if ( getprop("an24/FuelControl/sw0406") == 0.0 or ( getprop("an24/FuelControl/sw0406") == 1.0 and ( getprop("an24/FuelControl/rrear463_press") > 0.12 and getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg") > 450.0 or getprop("/consumables/fuel/tank[3]/level-kg") < 0.1 ) ) ) {
	setprop("an24/FuelControl/rmainecn_press", 0.0 );
	}
	else {
	setprop("an24/FuelControl/rmainecn_press", 0.6 );
	}
 settimer(autor, 0.1);
}

setlistener("sim/signals/fdm-initialized", autor);

var ondutyl = func {
	var lauxpress = getprop("an24/FuelControl/lrear463_press") + getprop("an24/FuelControl/lfront463_press");
	var lmainpress = getprop("an24/FuelControl/lmainecn_press");
	if ( lauxpress < lmainpress ) {
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyl", 1.0 );
	}
	else if ( lauxpress > 0.0 ) {
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyl", 2.0 );
	}
	else {
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyl", 0.0);
	}
}
setlistener("an24/FuelControl/lmainecn_press", ondutyl);
setlistener("an24/FuelControl/lrear463_press", ondutyl);
setlistener("an24/FuelControl/lfront463_press", ondutyl);

var cutoffl = func {
	if ( getprop("an24/FuelControl/groupondutyl") == 0.0 and getprop("an24/FuelControl/crossfeed") == 0.0 ) {
	setprop("an24/FuelControl/cutoff-l-by-fs", 1.0);
	setprop("/controls/engines/engine[0]/cutoff", 1.0 );
	}
	else if ( getprop("an24/FuelControl/cutoff-l-by-sw") == 0.0 ) {
	setprop("/controls/engines/engine[0]/cutoff", 0.0 );
	}
}
setlistener("an24/FuelControl/groupondutyl", cutoffl);
setlistener("an24/FuelControl/crossfeed", cutoffl);
setlistener("an24/FuelControl/cutoff-l-by-sw", cutoffl);

var ondutyr = func {
	var rauxpress = getprop("an24/FuelControl/rrear463_press") + getprop("an24/FuelControl/rfront463_press");
	var rmainpress = getprop("an24/FuelControl/rmainecn_press");
	if ( rauxpress < rmainpress ) {
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyr", 1.0 );
	}
	else if ( rauxpress > 0.0 ) {
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyr", 2.0 );
	}
	else {
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 0.0);
	setprop("an24/FuelControl/groupondutyr", 0.0);
	}
}
setlistener("an24/FuelControl/rmainecn_press", ondutyr);
setlistener("an24/FuelControl/rrear463_press", ondutyr);
setlistener("an24/FuelControl/rfront463_press", ondutyr);

var cutoffr = func {
	if ( getprop("an24/FuelControl/groupondutyr") == 0.0 and getprop("an24/FuelControl/crossfeed") == 0.0 ) {
	setprop("an24/FuelControl/cutoff-r-by-fs", 1.0);
	setprop("/controls/engines/engine[1]/cutoff", 1.0 );
	}
	else if ( getprop("an24/FuelControl/cutoff-r-by-sw") == 0.0 ) {
	setprop("/controls/engines/engine[1]/cutoff", 0.0 );
	}
}
setlistener("an24/FuelControl/groupondutyr", cutoffr);
setlistener("an24/FuelControl/crossfeed", cutoffr);
setlistener("an24/FuelControl/cutoff-r-by-sw", cutoffr);

# Equalizing left tanks
var giveandgetl = func {
	var equalleft = getprop("/fdm/jsbsim/propulsion/engine[1]/fuel-flow-rate-pps") / ( getprop("an24/FuelControl/groupondutyl") + getprop("an24/FuelControl/groupondutyr") ) - ( ( getprop("/fdm/jsbsim/propulsion/engine[0]/fuel-flow-rate-pps") * getprop("an24/FuelControl/groupondutyr") ) / ( getprop("an24/FuelControl/groupondutyl") * ( getprop("an24/FuelControl/groupondutyl") + getprop("an24/FuelControl/groupondutyr") ) ) );
if ( getprop("an24/FuelControl/crossfeed") == 0 ) {
	if ( getprop("an24/FuelControl/groupondutyl") == 1 ) {
	setprop("/fdm/jsbsim/propulsion/tank[2]/external-flow-rate-pps", equalleft );
	setprop("/fdm/jsbsim/propulsion/tank[1]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[0]/external-flow-rate-pps", 0 );
	}
	else if ( getprop("an24/FuelControl/groupondutyl") == 2 ) {
	setprop("/fdm/jsbsim/propulsion/tank[0]/external-flow-rate-pps", equalleft );
	setprop("/fdm/jsbsim/propulsion/tank[1]/external-flow-rate-pps", equalleft );
	setprop("/fdm/jsbsim/propulsion/tank[2]/external-flow-rate-pps", 0 );
	}
	else {
	setprop("/fdm/jsbsim/propulsion/tank[0]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[1]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[2]/external-flow-rate-pps", 0 );
	}}
else {
	setprop("/fdm/jsbsim/propulsion/tank[0]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[1]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[2]/external-flow-rate-pps", 0 );
}
	
 settimer(giveandgetl, 0.1);
}
setlistener("sim/signals/fdm-initialized", giveandgetl);

# Equalizing right tanks
var giveandgetr = func {
	var equalright = getprop("/fdm/jsbsim/propulsion/engine[0]/fuel-flow-rate-pps") / ( getprop("an24/FuelControl/groupondutyl") + getprop("an24/FuelControl/groupondutyr") ) - ( ( getprop("/fdm/jsbsim/propulsion/engine[1]/fuel-flow-rate-pps") * getprop("an24/FuelControl/groupondutyl") ) / ( getprop("an24/FuelControl/groupondutyr") * ( getprop("an24/FuelControl/groupondutyl") + getprop("an24/FuelControl/groupondutyr") ) ) );
if ( getprop("an24/FuelControl/crossfeed") == 0 ) {
	if ( getprop("an24/FuelControl/groupondutyr") == 1 ) {
	setprop("/fdm/jsbsim/propulsion/tank[3]/external-flow-rate-pps", equalright );
	setprop("/fdm/jsbsim/propulsion/tank[4]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[5]/external-flow-rate-pps", 0 );
	}
	else if ( getprop("an24/FuelControl/groupondutyr") == 2 ) {
	setprop("/fdm/jsbsim/propulsion/tank[5]/external-flow-rate-pps", equalright );
	setprop("/fdm/jsbsim/propulsion/tank[4]/external-flow-rate-pps", equalright );
	setprop("/fdm/jsbsim/propulsion/tank[3]/external-flow-rate-pps", 0 );
	}
	else {
	setprop("/fdm/jsbsim/propulsion/tank[5]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[4]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[3]/external-flow-rate-pps", 0 );
	}}
else {
	setprop("/fdm/jsbsim/propulsion/tank[5]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[4]/external-flow-rate-pps", 0 );
	setprop("/fdm/jsbsim/propulsion/tank[3]/external-flow-rate-pps", 0 );
}
	
 settimer(giveandgetr, 0.1);
}
setlistener("sim/signals/fdm-initialized", giveandgetr);
