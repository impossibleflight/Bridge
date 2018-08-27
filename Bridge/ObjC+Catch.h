//
//  ObjC-internal.h
//  ObjC
//
//  Created by John Clayton on 8/27/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ObjC.h"

@interface ObjC (Catch)

+ (BOOL) performThrowingErrorsForExceptions:(void(^)(void))block error:(NSError **)errorPtr NS_SWIFT_NAME(performThrowingErrorsForExceptions(block:));

@end
