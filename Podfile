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
project 'LightySample/LightySample.xcodeproj'

target 'Lighty' do
	project 'Lighty.xcodeproj'
	use_frameworks!

	# Pods for Lighty

	target 'LightyTests' do
    	inherit! :search_paths
    	testing_pods
	end

end

target 'LightySample' do
	use_frameworks!
	product_pods
end

target 'LightySample macOS' do
	use_frameworks!
	product_pods
end
