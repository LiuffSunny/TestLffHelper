#
# Be sure to run `pod lib lint LffHealper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LffHealper'
  s.version          = '0.3.0'
  s.summary          = 'A short description of LffHealper.'

  s.description      = <<-DESC
TODO: 测试0.2.0.
                       DESC

  s.homepage         = 'https://github.com/LiuffSunny/LffHealper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LiuffSunny' => 'liuffSunny@163.com' }
  s.source           = { :git => 'https://github.com/LiuffSunny/TestLffHelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://www.baidu.com'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LffHealper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LffHealper' => ['LffHealper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
