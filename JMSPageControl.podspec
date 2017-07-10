Pod::Spec.new do |s|

  s.name          = "JMSPageControl"
  s.version       = "1.0.1"
  s.license       = "MIT"
  s.summary       = "A custom UIControl using Swift."
  s.homepage      = "https://github.com/James-swift/JMSPageControl"
  s.author        = { "xiaobs" => "1007785739@qq.com" }
  s.source        = { :git => "https://github.com/James-swift/JMSPageControl.git", :tag => "1.0.1" }
  s.requires_arc  = true
  s.description   = <<-DESC
                   JMSPageControl - A custom UIControl using Swift.
                   DESC
  s.source_files  = "JMSPageControl/Lib/*"
  s.platform      = :ios, '8.0'
  s.framework     = 'Foundation', 'UIKit'  

end
