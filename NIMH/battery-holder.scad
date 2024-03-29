/*
 * Variables for Thingiverse Customizer
 * ==================================================================
 *
 */

// The number of AA cells in your battery holder
Cell_Count =7;


/*
 * Library function: edge
 * ==================================================================
 *
 * Used to make roundes edges on objects
 *
 */
module edge(radius, height)
{
	difference()
	{
		translate([radius/2-0.5, radius/2-0.5, 0])
			cube([radius+1, radius+1, height], center = true);

		translate([radius, radius, 0])
			cylinder(h = height+1, r1 = radius, r2 = radius, center = true, $fn = 100);
	}
}

module make_single_cell(cells, i) {
    // battery cradle
    translate([0, -cells*15/2+15/2+15*i, 15/2+10/2])
    rotate(90, [0, 1, 0])
        cylinder(r=15/2, h=53.5, center=true, $fn = 100);

    // spring cut-out
    translate([55/2-1/2 + .75, -cells*15/2+15/2+15*i, 15/2+10/2])
        cube(size=[.5, 5.5, 30], center=true);

    // circular hole for contact/spring
    translate([55/2-2/2, -cells*15/2+15/2+15*i, (16/2+10/2) - .2])
        rotate(90, [0, 1, 0])
        cylinder(r=5, h=2, center=true, $fn = 100);
    // square to coincide with cylinder cutout
    translate([55/2-2/2, -cells*15/2+15/2+15*i, (16/2+10/2) + 6])
        cube(size=[2, 10, 12], center=true);

    // pocket for contact to fit in
    translate([(55/2-2/2) + 1.15, -cells*15/2+15/2+15*i, (16/2+10/2) -1.25])
        cube(size=[.7, 11.1, 12], center=true);

    translate([-(55/2-1/2) - .75, -cells*15/2+15/2+15*i, 15/2+10/2])
        cube(size=[.5, 5.5, 30], center=true);


    // circular hole for contact/spring
    translate([-(55/2-2/2), -cells*15/2+15/2+15*i, (16/2+10/2) - .2])
        rotate(90, [0, 1, 0])
        cylinder(r=5, h=2, center=true, $fn = 100);
    // square to coincide with cylinder cutout
    translate([-(55/2-2/2), -cells*15/2+15/2+15*i, (16/2+10/2) + 6])
        cube(size=[2, 10, 12], center=true);


    // pocket for contact to fit in
    translate([-(55/2-2/2) -1.15, -cells*15/2+15/2+15*i, (16/2+10/2) - 1.15])
        cube(size=[.7, 11.1, 12], center=true);
        
    // cutout for little protruding part on negative contact
    if(i % 2 == 0) {
        translate([-(55/2-2/2) -1.75, -cells*15/2+15/2+15*i, 16/2+10/2 + 4])
            cube(size=[.5, 11.1/2, 12], center=true);
    } else {
        translate([55/2-2/2 + 1.75, -cells*15/2+15/2+15*i, 16/2+10/2 + 4])
            cube(size=[.5, 11.1/2, 12], center=true);
    }
        

    // solder flange cut-out
    translate([(50/2+3-7/2), -cells*15/2+15/2+15*i, 3/2])
        cube(size=[7, 5.5, 5], center=true);
    
    if(i == 0) {
        translate([(50/2)-4, -cells*15/2+15/2+15*i, 3/2])
            cylinder(r=5.5/2, h=5, center=true, $fn = 50);
    }

    translate([-(50/2+3-7/2), -cells*15/2+15/2+15*i, 3/2])
        cube(size=[7, 5.5, 5], center=true);

    if(i == cells- 1) {
        translate([-(50/2)+4, -cells*15/2+15/2+15*i, 3/2])
            cylinder(r=5.5/2, h=5, center=true, $fn = 50);
    }
    // polarity markings
    if(i % 2 == 0) {
        translate([20, -cells*15/2+15/2+15*i, 4/2+4.5])
            cube(size=[6, 2, 4], center=true);
        translate([20, -cells*15/2+15/2+15*i, 4/2+4.5])
            cube(size=[2, 6, 4], center=true);
        translate([-20, -cells*15/2+15/2+15*i, 4/2+4.5])
            cube(size=[6, 2, 4], center=true);
    } else {
        translate([-20, -cells*15/2+15/2+15*i, 4/2+4.5])
                    cube(size=[6, 2, 4], center=true);
        translate([-20, -cells*15/2+15/2+15*i, 4/2+4.5])
            cube(size=[2, 6, 4], center=true);
        translate([20, -cells*15/2+15/2+15*i, 4/2+4.5])
            cube(size=[2, 6, 4], center=true);
    }


}

