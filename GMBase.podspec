#
# Be sure to run `pod lib lint GMBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GMBase'
  s.version          = '0.1.1'
  s.summary          = 'A short description of GMBase.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gumingjian/GMBase.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gmj' => '276122162@qq.com' }
  s.source           = { :git => 'https://github.com/gumingjian/GMBase.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.static_framework = true
  s.requires_arc = true
  s.source_files = 'GMBase/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GMBase' => ['GMBase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
