require 'rake'
require 'rake/clean'
require 'rake/testtask'

CLEAN << FileList['*.gem']

namespace 'gem' do
  desc 'Build the windows-pr gem'
  task :create do
    spec = eval(IO.read('windows-pr.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc 'Install the windows-pr gem'
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install #{file}"
  end
end

namespace 'test' do
  Rake::TestTask.new('all') do |t|
    t.warning = true
    t.test_files = FileList['test/tc*']
  end

  Rake::TestTask.new('clipboard') do |t|
    t.warning = true
    t.verbose = true
    t.test_files = FileList['test/tc_clipboard.rb']
  end

  Rake::TestTask.new('synchronize') do |t|
    t.warning = true
    t.verbose = true
    t.test_files = FileList['test/tc_synchronize.rb']
  end

  Rake::TestTask.new('unicode') do |t|
    t.warning = true
    t.verbose = true
    t.test_files = FileList['test/tc_unicode.rb']
  end

  Rake::TestTask.new('volume') do |t|
    t.warning = true
    t.verbose = true
    t.test_files = FileList['test/tc_volume.rb']
  end
end

task :default => 'test:all'
