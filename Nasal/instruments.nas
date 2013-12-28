# Before anything else change random seed.
srand();

var kppm_0_start_offset = 360*rand();
setprop("/instrumentation/kppm[0]/scale-offset", kppm_0_start_offset);

#save sound volume and deny sound for startup

var vol = getprop("/sim/sound/volume");
	  setprop("an24/volume", vol);  
	  setprop("/sim/sound/volume", 0.0);
print("PNK started");
