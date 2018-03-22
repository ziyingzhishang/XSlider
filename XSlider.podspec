
Pod::Spec.new do |s|
  s.name         = "XSlider"
  s.version      = "1.0.0"
  s.summary      = "A short description of xsliderPod."
  s.homepage     = "https://github.com/ziyingzhishang/XSlider"

  s.license      = "MIT"  
  s.author             = { "Xudong" => "ziyingzhishang@163.com" }

  s.platform     = :ios

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/ziyingzhishang/XSlider.git", :branch => "master" }

  s.source_files  = "XSlider/source/*.swift"
  s.exclude_files = "XSlider/source/LICENSE"
  s.requires_arc = true
end
