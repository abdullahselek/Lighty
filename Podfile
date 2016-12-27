platform :ios, '9.0'

def product_pods
	pod 'Lighty', :path => '.'
end

workspace 'Lighty.xcworkspace'
project 'Sample/iOS Sample/iOS Sample.xcodeproj'

target 'iOS Sample' do
	use_frameworks!
    inherit! :search_paths
    product_pods
end