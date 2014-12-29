//
//  CircleProgressView.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleProgressView.h"
#import "CircleShapeLayer.h"

@interface CircleProgressView()

@property (nonatomic, strong) CircleShapeLayer *progressLayer;
@property (strong, nonatomic) UILabel *progressLabel;

@end

@implementation CircleProgressView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressLayer.frame = self.bounds;
    
    [self.progressLabel sizeToFit];
    self.progressLabel.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y);
}

- (void)updateConstraints {
    [super updateConstraints];
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _progressLabel.numberOfLines = 2;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.backgroundColor = [UIColor clearColor];
        _progressLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_progressLabel];
    }
    
    return _progressLabel;
}

- (double)percent {
    return self.progressLayer.percent;
}

- (NSTimeInterval)timeLimit {
    return self.progressLayer.timeLimit;
}

- (void)setTimeLimit:(NSTimeInterval)timeLimit {
    self.progressLayer.timeLimit = timeLimit;
}

- (void)setElapsedTime:(NSTimeInterval)elapsedTime {
    _elapsedTime = elapsedTime;
    self.progressLayer.elapsedTime = elapsedTime;
    self.progressLabel.attributedText = [self formatProgressStringFromTimeInterval:elapsedTime];
}

#pragma mark - Private Methods

- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = false;
    
    //add Progress layer
    self.progressLayer = [[CircleShapeLayer alloc] init];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.progressLayer];
    
}

- (void)setTintColor:(UIColor *)tintColor {
    self.progressLayer.progressColor = tintColor;
    self.progressLabel.textColor = tintColor;
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval shortDate:(BOOL)shortDate {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    
    if (shortDate) {
        return [NSString stringWithFormat:@"%02ld:%02ld", (long)hours, (long)minutes];
    }
    else {
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
    }
    
}

- (NSAttributedString *)formatProgressStringFromTimeInterval:(NSTimeInterval)interval {
    
    NSString *progressString = [self stringFromTimeInterval:interval shortDate:false];
    
    NSMutableAttributedString *attributedString;
    
    
    if (_status.length > 0) {
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", progressString, _status]];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:40]}
                                range:NSMakeRange(0, progressString.length)];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-thin" size:18]}
                                range:NSMakeRange(progressString.length+1, _status.length)];
        
    }
    else
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",progressString]];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:18]}
                                range:NSMakeRange(0, progressString.length)];
    }
    
    return attributedString;
}


@end
