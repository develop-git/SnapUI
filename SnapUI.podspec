#
# Be sure to run `pod lib lint SnapUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
   s.name = 'SnapUI'
   s.version = '1.0.0'
   s.license = 'MIT'
   s.summary = '对 SnapKit 进行链式编程扩展，同时避免了视图添加约束冲突、视图未添加到父视图等造成崩溃的问题'
   s.homepage = 'https://github.com/develop-git/SnapUI'
   s.authors = { 'jianli' => 'develop-work@outlook.com' }
   s.source = { :git => 'git@github.com:develop-git/SnapUI.git', :tag => s.version.to_s }
   #s.documentation_url = ''

   s.requires_arc = true
   
   s.ios.deployment_target = '11.0'
   s.osx.deployment_target = '11.12'
   s.tvos.deployment_target = '11.0'

   s.swift_versions = ['5.5']

   s.source_files = 'Sources/**/*.swift'
   
   s.dependency 'SnapKit', '~> 5.6.0'

   s.xcconfig = {
       'LIBRARY_SEARCH_PATHS' => '$(SDKROOT)/usr/lib/swift',
   }
 end
