
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_model_validators/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_model_validators'
  spec.version       = ActiveModelValidators::VERSION
  spec.authors       = ['Erol Fornoles']
  spec.email         = ['erol.fornoles@gmail.com']

  spec.summary       = 'Additional validations for Active Model'
  spec.description   = 'Additional validations for Active Model'
  spec.homepage      = 'https://github.com/Erol/active_model_validators'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activemodel', "~> 5.2.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end