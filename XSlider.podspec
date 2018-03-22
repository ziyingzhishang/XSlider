
Pod::Spec.new do |s|
  s.name         = "xsliderPod"
  s.version      = "0.0.1"
  s.summary      = "A short description of xsliderPod."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/ziyingzhishang/XSlider"

  s.license      = "MIT"
  
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Xudong" => "ziyingzhishang@163.com" }
 

  s.platform     = :ios

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/ziyingzhishang/XSlider.git", :branch => "master" }

  s.source_files  = "XSlider/source/*.swift"
  s.exclude_files = "XSlider/source/LICENSE"
  s.requires_arc = true
end
