platform :ios, '15.0'

inhibit_all_warnings!

target 'CodingChallenge' do
  use_frameworks!

  pod 'SwiftLint', '~> 0.47'
  pod 'R.swift', '~> 6.1.0'
  pod 'Swinject', '~> 2.7.1'
  pod 'SwinjectAutoregistration', '~> 2.8.1'

  target 'CodingChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CodingChallengeUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
