require 'rake'
require 'rspec/core/rake_task'


namespace :spec do
  [:unit, :integration].each do |sub|
    desc "Run the specs in spec/#{sub}"
    RSpec::Core::RakeTask.new(sub) do |t|
      t.pattern = "spec/#{sub}/**/*_spec.rb"
    end
  end
end
