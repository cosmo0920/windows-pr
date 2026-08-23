require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'windows-pr'
  spec.version    = '1.2.6'
  spec.license    = 'Artistic-2.0'
  spec.authors    = ['Daniel J. Berger', 'Park Heesob', 'Hiroshi Hatake']
  spec.email      = ['cosmo0920.oucc@gmail.com', 'djberg96@gmail.com']
  spec.homepage   = 'https://github.com/djberg96/windows-pr'
  spec.summary    = 'Windows functions and constants bundled via Fiddle'
  spec.test_files = Dir["test/tc*"]
  
  spec.files      = `git ls-files -z`.split("\x0").reject do |file|
    file.end_with?('.gem', '.log') ||
      file.start_with?(
        '.bundle/',
        '.git',
        '.github/',
        'coverage/',
        'pkg/',
        'tmp/',
        'vendor/bundle/'
      )
  end

  spec.add_development_dependency('minitest', '~> 6.0')
  spec.add_development_dependency('rake')
  spec.add_dependency('fiddle')

  spec.metadata   = {
    'bug_tracker_uri' => 'https://github.com/cosmo0920/windows-pr/issues',
    'changelog_uri' => 'https://github.com/cosmo0920/windows-pr/blob/master/CHANGES',
    'documentation_uri' => 'https://www.rubydoc.info/gems/windows-pr',
    'source_code_uri' => 'https://github.com/cosmo0920/windows-pr'
  }

  spec.description = <<-EOF
    The windows-pr library is a collection of Windows functions and constants
    pre-defined for you using Ruby's Fiddle library. It also autogenerates
    explicit ANSI and Wide character versions of those functions, as well as
    constants that can be used as methods, e.g. CloseHandle() instead of
    CloseHandle.call().
  EOF
end
