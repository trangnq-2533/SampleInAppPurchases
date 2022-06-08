# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

target 'SampleInAppPurchases' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SampleInAppPurchases
  
  pod 'R.swift'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SwiftLint'
  pod 'Then'
end

  post_install do |pi|
    pi.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
