//
//  Objector.m
//  BridgeTests
//
//  Created by John Clayton on 8/27/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

#import "Objector.h"

@implementation Objector

- (void) doSomething:(BOOL)raise {
	NSParameterAssert(raise == NO);
}

- (NSString *) findSomething:(BOOL)raise {
	NSParameterAssert(raise == NO);
	return @"abc123";
}

@end
