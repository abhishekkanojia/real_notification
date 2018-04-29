
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "real_notification/version"

Gem::Specification.new do |spec|
  spec.name          = "real_notification"
  spec.version       = RealNotification::VERSION
  spec.authors       = ["Abhishek Kanojia"]
  spec.email         = ["abhishek.kanojia3193@gmail.com"]

  spec.summary       = %q{ Real Notification provided push notification using action cable for rails application. }
  spec.description   = %q{ Real Notification provided push notification using action cable for rails application. }
  spec.homepage      = 'https://github.com/abhikanojia/real_notification'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
  spec.add_dependency 'jquery-rails', '~> 4.3', '>= 4.3.3'
  spec.add_dependency 'redis', '~> 4.0'
end