module battery_box(cells)
{
	difference()
	{
		union()
		{
			//translate([0, 0, 10/2])
			//	cube(size=[50+2+8, 15*cells, 10], center=true);

			translate([0, 0, 12/2])
				cube(size=[50+2+8, 15*cells, 8], center=true);
	
			translate([50/2+3+2/2, 0, 22/2])
				cube(size=[2, 15*cells, 18], center=true);

			translate([-(50/2+3+2/2), 0, 22/2])
				cube(size=[2, 15*cells, 18], center=true);

			translate([-(50/2+3-2/2) - .75, 0, 11.5/2+10/2])
				cube(size=[2, 15*cells, 11.5], center=true);

			translate([(50/2+3-2/2) + .75, 0, 11.5/2+10/2])
				cube(size=[2, 15*cells, 11.5], center=true);
			
			// mounting flanges	
            /*
			translate([20, cells*15/2+4/2, 3/2+2])
				cube(size=[7, 4, 3], center=true);

			translate([20, cells*15/2+4, 3/2+2])
				cylinder(r=7/2, h=3, center=true, $fn = 60);

			translate([-20, cells*15/2+4/2, 3/2+2])
				cube(size=[7, 4, 3], center=true);

			translate([-20, cells*15/2+4, 3/2+2])
				cylinder(r=7/2, h=3, center=true, $fn = 60);

			translate([20, -(cells*15/2+4/2), 3/2+2])
				cube(size=[7, 4, 3], center=true);

			translate([20, -(cells*15/2+4), 3/2+2])
				cylinder(r=7/2, h=3, center=true, $fn = 60);

			translate([-20, -(cells*15/2+4/2), 3/2+2])
				cube(size=[7, 4, 3], center=true);

			translate([-20, -(cells*15/2+4), 3/2+2])
				cylinder(r=7/2, h=3, center=true, $fn = 60);
            */
		}
		
		for (i=[0:cells-1])
		{
            make_single_cell(cells, i);
		}
		
		if (cells>=2)
		{
            translate([(50/2+3-7/2), 5, 3/2])
                cube(size=[7, (cells*15) - 30, 5], center=true);
            
            translate([-(50/2+3-7/2), -5, 3/2])
                cube(size=[7, (cells*15) - 30, 5], center=true);
		}
		
        


        
        
		// bottom cut-out for output wires
		translate([25/2, -cells*15/2+15/2+15*0, 2.5/2])
			cube(size=[25, 2, 5.5], center=true);			

		translate([3/2, -cells*15/2+15/2+15*0+1, 2.5/2])
			edge(4, 5.5);

		translate([3/2, -cells*15/2+15/2+15*0-1, 2.5/2])
		rotate(-90, [0, 0, 1])
			edge(4, 5.5);

		translate([-25/2, -cells*15/2+15/2+15*(cells-1), 2.5/2])
			cube(size=[25, 2, 5.5], center=true);			
	
		translate([-3/2, -cells*15/2+15/2+15*(cells-1)+1, 2.5/2])
		rotate(90, [0, 0, 1])
			edge(4, 5.5);

		translate([-3/2, -cells*15/2+15/2+15*(cells-1)-1, 2.5/2])
		rotate(180, [0, 0, 1])
			edge(4, 5.5);

		// bottom polarity marking (+)
		translate([7, -cells*15/2+15/2+15*0-4.5, 1.5/2])
			cube(size=[4, 1.5, 1.6], center=true);

		translate([7, -cells*15/2+15/2+15*0-4.5, 1.5/2])
			cube(size=[1.5, 4, 1.6], center=true);

		// bottom polarity marking (-)
		translate([-7, -cells*15/2+15/2+15*(cells-1)+4.5, 1.5/2])
			cube(size=[4, 1.5, 1.6], center=true);
		
		// mounting holes
		translate([20, cells*15/2+4, 3/2])
			cylinder(r=3.3/2, h=10, center=true, $fn = 30);

		translate([-20, cells*15/2+4, 3/2])
			cylinder(r=3.3/2, h=10, center=true, $fn = 30);

		translate([20, -(cells*15/2+4), 3/2])
			cylinder(r=3.3/2, h=10, center=true, $fn = 30);

		translate([-20, -(cells*15/2+4), 3/2])
			cylinder(r=3.3/2, h=10, center=true, $fn = 30);

		// bottom cut-out for output wire
		translate([0, 0, 2.5/2])
			cube(size=[3, cells*15+5, 5.5], center=true);

		/*
		// cutout to ease battery removal
		%translate([0, 0, 20/2+10/2])
		rotate(90, [1, 0, 0])
			cylinder(r=20/2, h=cells*15+5, center=true, $fn = 100);
		*/

		// rounded corners on end plates
		translate([0, -cells*15/2, 20])
		rotate(90, [0, 1, 0])
			edge(4, 50+8+8+5);

		translate([0, cells*15/2, 20])
		rotate(90, [0, 1, 0])
		rotate(-90, [0, 0, 1])
			edge(4, 50+8+8+5);

		translate([0, -cells*15/2, 16.5])
		rotate(90, [0, 1, 0])
			edge(3, 50+6);

		translate([0, cells*15/2, 16.5])
		rotate(90, [0, 1, 0])
		rotate(-90, [0, 0, 1])
			edge(3, 50+6);
	}
}

battery_box(Cell_Count);