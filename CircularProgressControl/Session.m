//
//  Session.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "Session.h"

@implementation Session

- (NSTimeInterval)progressTime {
    
    if (_finishDate) {
        return [_finishDate timeIntervalSinceDate:self.startDate];
    }
    else {
        return [[NSDate date] timeIntervalSinceDate:self.startDate];
    }
}

@end
