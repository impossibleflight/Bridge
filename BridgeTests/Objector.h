//
//  Objector.h
//  BridgeTests
//
//  Created by John Clayton on 8/27/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Objector : NSObject

- (void) doSomething:(BOOL)raise;
- (NSString *) findSomething:(BOOL)raise;

@end
