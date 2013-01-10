task :default => [:cucumber, :rspec]

require "cucumber/rake/task"
require "rspec/core/rake_task"


Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = ["features"]
end

RSpec::Core::RakeTask.new(:rspec)
