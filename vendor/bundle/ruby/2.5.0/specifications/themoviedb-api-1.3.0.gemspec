# -*- encoding: utf-8 -*-
# stub: themoviedb-api 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "themoviedb-api".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["18Months".freeze]
  s.date = "2018-03-19"
  s.description = "Provides a simple and intuitive interface for the Movie Database API making use of OpenStruct.".freeze
  s.email = ["dev@18months.it".freeze]
  s.homepage = "https://github.com/18Months/themoviedb-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.0".freeze
  s.summary = "A simple to use Ruby wrapper for the The Movie Database API.".freeze

  s.installed_by_version = "3.0.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0", ">= 2.0"])
      s.add_development_dependency(%q<awesome_print>.freeze, ["~> 1.8", ">= 1.8"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 4.0", ">= 4.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3", ">= 12.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7", ">= 3.7"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.3", ">= 3.3"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8", ">= 0.8"])
    else
      s.add_dependency(%q<rest-client>.freeze, ["~> 2.0", ">= 2.0"])
      s.add_dependency(%q<awesome_print>.freeze, ["~> 1.8", ">= 1.8"])
      s.add_dependency(%q<vcr>.freeze, ["~> 4.0", ">= 4.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3", ">= 12.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7", ">= 3.7"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.3", ">= 3.3"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.8", ">= 0.8"])
    end
  else
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0", ">= 2.0"])
    s.add_dependency(%q<awesome_print>.freeze, ["~> 1.8", ">= 1.8"])
    s.add_dependency(%q<vcr>.freeze, ["~> 4.0", ">= 4.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3", ">= 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7", ">= 3.7"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.3", ">= 3.3"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8", ">= 0.8"])
  end
end
