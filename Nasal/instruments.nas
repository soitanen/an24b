# Before anything else change random seed.
srand();

var kppm_0_start_offset = 360*rand();
setprop("/instrumentation/kppm[0]/scale-offset", kppm_0_start_offset);
