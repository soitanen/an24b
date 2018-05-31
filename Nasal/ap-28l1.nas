srand();

var powerOn = func {
	if (getprop("/an24/AP-28l1/internal/powered")) {
		setprop("/an24/AP-28l1/internal/power-on-time", getprop("/sim/time/elapsed-sec") + 5 + rand()*10);
	} else {
		setprop("/an24/AP-28l1/internal/engaged", 0);
		setprop("/an24/AP-28l1/internal/kv", 0);
	}

}
setlistener("/an24/AP-28l1/internal/powered", powerOn, 0, 0);

var engage_ap = func {
	if (getprop("/an24/AP-28l1/internal/armed")) {
		setprop("/an24/AP-28l1/internal/engaged", 1);
		setprop("/an24/AP-28l1/internal/horizon-mode", 0);
		setprop("/an24/AP-28l1/internal/target-pitch", getprop("/instrumentation/agd-l/indicated-pitch-deg"));
		headings_write();
	} else {
		setprop("/an24/AP-28l1/internal/horizon-mode", 0);
		setprop("/an24/AP-28l1/internal/target-pitch", getprop("/instrumentation/agd-l/indicated-pitch-deg"));
		headings_write();
	}
}

var engage_horizon_mode = func {
	setprop("/an24/AP-28l1/internal/horizon-mode", 1);
	setprop("/an24/AP-28l1/internal/target-pitch", 0.5);
	settimer(engage_kv_mode,10);
}

var engage_kv_mode = func {
	setprop("/an24/AP-28l1/internal/kv", 1);
	setprop("/an24/AP-28l1/internal/target-pressure-inhg", getprop("/systems/static[0]/pressure-inhg"));
}

var headings_write = func {
	setprop("/an24/AP-28l1/internal/target-heading-gpk-52", getprop("instrumentation/gpk-52/indicated-heading-deg"));
	setprop("/an24/AP-28l1/internal/target-heading-gik-1", getprop("instrumentation/gik-1/indicated-heading"));
	setprop("/an24/AP-28l1/internal/rudder-gik-1-integrator", 0);
}

setlistener("/an24/AP-28l1/switches/roll-control", headings_write, 0, 0);
setlistener("/an24/AP-28l1/internal/yaw-mode", headings_write, 0, 0);
