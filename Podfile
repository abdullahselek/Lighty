platform :ios, '9.0'

def product_pods
	pod 'Lighty', :path => '.'
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

workspace 'Lighty.xcworkspace'
project 'Lighty.xcodeproj'

target 'Lighty-iOSTests' do
	use_frameworks!
    inherit! :search_paths
    testing_pods
end