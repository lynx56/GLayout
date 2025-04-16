Pod::Spec.new do |s|
  s.name             = 'GLayout'
  s.version          = '1.0.1'
  s.summary          = 'A set of layout constraints utilities and UIView extensions for easier constraint management.'
  s.description      = <<-DESC
                         GLayout is a simple library that provides utilities for managing layout constraints.
                         It includes functions for adding equal, greater-than, and less-than constraints,
                         along with helper extensions for UIView to easily add and set constraints.
                       DESC
  s.homepage         = 'https://github.com/lynx56/GLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gulnaz Almukhametova' => 'lynx56reg@gmail.com' }
  s.source           = { :git => 'https://github.com/lynx56/GLayout.git', :tag => '1.0.1' }
  s.platform         = :ios, '13.0'
  s.source_files     = 'Sources/GLayout/**/*.{swift}'
  s.requires_arc     = true

  # Specify the Swift version (optional)
  s.swift_versions   = ['5.0']
end