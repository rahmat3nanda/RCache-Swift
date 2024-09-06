Pod::Spec.new do |s|
  s.name             = 'RCache'
  s.version          = '1.0.4'
  s.summary          = 'RCache is a lightweight Swift library designed to simplify data storage.'
  s.description      = 'RCache is a lightweight Swift library designed to simplify data storage in UserDefaults and Keychain.'
  s.homepage         = 'https://github.com/rahmat3nanda/RCache-Swift.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rahmat Trinanda Pramudya Amar' => 'rahmat3nanda@gmail.com.com' }
  s.source           = { :git => 'https://github.com/rahmat3nanda/RCache-Swift.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.13'
  s.source_files     = 'Sources/**/*.{swift,h,m}'
end
