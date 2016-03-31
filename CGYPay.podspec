Pod::Spec.new do |s|

  s.name         = "CGYPay"
  s.version      = "1.0.0"
  s.summary      = "CGYPay SDK"
  s.description  = <<-DESC
  					       让支付变得更简单
                   DESC

  s.homepage     = "https://github.com/Chakery/CGYPay"
  s.license      = 'MIT'
  s.author       = { "chakery" => "striveordeath@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Chakery/CGYPay.git", :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
  	core.source_files = 'Classes/CGYPay/*.swift'
  	core.ios.library = 'libc++', 'libz'
  	core.frameworks = 'CoreTelephony', 'SystemConfiguration', 'CFNetwork'
  	core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'AliPay' do |alipay|
    alipay.source_files = 'Classes/AlipaySDk/*.swift'
    alipay.ios.vendored_frameworks = 'Classes/AlipaySDk/AlipaySDK.framework'
    alipay.frameworks = 'CoreMotion', 'CoreGraphics', 'CoreText', 'QuartzCore'
    alipay.dependency 'CGYPay/Core'
  end

  s.subspec 'WxPay' do |wx|
    wx.vendored_libraries = 'Classes/WxSDK/*.a'
    wx.public_header_files = 'Classes/WxSDK/*.h'
    wx.source_files = 'Classes/WxSDK/*.swift'
    wx.ios.library = 'libsqlite3.0'
    wx.dependency 'CGYPay/Core'
  end

  s.subspec 'UnionPay' do |unionpay|
    unionpay.vendored_libraries = 'Classes/UPPaySDK/*.a'
    unionpay.public_header_files = 'Classes/UPPaySDK/*.h'
    unionpay.source_files = 'Classes/UPPaySDK/*.swift'
    unionpay.dependency 'CGYPay/Core'
  end

end
