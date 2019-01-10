n=20;

for(i=[0:n]) {
    rotate([0,0,i*360/n]) {
        translate([10,0,0]) { 
            cube([2,2,60]);
        }
    }
}