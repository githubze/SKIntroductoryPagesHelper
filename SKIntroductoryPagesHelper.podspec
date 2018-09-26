Pod::Spec.new do |s|
  s.name         = "SKIntroductoryPagesHelper"
  s.version      = "1.0.0"
  s.summary      = "An iOS ImagePicker."
  s.homepage     = "https://github.com/githubze/SKIntroductoryPagesHelper"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'githubze' => '1424395628@qq.com' }
  s.source       = { :git => "https://github.com/githubze/SKIntroductoryPagesHelper.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = "SKIntroductoryPagesHelper/**/*.{h,m}"
  s.requires_arc = true
  s.dependency   = "Masonry", "SKQuickControl"

end