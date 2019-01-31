// Jim Samson
// Spool with teeth for rat project 
// November 14, 2018

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
            middleShaft();
            bearings();
            gear();
            tube();
        }
    }
}

module tube() {
    translate([0,0,-1]) {
        cylinder(d=5.6,h=beltHeight+1,$fn=100);
    }
}

module gear() {
   //translate([-11,-11.1,-1]) {
        //import("SGearSpurV1_fixed.stl", convexity=10); 
    //}
    translate([0,0,0]) {
        cube([15.3,15.3,30],center=true);
    }
}

module teethHolder() {
    cylinder(d=bearingDiameter,h=beltHeight);
}

module middleShaft() {
    translate([0,0,16]) {
        cylinder(d=bearingDiameter/1.08,h=beltHeight);
    }
}

module bearings() {
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