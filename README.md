an24b
=====

An-24B for FlightGear flight simulator

Credits:
FDM and systems, programming - Michael Soitanen (soitanen.michael@gmail.com)
Initial 3D model and texture, some systems and programming - Adrian
ASI - helijah
Artwork - Orvil
Some 3D instruments were taken from Tu-154B-2 by Yurik and Yak-40 by Specter.

=====================================================================================
QUICK STARTUP-GUIDE (to be improved (with pictures (and such (like, as pdf))))

- On AZS(circuit-breaker)-Panel (big panel with MANY switches at right side of crewsection):
  - Close ALL circuit-breakers (best by clicking the "all-on"-clickspots to the right of each row)

- On Fuel-Control-Panel (extra-panel on pilots' middle panel):
  - Turn on all switches at the bottom, except middle one (cross-feed, optional)

- On Left Horizontal Panel:
  - Turn up cut-off switch next to green and red lamp

- On Engine-Start-Panel (sunk panel on pilot's left console):
  - Press lower black/white button (wait for TG-16 APU start, indicated by green lamp and tachometer)
  - Put 2nd switch in top row up to position "lev" (left) and press upper left black/white button (AI-24 engine start)
    - left engine should spool up and start
  - Put 2nd switch in top row down to position "prav" (right) and press upper black/white button (AI-24 engine start)
    - guess what's supposed to happen
  - Press lower right red/grey button once, APU stops

- Below pilot's left panel:
  - Put on switches "AGD", "EUP", "CGV" (number 4,5,6 in this row); watch AGD (AI) go up

- On pilot's left panel:
  - Press little black/white button below AI until indicator of KPPM (ASI) doesn't move anymore

- On F/O's right console:
  - Look out for a big compass rose and a device with two knobs above it
  - Set latitude on right knob and use left knob to turn big compass rose to heading indicated by KPPM

- On middle console:
  - Put on second switch of AP-control, wait for orange light ("AP ready")

- Below pilot's left panel: 
  - Left 3-way switch: choose appropriate steering setting (up: taxi, middle: OFF, down: takeoff/landing) 

- In GUI "an24b":
  - Select "Realism setting" and/or "Tiller steering"

=================================
QUICK IMPORTANT INSTRUMENTS GUIDE

- SPU-7 Communication device:
  - Located at all four workplaces; what and who you listen to on your headphones, who you speak to on your mic (workplace specific)
  - Turn up "Listen"-volume by turning up left upper volume knob, set desired source on central knob:
    - "UKR" (1) and "DR"(4): R-802 I* and R-802 II*; VHF
    - "SR"(2) and "KR"(3): US-8k*, R-836*; HF/AM
    - "RK1"(5) and "RK2"(6): Radiocompass ARK-11 I*, Radiocompass ARK-11 II*/RSBN*; AM
* Current configuration 

- R-802 VHF
  - Located middle overhead left (I) and right (II) side; I is memory device, II is frequency select device
    - Turn up volume knob
    - Set desired frequency on II, store this frequency in I by clicking screw in I -> frequency will be stored in I at currently set channel*
    - Set channel on I, click screw on II -> II will tune to currently selected channel on I*
* Not as in RL; in RL, memory of I is "programmed" preflight and has no influence to II nor is influenced by II
    
- ARK-11 ADF:
  - I and II located at Navigator's workplace, second II on overhead; like R-802 with memory device (buttons 1-9)
    - Push down the upper "P"-button from the left section of memory buttons -> device now ready to set frequencies
    - Set desired frequency by left knob: frequency ranges, middle one: rough setting, right upper one: fine tuning
    - Push one memory button 1-9 to store frequency*; station, frequency and range should appear on table; repeat as desired
    - With "P"-button pushed again (up), pressing memory buttons will "recall" set frequencies
  - ARK-11 modes:
    - "Comp. 1" (1) and "Comp. 2" (4): like "ADF" mode, frame/loop antenna turns automatically, to/from known
    - "Ant." (2): guess!
    - "Frame" (3): manual turning of frame/loop antenna by l-r-antenna switch, volume and instrument above indicate direction, to/from unknown
* Not as in RL; see R-802

- AP-28l1 Autopilot
  - located at back of middle console; Roll Select; Altitude, Pitch, Course/Heading Hold
  - Connect by either pressing "d" or big button -> Wing level* and Pitch Hold
    - Top row switches/knobs: Pitch up/down, Roll angle, Pitch up/down
    - Middle row switches/buttons: switch Autotrim, switch Power ON, big button, switch GIK or OFF or ZK-mode, switch Pitch ON/OFF
      - "GIK": Current course indicated by GIK; "ZK": Heading select by ZK
    - Lower row buttons/lamps: 2 Lamps Autotrim intervention, Button Wing Level, Lamp/Button Altitude Hold
* Should be Roll Hold I think?

