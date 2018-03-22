# sources
setprop("an24/Electrics/Gen_18TMOl_DC_V", 0.0 );
setprop("an24/Electrics/Gen_18TMOr_DC_V", 0.0 );
setprop("an24/Electrics/Gen_GO16l_AC_V", 0.0 );
setprop("an24/Electrics/Gen_GO16r_AC_V", 0.0 );
setprop("an24/Electrics/Batt_12SAMa_DC_V", 27.0 );
setprop("an24/Electrics/Batt_12SAMb_DC_V", 27.0 );
setprop("an24/Electrics/AUX_ShRAP500a_DC_V", 0.0 ); # ?V DC AUX
setprop("an24/Electrics/AUX_ShRAP500b_DC_V", 0.0 ); 
setprop("an24/Electrics/AUX_ShRAP200_AC_V", 0.0 ); # 115V AC AUX

# in between
setprop("an24/Electrical_Panel/kn_rn-600l", 0.0 ); #knob voltage regulator 115 +-10V
setprop("an24/Electrical_Panel/kn_rn-600r", 0.0 );
setprop("an24/Electrical_Panel/kn_stgl", 0.0 ); #knob voltage regulator 36V +-?V
setprop("an24/Electrical_Panel/kn_stgr", 0.0 );
setprop("an24/Electrical_Panel/sw_on_outboard", 0.0 ); # Main switch outboard aux -1, off 0, onboard 1
setprop("an24/Electrical_Panel/sw_pt-1000", 0.0 ); # Converter 27V DC -> 36V AC, 1 = main (auto), 0 = both off, -1 = reserve 
setprop("an24/Electrical_Panel/sw_stgl_coupled", 0.0 );
setprop("an24/Electrical_Panel/sw_stgr_coupled", 0.0 );
setprop("an24/Electrical_Panel/sw_PO-750_AUX", 0.0 ); # Converter 115V AC, 1 = on, 0 = off, -1 = AUX 

setprop("an24/Electrics/PT-1000main", 1.0 ); # working? 1 = Yes
setprop("an24/Electrics/PT-1000reserve", 1.0 ); # working? 1 = Yes
setprop("an24/Electrics/PO-750", 1.0 ); # working? 1 = Yes

# buses
setprop("an24/Electrics/BUS_27V_DC_V", 0.0 );
setprop("an24/Electrics/BUS_115V_AC_V", 0.0 );
setprop("an24/Electrics/BUS_115V_AC_Hz", 0.0 );
setprop("an24/Electrics/BUS_36V_AC_V", 0.0 );
setprop("an24/Electrics/BUS_36V_AC_Hz", 0.0 );
setprop("an24/Electrics/BUS_EMERGBAR_DC_V", 0.0 );


## Battery discharge
var batta_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/Batt_12SAMa_DC_V");
	var charging = getprop("an24/Electrics/Batt_12SAMa_DC_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	setprop("an24/Electrics/Batt_12SAMa_DC_V", voltage);
	}
	else {
	batta_discharge.stop();
	}
});
batta_discharge.start();

var bus_36V_AC_V = func {
	if ( getprop("an24/Electrical_Panel/sw_pt-1000") != 0.0 and (getprop("an24/Electrics/PT-1000main") == 1.0 or getprop("an24/Electrics/PT-1000reserve") == 1.0 ) ) {
		var pt1000 = 1.0;
	}
	else {
		var pt1000 = 0.0;
	}
	if (getprop("an24/Electrical_Panel/sw_stgl_coupled") == 1.0 and getprop("an24/Electrics/Gen_18TMOl_DC_V") > 20.0) {
		var input_bus_36v = getprop("an24/Electrics/Gen_18TMOl_DC_V") * 1.33 * pt1000 ;

	}
	else if (getprop("an24/Electrical_Panel/sw_stgr_coupled") == 1.0 ) {
		var input_bus_36v = getprop("an24/Electrics/Gen_18TMOr_DC_V") * 1.33 * pt1000 ;
	}
	else {
		var input_bus_36v = 0.0; # do i really need that?
	}
	setprop("an24/Electrics/BUS_36V_AC_V", input_bus_36v );
}
setlistener("an24/Electrical_Panel/sw_stgl_coupled", bus_36V_AC_V);
