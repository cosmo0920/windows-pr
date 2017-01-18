require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'windows-pr'
  spec.version    = '1.2.6'
  spec.license    = 'Artistic 2.0'
  spec.authors    = ['Daniel J. Berger', 'Park Heesob', 'Hiroshi Hatake']
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/windows-pr'
  spec.summary    = 'Windows functions and constants bundled via Win32::API'
  spec.test_files = Dir["test/tc*"]
  spec.files      = `git ls-files`.split($\)

  spec.extra_rdoc_files = [
    'MANIFEST',
    'README',
    'CHANGES',
    'doc/conversion_guide.txt'
  ]

  spec.add_development_dependency('minitest', '~> 5.9.0')
  spec.add_development_dependency('rake')
  spec.add_dependency('windows-api', '>= 0.4.0')
  spec.add_dependency('win32-api', '>= 1.4.5')

  spec.description = <<-EOF
    The windows-pr library is a collection of Windows functions and constants
    pre-defined for you using the windows-api library. It also autogenerates
    explicit ANSI and Wide character versions of those functions, as well as
    constants that can be used as methods, e.g. CloseHandle() instead of
    CloseHandle.call().
  EOF
end
