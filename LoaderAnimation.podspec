#
# Be sure to run `pod lib lint LoaderAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoaderAnimation'
  s.version          = '0.7.0'
  s.summary          = 'Add AMnimation on Loader.'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sunitamoond/LoaderAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunitamnit@gmail.com' => 'sunitamnit@gmail.com' }
  s.source           = { :git => 'https://github.com/sunitamoond/LoaderAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  #s.source_files = '*.swift', 'Extensions/*.swift'
  source_files_basic = '*.swift', 'Extensions/*.swift'
  source_files_modules = 'Module/*.swift'
  s.default_subspec = 'Basic', 'Modules'
  
  s.subspec 'Basic' do |basic|
    basic.source_files = source_files_basic
  end
  
  s.subspec 'Modules' do |modules|
   modules.source_files = source_files_modules
  end
  
  # s.resource_bundles = {
  #   'LoaderAnimation' => ['LoaderAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.platform = :ios, "10.0"
end
