int main (int argc, const char * argv[]) {

	//Lesson 1
	NSLog(@"Hello world\n");
	NSObject *obj; //declare an object
	obj = [[NSObject alloc] init]; //Initialize an object
	//release an object
	[release obj]
	
	//Most frequently used construction
	s = [[NSString alloc] initWithFormat:@"stuff is : %@", @"Hello"];
	
	//Create a string you can extend or change
	NSMutableString *s20 [[NSMutableString alloc] initWithString"@"Hello String"];
	[s20 appendString"@Hello back"];
	
	//NSString with instance methoc
	NSString *s20 = [[NSString alloc] initWithString:@"instance"];
	NSUInteger bwLength = [s20 length];
	
	//Lesson 2
	int count = 1235;
	NSString *s20 = [[NSString alloc] initWithFormat:@"string is %@", count];
	
	//NSSMutableString can use appendString
	
	//NSNumber is a number class for use with other classes that need an NSObject type number.
	//use NSNumber to take scalar values and put htem in an object.
	NSNumber *num1 = [[NSNumber alloc] initWithInt:1234];
	//or initWithFloat
	
	//NSDate
    NSDate *bwDate1 = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDate *bwDate2 = [[NSDate alloc] initWithTimeIntervalSinceNow:10.0]; //10 seconds will initialize in 10 seconds

	//NSArray
	NSArray *array = [[NSArray alloc] initWithObjects:@"one", @"two"];
	
	for ( int x = 0; x < [array count]; x++) { }
	
	//how to declare a class or instance method
	+(void) bwClassMethod:(int) count;
	+(void) bwClassMethod:(int) count { 
	NSLog(@"%s: count: %i", __FUNCTION__, count);
	}
	
	//Lesson 3
	//fast enumeration through an array
	for (NSString *s in array) {
	NSLog(@"String is %@", s);
	}
	
	//NSArray - numberWithInt:2
	//NSMutableArray - addObject
	//insertObject:@"stuff" atIndex:1];
	// NSMutableArray can also use removeObjectAtIndex:1
	
	NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:@"ObjOne", @"KeyOne", @"ObjTwo", @"KeyTwo",
                       @"ObjThree", @"KeyThree", nil];
    NSLog(@"%@", d);
    
    for (NSString *key in d) {
        NSString *value = [d objectForKey:key];
        NSLog(@"%@: %@", key, value);
    }
  
    [d release];
    
    NSMutableDictionary *d2 = [[NSMutableDictionary alloc] init];
    [d2 setValue:@"ValueOne" forKey:@"KeyOne"];
    [d2 setValue:@"ValueTwo" forKey:@"KeyTwo"];
    NSLog(@"%@", d2);
