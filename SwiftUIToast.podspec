Pod::Spec.new do |spec|
  spec.name         = "SwiftUIToast"
  spec.version      = "1.0.2"
  spec.summary      = "A Swift package for displaying sleek iOS-style toast notifications."
  spec.description  = <<-DESC
  A package for displaying sleek iOS-style toast notifications with SwiftUI. It's intended to mimic the toasts seen when charging an Apple Pencil or connecting AirPods.
                   DESC
  spec.homepage     = "https://github.com/jebenjamin/SwiftUIToast"
  spec.screenshots  = "https://github.com/jebenjamin/SwiftUIToast/raw/main/Examples.jpg"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Jonathan Benjamin" => "jonathan@axnote.app" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/jebenjamin/SwiftUIToast.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
end
