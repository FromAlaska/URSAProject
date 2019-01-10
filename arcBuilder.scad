fn = 24;

module sector(radius=10, anglesSector=[0, 180], fn = 100) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [anglesSector[0] : step : anglesSector[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(anglesSector[1]), r * sin(anglesSector[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, anglesArc=[0,45], width = 1, fn = 100) {
    difference() {
        sector(radius + width, anglesArc, fn);
        sector(radius, anglesArc, fn);
    }
} 

//linear_extrude(1) arc(radius, angles, width);