$:.unshift File.expand_path('../lib', __FILE__)

require "rubygems"

Gem::Specification.new do |gem|
  gem.name            = "sleep"
  gem.version         = "0.1"
  gem.author          = "Bryan Goines"
  gem.summary         = "A little Ruby library to calculate 6 sleep-cycle times for good night's sleep"
  gem.email           = "bryann83@gmail.com"
  gem.homepage        = "https://github.com/bry4n/sleep"
  gem.executables     = ["bedtime"]
  gem.files           = Dir['README.md', 'LICENSE', 'lib/**/*.rb', 'bin/*']
  gem.add_dependency  "chronic"
  gem.add_dependency  "thor"
end
