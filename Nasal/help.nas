    #############################################################################
    #    Copyright 								#
    #									   	#
    #    (C) 2010 by Yurik V. Nikiforoff - FDM, 3d instruments, animations, 	#
    #    systems and over.   							#
    #		yurik@megasignal.com					   	#
    #                                                                          	#
    #    This program is free software; you can redistribute it and#or modify  	#
    #    it under the terms of the GNU General Public License as published by  	#
    #    the Free Software Foundation; either version 2 of the License, or     	#
    #    (at your option) any later version.                                   	#
    #                                                                          	#
    #    This program is distributed in the hope that it will be useful,       	#
    #    but WITHOUT ANY WARRANTY; without even the implied warranty of        	#
    #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         	#
    #    GNU General Public License for more details.                          	#
    #                                                                          	#
    #    You should have received a copy of the GNU General Public License     	#
    #    along with this program; if not, write to the                         	#
    #    Free Software Foundation, Inc.,                                       	#
    #    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             	#
    #############################################################################

var help_win = screen.window.new( 0, 0, 1, 3 );
help_win.fg = [0,1,1,1];

# Printing flaps position when in transit
var flaps = func {
   var flaps_pos_deg = getprop("/fdm/jsbsim/fcs/flap-pos-deg");
   if(  flaps_pos_deg == nil ) flaps_pos_deg = 0.0;
   help_win.write(sprintf("Flaps position: %.0f degrees", flaps_pos_deg) );
}

setlistener( "/surface-positions/flap-pos-norm", flaps, 0, 0 );

# Printing idle lock position when changing
var idle_lock = func {
   var idle_lock_pos = getprop("/fdm/jsbsim/fcs/throttle/idle-lock-pos");
   if(  idle_lock_pos == nil ) idle_lock_pos = 0.12;
   if ( idle_lock_pos < 0.12) idle_lock_pos = 0.12;
   if ( idle_lock_pos > 0.22) idle_lock_pos = 0.22;
   setprop("/fdm/jsbsim/fcs/throttle/idle-lock-pos", idle_lock_pos); 
   help_win.write(sprintf("Idle lock: %.0f degrees UPRT", idle_lock_pos*100) );
}

setlistener( "/fdm/jsbsim/fcs/throttle/idle-lock-pos", idle_lock, 0, 0 );

# Help string with masses and speeds
var mass_info = func {
   var mass_lbs = getprop("/fdm/jsbsim/inertia/weight-lbs");
   var fuel_kg = getprop("/consumables/fuel/total-fuel-kg");
   var flaps_pos_deg = getprop("/fdm/jsbsim/fcs/flap-pos-deg");
   var cg_z_m = getprop("/fdm/jsbsim/inertia/cg-z-in") * 0.0254;
   var cg_x_m = getprop("/fdm/jsbsim/inertia/cg-x-in") * 0.0254;

   var yt0 = 1.467 - cg_z_m - 0.0524 * (cg_x_m - 8.866);
   var xt0 = cg_x_m - 8.866 + 0.0524 * yt0;
   var cax = xt0 * 100 / 2.813;

   var mass_kg = mass_lbs * 0.45359237;

   var vrotate = 5.5 * mass_kg / 1000 - 1.5 * flaps_pos_deg + 117;

   help_win.write(sprintf("Total mass: %.0f kg, CAX: %.1f%%, Total fuel: %.0f kg, Vr: %.0f km/h", mass_kg, cax, fuel_kg, vrotate) );
}

var messenger = func{
help_win.write(arg[0]);
}
print("Help subsystem started");
