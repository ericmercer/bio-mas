// randomized dining philosophers [LR81]
// three philosophers

dtmc

const int flock = 0;
const int torus = 1;
const int none = 0;
const double SF = 70;
const double ST = 30;
const double RF = 1/5;

module bistate

	s: [0..1] init 0;
	m: [0..100] init none;

	[Fm10] (s = flock) & (m = none) -> 0.9: (s' = flock) & (m' = 10) +
	                                   0.1: (s' = s) & (m' = m); 
	//[Fm20] (s = flock) & (m = none) -> (s' = flock) & (m' = 20);
	//[Fm30] (s = flock) & (m = none) -> (s' = flock) & (m' = 30);
	//[Fm40] (s = flock) & (m = none) -> (s' = flock) & (m' = 40); 
	//[Fm50] (s = flock) & (m = none) -> (s' = flock) & (m' = 50);
	//[Fm60] (s = flock) & (m = none) -> (s' = flock) & (m' = 60);
	//[Fm70] (s = flock) & (m = none) -> (s' = flock) & (m' = 70);
	//[Fm80] (s = flock) & (m = none) -> (s' = flock) & (m' = 80);
	//[Fm90] (s = flock) & (m = none) -> (s' = flock) & (m' = 90);
	//[Fm100] (s = flock) & (m = none) -> (s' = flock) & (m' = 100);

	[FtoT] (s = flock) & (m >= 10) & (m < 70) ->       m/SF:(s' = torus) & (m' = none) + 
	                                             1 - (m/SF):(s' = flock) & (m' = m + floor(m * RF)); 
	[FtoTWP1] (s = flock) & (m >= 70) -> (s' = torus) & (m' = none); 

	[Tm10] (s = torus) & (m = none) -> 0.9: (s' = torus) & (m' = 10) +
	                                   0.1: (s' = s) & (m' = m);
	//[Tm20] (s = torus) & (m = none) -> (s' = torus) & (m' = 20);
	//[Tm30] (s = torus) & (m = none) -> (s' = torus) & (m' = 30);
	//[Tm40] (s = torus) & (m = none) -> (s' = torus) & (m' = 40); 
	//[Tm50] (s = torus) & (m = none) -> (s' = torus) & (m' = 50);
	//[Tm60] (s = torus) & (m = none) -> (s' = torus) & (m' = 60);
	//[Tm70] (s = torus) & (m = none) -> (s' = torus) & (m' = 70);
	//[Tm80] (s = torus) & (m = none) -> (s' = torus) & (m' = 80);
	//[Tm90] (s = torus) & (m = none) -> (s' = torus) & (m' = 90);
	//[Tm100] (s = torus) & (m = none) -> (s' = torus) & (m' = 100);

	[TtoF] (s = torus) & (m >= 10) & (m < 30) ->       m/ST:(s' = flock) & (m' = none) + 
	                                             1 - (m/ST):(s' = torus) & (m' = m + floor(m * RF)); 
	[TtoFWP1] (s = torus) & (m >= 30) -> (s' = flock) & (m' = none); 

endmodule

rewards "numFtoT"
	[FtoT] true : 1;
	[FtoTWP1] true : 1;
endrewards

rewards "numTtoF"
	[TtoF] true : 1;
	[TtoFWP1] true : 1;
endrewards


//init (m = none) endinit

label "flock" = (s = flock);
label "torus" = (s = torus);
label "none" = (m = none);
label "m100" = (m = 100);
label "m90" = (m = 90);
label "m80" = (m = 80);
label "m70" = (m = 70);
label "m60" = (m = 60);
label "m50" = (m = 50);
label "m40" = (m = 40);
label "m30" = (m = 30);
label "m20" = (m = 20);
label "m10" = (m = 10);
