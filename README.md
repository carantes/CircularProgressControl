# CircularProgressControl

***

This is a simple and adaptive Circular Progress View.

It basically consists of two CAShapeLayers to draw a static and a animated circle, and a progress label with two lines, the first to describe a timer and the second for a state.

![Screenshot](https://cloud.githubusercontent.com/assets/1878740/5596864/2269a630-927f-11e4-8d3b-aa58ef0e3b8e.png) 

## Features

- automatically update the circle progress when the elapsed time is set
- autolayout compatible
- autoformat the timer label
- tint color of progress layer and label
- state description can be changed

## Installation

Grab the files in `View/CircularProgressView` and put it in your
project. The code uses ARC, so make sure to turn that on for the files if you're
not already using ARC.

## Usage

Subclass CircularProgressView or manually create a new instance using alloc/initWithFrame:
```objectivec
CircleProgressView *progressView = [[CircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
```
Configure the parameters before set the elapsed time:
```objectivec
[_circleProgressView setTimeLimit:3600*8];
[_circleProgressView setStatus:NSLocalizedString(@"circle-progress-view.status-not-started", nil)];
[_circleProgressView setTintColor:[UIColor whiteColor]];
[_circleProgressView setElapsedTime:0];
```

## Small Print

### License

`CircularProgressView` is released under the MIT license.

### Author

Carlos Arantes ([@carantes](http://twitter.com/carantes))

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/carantes/circularprogresscontrol/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
