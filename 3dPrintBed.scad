footToMillimeters=304.8;

module hotPlate(length=1, width=1, height=10) {
    color("grey",1.0) {
        translate([0,0,-height]) {
            cube([length*footToMillimeters, width*footToMillimeters, height]);
        }
    }
}
module gridPlate(length=1, width=1, height = 9) {
    // For grid X 
    for(i = [0 : 2]) {
        translateX = i*(304.8/4);
        translate([0,footToMillimeters/4 + translateX, -height]) {
            gridX();
        }
    }
    
    // For grid Y
    for(i = [0 : 2]) {
        translateY = i*(304.8/4);
        translate([footToMillimeters/4 + translateY, 0, -height]) {
            gridY();
        }
    }
}

module gridY(length=1, width=1, height=10) {
    color("LimeGreen", 1.0) {
        cube([1, width*footToMillimeters, height]);
    }
}
module gridX(length=1, width=1, height=10) {
    color("Crimson", 1.0) {
        cube([length*footToMillimeters, 1, height]);
    }
}