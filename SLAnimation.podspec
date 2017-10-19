#
# Be sure to run `pod lib lint SLAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SLAnimation'
  s.version          = '1.1'
  s.summary          = 'A Simple and Powerful Animation Library. Written in Obj-C and compatible with Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A Simple and Powerful Animation Library. Written in Obj-C and compatible with Swift. Features chainable animations, callbacks, and super simple effects wrapper.'

  s.homepage         = 'https://github.com/jclwong/SLAnimation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jclwong' => 'jackwongau@hotmail.com' }
  s.source           = { :git => 'https://github.com/jclwong/SLAnimation.git', :commit => '0fa0155eaa6a8879d4b38eb367f374da330848d4', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SLAnimation/Classes/*.{h,m}'



  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # s.source_files = 'SLAnimation/Classes/*'
  # s.source_files = 'SLAnimation/Classes/**/*'
  # s.source_files = 'Classes/**/*.{h,m}'
  # s.resource_bundles = {
  #   'SLAnimation' => ['SLAnimation/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
