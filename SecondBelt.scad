// Jim Samson
// Second version of the belt

include <3dPrintBed.scad>
include <arcBuilder.scad>

$fs=0.01;
footToMillimeters=304.8;

// For line Length
lineLength=footToMillimeters/3.357;
linePlacement = footToMillimeters/8;

// For Circles
radius = 30.3;
angles = [-90, 90];
offsetOfHalfCircles=radius*2;

beltHeight=80; // millimeters
beltWidth=1;
beltLength=1*footToMillimeters-offsetOfHalfCircles;

// For Circles
width = beltWidth;

// For total length of belt
offsetTotalLength = 0.6;

belt(); // Just like a main function

module belt() {
    //hotPlate(); // From 3dPrintBed hotPlate module
    //gridPlate(); // From 3dPrintBed gridPlate module
    
    translate([lineLength+50,-25,0]) {
        rotate([0,0,45]) {
            union() {
                beltCircleA();
                beltCircleB();
                lineA();
                lineB();
            }
        }
    }  
}

module beltCircleA() {
    translate([linePlacement, lineLength+radius+beltWidth, 0]) {
        rotate([0,0,180]) {
            HalfCircle();
        }
    }
}

module beltCircleB() {
    translate([lineLength+linePlacement*4+linePlacement+1, lineLength+radius+beltWidth, 0]) {
            HalfCircle();
    }
}

module HalfCircle() {
    linear_extrude(beltHeight) arc(radius, angles, width);
}

module lineA() {
    translate([linePlacement, lineLength, 0]) {
        lineX();
    }
}

module lineB() {
    translate([linePlacement, lineLength*2-29.1953599, 0]) {
        lineX();
    }
}

module lineX() {
    #cube([beltLength, beltWidth, beltHeight]);
}