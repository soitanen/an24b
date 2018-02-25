#setprop("an24/Anti-Ice/elements/wingL_sens", "0");
#setprop("an24/Anti-Ice/elements/wingR_sens", "0");
#setprop("an24/Anti-Ice/elements/h-stab_sens", "0");
#setprop("an24/Anti-Ice/elements/v-stab_sens", "0");
#setprop("an24/Anti-Ice/elements/engineL_sens", "0");
#setprop("an24/Anti-Ice/elements/engineR_sens", "0");
#setprop("an24/Anti-Ice/elements/propL_sens", "0");
#setprop("an24/Anti-Ice/elements/propR_sens", "0");
#setprop("an24/Anti-Ice/elements/windowL_sens", "0");
#setprop("an24/Anti-Ice/elements/windowR_sens", "0");
#setprop("an24/Anti-Ice/elements/pitotA1_sens", "0");
#setprop("an24/Anti-Ice/elements/pitotA2_sens", "0");
#setprop("an24/Anti-Ice/elements/pitotA3_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport1_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport2_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport3_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport4_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport5_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport6_sens", "0");
#setprop("an24/Anti-Ice/elements/staticport7_sens", "0");
#setprop("an24/Anti-Ice/elements/achs_mp_sens", "0");
#setprop("an24/Anti-Ice/elements/achs_rc_sens", "0");
#setprop("an24/Anti-Ice/elements/achs_eng_sens", "0");
#setprop("an24/Anti-Ice/elements/achs_nav_sens", "0");
#setprop("an24/Anti-Ice/elements/AK-53_sens", "0");

#setprop("an24/Anti-Ice/elements/wingL_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/wingR_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/h-stab_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/v-stab_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/engineL_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/engineR_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/propL_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/propR_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/windowL_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/windowR_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/pitotA1_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/pitotA2_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/pitotA3_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport1_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport2_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport3_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport4_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport5_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport6_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/staticport7_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/achs_mp_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/achs_rc_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/achs_eng_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/achs_nav_ice_cm", "0");
#setprop("an24/Anti-Ice/elements/AK-53_ice_cm", "0");

# amount of build-up or subliminating should be rather something like this:
# ice-cm + icing-severity * /velocities/airspeed-kt * (sensitivity + ice-amount) * deltatime

# Let's start decent
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
	setprop("an24/Anti-Ice/elements/windowL_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/windowL_cm", thickness + (cmpermin/10), 6 );
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
	setprop("an24/Anti-Ice/elements/windowR_cmpermin", cmpermin );
	interpolate("an24/Anti-Ice/elements/windowR_cm", thickness + (cmpermin/10), 6 );
	}
});

Rwindow_icing.start();

var Cwindow_icing = func {
        var thickness = ( getprop("an24/Anti-Ice/elements/windowL_cm") + getprop("an24/Anti-Ice/elements/windowR_cm") )/2 ;
	setprop("an24/Anti-Ice/elements/windowC_cm", thickness);
};

 setlistener("an24/Anti-Ice/elements/windowL_cm", Cwindow_icing);
 setlistener("an24/Anti-Ice/elements/windowR_cm", Cwindow_icing);





