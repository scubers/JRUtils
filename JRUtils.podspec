Pod::Spec.new do |s|

    s.name         = "JRUtils"
    s.version      = "0.0.6"
    s.summary      = "Summary of convenience util for ios development"

    s.homepage     = "https://github.com/scubers/JRUtils"
    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "jrwong" => "jr-wong@qq.com" }
    s.ios.deployment_target = "8.0"
    s.source       = { :git => "https://github.com/scubers/JRUtils.git", :tag => "#{s.version}" }


    s.source_files  = "JRUtils/JRUtils/**/*.swift"
    s.requires_arc = true

    s.dependency 'CryptoSwift', '~> 0.4.1'
end
