## MARK: - Configuration
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

## MARK: - Functions

def utilityPods
  pod 'R.swift', '5.0.0'
  pod 'SwiftLint', '0.31.0'
end

def uiPods
  pod 'SnapKit'
end

def testingPods
  pod 'Quick'
  pod 'Nimble'
  pod 'Nimble-Snapshots'
end

## MARK: - Targets

target 'TheCloudLock' do
  
  utilityPods
  uiPods

  target 'TheCloudLockTests' do
   inherit! :search_paths
   
    testingPods
    
  end
  
end


## MARK: - Post Install Script

post_install do |installer|
  
  ## Project
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = "YES"
  end
    
  ## Targets
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
