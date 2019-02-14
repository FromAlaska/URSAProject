// Jim Samson
// Spool with teeth for rat project 
// November 14, 2018

washerHeight=1.7;
boltHeight=6.66;
wallHeight=5.9;

offsetHeight=washerHeight+boltHeight+wallHeight;

beltHeight=80; // millimeters
diameterForBelt=30;

diameterForEdgesHeight=2;
diameterForEdges = diameterForBelt + 4;

bearingDiameter=22.2;
bearingHeight=8;

totalHeight=92; // Total Height of belt
offsetHeightOfBelt=(totalHeight-beltHeight)/2; // Stuff

spoolHolder();

//translate([20,0,0]) cube([10,10,80]);

translate([0,20,(totalHeight/2)-offsetHeightOfBelt]) cube([10,10,totalHeight],center=true);


module spoolHolder() {
    union() {
        difference() {
            spool();
            middleShaft();
            bearings();
            gear();
            tube();
        }
        translate([0,0,-offsetHeight]) {
        cylinder(r=15.3/2,h=offsetHeight);
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
    cubeHeight=20;
    translate([0,0,cubeHeight/2]) {
        #cube([15.3,15.3,cubeHeight+1],center=true);
    }
}

module teethHolder() {
    cylinder(d=bearingDiameter,h=beltHeight);
}

module middleShaft() {
    translate([0,0,46]) {
        cylinder(d=bearingDiameter/1.08,h=beltHeight);
    }
}

module bearings() {
    translate([0,0,beltHeight-bearingHeight+1-12.7]) {
        cylinder(d=bearingDiameter,h=bearingHeight+12);
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