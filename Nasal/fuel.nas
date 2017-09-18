## Fuel valves and pumps
# group 1 fuel pumps etsn stop when level in corresponding tanks of group 2 less than 450kg in auto mode

var gr1pumpleft = func {
        var levelgr2left = getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg");
        var gr1mode = getprop("an24/animations/FuelControl/group1leftpump");
	if ( (( levelgr2left < 450 and gr1mode == 1 and getprop("/consumables/fuel/tank[2]/level-kg") > 0 ) or gr1mode == -1 ) and getprop("an24/AZS/sw0113") == 1 ) {
	setprop("/controls/fuel/tank[2]/boost-pump[0]", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 0.0);
	setprop("/controls/fuel/tank[0]/boost-pump[0]", 0.0);
	setprop("/controls/fuel/tank[1]/boost-pump[0]", 0.0);
	}
	else if (getprop("an24/AZS/sw0114") == 1 ) {
	setprop("/controls/fuel/tank[2]/boost-pump[0]", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 0.0);
	setprop("/controls/fuel/tank[0]/boost-pump[0]", 1.0);
	setprop("/controls/fuel/tank[1]/boost-pump[0]", 1.0);
	}
	else {
	setprop("/controls/fuel/tank[2]/boost-pump[0]", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[0]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[1]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[2]/priority", 0.0);
	setprop("/controls/fuel/tank[0]/boost-pump[0]", 0.0);
	setprop("/controls/fuel/tank[1]/boost-pump[0]", 0.0);
	}
 settimer(gr1pumpleft, 0.01);
}

 setlistener("sim/signals/fdm-initialized", gr1pumpleft);

var gr1pumpright = func {
        var levelgr2right = getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg");
        var gr1mode = getprop("an24/animations/FuelControl/group1rightpump");
	if ( (( levelgr2right < 450 and gr1mode == 1 and getprop("/consumables/fuel/tank[3]/level-kg") > 0 ) or gr1mode == -1 ) and getprop("an24/AZS/sw0116") == 1 ) {
	setprop("/controls/fuel/tank[3]/boost-pump[0]", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 0.0);
	setprop("/controls/fuel/tank[4]/boost-pump[0]", 0.0);
	setprop("/controls/fuel/tank[5]/boost-pump[0]", 0.0);
	}
	else if (getprop("an24/AZS/sw0115") == 1 ) {
	setprop("/controls/fuel/tank[3]/boost-pump[0]", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 0.0);
	setprop("/controls/fuel/tank[5]/boost-pump[0]", 1.0);
	setprop("/controls/fuel/tank[4]/boost-pump[0]", 1.0);
	}
	else {
	setprop("/controls/fuel/tank[3]/boost-pump[0]", 1.0);
	setprop("/fdm/jsbsim/propulsion/tank[5]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[4]/priority", 0.0);
	setprop("/fdm/jsbsim/propulsion/tank[3]/priority", 0.0);
	setprop("/controls/fuel/tank[5]/boost-pump[0]", 0.0);
	setprop("/controls/fuel/tank[4]/boost-pump[0]", 0.0);
	}
 settimer(gr1pumpright, 0.01);
}

 setlistener("sim/signals/fdm-initialized", gr1pumpright);
