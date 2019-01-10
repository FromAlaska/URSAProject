// Jim Samson
// Belt for rat Project
// November 12, 2018

include<3dPrintBed.scad>
include<arcBuilder.scad>

$fs=0.1;
footToMillimeters=304.8;

beltHeight=60; // millimeters
beltWidth=1;

// For line Length
lineLength=footToMillimeters/4;
linePlacement = footToMillimeters/8;

// For Circles
radius = 37.6;
angles = [-90, 90];
width = beltWidth;
offsetLength=0.7;
offsetForLines = offsetLength + 1;

belt();

module belt() {
    //hotPlate(); // From 3dPrintBed hotPlate module
    //gridPlate(); // From 3dPrintBed gridPlate module
    union() {
        rowThreeLines();
        rowTwoLines();
        rowOneLines();
        rowFourHalfCircles();
        rowTwoHalfCircle();
        rowOneQuarterCircleA();
        rowOneQuarterCircleB();
    }
}

module rowFourHalfCircles() {
    for(i = [0:1]) {
        translate([lineLength*3, (i*lineLength) * 2 + offsetLength + 0.5 + lineLength,0]) {
            linear_extrude(beltHeight) arc(radius, angles, width);
        }
    }
}

module rowThreeLines() {
    for(i = [0 : 3]) {
        translate([2 * lineLength, (i * lineLength) + linePlacement + offsetLength, 0]) {
            lineX();
        }
    }
}

module rowTwoHalfCircle() {
    translate([lineLength*2, (lineLength) * 2 + offsetLength + 0.5,0]) {
        rotate([0,0,180]) {
            linear_extrude(beltHeight) arc(radius, angles, width);
        }
    }
}

module rowTwoLines() {
    for(i = [0 : 1]) {
        translate([lineLength, 3 * (i * lineLength) + linePlacement + offsetLength, 0]) {
            lineX();
        }
    }
}

module rowOneQuarterCircleA() {
    translate([lineLength,lineLength + offsetLength + 0.5,0]) {
        rotate([0,0,180]) {
            linear_extrude(beltHeight) arc(radius, [0,90], width);
        }
    }
}

module rowOneQuarterCircleB() {
    translate([lineLength,lineLength*3 + offsetLength + 0.5,0]) {
        rotate([0,0,90]) {
            linear_extrude(beltHeight) arc(radius, [0,90], width);
        }
    }
}

module rowOneLines() {
    for(i = [0 : 1]) {
        translate([linePlacement + offsetLength -0.2, (i*lineLength) + lineLength + offsetLength + 0.5,0]) {
            lineY();
        }
    }
}

module lineX() {
    #cube([lineLength, beltWidth, beltHeight]);
}

module lineY() {
    rotate([0,0,90]) {
        lineX();
    }
}




