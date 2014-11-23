# CircularProgressControl

***

This is a simple and adaptive Circular Progress View.

It basically consists of two CAShapeLayers to draw a static and a animated circle, and a progress label with two lines, the first to describe a timer and the second for a state.


## Features

- automatically update the circle progress when the elapsed time is set
- autoformat the timer label 
- tint color of progress layer and label
- state description can be changed

## Installation

Grab the files in `View/CircularProgressView` and put it in your
project. The code uses ARC, so make sure to turn that on for the files if you're
not already using ARC.

## Usage

The compose bar visible in the demo above was created as follows:

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
