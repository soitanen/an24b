# Simple autostart

var step = 0;

var startup = func {
	 	step = 1;
	 	t = 0.0;

		screen.log.write("AZS circuit-breaker panel", 1, 1, 1);
		setprop("an24/AZS/sw0101", 1.0 );
		setprop("an24/AZS/sw0102", 1.0 );
		setprop("an24/AZS/sw0103", 1.0 );
	 	t += 0.2;

		settimer( func{
		setprop("an24/AZS/sw0104", 1.0 );
		setprop("an24/AZS/sw0105", 1.0 );
		setprop("an24/AZS/sw0106", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0108", 1.0 );
		setprop("an24/AZS/sw0109", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
        	setprop("an24/AZS/sw0110", 1.0 );
        	setprop("an24/AZS/sw0111", 1.0 );
        	setprop("an24/AZS/sw0112", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0113", 1.0 );
		setprop("an24/AZS/sw0114", 1.0 );
		setprop("an24/AZS/sw0115", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0116", 1.0 );
		setprop("an24/AZS/sw0117", 1.0 );
		setprop("an24/AZS/sw0118", 1.0 );
		}, t); t += 0.2;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0201", 1.0 );
		setprop("an24/AZS/sw0202", 1.0 );
		setprop("an24/AZS/sw0203", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0204", 1.0 );
		setprop("an24/AZS/sw0205", 1.0 );
		setprop("an24/AZS/sw0206", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0207", 1.0 );
		setprop("an24/AZS/sw0208", 1.0 );
		setprop("an24/AZS/sw0209", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0210", 1.0 );
		setprop("an24/AZS/sw0211", 1.0 );
		setprop("an24/AZS/sw0212", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0213", 1.0 );
		setprop("an24/AZS/sw0214", 1.0 );
		setprop("an24/AZS/sw0215", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0216", 1.0 );
		setprop("an24/AZS/sw0217", 1.0 );
		setprop("an24/AZS/sw0218", 1.0 );
		}, t); t += 0.15;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0301", 1.0 );
		setprop("an24/AZS/sw0302", 1.0 );
		setprop("an24/AZS/sw0303", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0304", 1.0 );
		setprop("an24/AZS/sw0305", 1.0 );
		setprop("an24/AZS/sw0306", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0308", 1.0 );
		setprop("an24/AZS/sw0309", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0310", 1.0 );
		setprop("an24/AZS/sw0312", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0313", 1.0 );
		setprop("an24/AZS/sw0314", 1.0 );
		setprop("an24/AZS/sw0315", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0316", 1.0 );
		setprop("an24/AZS/sw0317", 1.0 );
		setprop("an24/AZS/sw0318", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0401", 1.0 );
		setprop("an24/AZS/sw0402", 1.0 );
		setprop("an24/AZS/sw0403", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0404", 1.0 );
		setprop("an24/AZS/sw0406", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0407", 1.0 );
		setprop("an24/AZS/sw0408", 1.0 );
		setprop("an24/AZS/sw0409", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0410", 1.0 );
		setprop("an24/AZS/sw0411", 1.0 );
		setprop("an24/AZS/sw0412", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0413", 1.0 );
		setprop("an24/AZS/sw0414", 1.0 );
		setprop("an24/AZS/sw0415", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0416", 1.0 );
		setprop("an24/AZS/sw0417", 1.0 );
		setprop("an24/AZS/sw0418", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0504", 1.0 );
		setprop("an24/AZS/sw0506", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0507", 1.0 );
		setprop("an24/AZS/sw0508", 1.0 );
		setprop("an24/AZS/sw0509", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0510", 1.0 );
		setprop("an24/AZS/sw0511", 1.0 );
		setprop("an24/AZS/sw0512", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0513", 1.0 );
		setprop("an24/AZS/sw0514", 1.0 );
		setprop("an24/AZS/sw0515", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0516", 1.0 );
		setprop("an24/AZS/sw0517", 1.0 );
		setprop("an24/AZS/sw0518", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0602", 1.0 );
		setprop("an24/AZS/sw0603", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0604", 1.0 );
		setprop("an24/AZS/sw0605", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0608", 1.0 );
		setprop("an24/AZS/sw0609", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0610", 1.0 );
		setprop("an24/AZS/sw0611", 1.0 );
		setprop("an24/AZS/sw0612", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0613", 1.0 );
		setprop("an24/AZS/sw0614", 1.0 );
		setprop("an24/AZS/sw0615", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0616", 1.0 );
		setprop("an24/AZS/sw0617", 1.0 );
		setprop("an24/AZS/sw0618", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0701", 1.0 );
		setprop("an24/AZS/sw0702", 1.0 );
		setprop("an24/AZS/sw0703", 1.0 );
		}, t); t += 0.08;

	 	settimer( func{
		setprop("an24/AZS/sw0704", 1.0 );
		setprop("an24/AZS/sw0705", 1.0 );
		setprop("an24/AZS/sw0706", 1.0 );
		}, t); t += 0.08;

	 	settimer( func{
		setprop("an24/AZS/sw0707", 1.0 );
		setprop("an24/AZS/sw0708", 1.0 );
		setprop("an24/AZS/sw0709", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0710", 1.0 );
		setprop("an24/AZS/sw0711", 1.0 );
		setprop("an24/AZS/sw0712", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0713", 1.0 );
		setprop("an24/AZS/sw0714", 1.0 );
		setprop("an24/AZS/sw0715", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0716", 1.0 );
		setprop("an24/AZS/sw0717", 1.0 );
		setprop("an24/AZS/sw0718", 1.0 );
		}, t); t += 0.08;

# Fuel System

		settimer( func{
		screen.log.write("Fuel System", 1, 1, 1);
		setprop("an24/FuelControl/sw0402", 1.0 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0403", 1.0 );
		setprop("an24/FuelControl/lrear463_press", 0.16 );
		setprop("an24/FuelControl/lfront463_press", 0.16 );
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/FuelControl/sw0405", 1.0 );
		setprop("an24/FuelControl/rrear463_press", 0.16 );
		setprop("an24/FuelControl/rfront463_press", 0.16 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0406", 1.0 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0401", 1.0 );
		setprop("an24/FuelControl/cutoff-l-by-sw", 0.0 );
		}, t); t += 0.8;

		settimer( func{
		setprop("an24/FuelControl/sw0407", 1.0 );
		setprop("an24/FuelControl/cutoff-r-by-sw", 0.0 );
		setprop("an24/FuelControl/TG-16_cutoff", 0.0 );
		}, t); t += 0.2;

# Engine Start

		settimer( func{
		screen.log.write("Engine Start, TG-16 APU first", 1, 1, 1);
		interpolate("an24/Start-Panel/starttg-btn", 1.0, 0.1, 0.0, 0.1 );
		setprop("/fdm/jsbsim/propulsion/cutoff_cmd", 0.0);
		setprop("/controls/engines/engine[2]/cutoff", 1.0);
		setprop("an24/Start-Panel/discontinuestarttg", 0.0 );
		setprop("/controls/engines/engine[2]/starter", 1.0 );
		}, t); t += 0.3;


		settimer( func{
		screen.log.write("Meanwhile initialize AGD, EUP and CGV...", 1, 1, 1);
		setprop("an24/instrumentation/agd", 5.0 );
		setprop("an24/instrumentation/sw_agd-l", 1.0 );
		setprop("an24/instrumentation/agd-r", 5.0 );
		setprop("an24/instrumentation/sw_agd-r", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/instrumentation/eup", 1.0 );
		setprop("an24/instrumentation/sw_eup", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/instrumentation/cgv", 1.0 );
		setprop("an24/instrumentation/sw_cgv", 1.0 );
		}, t); t += 0.2;


		settimer( func{
		screen.log.write("...and compasses GIK and GPK", 1, 1, 1);
		setprop("an24/instrumentation/gik", 1.0 );
		setprop("an24/instrumentation/sw_gik", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/instrumentation/gpk", 1.0 );
		setprop("an24/instrumentation/sw_gpk", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		screen.log.write("Now aligning GIK...", 1, 1, 1);
		interpolate("/instrumentation/gik-1/indicated-heading", getprop("/orientation/heading-magnetic-deg"), 5.0 );
		}, t); t += 2.0;

		settimer( func{
		screen.log.write("...and align GPK with GIK heading and set latitude", 1, 1, 1);
		interpolate("/instrumentation/gpk-52/offset-deg", 0.0, 8.0 );
		interpolate("/instrumentation/gpk-52/lat-nut", getprop("position/latitude-deg"), 8.0 );
		}, t); t += 2.0;

		settimer( func{
		screen.log.write("Left engine start", 1, 1, 1);
		setprop("an24/Start-Panel/left-right", 0.0 );
		interpolate("an24/Start-Panel/left-right_sw", 1.0, 0.1 );
		setprop("an24/Start-Panel/timerapd", 0.0, 1.0 );
		interpolate("an24/Start-Panel/startai24-btn", 1.0, 0.3, 0.0, 0.2 );
		interpolate("an24/Start-Panel/timerapd", 30.0, 30.0, 0.0, 3.0 );
		}, t); t += 0.5;

		settimer( func{
		screen.log.write("Power on autopilot AP-28L ", 1, 1, 1);
		interpolate("an24/AP-28l1/switches/power", 1.0, 0.1 );
		interpolate("an24/AP-28l1/internal/powered", 1.0, 0.1 );
		}, t); t += 10.0;

		settimer( func{
		screen.log.write("Fuel indicator to sum", 1, 1, 1);
		interpolate("an24/PG5and2PPT1/selected-ind", 1.0, 0.1, 2.0, 0.1, 3.0, 0.1 );
		}, t); t += 1.0;

		settimer( func{
		screen.log.write("Set flaps to T/O - 15 degrees ", 1, 1, 1);
		interpolate("/controls/flight/flaps/", 0.4033333, 4.0 );
		}, t); t += 5.0;

		settimer( func{
		screen.log.write("Right engine start", 1, 1, 1);
		setprop("an24/Start-Panel/left-right", 1.0 );
		interpolate("an24/Start-Panel/left-right_sw", 0.0, 0.1 );
		setprop("an24/Start-Panel/timerapd", 0.0, 1.0 );
		interpolate("an24/Start-Panel/startai24-btn", 1.0, 0.3, 0.0, 0.2 );
		interpolate("an24/Start-Panel/timerapd", 30.0, 30.0, 0.0, 3.0 );
		}, t); t += 15.0;

		settimer( func{
		screen.log.write("APU shutdown", 1, 1, 1);
		setprop("an24/Start-Panel/discontinuestarttg", 1.0 );
		setprop("controls/engines/engine[2]/starter", 0.0 );
		setprop("controls/engines/engine[2]/cutoff", 1.0 );
		interpolate("an24/Start-Panel/discontinuestarttg-btn", -1.0, 0.2 );
		settimer(func {interpolate("an24/Start-Panel/discontinuestarttg-btn", 0.0, 0.1 );},0.2);
		}, t); t += 0.2;
};
