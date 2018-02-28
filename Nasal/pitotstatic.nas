# Static ports and pitots selection by levers on lc and rc, S1 has to stand for S1 and S5, S2 for S2 and S6 atm,
# S8 and S9 are emergency/reserve ports, which are not exposed to failure yet
# static[9,10] and pitot[3] serve as fake "input receivers" only
# stop() and start() is made by lever position in an24/Models/Interior/Control_Units/Pitot/xy.xml

### left instruments ###
var pitotswap_A1selected = maketimer(0.01, func(){
	setprop("/systems/pitot[3]/total-pressure-inhg", getprop("/systems/pitot[0]/total-pressure-inhg") );
});
pitotswap_A1selected.start();

var pitotswap_A2selected = maketimer(0.01, func(){
	setprop("/systems/pitot[3]/total-pressure-inhg", getprop("/systems/pitot[1]/total-pressure-inhg") );

});

###################################################################################################
###################################################################################################
var staticswap_S1selected = maketimer(0.01, func(){
	setprop("/systems/static[9]/pressure-inhg", getprop("/systems/static[0]/pressure-inhg") );
});
staticswap_S1selected.start();

var staticswap_E1selected = maketimer(0.01, func(){
	setprop("/systems/static[9]/pressure-inhg", getprop("/systems/static[7]/pressure-inhg") );
});

###################################################################################################
###################################################################################################

### right instruments ###
var staticswap_S2selected = maketimer(0.01, func(){
	setprop("/systems/static[10]/pressure-inhg", getprop("/systems/static[1]/pressure-inhg") );
});
staticswap_S2selected.start();

var staticswap_E2selected = maketimer(0.01, func(){
	setprop("/systems/static[10]/pressure-inhg", getprop("/systems/static[8]/pressure-inhg") );
});
