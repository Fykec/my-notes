[Calculate distance from location in iOS 7](http://stackoverflow.com/questions/8568574/pretty-print-distances-for-ios)

	
	CLLocationDistance distance = 1320.0;
	MKDistanceFormatter *df = [[MKDistanceFormatter alloc]init];
	df.unitStyle = MKDistanceFormatterUnitStyleFull;

	NSString *prettyString = [df stringFromDistance:distance];