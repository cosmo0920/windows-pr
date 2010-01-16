require 'rubygems'

spec = Gem::Specification.new do |gem|
   gem.name       = 'windows-pr'
   gem.version    = '1.0.8'
   gem.license    = 'Artistic 2.0'
   gem.authors    = ['Daniel J. Berger', 'Park Heesob']
   gem.email      = 'djberg96@gmail.com'
   gem.homepage   = 'http://www.rubyforge.org/projects/win32utils'
   gem.platform   = Gem::Platform::RUBY
   gem.summary    = 'Windows functions and constants bundled via Win32::API'
   gem.test_files = Dir["test/tc*"]
   gem.files      = Dir["**/*"].reject{ |f| f.include?('CVS') }
   
   gem.rubyforge_project = 'win32utils'
   
   gem.extra_rdoc_files = [
       'MANIFEST',
       'README',
       'CHANGES',
       'doc/conversion_guide.txt'
   ]
   
   gem.add_dependency('windows-api', '>= 0.3.0')
   gem.add_dependency('win32-api', '>= 1.4.5')
   
   gem.description = <<-EOF
      The windows-pr library is a collection of Windows functions and constants
      pre-defined for you using the windows-api library. It also autogenerates
      explicit ANSI and Wide character versions of those functions, as well as
      constants that can be used as methods, e.g. CloseHandle() instead of
      CloseHandle.call().
   EOF
end

Gem::Builder.new(spec).build
