Pod::Spec.new do |spec|
  spec.name         = 'SLAnimation'
  spec.version      = '1.2'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/jclwong/SLAnimation'
  spec.authors      = { 'jclwong' => 'jackwongau@hotmail.com' }
  spec.summary      = <<-DESC
A Simple and Powerful Animation Library. Written in Obj-C and compatible with Swift. Features chainable animations, callbacks, and super simple effects wrapper.
                       DESC
  spec.source       = { :git => 'https://github.com/jclwong/SLAnimation.git', :tag => s.version.to_s }
  spec.source_files = 'SLAnimation/Classes/*.{h,m}'
  spec.framework    = 'UIKit'
end

