#
# Be sure to run `pod lib lint EZTableKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EZTableKit'
  s.version          = '0.1.0'
  s.summary          = 'A way for decoupling and simply managing TableView data.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Separate display and data processing.
Manage the data of TableView flexibility and simplicity.
                       DESC

  s.homepage         = 'https://github.com/Orisun/EZTableKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Orisun' => 'wang.orisun@icloud.com' }
  s.source           = { :git => 'https://github.com/Orisun/EZTableKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'EZTableKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EZTableKit' => ['EZTableKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
