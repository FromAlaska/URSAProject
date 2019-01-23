// Jim Samson
// Nut Holder

$fa=1;
$fs=0.6;

// Unit conversions
InchesToMm=25.4;

// Bolt size measurements
boltSize=(1/2)*InchesToMm;
boltDiameter=(5/16)*InchesToMm;
boltHeight=(5/2)*InchesToMm;

// Bolt Cap Sizes
capDiameter=20;
capHeight=1*InchesToMm;

cap();

module cap() {
    union() {
        capCylinder();
    }
}

module capCylinder() {
    cylinder(r=10,h=10);
}