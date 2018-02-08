
Pod::Spec.new do |s|

s.name         = "WQImageWordMode"
s.version      = "0.0.1"
s.summary      = "无图模式的图片请求"

s.description  = <<-DESC
自己总结的无图模式的图片请求，欢迎使用。
DESC


s.homepage     = "https://github.com/WQiOS/WQImageWordMode"
s.license      = "MIT"
s.author       = { "王强" => "1570375769@qq.com" }
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.requires_arc = true # 是否启用ARC
s.source       = { :git => "https://github.com/WQiOS/WQImageWordMode.git", :tag => "#{s.version}" }
s.source_files = "WQImageWordMode/*.{h,m}"
s.ios.framework  = 'UIKit'
s.dependency 'AFNetworking'
s.dependency 'SDWebImage'

end
