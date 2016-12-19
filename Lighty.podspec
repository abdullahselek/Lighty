Pod::Spec.new do |s|

    s.name                = 'Lighty'
    s.version             = '0.1'
    s.summary             = 'Easy to use and lightweight logger in Swift'
    s.homepage            = 'https://github.com/abdullahselek/Lighty'
    s.license             = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author              = {
        'Abdullah Selek' => 'abdullahselek@yahoo.com'
    }
    s.source              = {
        :git => 'https://github.com/abdullahselek/Lighty.git',
        :tag => s.version.to_s
    }
    s.ios.deployment_target = '9.0'
    s.source_files        = 'Lighty/*.swift'
    s.requires_arc        = true

end