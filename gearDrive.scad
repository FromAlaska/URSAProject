// Jim Samson
// November 14, 2018
// Gear for rat treadmill

$fn=100;

gearPart();

boxLength=14.8;
boxWidth=14.8;
boxHeight=30-12.7;

shaftDiameter=5.4;
shaftHeight=22;

topDiameter=13;
topHeight=12.7;

module gearPart() {
    union() {
        bottomPart();
        topPart();
    }
}

module screwHole() {
    translate([0.5+2.3,0,boxHeight+topHeight/2]) {
        rotate([0,90,0]) {
            rotate([0,0,30]) {
                hull() {
                    cylinder(d=6.3,h=2.3);
                    $fn=6;
                }
            }
        }
    }
}

module rectangleHole() {
    translate([1.7,0,boxHeight+topHeight/2]) {
        cube([2.3,6.3,20],center=true);
    }
}

module topPart() {
    difference() {
        translate([0,0,boxHeight]) {
            cylinder(d=topDiameter, h=topHeight);
        }
        shaft();
        screwHole();
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
        cylinder(d=shaftDiameter,h=shaftHeight+1);
    }
}