Pod::Spec.new do |s|

    s.name                  = 'Lighty'
    s.version               = '1.1.7'
    s.summary               = 'Easy to use and lightweight logger for iOS, macOS, tvOS, watchOS and Linux in Swift'
    s.homepage              = 'https://github.com/abdullahselek/Lighty'
    s.license               = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author                = {
        'Abdullah Selek' => 'abdullahselek@gmail.com'
    }
    s.source                = {
        :git => 'https://github.com/abdullahselek/Lighty.git',
        :tag => s.version.to_s
    }
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.11'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    s.source_files          = 'Sources/*.swift'
    s.requires_arc          = true
    s.swift_version         = '5.0'

end
