//
//  ObjC.m
//  StoryKit
//
//  Created by John Clayton on 8/21/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

#import "ObjC+Catch.h"
#import "ObjC.h"

@implementation _ObjC (Catch)

+ (BOOL) _performThrowingErrorsForExceptions:(void(^)(void))block error:(NSError **)errorPtr {
	@try {
		block();
	} @catch (NSException *exception) {
		if (errorPtr) {
			NSMutableDictionary *info = [NSMutableDictionary new];
			info[NSLocalizedDescriptionKey] = [NSString stringWithFormat:@"An exception occurred: %@",[exception name]];
			if (exception != nil) {
				[info setObject:exception forKey:@"exception"];
			}
			if ([exception reason]) {
				[info setObject:[exception reason] forKey:@"reason"];
			}
			if ([exception callStackSymbols]) {
				[info setObject:[exception callStackSymbols] forKey:@"callStackSymbols"];
			}
			if ([exception userInfo]) {
				[info setObject:[exception userInfo] forKey:@"userInfo"];
			}

			NSError *error = [NSError errorWithDomain:@"Exception Error Domain" code:-999 userInfo:info];
			*errorPtr = error;
		}
		return NO;
	}
	return YES;
}

@end
