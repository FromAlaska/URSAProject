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
        gripHolders();
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

module gripHolders() {
    n=20;
    for(i=[0:n]) {
        rotate([0,0,i*360/n]) {
            translate([(diameterForBelt/2)-1.7,0,2]) { 
                cube([2,2,beltHeight-4]);
            }
        }
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
    cylinder(d=diameterForBelt,h=beltHeight);
    
    cylinder(d=diameterForEdges,h=diameterForEdgesHeight);
    translate([0,0,beltHeight-2]) {
        cylinder(d=diameterForEdges,h=diameterForEdgesHeight);
    }
}