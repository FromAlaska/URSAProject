// Jim Samson
// November 14, 2018
// Gear for rat treadmill

$fn=100;

washerHeight=1.7;
boltHeight=6.66;
wallHeight=5;

offsetHeight=wallHeight;

gearPart();

boxLength=15.3;
boxWidth=15.3;
boxHeight=20;

shaftDiameter=5.4;
shaftHeight=22;

topDiameter=14.1;
topHeight=offsetHeight;

module gearPart() {
    union() {
        bottomPart();
        topPart();
    }
}

module screwHole() {
    translate([0.5+2.3,0,boxHeight+topHeight/2+0.3]) {
        rotate([0,90,0]) {
            rotate([0,0,30]) {
                hull() {
                    cylinder(d=7.2,h=2.3);
                    $fn=6;
                }
            }
        }
    }
}

module rectangleHole() {
    translate([3,0,boxHeight+topHeight/2]) {
        cube([2.4,7.2,20],center=true);
    }
}

module topPart() {
    difference() {
        translate([0,0,boxHeight]) {
            cylinder(d=topDiameter, h=offsetHeight+1);
        }
        shaft();
        //screwHole();
        rectangleHole();
        //Diameter of the screw
        translate([0.5+2.3,0,boxHeight+topHeight/2]) {
            rotate([0,90,0]) {
                #cylinder(d=2.5,h=5);
            }
        }
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
    translate([0,0,boxHeight+topHeight-shaftHeight]) {
        cylinder(d=shaftDiameter,h=shaftHeight+2);
    }
}