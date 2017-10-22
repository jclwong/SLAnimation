Pod::Spec.new do |spec|
  spec.name         = 'SLAnimation'
  spec.version      = '1.2.2'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/jclwong/SLAnimation'
  spec.authors      = { 'jclwong' => 'jackwongau@hotmail.com' }
  spec.summary      = 'A Simple and Powerful Animation Library. Written in Obj-C and compatible with Swift.'
  spec.description      = <<-DESC
A Simple and Powerful Animation Library. Written in Obj-C and compatible with Swift. Features chainable animations, callbacks, and super simple effects wrapper.
Features numerous animatable properties, multi-stage animations, callbacks and simplified effects wrapper.
                      DESC
  spec.source       = { :git => 'https://github.com/jclwong/SLAnimation.git', :tag => spec.version.to_s }
  spec.source_files = 'SLAnimation/Classes/*.{h,m}'
  spec.ios.deployment_target = '8.0'
end
