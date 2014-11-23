//
//  Session.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kSessionStateStart = 0,
    kSessionStateStop = 1
} SessionState;

@interface Session : NSObject

@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * finishDate;
@property (nonatomic, readonly) NSTimeInterval progressTime;
@property (nonatomic) SessionState state;

@end
