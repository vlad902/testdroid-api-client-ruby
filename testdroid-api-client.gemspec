Gem::Specification.new do |s|
  s.name               = "testdroid-api-client"
  s.version            = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sakari Rautiainen"]
  s.date = %q{2013-10-15}
  s.description = %q{Ruby client for testdroid api v2}
  s.license       = "MIT"
  s.email = %q{sakari.rautiainen@bitbar.com}
  s.files         = `git ls-files`.split($/)
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = %q{http://rubygems.org/gems/testdroid-api-client}
  s.require_paths = ['lib']
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Testdroid API Client!}
  s.add_runtime_dependency "oauth2"
  s.add_runtime_dependency "faraday","~> 0.9.0"
  s.add_development_dependency "bump"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock", "~> 1.9.0"
  s.add_development_dependency "vcr"
  s.add_development_dependency "yard"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
