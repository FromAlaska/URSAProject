// Jim Samson
// Spool for rat project 
// November 13, 2018

$fs=0.1;

offsetForEnds=6;

beltHeight=60+(offsetForEnds); // millimeters
diameterForBelt=30;

diameterForEdgesHeight=2;
diameterForEdges = diameterForBelt + 4;

bearingDiameter=22.2;
bearingHeight=8;

spoolHolder();

module spoolHolder() {
    union() {
        difference() {
            spool();
            #bearings();
            middleShaft();
        }
    }
}

module middleShaft() {
    cylinder(d=bearingDiameter/1.08,h=beltHeight);
}

module bearings() {
    translate([0,0,-1]) {
        cylinder(d=bearingDiameter,h=bearingHeight);
    }
    
    translate([0,0,beltHeight-bearingHeight+1]) {
        cylinder(d=bearingDiameter,h=bearingHeight);
    }
}

module spool() {
    translate([0,0,beltHeight/2]) {
        intersection() {
            cube([beltHeight,beltHeight,beltHeight], center=true); 
            resize([diameterForBelt,diameterForBelt,beltHeight*2])
            sphere(r=10);
        }
    }
}

module oval(w,h, height, center = false) {
 scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}