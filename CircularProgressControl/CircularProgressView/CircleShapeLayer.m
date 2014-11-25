//
//  CircleShapeLayer.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleShapeLayer.h"

@interface CircleShapeLayer ()

@property (assign, nonatomic) double initialProgress;
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation CircleShapeLayer

@synthesize percent = _percent;

- (instancetype)init {
    if ((self = [super init]))
    {
        //Default Iphone Width
        self.bounds = CGRectMake(0, 0, 250, 250);
        self.position = CGPointMake(125, 125);
        
        [self setupLayer];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {

    if ((self = [super init]))
    {
        self.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
        
        [self setupLayer];
    }
    
    return self;
}


- (void)setupLayer {
    
    self.path = [self drawPathWithArcCenter];
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f].CGColor;
    self.lineWidth = 20;
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = [self drawPathWithArcCenter];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.progressLayer.lineWidth = 20;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineJoin = kCALineJoinRound;
    [self addSublayer:self.progressLayer];
    
}

- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat radius = self.bounds.size.width/2; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                          radius:radius
                                      startAngle:(-M_PI/2)
                                        endAngle:(3*M_PI/2)
                                       clockwise:YES].CGPath;
}


- (void)setElapsedTime:(NSTimeInterval)elapsedTime {
    _initialProgress = [self calculatePercent:_elapsedTime toTime:_timeLimit];
    _elapsedTime = elapsedTime;
    
    self.progressLayer.strokeEnd = self.percent;
    [self startAnimation];
}

- (double)percent {
    
    _percent = [self calculatePercent:_elapsedTime toTime:_timeLimit];
    return _percent;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.progressLayer.strokeColor = progressColor.CGColor;
}

- (double)calculatePercent:(NSTimeInterval)fromTime toTime:(NSTimeInterval)toTime {
    
    if ((toTime > 0) && (fromTime > 0)) {
        
        CGFloat progress = 0;
        
        progress = fromTime / toTime;
        
        if ((progress * 100) > 100) {
            progress = 1.0f;
        }
        
        NSLog(@"Percent = %f", progress);
        
        return progress;
    }
    else
        return 0.0f;
}

- (void)startAnimation {
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @(self.initialProgress);
    pathAnimation.toValue = @(self.percent);
    pathAnimation.removedOnCompletion = YES;
    
    [self.progressLayer addAnimation:pathAnimation forKey:nil];
    
}

@end
