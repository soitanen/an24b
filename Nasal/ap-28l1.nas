srand();

var powerOn = func {
	if (getprop("/an24/ap-28l1/internal/powered")) {
		setprop("/an24/ap-28l1/internal/power-on-time", getprop("/sim/time/elapsed-sec") + 5 + rand()*10)
	} else {
		setprop("/an24/ap-28l1/internal/engaged", 0);
	}

}
setlistener("/an24/ap-28l1/internal/powered", powerOn);

var engage_ap = func {
	if (getprop("/an24/ap-28l1/internal/armed")) {
		setprop("/an24/ap-28l1/internal/engaged", 1);
		setprop("/an24/ap-28l1/internal/horizon-mode", 0);
	} else {
		setprop("/an24/ap-28l1/internal/horizon-mode", 0);
	}
}

var engage_horizon_mode = func {
		setprop("/an24/ap-28l1/internal/horizon-mode", 1);
}