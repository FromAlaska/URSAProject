// Jim Samson
// November 14, 2018
// Gear for rat treadmill

$fn=100;

gearPart();

boxLength=14.7;
boxWidth=14.7;
boxHeight=15;

shaftDiameter=5.4;
shaftHeight=22;

topDiameter=13;
topHeight=6;

module gearPart() {
    union() {
        bottomPart();
        topPart();
    }
}

module screwHole() {
    translate([3,0,18]) {
        rotate([0,90,0]) {
            cylinder(d=2,h=3.5);
        }
    }
}

module rectangleHole() {
    translate([3,0,20]) {
        cube([2,6,10],center=true);
    }
}

module topPart() {
    difference() {
        translate([0,0,boxHeight]) {
            cylinder(d=topDiameter, h=topHeight);
        }
        shaft();
        #screwHole();
        rectangleHole();
    }
}

module bottomPart() {
    difference() {
        box();
        shaft();
    }
}

module box() {
    translate([0,0,boxHeight/2]) {
        cube([boxLength, boxWidth, boxHeight],center=true);
    }
}

module shaft() {
    translate([0,0,-1]) {
        #cylinder(d=shaftDiameter,h=shaftHeight+1);
    }
}