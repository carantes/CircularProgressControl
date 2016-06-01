Pod::Spec.new do |s|
  s.name         = "CircularProgressControl"
  s.version      = "TODO"
  s.summary      = "Circular Progress Control using CAShapeLayer"
  s.description  = "It basically consists of two CAShapeLayers to draw a static and a animated circle, and a progress label with two lines, the first to describe a timer and the second for a state."

  s.homepage     = "https://github.com/carantes/CircularProgressControl"

  s.license      = "MIT License"

  s.author       = "Carlos Eduardo Arantes Ferreira"

  s.source       = { :git => "https://github.com/carantes/CircularProgressControl.git", :tag => "TODO" }

  s.source_files = "CircularProgressControl/CircularProgressControl/*.{h,m}"

  s.ios.deployment_target = "8.0"
end
