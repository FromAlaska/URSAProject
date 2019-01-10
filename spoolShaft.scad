// Jim Samson
// Spool for rat project 
// November 13, 2018

beltHeight=60; // millimeters
diameterForBelt=30;

diameterForEdgesHeight=beltHeight-58;
diameterForEdges = diameterForBelt + 2;

bearingDiameter=20;
bearingHeight=8;

spoolHolder();

module spoolHolder() {
    union() {
        difference() {
            spool();
            bearings();
            middleShaft();
        }
    }
}

module middleShaft() {
    cylinder(d=bearingDiameter-2,h=beltHeight);
}

module bearings() {
    translate([0,0,-1]) {
        cylinder(d=bearingDiameter,h=bearingHeight);
    }
    
    translate([0,0,beltHeight-bearingHeight+1]) {
        #cylinder(d=bearingDiameter,h=bearingHeight);
    }
}

module spool() {
    cylinder(d=diameterForBelt,h=beltHeight);
    
    cylinder(d=diameterForEdges,h=diameterForEdgesHeight);
    translate([0,0,beltHeight-2]) {
        cylinder(d=diameterForEdges,h=diameterForEdgesHeight);
    }
}