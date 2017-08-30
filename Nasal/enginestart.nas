#engine start stuff
#gtn1/n2 is nx GasTurbine GTD-16
setprop("an24/Start-Panel/timerapd", 0.0);
setprop("an24/Start-Panel/discontinuestarttg", 0.0);
setprop("an24/Start-Panel/left-right", 1.0);

var apdseq = func {
var apd = getprop("an24/Start-Panel/timerapd");
var gtn1 = getprop("engines/engine[2]/n1");
var lengreng = getprop("an24/Start-Panel/left-right");
	if (apd > 0.0 and gtn1 > 94 and lengreng == 0.0) {
	setprop("/controls/electric/engine[0]/generator", 1.0);
	setprop("/controls/engines/engine[0]/starter", 1.0);
	}

	else if (apd > 0.0 and gtn1 > 94) {
	setprop("/controls/electric/engine[1]/generator", 1.0);
	setprop("/controls/engines/engine[1]/starter", 1.0);
	}
}

var gtseq = func {
var gtn2 = getprop("engines/engine[2]/n2");
	if (gtn2 > 18.0) {

	setprop("/fdm/jsbsim/propulsion/cutoff_cmd", 0.0);
	setprop("/controls/engines/engine[2]/cutoff", 0.0);
	}
#
#	else {
#	setprop("controls/engines/engine[2]/cutoff", 1.0);
#	}
}

setlistener("engines/engine[2]/n2", gtseq);
setlistener("engines/engine[2]/n1", apdseq);
