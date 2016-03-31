Pod::Spec.new do |s|

  s.name         = "CGYPay"
  s.version      = "1.0.0"
  s.summary      = "让支付变得更简单"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/Chakery/CGYPay"
  s.author       = { "chakery" => "striveordeath@gmail.com" }
  s.platform     = :ios
  s.platform     = :osx
  s.source       = { :git => "https://github.com/Chakery/CGYPay.git", :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.subspec 'Core' do |core|
  	core.source_files = 'CGYPay/Classes/CGYPayCore/*.swift'
  	core.ios.library = 'c++', 'z'
  	core.frameworks = 'CoreTelephony', 'SystemConfiguration', 'CFNetwork'
  	core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'AliPay' do |alipay|
    alipay.source_files = 'CGYPay/Classes/AlipaySDk/*.swift'
    alipay.vendored_frameworks = 'CGYPay/Classes/AlipaySDk/AlipaySDK.framework'
    alipay.public_header_files = 'CGYPay/Classes/AlipaySDk/AlipaySDK.framework/Headers/*.h'
    alipay.frameworks = 'CoreMotion', 'CoreGraphics', 'CoreText', 'QuartzCore'
    alipay.dependency 'CGYPay/Core'
  end

  s.subspec 'WxPay' do |wx|
    wx.vendored_libraries = 'CGYPay/Classes/WxSDK/*.a'
    wx.public_header_files = 'CGYPay/Classes/WxSDK/*.h'
    wx.source_files = 'CGYPay/Classes/WxSDK/*.{swift, h}'
    wx.ios.library = 'sqlite3.0'
    wx.dependency 'CGYPay/Core'
  end

  s.subspec 'UnionPay' do |unionpay|
    unionpay.vendored_libraries = 'CGYPay/Classes/UPPaySDK/*.a'
    unionpay.public_header_files = 'CGYPay/Classes/UPPaySDK/*.h'
    unionpay.source_files = 'CGYPay/Classes/UPPaySDK/*.{swift, h}'
    unionpay.dependency 'CGYPay/Core'
  end

end
