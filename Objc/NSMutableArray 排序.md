[TOC]

# NSMutableArray 排序

2013-07-08 19:36:40

	NSMutableArray* arr = [NSMutableArrayarrayWithObjects:
                           [NSNumber numberWithInt:0],
                           [NSNumber numberWithInt:3],
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:7],
                           [NSNumber numberWithInt:8],
                           [NSNumber numberWithInt:9],
                           [NSNumber numberWithInt:10],
                           [NSNumber numberWithInt:6],
                           [NSNumber numberWithInt:5],
                           [NSNumber numberWithInt:4],
                           nil];
    
    // 升序
    // 0 --> 10
    [arr sortUsingComparator:^NSComparisonResult(__strongid obj1,__strong id obj2){
        return [obj1 intValue] > [obj2intValue];
    }];
    
    NSLog(@"%@", [arrdebugDescription]);
    
    // 降序
    // 10 --> 0
    [arr sortUsingComparator:^NSComparisonResult(__strongid obj1,__strong id obj2){
        return [obj1 intValue] < [obj2intValue];
    }];
     NSLog(@"%@", [arrdebugDescription]);


	NSMutableArray* arr = [NSMutableArray arrayWithObjects:@"C", @"A", @"H", @"I", @"B", @"D", @"J", @"E", @"F", @"G", @"K", nil];
    
    // 升序
    // A --> K
    [arr sortUsingComparator:^NSComparisonResult(__strong id obj1,__strong id obj2){
        NSString *str1=(NSString *)obj1;
        NSString *str2=(NSString *)obj2;
        return [str1 compare:str2];
    }];
    
    NSLog(@"%@", [arr debugDescription]);
    
    // 降序
    // K --> A
    [arr sortUsingComparator:^NSComparisonResult(__strong id obj1,__strong id obj2){
        NSString *str1=(NSString *)obj1;
        NSString *str2=(NSString *)obj2;
        return [str2 compare:str1];
    }];
     NSLog(@"%@", [arr debugDescription]);