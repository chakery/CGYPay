Pod::Spec.new do |s|

  s.name         = "CGYPay"
  s.version      = "1.1.4"
  s.summary      = "CGYPay SDK"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/Chakery/CGYPay"
  s.author       = { "chakery" => "striveordeath@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/Chakery/CGYPay.git", :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
  	core.source_files = 'CGYPay/Classes/CGYPayCore'
  	core.ios.library = 'c++', 'z'
  	core.frameworks = 'CoreTelephony', 'SystemConfiguration', 'CFNetwork'
  	core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'AliPay' do |alipay|
    alipay.source_files = 'CGYPay/Classes/AlipaySDk', 'CGYPay/Classes/AlipaySDk/AlipaySDK.framework/Headers/*'
    alipay.vendored_frameworks = 'CGYPay/Classes/AlipaySDk/AlipaySDK.framework'
    alipay.public_header_files = 'CGYPay/Classes/AlipaySDk/AlipaySDK.framework/Headers/**/*.h'
    alipay.frameworks = 'CoreMotion', 'CoreGraphics', 'CoreText', 'QuartzCore'
    alipay.dependency 'CGYPay/Core'
  end

  s.subspec 'WxPay' do |wx|
    wx.source_files = 'CGYPay/Classes/WxSDK'
    wx.vendored_libraries = 'CGYPay/Classes/WxSDK/*.a'
    wx.public_header_files = 'CGYPay/Classes/WxSDK/*.h'
    wx.ios.library = 'sqlite3.0'
    wx.dependency 'CGYPay/Core'
  end

  s.subspec 'UnionPay' do |unionpay|
    unionpay.source_files = 'CGYPay/Classes/UPPaySDK'
    unionpay.vendored_libraries = 'CGYPay/Classes/UPPaySDK/*.a'
    unionpay.public_header_files = 'CGYPay/Classes/UPPaySDK/*.h'
    unionpay.dependency 'CGYPay/Core'
  end

end
