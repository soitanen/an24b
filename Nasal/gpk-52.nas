props.globals.initNode("instrumentation/gpk-52/heading-bug-deg", 0);
props.globals.initNode("instrumentation/gpk-52/heading-bug-error-deg", 0);
props.globals.initNode("instrumentation/gpk-52/indicated-heading-deg", 0);
props.globals.initNode("instrumentation/gpk-52/lat-nut", 0);
props.globals.initNode("instrumentation/gpk-52/earth-err", 0.0);
props.globals.initNode("instrumentation/gpk-52/lat-nut-corr", 0.0);
props.globals.initNode("instrumentation/gpk-52/transport-wander", 0.0);

srand();
var hdg_stop = int(rand() * 360);
var init_true_heading = getprop("orientation/heading-deg");
props.globals.initNode("instrumentation/gpk-52/offset-deg", (hdg_stop - getprop("orientation/heading-deg")));


var gyro = func {
    var offset = getprop("instrumentation/gpk-52/offset-deg");

    var transport_wander = getprop("instrumentation/gpk-52/transport-wander");
    
    var true_heading = getprop("orientation/heading-deg");

    var earth_err = getprop("instrumentation/gpk-52/earth-err");
    var lat_nut_corr = getprop("instrumentation/gpk-52/lat-nut-corr");

    var hdg = true_heading + earth_err + lat_nut_corr + transport_wander + offset;
    if (hdg >= 360) {
        hdg = hdg - 360;
    }

    if (getprop("systems/electrical/volts") > 0) {
        init_true_heading = hdg - offset;
        setprop("instrumentation/gpk-52/indicated-heading-deg", hdg);
    } else {
        setprop("instrumentation/gpk-52/indicated-heading-deg", (init_true_heading + offset));
   }
    
    var hdg_bug = getprop("instrumentation/gpk-52/heading-bug-deg");
    var hdg_error = hdg_bug - hdg;
    if (hdg_error > 180) {
        hdg_error = hdg_error - 360;
    }
    if (hdg_error < -180) {
        hdg_error = hdg_error + 360;
    }
    setprop("instrumentation/gpk-52/custom-heading-bug-error-deg",hdg_error);
    settimer(gyro, 0);
}

setlistener("/sim/signals/fdm-initialized", gyro);


var earth_err = 0;
var lat_nut_corr = 0;

var earthRate = func {
    var current_lat = getprop("position/latitude-deg");
    var lat_nut = getprop("instrumentation/gpk-52/lat-nut");
    var earth_rate = -(15 * math.sin(current_lat * math.pi / 180) * (1/36000));
    var lat_nut_rate = (15 * math.sin(lat_nut * math.pi / 180) * (1/36000));
    earth_err = earth_err + earth_rate;
    lat_nut_corr = lat_nut_corr + lat_nut_rate;
    setprop("instrumentation/gpk-52/earth-err", earth_err);
    setprop("instrumentation/gpk-52/lat-nut-corr", lat_nut_corr);
    settimer(earthRate, 0.1);
}

setlistener("/sim/signals/fdm-initialized", earthRate);

# initial position:
var start_lat = getprop("position/latitude-deg");
var start_lon = getprop("position/longitude-deg");
var transport_wander = 0.0;

var transportWander = func {
    var end_lat = getprop("position/latitude-deg");
    var end_lon = getprop("position/longitude-deg");
    var mean_lat = (start_lat + end_lat)/2;
    var transport_wander_rate = -((end_lon - start_lon) * math.sin(mean_lat * math.pi / 180));
   
    transport_wander = transport_wander + transport_wander_rate;
    setprop("instrumentation/gpk-52/transport-wander", transport_wander);

    # re-initial position again:
    start_lat = getprop("position/latitude-deg");
    start_lon = getprop("position/longitude-deg");
    
    settimer(transportWander, 0.1);
}
setlistener("/sim/signals/fdm-initialized", transportWander);