require 'rake'
require 'rake/testtask'
require 'rack'

task default: %w[test]

desc 'Run server'
task :server do
  system ('rackup config.ru')
end

task :test do
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/test*.rb']
    t.verbose = true
  end
end
