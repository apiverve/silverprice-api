Pod::Spec.new do |s|
  s.name             = 'APIVerveSilverPrice'
  s.version          = '1.2.3'
  s.summary          = 'Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction.'
  s.description      = <<-'DESC'
Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans can request quotes across 172 currencies, 24-hour high and low ranges, and hourly price snapshots.

This iOS/macOS SDK provides a convenient way to access the Silver Price from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/silverprice?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/silverprice-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveSilverPrice/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
